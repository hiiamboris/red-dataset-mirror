Red[]

; -- required stuff
name: 'git
version: 0.0.1
ved-rule: [	
	'git [
		'about	(area: ["GIT is working"])
	|	'branch	(area: reduce ["Current branch: " select get-status 'branch])
	|	'status (area: show-status get-status)
	|	'add set value ['. | block!] (
			result: add value
			area: head insert show-status get-status result
		)
	|	'reset (value: none) opt [set value ['soft | 'mixed | 'hard | 'merge | 'keep]] (
			result: reset value
			area: head insert show-status get-status result
		)
	|	'commit set value string! (area: set-area commit value)
	|	'push (area: set-area push value)
	|	'pull (area: set-area pull value)
	]
]

; -- optional stuff
led-rule: [ 
	"g?"	(emit [git about])
|	"gb"	(emit [git branch])
|	"gs"	(emit [git status])
|	"gr"	(value: none) opt [set value reset-chars] (
		code: [git reset]
		if value [
			append code select [
				#"s" soft #"x" mixed #"h" hard #"m" merge "#k" keep none none
			] value
		]
	)
|	"ga" copy value to end (
		value: case [
			"." = value ['.]
			true [split value space]
		]
		emit reduce ['git 'add value]
	)
|	"gc" copy value to end (emit reduce ['git 'commit value])
|	["gps" | "g>"] (emit [git push])
|	["gpl" | "g<"] (emit [git pull])
]

; -- internal stuff
reset-chars: charset "sxhmk" ; Soft, miXed, Hard, Merge, Keep
ws: charset " ^-^/"
sp: [any ws]
code: none
value: none
result: none
fork*: #""
teeth*: #""

set-area: func [data][head insert show-status get-status data]

call-git: func [data /local result][
	if block? data [data: reduce data]
	call/output/wait
t: rejoin compose ["git " (data)] result: clear ""
	probe t
	copy probe result
]

add: func ['files][call-git ["add " files]]
commit: func [message][call-git [ {commit -m "} message {"}]]
push: func[][call-git "push"]
pull: func[][call-git "pull"]
reset: func [mode][call-git ["reset " either mode [head insert form mode "--"][""]]]
get-status: func [
	/local 
		branch value 
		modified untracked added deleted replaced copied
][
	modified: clear []
	untracked: clear []
	added: clear []
	deleted: clear []
	replaced: clear []
	copied: clear []
	result: call-git "status -sb"
	parse result [
		some [
			"## " copy branch to newline skip ; TODO: better splitting
			; TODO: support staged / not staged
		|	sp ["MM" | "M"] sp copy value to newline skip (append modified to file! value)
		|	sp "A" sp copy value to newline skip (append added to file! value)
		|	sp "D" sp copy value to newline skip (append deleted to file! value)
		|	sp "R" sp copy value to newline skip (append replaced to file! value)
		|	sp "C" sp copy value to newline skip (append copied to file! value)
		|	sp "??" sp copy value to newline skip (append untracked to file! value)
		]
	]
	reduce [
		'branch		branch
		'modified	copy modified 
		'untracked	copy untracked
		'added		copy added
		'deleted	copy deleted
		'replaced	copy replaced
		'copied		copy copied
	]
]
show-status: func [
	status 
	/local data
][
	data: compose [
		'fg 'bright 'red "Branch:" (tab) 'bold (status/branch) 'reset (newline)
		(newline)
		'fg 'bright 'blue "Modified:" (newline)
	]
	foreach value status/modified [append data compose [(tab) (form value) (newline)]]
	append data ['reset]
	data
]
