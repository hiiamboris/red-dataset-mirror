Red[
	Title: "Values scanner - static analysis of Red script."
	Usage: {
# Basic usage

```
vs <script>
```

where <script> is `file!` or `string!`

*vs* returns block with info about script. Following fields are included:

- functions
- objects
- code
- structure
- words
- script
- info

## Functions

`map!` of functions defined at top level. Doesn't include functions defined
in objects (may change later).

## Objects

map! of objects defined at top level. See above

## Code

Block of separate code that is on top level 

## Structure

Block of functions, objects and code blocks. Whole script could be recreated
from this structure.

## Words

Block of new words.

## Script

Loaded script

## Info

Script statistics consisting of:

- length (total number of values)
- types (statistics about used types)

# Advanced usage

Function matching is done with `parse` rule that checks for `func` or `function`
words. If you are using your custom function constructors, use `scanner!/add-func-def <name>`
e.g.: `scanner!/add-func-def 'lfunc`.
To remove custom definitions, use `scanner!/clear-func-defs` function.

}
]

scanner!: context [
	functions: #()
	objects: #()
	code: []
	structure: []
	block: []
	info: []
	words-cache: []
	name: value: none
	args: locals: spec*: body*: none

	init: func [
	][
		clear functions
		clear objects
		clear code
		clear structure
		clear block
		store-words
	]

	store-words: does [insert/only words-cache copy words-of system/words]
	diff-words: does [
		store-words
		difference first words-cache second words-cache
	]

	store-block: does [
		unless empty? block [
			append/only code copy block 
			clear block
			append/only structure make path! reduce ['code length? code]
			new-line back tail structure true
		]
	]
	clear-func-defs: does [func-def: ['func | 'function]]
	add-func-def: func [name][
		append func-def '|
		append func-def to lit-word! name
	]
	skip-head: [opt ['Red block!]]
	set-name: [
		set name set-word! (name: to word! name)
	|	'set set name word!
	]
	func-def: ['func | 'function]
	match-func: [
		set-name
		(args: locals: spec*: body*: none)
		[
			func-def set spec* block! set body* block!
		|	'does set body* block!
		|	'has set locals block! set body* block! (spec: reduce [/locals locals])
		|	'make ['function! | 'op!] [
				set args block! (set [spec* body*] args)
			|	set args get-word! (
					args: get args
					spec*: spec-of :args
					body*: body-of :args
				)
			]
		] (
			unless spec* [spec*: []]
			; NOTE: This is here just because #3595, remove once it's fixed
			if mark: find spec* quote return: [
				remove find mark string!
			]

			store-block
			functions/:name: make func! [spec: spec* body: body* value: func spec* body*] 
			append/only structure make path! reduce ['functions name]
			new-line back tail structure true
		)
	]
	match-object: [
		set-name
		(body: none)
		['context | 'object | 'make 'object!]
		set body block! ; TODO: add support for map! also (or as separate func?)	
		(
			store-block
			objects/:name: body
			append/only structure make path! reduce ['objects name]
			new-line back tail structure true
		)
	]
	match-anything: [
		set value skip (
			append/only block value
		) 
	]
	rule: [
		skip-head
		some [
			match-func
		|	match-object
		|	match-anything
		]
	]

	construct: func [
		/local script data
	][
		script: copy [] ; TODO: clear?
		foreach value structure [
			switch value/1 [
				code [
					append script get value
				]
				functions [
					data: get value
					repend script [to set-word! value/2 'func data/1 data/2]
					new-line skip tail script -4 true
				]
			]
		]
		script
	]

	set 'vs func [
		script
		/local source ctx
	][
		init
		store-words
		if file? script [script: read script]
		source: either string? script [script][mold script]
		script: load script
		either block? script [
			parse script rule
			reduce [
				'functions functions
				'objects objects
				'code code
				'structure structure
				'words diff-words  
				'script script
				'info enumerate script
				:construct
			]
		][
			; TODO: some scripts may be just a map! or something that is not a block!
			none
		]
	]
]

