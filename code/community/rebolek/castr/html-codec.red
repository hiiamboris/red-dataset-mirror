Red [
	Title:          "HTML"
	Description:    "Encoder and decoder for HTML and XML format"
	Author:         "Boleslav Březovský"
	Notes: [
{
== UNCLOSED <P> TAG ==

A p element’s end tag may be omitted if the p element is immediately followed
by an address, article, aside, blockquote, dir, div, dl, fieldset, footer,
form, h1, h2, h3, h4, h5, h6, header, hr, menu, nav, ol, p, pre, section,
table, or ul element, or if there is no more content in the parent element
and the parent element is not an a element.

== UNCLOSED <DD> TAG ==

The start tag is required. The end tag may be omitted if this element
is immediately followed by another <dd> element or a <dt> element,
or if there is no more content in the parent element.
}
	]
	To-Do: [
		"STRICT mode to ignore all quirks"
	]
]

; -- TODO: move to separate file --------------------------------------------

debug?: no

debug: func [
	value
	/init
] [
	if all [debug? init] [write value "" exit]
	if debug? [
		write/append %debug value
		print value
		print [
			"stack:" length? html/stack
			"atts-stack:" length? html/atts-stack
			rejoin [index? html/pos "/" length? html/doc]
		]
		if (length? html/stack) <> (length? html/atts-stack) [
			print "stacks differ"
			halt
		]
		wait 0.01
;		if "q" = ask "Q to quit:" [halt]
	]
]
debug/init %debug

context [
	test-dir: %tests/html/
	tests: none
	init-tests: does [
		; TODO: support multiple test files
		tests: skip load test-dir/quirks.red 2
	]

	set 'run-test func [test] [
		if integer? test [
		unless tests [init-tests]
			test: pick tests test
		]
		; TODO: check for empty stack
		equal? load-html test/1 test/2
	]

	set 'run-tests func [/init /local index] [
		if any [not tests init] [init-tests]
		index: 0
		failed: clear []
		foreach test tests [
			index: index + 1
			unless run-test test [append failed index]
		]
		failed
	]
]

; ===========================================================================

; TODO: NAME* rules should be CHAR*

html: context [

	; === SUPPORT ===========================================================

	penult: func [series] [first back back tail series]

	unclosable?: func [
		"Return TRUE if tag can be unclosed"
		tag
	] [
		to logic! find [
			"html" "head" "body" "p" "dt" "dd" "li" "option" "thead" "th"
			"tbody" "tr" "td" "tfoot" "colgroup"
		] tag
	]

	close-current?: func [] [
		print ["CC:" name= name-ahead=]
	]

	select-end-tag: func [tag] [
		end-tag: switch/default tag [
			"p"			[end-p-tag]
			"dd" "dt"	[end-dd-tag]
			"li"		[end-li-tag]
			"option"	[end-option-tag]
			"thead"		[end-thead-tag]
			"th" "td"	[end-th-tag]
			"tr"		[end-tr-tag]
		] [tag]
	]

	; === SETTINGS ==========================================================

	empty-value: none   ; used for single tags that have no content
	align-content?: yes ; store `HTML` strings as one or three values:
						; `string` or `[NONE string NONE]`
						; this required for traversing with `foreach-node`
	key-type: string!	; `string!` or `word!` for conversion where possible

	; == VARS ===============================================================

	omitable-close?: false
	atts-stack: []
	stack: []
	end-stack: []
	name=: none
	name-ahead=: none
	atts=: #[]
	att-name=:
	att-value=: none
	doc: none
	pos: []
	value: none
	s: e: t: none

	; === RULES =============================================================

	push-atts: [(append atts-stack copy atts=)]
	pop-atts: [keep (take/last atts-stack)]

	keep-name: [
		(try [name=: to word! name=])
		keep (name=)
	]

	document: [
		(clear stack)
		(clear atts-stack)
		some content
	]
	whitespace: charset " ^-^/^M"
	ws: [any whitespace]
	name-start-char: charset [
		":_" #"a" - #"z" #"A" - #"Z" #"^(C0)" - #"^(D6)" #"^(D8)" - #"^(F6)"
		#"^(F8)" - #"^(02FF)" #"^(0370)" - #"^(037D)" #"^(037F)" - #"^(1FFF)"
		#"^(200C)" - #"^(200D)" #"^(2070)" - #"^(218F)" #"^(2C00)" - #"^(2FEF)"
		#"^(3001)" - #"^(D7FF)" #"^(F900)" - #"^(FDCF)" #"^(FDF0)" - #"^(FFFD)"
		#"^(010000)" - #"^(0EFFFF)"
	]
	name-char: union name-start-char charset [
		"-." #"0" - #"9" #"^(B7)" #"^(0300)" - #"^(036F)" #"^(203F)" - #"^(2040)"
	]
	name: [name-start-char any name-char]
	single-tags: [
		"area" | "base" | "br" | "col" | "command" | "embed" | "hr" | "img"
	|	"input" | "keygen" | "link" | "meta" | "param" | "source" | "track"
	|	"wbr"
	]

; -- content --

	metadata-content: [
		"base" | "command" | "link" | "meta" | "noscript" | "script" | "style"
	|	"title"
	] ; obsolete: command
	flow-content: [
		"a" | "abbr" | "address" | "article" | "aside" | "audio" | "b" | "bdo"
	|	"bdi" | "blockquote" | "br" | "button" | "canvas" | "cite" | "code"
	|	"command" | "data" | "datalist" | "del" | "details" | "dfn" | "div"
	|	"dl" | "em" | "embed" | "fieldset" | "figure" | "footer" | "form"
	|	"h1" | "h2" | "h3" | "h4" | "h5" | "h6" | "header" | "hgroup" | "hr"
	|	"i" | "iframe" | "img" | "input" | "ins" | "kbd" | "keygen" | "label"
	|	"main" | "map" | "mark" | "math" | "menu" | "meter" | "nav" | "noscript"
	|	"object" | "ol" | "output" | "p" | "picture" | "pre" | "progress"
	|	"q" | "ruby" | "s" | "samp" | "script" | "section" | "select" | "small"
	|	"span" | "strong" | "sub" | "sup" | "svg" | "table" | "template"
	|	"textarea" | "time" | "ul" | "var" | "video" | "wbr"
	] ; obsolete: command, deprecated: keygen
;	<area>, if it is a descendant of a <map> element
;	<link>, if the itemprop attribute is present
;	<meta>, if the itemprop attribute is present
;	<style>, if the scoped attribute is present
	sectioning-content: [
		"article" | "aside" | "nav" | "section"
	]
	heading-content: [
		"h1" | "h2" | "h3" | "h4" | "h5" | "h6" | "hgroup"
	]
	phrasing-content: [
		"abbr" | "audio" | "b" | "bdo" | "br" | "button" | "canvas" | "cite"
	|	"code" | "command" | "data" | "datalist" | "dfn" | "em" | "embed"
	|	"i" | "iframe" | "img" | "input" | "kbd" | "keygen" | "label"
	|	"mark" | "math" | "meter" | "noscript" | "object" | "output"
	|	"picture" | "progress" | "q" | "ruby" | "samp" | "script" | "select"
	|	"small" | "span" | "strong" | "sub" | "sup" | "svg" | "textarea"
	|	"time" | "var" | "video" | "wbr"
	] ; obsolete: command, deprecated: keygen
	embedded-content: [
		"audio" | "canvas" | "embed" | "iframe" | "img" | "math" | "object"
	|	"picture" | "svg" | "video"
	]
	interactive-content: [
		"a" | "button" | "details" | "embed" | "iframe" | "keygen" | "label" 
	|	"select" | "textarea"
	]
	form-associated-content: [
		"button" | "fieldset" | "input" | "keygen" | "label" | "meter"
	|	"object" | "output" | "progress" | "select" | "textarea"
	] ; deprecated: keygen

; -- content -- (main rule) --
	
	close-tags: 0
	
	content: [
		pos:
		errors (debug ["|errr|" name=]) 	; error has higher priority
	|	if (close-tags > 0) break			; we are in close loop: there are unclosed tags that need to be closed
	|	new-close-tag break
	|	if (unclosable? last stack) close-opt-tag2 break
	|	comment (debug ["|cmnt|" name=])
	|	doctype (debug ["|dctp|"])
	|	some [
			open-tag
			(debug rejoin ["|open| <" name= ">"])
			collect any content
			(debug rejoin [close-tags "|clse| <" name= "> stack:" mold stack])
			(take/last stack)
			pop-atts
			(close-tags: close-tags - 1)
			break
		]
	|	single-tag (debug ["|sngl|" name=])
	|	string (debug ["|strn|" mold t: copy/part s e length? t])
	]

; --

	close-omitable: [
		(name=: last stack)
		(take/last stack)
		pop-atts
	]
	open-tag: [
		ws
;		ahead [#"<" copy name-ahead= some name]
		#"<"
		not ahead single-tags
		(debug "--open-tag?")
		copy name= some name
		ws atts ws
		#">"
		(debug ["--open-tag" mold name=])
		push-atts
		(if unclosable? name= [append end-stack name=])
		(append stack name=)
		(select-end-tag last stack)
		; NOTE: sometimes, there may be some total nonsense as a tag name
		;		so to be sure we can handle everything, let’s be safe
		;		and TRY the conversion first, with keeping string
		;		as a safe failback
		keep-name
	]
	close-tag: [
		(debug "--close-tag?")
		close-opt-tag1
	|	pos: (debug ["std close tag@" copy/part pos 5 #- last stack]) 
		ws "</"
		(name=: last stack)	; first we test the name
		name=				; and if it matches, we can remove it
		(take/last stack)	; this prevents stack corruption
		#">"				; in case of badly writen HTML (wild close tag)
		(name=: none)
		pop-atts
;	|	; This is ERROR checking - unlosed tags that should be closed but aren't
;		;	get closed by previous tag (<div><span>unclosed</div>)
;		(print "CHECK PREV")
;		(prev-checking?: true)
;		(prev-index: -1 + length? stack)
;		close-prev-tag
	]
	wild-close-tag: [
		pos:
		ws "</"
		(debug ["CHECK WILD:" last stack "@" trim/lines copy pos])
		(name=: last stack)
		x0:
		not name= x1:
		copy name= some name
		if (

			closing?: false
			repeat i length? stack [
				index: (length? stack) - i + 1
				if equal? name= stack/:index [closing?: true break]
			]
			any [
				all [								; some tags can be unclosed
					unclosable? last stack			; but we must be sure
;					not equal? name= penult stack	; that the closing tag
					not closing?
				]									; is from level above
;				not equal? "p" last stack
				not unclosable? last stack
			]
		)
		#">"
	]
	new-close-tag: [
		pos:
		ws "</"
		(debug ["NEW CLOSE:" last stack "@" trim/lines copy pos])
		(name=: last stack)
		copy name= some name
		(
			close-tags: 0
			length: length? stack
			match?: false
			repeat index length [
				i: length - index + 1
				close-tags: close-tags + 1
				if equal? name= pick stack i [
					match?: true
					break
				]
			]
			; it’s possible it’s a wild close tag, in that case just ignore it
			unless match? [close-tags: 0]
; now it should close (index + 1) tags.
		)
		#">"
		content
	]
	tag-chars: charset "<>"
	unclosed-tag: [
		#"<"
		some [not tag-chars skip]
		ahead #"<"
	]

	close-opt-tag1: [
; there are three ways to close <p> and <dd> tag:
		if (unclosable? last stack)
		pos:
		(debug ["|uncl|" mold stack mold pos])
		[
			ws "</" [
		; 1. </p>, </dd>
				(name=: last stack)
				name=
				#">"
		; 2. close parent tag
			|	(name=: first back back stack)
				name=
				:pos	; rewind so CLOSE-TAG for above tag can catch it again
						; TODO: change to AHEAD, needs rule rewrite
			]
		|	if (unclosable? last stack)
		]
		(take/last stack)
		(name=: none)
		pop-atts
		(debug "closed para1")
	]
	close-opt-tag2: [
; 3. open tag from END-P-TAG list
		pos:
		ahead [#"<" end-tag]
		(select-end-tag penult stack)
	]
	end-tag: none
	end-p-tag: [
		"address" | "article" | "aside" | "blockquote" | "dir" | "div" | "dl"
	|	"fieldset" | "footer" | "form" | "h1" | "h2" | "h3" | "h4" | "h5"
	|	"h6" | "header" | "hr" | "menu" | "nav" | "ol" | "p" | "pre"
	|	"section" | "table" | "ul"
	|	"body" ; NOTE: it’s not in the list, but obviously is needed
	]
	end-dd-tag: ["dd" | "dt"]
	end-li-tag: ["li"]
	end-option-tag: ["option" | "optgroup"]
	end-thead-tag: ["tbody" | "tfoot"]
	end-th-tag: ["th" | "td"]
	end-tr-tag: ["tr"]
	close-char: #"/"
	action: none
	single-tag: [
		(close-char: #"/")
		ws #"<" opt [#"!" (close-char: "")]
		(debug "--single-tag?")
		copy name= [
			single-tags (close-char: [opt #"/"])
		|	some name
		]
		ws atts ws
		close-char #">"
		(debug ["--single-tag" mold name=])
		opt ["</" name= #">"]
		push-atts
		keep-name
		keep (empty-value) ; empty content
		pop-atts
	]
	;TODO: for HTML attribute names, #":" should be excluded
	pair-att: [
		ws not #"/"
		copy att-name= some name
		#"=" [
			set quot-char [#"^"" | #"'"]
			copy att-value= to quot-char skip
		|	copy att-value= to [#">" | whitespace]
		]
		ws (
			all [
				equal? word! key-type
				try [t: to set-word! att-name=]
				att-name=: t
			]
			atts=/:att-name=: att-value=
		)
	]
	single-att: [
		ws not #"/"
		copy att-name= some name
		ws
		(atts=/:att-name=: true)
	]
	atts: [
		(atts=: copy #[]) ; FIXME: IMO `clear` should be enough here, but it is not
		ws any [pair-att | single-att]
	]
	comment: [ws "<!--" thru "-->" ws]
	string: [
		s: any [
			if (find ["script" "pre"] name=) not ahead ["</" name= #">"] skip 
			; accept #"<" inside <script> and <pre>
		|	ahead ["</" | "<" name] break
		|	skip
		] 
		e: [
			if (
				value: copy/part s e
				all [not empty? value align-content?]
			) [
				; FIXME: three `keep`s are here because `keep` works as `keep/only`
				keep (none)
				keep (value)
				keep (#[]) ; TODO: should be user defined?
			]
		|	if (not align-content?) [keep (copy/part s e)]
		]
	]
	doctype: [
		; TODO: Add some output and better handling
		"<!DOCTYPE" thru #">"
	]
	errors: [
;		wild-close-tag (debug ["|wild|" name=])
;	|	
	unclosed-tag (debug ["|uncl|" name=])
	]

	init-parser: func [] [
		; theoretically, all stacks should be empty, but...
		clear stack
		clear atts-stack
		clear end-stack
		omitable-close?:
		name=:
		name-ahead=:
		att-name=:
		att-value=:
		pos:
		end-tag:
		s: e: t: none
		close-tags: 0
	]

	set 'load-html func [
		data [string! file! url!]
	] [
		unless string? data [data: read data]
		init-parser
		doc: data
		parse data [collect document]
	]

; === encoder part

	dbl-quot: #"^""
	output: make string! 10000

	enquote: function [value] [rejoin [dbl-quot value dbl-quot]]

	make-atts: function [
		data
	] [
		data: collect/into [
			foreach key keys-of data [
				keep rejoin [key #"=" enquote data/:key space]
			]
		] clear ""
		unless empty? data [insert data space]
		data
	]

	make-tag: function [
		name
		/with
			atts
		/close
		/empty
	] [
		atts: either with [rejoin [space make-atts atts]] [""]
		rejoin trim reduce [
			#"<" if close [#"/"] form name atts if empty [" /"] #">"
		]
	]

	process-tag: function [
		data
	] [
		output: make string! 1000
		either data/1 [
			; tag
			either empty? data/2 [
				; empty tag
				debug ["single tag" mold data]
				repend output [#"<" form data/1 make-atts data/3 "/>"] 
			] [
				; tag pair
				debug ["tag pair" mold data]
				repend output [#"<" form data/1 make-atts data/3 ">"] 
				until [
					repend output process-tag take/part data/2 3
					empty? data/2
				]
				repend output ["</" form data/1 ">"]
			]
		] [
			; content
			repend output data/2
		]
		output
	]

	set 'to-html function [
		data
	] [
		data: copy data
		clear output
		; TODO add proper header: xml/doctype
		until [
			repend output process-tag take/part data 3
			empty? data
		]
		output
	]
]
