Red[
	Title: "LEST - Low Entropy Site Templating"
	Author: "Boleslav Březovský"
	To-Do: [
		"Cache ignores /PAGE ref"
		"Error handling"
	]
	Fix-Me: [
{
There's currently a problem with empty tags.
I'd like to be able to write [div] to emit {<div></div>}
but that may be problematic.
However, writing [div ""] is currently also problematic
and doesn't close the tag and [div " "] must be used instead.
This *MUST* be fixed.
}
	]
]

; NOTE: This is here as a reminder that LEST needs MarkyMark however,
;		it can’t INCLUDE it because of circular references my ass
;#include %mm.red
#include %common-tools.red
#include %mustache.red
#include %load-rules.red

; TODO: User management should be a separate module
#include %users.red

	; TODO: same as above, should be in a module
	token-to-cookie: func [token] [
		rejoin [token/value "; Expires=" to-rfc5322-date/gmt token/expires]
	]

l: context [

	page?: false

; -- cache handling
	cache-path: %/tmp/lest
	cache-file: cache-path/lest.cache
	cache-data: #[]
	unless exists? cache-path [make-dir cache-path]
	if exists? cache-file [cache-data: load cache-file]
	ignore-cache?: false ; override cache settings (for debug)
; --


	make-tag: func [
		data
		/close
	] [
		collect [
			keep ot
			if close [keep slash]
			keep rejoin data
			keep ct
		]
	]

	to-end-tag: func [value] [to tag! to refinement! value]
	init-tag: func [
		value
		/void
	] [
	; TODO: Isn't CLEAR enough here?
		stop-rule?: false
		tag: make tag-proto []
		tag/data: copy #[]
		tag/events: copy #[]
		tag/class: copy []
		tag/id: none
		tag/tag-name: value
		tag/void?: void
	]
	emit: func [value] [append out value]

	meta!: context [
		title:
		description:
			"Page generated with LEST"
		styles: make block! 8
		scripts: make block! 8
		url: none
		content: none
	]
	meta: none

	template: {
<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width">

		<title>{{title}}</title>
		{{{styles}}}
		<script type="module">
			document.documentElement.classList.remove('no-js');
			document.documentElement.classList.add('js');
		</script>
		{{{scripts}}}
		<meta name="description" content="{{description}}">
		<meta property="og:title" content="{{title}}">
		<meta property="og:description" content="{{description}}">
		<meta property="og:image" content="https://www.mywebsite.com/image.jpg">
		<meta property="og:image:alt" content="Image description">
		<meta property="og:locale" content="en_GB">
		<meta property="og:type" content="website">
		<meta name="twitter:card" content="summary_large_image">
		<meta property="og:url" content="{{url}}">

		<meta name="theme-color" content="#FF00FF">
	</head>

	<body>
{{{content}}}
	</body>
</html>
	}

	out: ""
	mark: rule: key: value: target: none
	tag: tag-proto: context [
		tag-name: none
		name: none
		void?: false
		id: none
		class: none
		events: #[]
		data: #[]
	]
	markymark?: true

	ot: #"<"
	ct: #">"
	eq: #"="
	dq: #"^""

	stack: clear []
	tag-stack: clear []

	stop-rule?: false
	actions: func ['word /local data] [
		data: get word
		also
			do first data
			do [
				set word next data
				if empty? get word [
					rewind :word
					stop-rule?: true
				]
			]
	]
	rewind: func ['word] [set word head get word]

	form-proto: context [
		method: none
		url: none
		value: none
		values: []
	]
	form-ctx: none
	form-value: context [type: name: value: none]
	form-args: [
		
	]
	attribute: func [tag field] [
		either select tag field [
			rejoin [space field eq enquote select tag field]
		] [""]
	]
; -- rules

	run-code: [set value paren! (try to block! value)]
	emit-code: ['emit set value paren! (emit try to block! value)]
	close-tag: quote (
		tag: take/last tag-stack
		emit rejoin [ot slash tag/tag-name ct]
	)
	get-string: [set value [string! | char!]]
	get-target: [set value [url! | file!]]
	get-value: [set value skip]
	emit-string: [
		mark:
		if (markymark?)
		(result: md/only value)
		[
			if (all [single? result equal? first result value])
			(emit result)
		|
			(insert mark result)
			:mark
			rule
		]
	|	(emit value)
	]
	tag-content: [
		opt resolve-word
		content
	]
	emit-tag: quote (
		emit collect [
			keep ot
			keep tag/tag-name
			keep attribute tag 'id
			keep attribute tag 'name
			unless empty? tag/class [
				keep rejoin [space #class eq dq take tag/class]
				while [not empty? tag/class] [
					keep rejoin [space take tag/class]
				]
				keep dq
			]
			foreach [key value] tag/data [
				keep rejoin [space key eq enquote value]
			]
			foreach [key value] tag/events [
				keep rejoin [space key eq enquote fix-quotes value]
			]
			if tag/void? [keep #"/"]
			keep ct
		]
	)
	push-tag: quote (
		append tag-stack tag
	)

	style-rule: [
		any [
			templates
		|	resolve-word
		]
		set value refinement!
		(append tag/class value)
	|	set value issue!
		(tag/id: value)
	|	set key ['name | 'type | 'value | 'style]
		opt resolve-word
		set value string!
		(put tag/data key value)
	]

	para-rule: [
		['p | 'para]
		(init-tag 'p)
		any style-rule
		emit-tag
		push-tag
		tag-content
		; NEWLINE goes after </p>
		(if equal? newline last out [take/last out])
		close-tag
		(emit newline)
	]
	tag-rule: [
		set value [
			'em | 'strong | 'pre | 'blockquote
			| 'h1 | 'h2 | 'h3 | 'h4 | 'h5 | 'h6
			| 'pre | 'code | 'header | 'footer | 'main | 'nav
			| 'div | 'span | 'button
		]
		(init-tag value)
		any style-rule
		emit-tag
		push-tag
		tag-content
		close-tag
	]
	_code-rule: [
		'code
		(class: none)
		(emit {<code})
		(append tag-stack 'code)
		into [
			opt [
				set class issue!
				(emit rejoin [{ class=language-} enquote form class])
			]
			(emit ">")
			rule
		]
		close-tag
	]

	form-type: none

	form-rule: [
		set form-type ['form | 'request]
		form-init
		set value ['get | 'post] (form-ctx/method: form value)
		get-target (form-ctx/url: value)
		emit-form-start
		into [some [form-content | content]]
		(emit </form>)
	]
	form-init: quote (
		form-ctx: make form-proto []
		form-ctx/value: make form-value []
		clear form-ctx/values ; TODO: Is it needed?
	)
	add-form-value: quote (append form-ctx/values copy/deep form-ctx/value)
	name-value-pair: [
		set value [issue! | string!] (put tag/data 'name tag/id: value)
		set value string! (put tag/data 'value value)
	]
	form-content: [
		input-rule
	|	label-rule
	]
	label-rule: [
		'label
		(init-tag 'label)
		any [
			'for
			opt resolve-word
			set value [issue! | string!] (put tag/data 'for value)
		|	style-rule
		]
		emit-tag
		push-tag
		tag-content
		close-tag
	]
	input-rule: [
		set value ['text | 'password | 'submit]
		(init-tag/void 'input)
		(put tag/data 'type value)
		any [
			name-value-pair
		|	style-rule
		|	event-rule
		]
		(if all [tag/id not tag/data/name] [tag/data/name: tag/id])
		emit-tag
;	|	tag-content
	]
	emit-input: quote (
		emit make-tag [
			#input space
			#type eq enquote form-ctx/value/type space
		]
	)
	emit-form-start: quote (
		emit make-tag [
			#form space
			#method eq enquote form-ctx/method space
			#action eq enquote form-ctx/url
		]
	)
	emit-form: quote (
		emit collect/into [
			keep make-tag [
				#form space
				#method eq enquote form-ctx/method space
				#action eq enquote form-ctx/url
			]
			foreach value form-ctx/values [
				keep emit-form-value value
			]
			keep </form>
		] clear ""
	)

	link-rule: [
		['a | 'link]
		(init-tag 'a)
		get-target (tag/data/href: value)
		emit-tag
		push-tag
		tag-content
		close-tag
	]

	image-acts: [
		[tag/data/title: value]
		[tag/data/alt: value]
	]

	image-rule: [
		['image | 'img]
		(init-tag/void 'img)
		some [
			if (stop-rule?)
			(stop-rule?: false)
			break
		|	get-target (tag/data/src: value)
		|	get-string (actions image-acts)
		|	set value pair!
			(tag/data/width: value/x tag/data/height: value/y)
		|	style-rule
		]
		(rewind image-acts)
		emit-tag
	]
	list-rule: [
		set value ['ul | 'ol]
		(init-tag value)
		emit-tag
		push-tag
		some list-item
		close-tag
	]
	list-item: [
		'li
		(init-tag 'li)
		emit-tag
		push-tag
		tag-content
		close-tag
	]

	event-rule: [
		set value lit-word!
		set action string!
		(put tag/events value action)
	]

	request-rule: [
		; NOTE: request/* will emit whole request object for debug purposes
		;		should be hidden by a setting
		set value path!
		[
			if (all [request value/1 = 'request])
			(emit either value/2 = '* [
				rejoin ["" <pre><code> mold request </code></pre>]
				] [get head change value 'request]
			)
		|	true
		]
	]

	cookie-rule: [
		'cookie
		set key string!
		any [
			templates
		]
		set value skip
		(
			if response [
				append response/cookies rejoin [key #"=" value]
			]
		)
	]

	comment-rule: ['comment skip]

	templates: none

	template-rule: [
		basic-template
	|	arg-template
	|	cmd-template
	]

	basic-template: [
		set key set-word!
		set value block!
		(
			append templates compose/deep [
				| mark:
				change (to lit-word! key) [(value)]
				:mark
			]
		)
	]

	arg-name: none
	arg-type: none
	tpl-ctx: none
	tpl-rule: none
	tpl-spec: none

	arg-template: [
		set key set-word!
		'args
		(tpl-ctx: make block! 10)
		(tpl-rule: reduce [quote mark: 'change])
		(tpl-spec: reduce [to lit-word! key])
		into [
			some [
				set arg-name word!
				(arg-type: 'skip)
				opt set arg-type block!
				(
;					repend tpl-ctx [to set-word! arg-name arg-type]
					repend tpl-ctx [to set-word! arg-name none]
					repend tpl-spec ['set arg-name arg-type]
				)
			]
		]
		set value block!
		(
			value: to paren! compose/deep [copy/deep [(value)]]
			repend tpl-rule [tpl-spec value quote :mark]
			repend tpl-ctx [quote __rule: tpl-rule]
			tpl-ctx: context tpl-ctx
			repend templates ['| tpl-ctx/__rule]
		)
	]

	cmd-template: [
		set key set-word!
		condition-rule
		set value skip
		(
			append templates compose/deep [
				| mark:
				change (to lit-word! key) [(value)]
				:mark
			]
		)
	]

	resolve-word: [
		ahead set value word!
		if (
			all [
				value: attempt [get value]
				not any-function? :value
			]
		)
		mark:
		change word! value
		:mark
	]

	included: ['dummy]

	included-rule: [
		'include
		set value [file! | url!]
		(load-rules include value)
	]

	actions: default-act: none

	switch-rule: [
		'switch
		mark:
		change [
			set value skip
			(actions: default-act: none)
			set actions block!
			opt [set default-act block!]
			(
				if path? value [change value 'request] ; TODO: This expect it is always REQUEST
				value: attempt [get value]
				value: switch/default value bind actions 'request any [default-act [none]]
			)
		] value
		:mark
	]

	condition-rule: [
		'if
	|	'either
	|	switch-rule
	]

	head-rule: [
	; -- HEAD
		'title get-string (meta/title: value)
	|	['desc | 'description] get-string (meta/description: value)
	|	'css get-target (append meta/styles value)
	|	'script get-target (append meta/scripts value)
	|	'url get-target (meta/url: target)
	]
	content: [
		opt resolve-word
		templates content
	|	tag-rule
	|	link-rule
	|	image-rule
	|	list-rule
	|	form-rule
	|	run-code
	|	emit-code
	|	'hr	(emit "<hr />^/")
	|	'br	(emit "<br />^/")
	|	para-rule
	|	request-rule
	|	cookie-rule
	|	get-string emit-string
	|	form-content
	|	template-rule
	|	comment-rule
	|	condition-rule
	|	ahead block! into rule
	|	resolve-word
	]
	rule: [
		any [
			set value paren! 
		|	'no-cache
		|	'page     (page?: true)
		|	'snippet  (page?: false)
		]
		any head-rule
		some content
	]

	request: none
	response: none

	set 'lest func [
		data [file! url! block! binary!]
		/page "Return full HTML page instead of just processed input"
		/only "Do not process input using Markdown parser"
		/cache "Pass cache ID as DATA arg (SHA256 checksum)"
		/hash "Return also hash as [data hash]"
		/trace
		/local file cache? id
	][
		page?: page
		if any [file? data url? data] [data: read data]
		id: either cache [
			data
		] [
			checksum either block? data [mold data] [data] 'sha256
		]
		if string? data [
			unless attempt [data: load/all data] [return data]
		]
		cache?: (not find data 'no-cache) and (not ignore-cache?)
		if all [
			cache?
			file: select cache-data id
		] [
			data: try [read cache-path/:file]
			if data [return data]
			#FIXME "If the cache file does not exist, we have no way to reacreate it"
		]
		markymark?: not only
		out: clear ""
		meta: make meta! []
		templates: copy ['dummy]
		#NOTE "HUB integration, works only from running HUB web server"
		if value? 'httpd [
			request: probe httpd/request
			response: probe httpd/response
		]
		#TODO "Check if PARSE failed"
		either trace [parse-trace data rule] [parse data rule]
		out: either page? [
			page: copy template
			meta/styles: collect [
				foreach value meta/styles [
					keep rejoin [
						{<link href="} value {" rel="stylesheet">^/}
					]
				]
			]
			meta/scripts: collect [
				foreach value meta/scripts [
					keep rejoin [
						{<script src="}
						value
						{" type="text/javascript"></script>}
					]
				]
			]
			meta/content: out
			mustache page meta
		] [out]
		if cache? [
			put cache-data id to file! file: rejoin [
				save/as none id 'base64url
				%.cache
			]
			if error? try [
				write cache-path/:file out
				save cache-file cache-data
			] [
				; if files can't be saved, removed them from cache list
				remove/part find cache-data id 2
			]
		]
		either hash [reduce [out id]] [out]
	]
 ; -- end of context
]
