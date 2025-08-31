#!/bin/red

Red []

owner: "hiiamboris"
repo:  "red-spaces"

codeberg: https://codeberg.org
api-url: codeberg/api/v1/repos/:owner/:repo/issues

issue-to-markdown: func [issue] [
    title:   issue/title
    number:  issue/number
    state:   issue/state
    body:    issue/body
    labels:  issue/labels
    created: issue/created_at
    updated: issue/updated_at
    url:     issue/html_url

    labels-markdown: ""
    if not empty? labels [
        labels-markdown: copy "**Labels:** "
        foreach label labels [
            append labels-markdown rejoin ["`" label/name "` "]
        ]
        append labels-markdown "^/"
    ]

    rejoin [
        "# " title " #" number "^/^/"
        "**State:** " state " | **Created:** " created " | **Updated:** " updated "^/"
        labels-markdown
        "**URL:** <" url ">^/"
        "---^/^/"
        body
        "^/^/---^/"
    ]
]

comment-to-markdown: func [comment] [
    user: comment/user/username
    body: comment/body
    created: transcode/one comment/created_at
    updated: transcode/one comment/updated_at
    return rejoin [
        "### Comment by **" user "** (**Posted:** " created " | **Updated:** " updated "):^/^/"
        body "^/^/---^/"
    ]
]

comments-to-markdown: function [issue-number] [
    comments: load codeberg/api/v1/repos/:owner/:repo/issues/:issue-number/comments
    if empty? comments [return ""]
    comments-md: copy "## Comments^/^/"
    foreach comment comments [
        append comments-md comment-to-markdown comment
    ]
    comments-md
]

page: 0
issues: copy []

while [not empty? data: load url: rejoin [api-url "?state=all&page=" page: page + 1 "&limit=50"]] [
    append issues data
    ; Check if there are more pages
    if (length? data) < 50 [break]
	wait 1		;-- easy on the rate limits
]

; Create output directory if it doesn't exist
make-dir %spaces/

; Save each issue as a Markdown file
foreach issue issues [
    filename: rejoin [%spaces/ "issue-" issue/number ".md"]
    write filename rejoin [issue-to-markdown issue  comments-to-markdown issue/number]
    print ["Saved" filename]
]

print "Done."

