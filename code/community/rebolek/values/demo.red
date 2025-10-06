Red[
	Notes: {
There are bascally three actions:

* Initial - when demo mode starts
* Actions - they are passed to normal engine and result is compared to expected one
* Ending  - quit, demo mode ends
}
]

demos: [
	default [
		info: {
	Welcome to **Values** - Red symbolic editor.

Values is front-end agnostic editor, however this demo expects you are using terminal front-end
(it's fairly safe assumption, as there are no other front-ends currently).

This demo will show you, how to use search. Command for search is `/`. 
Type `/value` to find `value`.

To exit demo, enter `q`.
}
		commands: ["/value"]
		exit: {Good bye!}
	]
]


demo!: context [
process-led: func [value][
	process switch/default value [
		"q" ['quit]
	][
		'default
	]
] 
process: func [
	value
][
	switch value [
		quit [[quit]]
		default [
			reduce ['show parse-md demos/default/info]
		]
	]
]

; --- end of context
]
