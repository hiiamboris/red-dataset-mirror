#!/bin/bash

if [ -z "$GITHUB_OAUTH_TOKEN" ]; then
	echo "No auth token defined! Trying the auth script..." >&2
	source ~/auth
	if [ -z "$GITHUB_OAUTH_TOKEN" ]; then
		echo "Export GITHUB_OAUTH_TOKEN=<token> first" >&2
		echo "GitHub has 60 a stupid requests/hour limit" >&2
		exit
	fi
fi

# Check for required tools
command -v curl >/dev/null 2>&1 || { echo "Error: curl is required but not installed."; exit 1; }
command -v jq >/dev/null 2>&1 || { echo "Error: jq is required but not installed."; exit 1; }

if [ -z "$1" ]; then
    echo "Usage: $0 <gist_id>"
    exit 1
fi

GIST_ID=$1
API_URL="https://api.github.com/gists/$GIST_ID"
COMMENTS_URL="$API_URL/comments"

# Fetch Gist data and comments
GIST_DATA=$(curl -H "Authorization: token $GITHUB_OAUTH_TOKEN" -s "$API_URL")
COMMENTS_DATA=$(curl -H "Authorization: token $GITHUB_OAUTH_TOKEN" -s "$COMMENTS_URL")

# Check for errors
if echo "$GIST_DATA" | jq -e '.message' >/dev/null; then
    echo "Error: $(echo "$GIST_DATA" | jq -r '.message')"
    exit 1
fi

# Extract Gist description
DESCRIPTION=$(echo "$GIST_DATA" | jq -r '.description // "No description"')

# Generate Markdown output
echo "# $DESCRIPTION"
echo
echo "**Gist ID:** $GIST_ID"
echo "**Created:** $(echo "$GIST_DATA" | jq -r '.created_at')"
echo "**Last updated:** $(echo "$GIST_DATA" | jq -r '.updated_at')"
echo

# Process each file
echo "$GIST_DATA" | jq -r '.files | keys[]' | while read -r FILENAME; do
    echo "## File: \`$FILENAME\`"
    echo
    LANGUAGE=$(echo "$GIST_DATA" | jq -r ".files[\"$FILENAME\"].language // \"text\"")
    echo '```'"$LANGUAGE"
    echo "$GIST_DATA" | jq -r ".files[\"$FILENAME\"].content"
    echo '```'
    echo
done

# Add comments section
echo "## Comments"
echo
if [ "$(echo "$COMMENTS_DATA" | jq length)" -eq 0 ]; then
    echo "No comments."
else
    echo "$COMMENTS_DATA" | jq -r '.[] | "### @\(.user.login) on \(.created_at)\n\n\(.body)\n"'
fi
