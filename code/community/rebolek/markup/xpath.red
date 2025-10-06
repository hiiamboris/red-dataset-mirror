Red []

#include %xml.red

; -- White Space
S: charset reduce [space tab cr lf]
S?: [opt S]
S*: [any S]
S+: [some S]

; -- string functions

string: func [value] []

concat: func [value] [rejoin value]

starts-with: func [s1 s2] [find/match s1 s2]

contains: func [s1 s2] [find s1 s2]

substring: func [string start length] [copy/part at string start length]

substring-before: func [s1 s2] [first parse s1 [collect [keep to s2]]]

substring-after: func [s1 s2] [copy next find s1 s2]

string-length: func [string] [length? string]

normalize-space: func [string] [
	rejoin parse string [
		S*
		collect [
			some [
				S+ end
			|	S+ keep (#" ")
			|	keep to S
			|	keep to end
			]
		]
		S*
	]
]


; -- support

tree-select: func [tree path] [
	foreach [name data attrs] [

	]
]

; -- test

data: load %data/test4.xml

tree-select data [Wikimedia project editions edition]
