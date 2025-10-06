Red[]

#include %../mustache.red

do-tests: func [
	/local index source data output
][
	index: 0
	foreach test tests [
		set [source data output] reduce test
		index: index + 1
		print index
		if file? source [source: read source]
		result: mustache source data
		probe equal? result output
	]
]

do-test: func [index][
	test: pick tests index
	set [source data output] reduce test
	if file? source [source: read source]
	result: mustache source data
	equal? output result
]

tests: [
	[
{Hello {{name}}
You have just won {{value}} dollars!
{{#in_ca}}
Well, {{taxed_value}} dollars, after taxes.
{{/in_ca}}}
		context [
			name: "Chris"
			value: 10000
			taxed_value: 10000 - (10000 * 0.4)
			in_ca: true
		]
{Hello Chris
You have just won 10000 dollars!
Well, 6000.0 dollars, after taxes.
}
	][
{* {{name}}
* {{age}}
* {{company}}
* {{{company}}}}
		context [
			name: "Chris"
			company: "<b>GitHub</b>"
		]
{* Chris
* 
* &lt;b&gt;GitHub&lt;/b&gt;
* <b>GitHub</b>}
	][
{Shown.
{{#person}}
  Never shown!
{{/person}}}
		context [
			person: false
		]
{Shown.
}
	][
{{{#repo}}
  <b>{{name}}</b>
{{/repo}}}
		context [
			repo: [
				#[name: "resque"]
				#[name: "hub"]
				#[name: "rip"]
			]
		]
{  <b>resque</b>
  <b>hub</b>
  <b>rip</b>
}
	][
{{{#wrapped}}
  {{name}} is awesome.
{{/wrapped}}}
		context [
			name: "Willy"
			wrapped: func [value][
				rejoin ["" <b> value </b>]
			]
		]
{<b>  Willy is awesome.
</b>}
	][
{{{#person?}}
  Hi {{name}}!
{{/person?}}}
		context [
			person?: context [name: "Jon"]
		]
{  Hi Jon!^/}
	][
{{{#repo}}
  <b>{{name}}</b>
{{/repo}}
{{^^repo}}
  No repos :(
{{/repo}}}
		context [
			repo: []
		]
{^/  No repos :(^/}
	][
{<h1>Today{{! ignore me }}.</h1>}
		#[]
{<h1>Today.</h1>}
	][
		%base.mustache
		context [
			names: #[name: "Alice"]
		]
{<h2>Names</h2>
  <strong>Alice</strong>

}
	]
]
