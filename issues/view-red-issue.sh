#!/bin/bash

# 1st argument = issue number

gh issue view "https://github.com/red/red/issues/$1" --json number,title,url,body,comments --template \
'# Issue #{{.number}}: {{.title}}
<{{.url}}>

{{if .body}}{{.body}}{{else}}<no description>{{end}}

{{if .comments}}
{{range .comments}}
## {{.author.login}} on {{.createdAt}}
{{.body}}

{{end}}
{{else}}
<no comments>
{{end}}'
