Red [
	title:   "Red inline tool"
	purpose: "Prepare script for compilation by embedding all of it's dependencies (once!)"
	author:  @hiiamboris
	license: 'BSD-3
	; needs:    CLI
	notes: {
		Due to countless bugs in #include system, it becomes a huge PITA to try to compile more complex scripts.
		This tool eliminates dependencies by embedding them, thus solving the problem.
		It also strips all assertions by default to speed up the binary
		
		Based on `include-once.red`
	}
]

#include %../../cli.red

included-scripts: []									;-- deduplication
ws: charset " ^-^/^M"
keep-assert?: no
indent: ""

remove-assert: function [input [string!]] [
	end: find/match/tail input "#assert"
	attempt [set [arg: end:] transcode/next end]		;-- may fail on "]"
	remove/part input end
]

skip-comment: function [input [string!]] [
	parse input [";" thru ["^/" | end] end:]
	end
]

skip-string: function [input [string!]] [
	multiline: [
		s: any "%" e: "{"
		any [multiline | not "}" skip]
		"}" (n: offset? s e) n "%"
	]
	parse input [
		[{"} any ["^^" skip | not {"} skip] {"} | multiline]
		end:
	]
	end
]

skip-macro: function [input [string!]] [				;-- without it, may hang on `#macro [] func [...]
	if p: find/match/tail input "#macro" [
		set [_: p:] transcode/next p
		set [token: p:] transcode/next p
		if token = 'func [
			set [_: p:] transcode/next p				;-- spec
			set [_: p:] transcode/next p				;-- body
		]
	]
	any [p input]
]

remove-process: function [input [string!]] [			;-- disarm #process off/on directive, to be able to expand the source
	if p: find/match/tail input "#process" [
		set [_: p:] transcode/next p					;-- skip off/on
		remove/part input p
	]
	any [p input]
]

handle-include: function [input [string!]] [
	end: find/match/tail input "#include"
	attempt [set [file: end:] transcode/next end]		;-- may fail on "]"
	unless file? :file [return end]						;-- ignore [#include] issues
		
	file: clean-path to-red-file file					;-- use absolute paths to ensure uniqueness
	if find included-scripts file [						;-- if already included, skip it
		return remove/part input end
	]
	
	old-path: what-dir
	set [path: _:] split-path file
	append included-scripts file
	change-dir path
	print rejoin [indent "inlining "(to-red-file file)"..."]
	append indent " "
	
	text: read file
	if all [
		set [red: p:] transcode/next text
		any ['Red == red 'Red/System == red]
		set [header: p:] transcode/next p
	][
		text: p											;-- skip the header in case Red word is defined to smth else
	]
	text: inline text
	remove/part input end
	end: insert input text
	
	take/last indent
	change-dir old-path
	end
]

inline: function [text [string!]][
	parse r: copy text [while [
		ahead "#include" p: (p: handle-include p) :p			;-- process inserted contents as well
	|	if (not keep-assert?) ahead "#assert" p: (p: remove-assert p) :p
	|	ahead [any "%" "{" | {"}] p: (p: skip-string p) :p
	|	ahead ";" p: (p: skip-comment p) :p 
	|	ahead "#macro" p: (p: skip-macro p) :p
	|	ahead "#process" p: (p: remove-process p) :p 
	|	skip
	]]
	r
]

inline-tool: function [
	"Prepare script for compilation by embedding all of it's dependencies"
	script [file!] "Source .red script"
	output [file!] "Output with all of it's dependencies embedded"
	/assert        "Do not strip #assert directives"
	/expand        "Expand (preprocess) the output; involves LOAD!"
	/t platform    "Specify target platform"
	/a "alias /assert"
	/e "alias /expand"
][
	set 'keep-assert? assert
	if platform [
		if platform = "MSDOS" [platform: "Windows"]				;@@ any other tricky cases?
		system/platform: load platform
	]
	;; inlining is textual, because often `mold/all` doesn't round-trip with `load`
	print ["master script:"(script: clean-path to-red-file script)]
	system/options/script: script								;-- required by %data-store.red's <script-name>
	result: inline read script
	if expand [
		set 'inlining? true										;-- hint for preprocessor directives
		result: mold/all/only expand-directives load result
	]
	write output result
	print "done!"
]

cli/process-into ('inline-tool)
