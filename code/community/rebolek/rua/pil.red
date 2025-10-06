Red[]

base: https://www.lua.org/pil
chapter-1: %1.html

result: []

next-page: [
	thru <table width="100%" class="nav">
	thru <td width="10%" align="right">
	thru {<a href="} copy target to #"^""
]

main-rule: [
	next-page
	some [
		<pre> copy code to </pre>
		(append result code)
	|	skip
	]
]

parse-pil: func [
	"Add all code chunks to RESULT and return next chapter"
	link
][
	target: none
	page: read probe link
	probe parse page main-rule
	target
]

init: func [file default][
	any [
		all [exists? file load file]
		default
	]
]

get-all: func [][
	result: init %code.red copy []
	chapter: init %chapter.red chapter-1
	while [chapter][
		link: rejoin [dirize base chapter]
		save %code.red result
		if chapter: parse-pil link [save %chapter.red chapter]
		
	]
]
