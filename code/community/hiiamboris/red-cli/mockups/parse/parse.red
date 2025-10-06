Red [
	title:   "Parse tool"
	purpose: "Use Parse power from command line"
	author:  @hiiamboris
	license: {Distributed under 3-clause BSD license}
]

#include %../../cli.red
#include %../../../common/include-once.red				;-- dependencies of glob...
#include %../../../common/with.red
#include %../../../common/without-gc.red
#include %../../../common/xyloop.red
#include %../../../common/tree-hopping.red
#include %../../../common/match.red
#include %../../../common/glob.red

bin2str: func [x] [		;@@ ideally should not be needed, but binary mode allows parsing by datatype, which is cool
	case [
		any-block? :x [forall x [change/only x bin2str :x/1] x]
		binary?    :x [to "" x]
		'else         [:x]
	]
]

;@@ TODO: "-" for stdin? not possible until ports though
parse-tool: function [
	{- Process input using Parse commands -}
	input      [file!]   "File or file mask to parse"
	rule       [string!] "Rule to match against, written in Red PARSE dialect"
	/init code [string!] "Evaluate given initialization code before parsing"
	/lines     "Parse input line-by-line (default: as a single string)"
	/enum      "Display line numbers together with the text (implies /lines)"
	; /case    "Use case-sensitive comparison"	;@@ BUG: always applies - #4862
	/count     "Count matches and display the number"
	/collect   "Collect matches and print to the console (don't forget to use 'keep' in the rule!)"
	/write     "Write the contents back (incompatible with --collect)"
	/whole     "Match rule to the whole text (otherwise look for it inside the text)"
	/recursive "Look for the file or mask in all subdirectories"
	/verbose   "Verbose output"
	/h         "Display synopsis and exit"
	/help      "Display full help text and exit"
	/l "alias /lines"
	/e "alias /enum"
	/n "alias /count"
	/c "alias /collect"
	/w "alias /write"
	/r "alias /recursive"
	/v "alias /verbose"
][
	if error? e: try [
		;; extra syntax checks
		if any [h help] [										;-- need special logic to distinguish -h from --help
			full?: find system/options/args "--help"			;-- let no arguments print short help only
			print cli/help-for/name/below parse-tool "Parse tool" either full? [pstext][""]
			quit
		]
		if all [write collect] [cli/fail ["--collect and --write options are mutually exclusive"]]
		
		;; data and rule preparation
		set [location: mask:] split-path input
		files: apply 'glob [
			/files on
			/from  on any [location %.]
			/only  on as string! mask
			/limit (not recursive) 1
		]
		if verbose [print ["Glob result:" mold/flat files]]
		rule: load/all rule
		if enum      [lines: true]
		unless whole [rule: compose/only [some thru (rule) to end]]	;-- allow multiple matches for collection
		if collect   [rule: compose/only [collect (rule)]]
		
		;; rule application
		if init [do code] 
		print*: func [data] [
			unless select printed?: #[] file [
				printed?/:file: yes
				print ["^/=== File:" to-local-file head file]
			]
			print :data
		]
		foreach file files [
			data: read/binary head file
			if verbose [print* ["Using rule:" mold rule]]
			if lines [
				nl: [opt #"^M" #"^/" marker:]
				lines: parse data [collect [
					any [keep copy _ to nl nl] [
						end (last-nl?: yes)
					|	keep copy _ to end (last-nl?: no)
					]
				]]
				if verbose [print* ["Applying rule to" length? lines "lines"]]
				marker: either all [marker marker/-2 = "#^M"] ["^M^/"]["^/"]	;-- determine the type of new-lines used
			]
			
			count: if count [0]
			result: []
			either lines [										;-- line-by-line matching
				repeat i length? lines [
					line: lines/:i
					set 'line-number i							;-- expose line-number to rule (e.g. `keep (line-number)`)
					either collect [
						append result parse line rule
					][ 
						parse line [(ok?: no) rule (ok?: yes)]
						if ok? [
							either count [
								count: count + 1
							][
								unless write [
									if enum [prin line-number prin "^-"]
									print* to "" line
								]
							]
						]
					]
				]
				if collect [probe new-line/all bin2str result yes]
				if write [										;-- reconstruct the file contents
					new: #{}
					foreach line lines [append append new line marker]
					-ml: negate length? marker
					unless last-nl? [clear skip tail new -ml]
					unless new == data [
						if verbose [print* "Contents have changed. Writing back."]
						system/words/write/binary file new
					]
				]
				if count [print* "Total" count "matches found"]
			][													;-- whole-file matching
				either count [
					parse data [any [rule (count: count + 1) | skip]]
					print* ["Total" count "matches found"]
				][
					if write [old: copy data]
					result: parse data [rule (ok?: yes)]
					if collect [probe new-line/all bin2str result yes]
					if all [write  not old == data] [
						if verbose [print* "Contents have changed. Writing back."]
						system/words/write/binary file data
					]
					if verbose [print* ["Parsing result:" pick ["success" "failure"] ok? = yes]]
					unless ok? [quit/return 1]
				]
			]
		]
		quit/return 0
	][
		print e
		quit/return 2
	]
]


pstext: {
Parse tool works in 2 modes: LINE mode and FILE mode

1. In FILE mode, it matches full file text against the RULE
   and returns 0 if RULE fully covers the file, or 1 if not.
   (useful to check if file follows a certain structure)

   If COLLECT option is provided, collected tokens (if any)
   are also printed to the console.
   (useful to gather info from the file)

   If WRITE option is provided, and RULE changes the input,
   file contents is also written back to the file.
   (useful to modify the file)
   
   If COUNT option is provided, RULE is matched any number of times
   and total number of matches is shown.
   (useful to obtain statistics)

2. In LINE mode, it splits text into lines, then matches RULE against every line.

   If COLLECT option is provided, it prints result collected from ALL lines.
   (useful to gather info from a file that is line-oriented)

   If WRITE option is provided, and RULE changes at least one line,
   file contents is written back to the file and no output is made.
   (useful to modify a file that is line-oriented)

   If COUNT option is provided, number of matching lines is shown.
   (useful to obtain line statistics)
   
   Otherwise, it prints each line that matches the RULE.
   (useful to filter the lines)

Examples:

   Displaying all lines containing 2 consecutive vowels:
parse -e --init "cs: charset {AEIOUaeiou}" FILE "2 cs"

   List what datatypes a file contains:
for %%i in (integer! float! tuple! string! file!) do (
    parse FILE "to %%i"
    if not errorlevel 1 echo Contains %%i
)	

   Collect all mixed-case words:
parse -c --init "mixed?: function [w][s: to string! w not any [s == uppercase copy s  s == lowercase copy s]]" README.md "[any { } copy w word!] opt [if (mixed? w) keep (transcode/one w)]"

   Extract columns 8-15 from the text:
parse -c -l -w FILE "0 8 skip keep copy _ 0 8 skip"

   Extract all line comments from the script:
parse -c -l -w parse.red "to {;} keep to end"
}

cli/process-into/name parse-tool "Parse tool"			;-- use uppercased name