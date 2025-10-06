#!/usr/bin/env bash
set -euo pipefail

# Requirements: curl, jq, pandoc, coreutils (date, mkdir, sed, cut)
# Optional: export STACKEXCHANGE_KEY="your_key" to increase quota.
source ~/auth

TAG="red-lang"
SITE="stackoverflow"
OUTDIR="stackoverflow"
PAGESIZE=100   # API max is 100
SLEEP_REQ=0.4  # pause between API requests (be polite)

API_BASE="https://api.stackexchange.com/2.3"

mkdir -p "$OUTDIR"

KEY_PARAM=""
if [ -n "${STACKEXCHANGE_KEY-}" ]; then
  KEY_PARAM="&key=${STACKEXCHANGE_KEY}"
fi

page=1
while :; do
  echo "Fetching questions page $page..."
  qurl="$API_BASE/questions?page=$page&pagesize=$PAGESIZE&order=desc&sort=creation&tagged=$TAG&site=$SITE&filter=withbody$KEY_PARAM"
  resp=$(curl -sS "$qurl")

  # if jq cannot parse, exit with error
  echo "$resp" | jq . >/dev/null 2>&1

  items_count=$(echo "$resp" | jq '.items | length')
  if [ "$items_count" -eq 0 ]; then
    echo "No more questions found (items=0)."
    break
  fi

  # iterate questions
  echo "$resp" | jq -c '.items[]' | while read -r qitem; do
    qid=$(echo "$qitem" | jq -r '.question_id')
    title=$(echo "$qitem" | jq -r '.title')
    link=$(echo "$qitem" | jq -r '.link')
    asked_on_unix=$(echo "$qitem" | jq -r '.creation_date')
    asked_on=$(date -d "@$asked_on_unix" --utc '+%Y-%m-%d %H:%M:%S UTC' 2>/dev/null || date -r "$asked_on_unix" '+%Y-%m-%d %H:%M:%S UTC')

    # body is HTML
    qbody=$(echo "$qitem" | jq -r '.body')

    # sanitize filename
    safe_title=$(echo "$title" | sed 's/[^a-zA-Z0-9._-]/_/g' | sed 's/_\+/_/g' | cut -c1-120)
    filename="$OUTDIR/${qid}_${safe_title}.md"

    echo "Writing: $filename"

    # build temporary HTML to convert with pandoc
    tmpfile="$(mktemp /tmp/so_q_XXXXXX.html)"
    {
      echo "<html><body>"
      echo "<h1>$(printf '%s' "$title" | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g')</h1>"
      echo "<p><strong>Link:</strong> <a href=\"$link\">$link</a></p>"
      echo "<p><strong>Asked:</strong> $asked_on</p>"
      echo "<hr>"
      # question body (raw HTML from API)
      printf '%s\n' "$qbody"
      echo "<hr>"
      echo "<h2>Answers</h2>"
    } > "$tmpfile"

    # fetch answers for the question (with body)
    aurl="$API_BASE/questions/$qid/answers?order=desc&sort=votes&site=$SITE&filter=withbody$KEY_PARAM"
    answers_resp=$(curl -sS "$aurl")
    sleep "$SLEEP_REQ"

    # iterate answers
    echo "$answers_resp" | jq -c '.items[]?' | while read -r aitem; do
      aid=$(echo "$aitem" | jq -r '.answer_id')
      ascore=$(echo "$aitem" | jq -r '.score')
      aowner=$(echo "$aitem" | jq -r '.owner.display_name // "unknown"')
      abody=$(echo "$aitem" | jq -r '.body')

      {
        echo "<hr>"
        echo "<h3>Answer (score: $ascore) — by $(printf '%s' "$aowner" | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g')</h3>"
        printf '%s\n' "$abody"
      } >> "$tmpfile"

      # fetch comments on this answer (with body)
      c_a_url="$API_BASE/answers/$aid/comments?order=asc&sort=creation&site=$SITE&filter=withbody$KEY_PARAM"
      c_a_resp=$(curl -sS "$c_a_url")
      sleep "$SLEEP_REQ"
      echo "$c_a_resp" | jq -r '.items[]? | ("<p><em>Comment by " + (.owner.display_name // "unknown") + ":</em> " + .body + "</p>")' >> "$tmpfile" || true
    done

    # comments on question
    echo "<hr><h2>Comments on question</h2>" >> "$tmpfile"
    c_q_url="$API_BASE/questions/$qid/comments?order=asc&sort=creation&site=$SITE&filter=withbody$KEY_PARAM"
    c_q_resp=$(curl -sS "$c_q_url")
    sleep "$SLEEP_REQ"
    echo "$c_q_resp" | jq -r '.items[]? | ("<p><em>Comment by " + (.owner.display_name // "unknown") + ":</em> " + .body + "</p>")' >> "$tmpfile" || true

    echo "</body></html>" >> "$tmpfile"

    # convert HTML -> Markdown
    pandoc "$tmpfile" -f html -t markdown -o "$filename"

    rm -f "$tmpfile"

    # small sleep to be polite
    sleep "$SLEEP_REQ"
  done

  has_more=$(echo "$resp" | jq -r '.has_more')
  if [ "$has_more" != "true" ]; then
    echo "No more pages."
    break
  fi

  page=$((page + 1))
  # throttle between pages
  sleep 1
done

echo "Done. Markdown files saved in: $OUTDIR"
