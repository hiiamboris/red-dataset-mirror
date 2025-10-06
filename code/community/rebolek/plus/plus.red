Red [
	Title: "PLUS - Plugin system"
	Author: "Boleslav Březovský"
	Notes: {
= Plugin system

Each plugin is object with few mandatory fields:

* `init`: inits itself. Called from plugin system.

* `rule`: parse rule that is register to plugin system.

This means each plugin can be registered multiple times with different data.

In `init` phase, plugins are loaded to `plugin-protos`.

When the rule is matched, object! in `plugin-protos` is modified. After match
ends, this object! is cloned and added to `plugins` block!. Original object!
then calls `init` and resets its state.

It may seem that initing object first would make more sense, but then we would
have to rebound rules. This way it works more natural from user’s POV.

It’s also possible to have global rules that change plugin state.
Put such rules into `global-rules` object!.
TODO: Loading mechanism for such global rules.
	}
] 

load-header: func [
	file
][
	file: load file
	system/script/header: second file
	skip file 2
]

plugin!: context [
	data: none
]

plus: context [

plugin-protos: #()

plugins: []

plugin-path: %plugins/

rules: ['dummy]

load-plugins: func [
	/local files file data ;g-rules
][
	files: read plugin-path
	g-rules: copy []
	foreach file files [
		data: load-header plugin-path/:file
		header: system/script/header
		switch probe to word! header/type [
			plugin [
				print "plugin"
				name: header/name
				plugin-protos/:name: make plugin! data
				repend rules [
					'| ; name 
					to paren! compose [init-plugin (name)]
					data/rule
					to paren! [add-plugin]
				]
			]
			rules [append g-rules data]
		]
		global-rules: context bind g-rules self
		bind rules global-rules
	]
]

global-rules: none
plugin: none

init-plugin: func [
	name 
][
	print "init-plugin"
	plugin: plugin-protos/:name
	plugin/init
]

add-plugin: func [][
	print mold plugin
	append plugins make plugin []
]

parse-dialect: func [data][
	; TODO: move binding to load-plugins?
	parse data [some rules]
]

; -- end of plus context
]

test: [
	plus/load-plugins
	plus/parse-dialect [
		hello world [1 2 3 4] 
		gabra [doktor the cat] 
		hello world [a b c d e f g h]
		gabra [hubert]
	]
]
