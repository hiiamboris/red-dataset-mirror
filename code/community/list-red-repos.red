Red []

list-red-repos: function [platform [string!] owner [string!]] [
	switch platform [
		"github.com" [
			template: {gh api graphql -f query='{
				search(query: "user:OWNER language:Red fork:false is:public", type: REPOSITORY, first: 100) {
					nodes {... on Repository { name }}
				}
			}'}
			cmd: replace/all copy template "OWNER" owner
			code: call/shell/wait/output cmd out: clear {}
			if code <> 0 [do make error! rejoin ["ERROR "code" calling "cmd]]
			json: load-json out
			collect [foreach node json/data/search/nodes [keep node/name]]
		]
		"gitlab.com" [
			user:  load rejoin [https://gitlab.com/api/v4/users?username= owner]
			repos: load rejoin [https://gitlab.com/api/v4/users/ user/1/id "/projects?per_page=100"]
			remove-each repo repos [repo/forked_from_project]
			remove-each repo repos [
				langs: load rejoin [https://gitlab.com/api/v4/projects/ repo/id "/languages"]
				any [not langs/red langs/red < 10]
			]
			collect [foreach repo repos [keep repo/path]]
		]
		"codeberg.org" [
			base: https://codeberg.org/api/v1/users/
			json: load base/:owner/repos
			collect [foreach repo json [if repo/language = "red" [keep repo/name]]]
		]
	]
]
;probe list-red-repos "github.com" "red"