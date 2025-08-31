
#4227: crash in string/concatenate-literal-part
================================================================================
Issue is closed, was reported by loziniak and has 16 comment(s).
[status.built] [status.tested] [GUI]
<https://github.com/red/red/issues/4227>

Hi, this code crashes under Windows 7 and Wine. Compiled with `-r`:
```
Red [Needs: 'View]

metrics_font: make font! []

styles: reduce [
	'menu-button [
		default-actor: on-down
		template: [
			type: 'base
			actors: [
				on-create: func [face [object!] event [event! none!]] [
					face/draw: copy []
					append face/draw compose [
						font (metrics_font)
					]
				]
			]
		]
	]
]

vid-code: compose/only [
	on-resizing [
		print "ERROR?"
		probe metrics_font
		print "There was no error."
	]
	menu-button []
]

window: layout/styles vid-code styles
view/flags window ['resize]
```
The output is:
```
ERROR?

*** Runtime Error 98: assertion failed
*** in file: /home/devel/prj/red/gtk/red-github/runtime/datatypes/string.reds
*** at line: 1063
***
***   stack: red/string/concatenate-literal-part 00000062h 00438A1Eh 30422756
***   stack: red/string/concatenate-literal-part 01A300E4h 009E00C4h 10354885
***   stack: red/datatype/mold 01D03568h 01A300E4h false false true 00000000h 0 0
***   stack: red/actions/mold 01D03568h 01A300E4h false false true 00000000h 0 0
***   stack: red/error/reduce 01A300C4h 01A300A4h
***   stack: red/error/form 01A300A4h 01A300B4h 01A30094h -18
***   stack: red/actions/form 01A300A4h 01A300B4h 01A30094h 0
***   stack: red/actions/form* -1
***   stack: red/natives/do-print true true
***   stack: red/natives/print* true
***   stack: do-safe
***   stack: do-actor
***   stack: ctx||403~awake 01703814h
***   stack: gui/make-event 00577D0Ch 0 32
***   stack: gui/WndProc 000701F0h 5 0 1310836
```

It does not crash when interpreted.
It also does not crash when compiled for Linux.

Compiled using Red GTK branch sources, commit d89f33b100 (17 Dec 2019)


Comments:
--------------------------------------------------------------------------------

On 2020-01-08T17:23:30Z, qtxie, commented:
<https://github.com/red/red/issues/4227#issuecomment-572171328>

    No crashes on my Win7 SP1 (6.1.7601). @loziniak Did you install SP1 for Win7?

--------------------------------------------------------------------------------

On 2020-01-09T10:39:17Z, loziniak, commented:
<https://github.com/red/red/issues/4227#issuecomment-572501804>

    `6.1.7601` here as well.

--------------------------------------------------------------------------------

On 2020-01-09T11:01:10Z, loziniak, commented:
<https://github.com/red/red/issues/4227#issuecomment-572510350>

    Now compiled with latest master (e26452d77c), but it's all the same. Do you compile on Windows or cross-compile from Linux?

--------------------------------------------------------------------------------

On 2020-01-29T23:14:49Z, hiiamboris, commented:
<https://github.com/red/red/issues/4227#issuecomment-580007392>

    This reminds me of https://github.com/red/red/issues/4183
    Try copying the font

--------------------------------------------------------------------------------

On 2020-01-30T01:27:27Z, greggirwin, commented:
<https://github.com/red/red/issues/4227#issuecomment-580042268>

    Crashes Win10 REPL as is. If I copy the font, as @hiiamboris suggests, no error.

--------------------------------------------------------------------------------

On 2020-01-30T08:39:44Z, loziniak, commented:
<https://github.com/red/red/issues/4227#issuecomment-580143154>

    Thanks for a workaround, @hiiamboris !

--------------------------------------------------------------------------------

On 2020-01-30T09:41:04Z, 9214, commented:
<https://github.com/red/red/issues/4227#issuecomment-580169036>

    There's such thing called "minimal example".
    
    ```red
    draw 0x0 reduce ['font font: make font! []] ? font
    ```

--------------------------------------------------------------------------------

On 2020-01-30T10:09:16Z, loziniak, commented:
<https://github.com/red/red/issues/4227#issuecomment-580180684>

    @9214 It's brilliant (although not very kind), thanks.

