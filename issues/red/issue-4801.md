
#4801: Complex CRASH in View involving on-over and pane modification
================================================================================
Issue is open, was reported by hiiamboris and has 10 comment(s).
[type.bug] [GUI] [type.design]
<https://github.com/red/red/issues/4801>

[Kudos to @dsunanda for discovering it](https://gitter.im/red/bugs?at=60031a6d787d8f79c8070a2f)

**Describe the bug**

On-over events' code first messes up `pane` of the window badly, then crashes.
![](https://i.gyazo.com/a5032032871af6047f6517d8a77e0469.gif)

If you close it before the crash you'll see in the output:
```
VIEW: WARNING: free null window handle!
VIEW: WARNING: free null window handle!
VIEW: WARNING: free null window handle!
```

Two stack traces have been observed:
```
*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/d2d/modules/view/backends/windows/gui.reds
*** at line: 138
***
***   stack: gui/get-face-values 005F06B2h
***   stack: gui/BaseWndProc 005F06B2h 15 0 0
```
and
```
*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/d2d/runtime/datatypes/context.reds
*** at line: 22
***
***   stack: red/_context/find-word 00000014h 109 true
***   stack: red/object/eval-path 027BF634h 02D6AF90h 00000000h 02D6A928h false
***   stack: red/actions/eval-path 027BF634h 02D6AF90h 00000000h 02D6A928h false
***   stack: red/interpreter/eval-path 02D6AF90h 02D6A938h 02D6A9C8h false false true false
***   stack: red/interpreter/eval-expression 02D6A938h 02D6A9C8h false true false
***   stack: red/interpreter/eval-arguments 027BF624h 02D6A928h 02D6A9C8h 00000000h 00000000h 029EFEE8h
***   stack: red/interpreter/eval-code 029EFEE8h 02D6A928h 02D6A9C8h false 00000000h 00000000h 029EFEE8h
***   stack: red/interpreter/eval-expression 02D6A928h 02D6A9C8h false false false
***   stack: red/interpreter/eval 02D6A860h true
***   stack: red/interpreter/eval-function 027BF5D4h 02D6A860h
***   stack: red/_function/call 027BF5D4h 00F5AB8Ch
***   stack: red/interpreter/eval-code 027BF4D4h 02CF22F8h 02CF22F8h false 00000000h 00000000h 027BF4D4h
***   stack: red/interpreter/eval-expression 02CF22D8h 02CF22F8h false false false
***   stack: red/interpreter/eval 027BF5C4h true
***   stack: red/natives/do* false -1 -1 -1
***   stack: red/interpreter/eval-arguments 027BF5B4h 02CF8230h 02CF8240h 00000000h 00000000h 029F0BB8h
***   stack: red/interpreter/eval-code 029F0BB8h 02CF8220h 02CF8240h true 00000000h 00000000h 029F0BB8h
***   stack: red/interpreter/eval-expression 02CF8220h 02CF8240h false true false
***   stack: red/interpreter/eval-arguments 027BF594h 02CF8210h 02CF8240h 02CF81F0h 02CF8258h 029EFF08h
***   stack: red/interpreter/eval-code 029EFF08h 02CF8200h 02CF8240h true 02CF81F0h 02CF8258h 029EFF08h
***   stack: red/interpreter/eval-path 02CF81F0h 02CF8200h 02CF8240h false false false false
***   stack: red/interpreter/eval-expression 02CF8200h 02CF8240h false false false
***   stack: red/interpreter/eval 027BF574h true
***   stack: red/natives/catch* true 1
***   stack: do-safe
***   stack: ctx||459~awake 00F5AC24h
***   stack: gui/make-event 0019EE9Ch 67108864 12
***   stack: gui/process 0019EE9Ch
***   stack: gui/do-events true
***   stack: gui/OS-destroy-view 027BF464h false
***   stack: ctx||468~destroy-view 027BF464h false
***   stack: on-face-deep-change*
***   stack: red/_function/call 027BF324h 00F63884h
***   stack: red/interpreter/eval-code 029F3FC8h 02DAF7B8h 02DAF7B8h false 00000000h 00000000h 029F3FC8h
***   stack: red/interpreter/eval-expression 02DAF728h 02DAF7B8h false false false
***   stack: red/interpreter/eval 02DAF670h true
***   stack: red/interpreter/eval-function 02DAC4A8h 02DAF670h
***   stack: red/_function/call 02DAC4A8h 04F9139Ch
***   stack: red/object/fire-on-deep 02DBF8A0h 02DBF8B0h 027BF2A4h 027A2BA4h 00555B60h 0 1
***   stack: red/ownership/check 027BF2A4h 027A2BA4h 00000000h 0 1
```

**To reproduce**

Use this code which juggles the z-order (`append` can be replaced by `insert` just the same):
```
Red []

print indent: ""
arrows1: tail ">>>>>>"
arrows2: tail "<<<<<<"

enum: function [] [
	prin [indent "PANE STATE: "]
	foreach f p/pane [
		prin [f/extra ":" either f/state ["OK  "]["NONE"] " "]
	]
	print ""
]

hover: function [face event] [
	print [indent skip arrows1 -1 - length? indent "hover" face/extra]
	append indent "^-"
	enum
    either where: find/same p/pane face [
    	;-- uncomment the following line for faster crash in CLI console
	    ; repeat i length? pane: face/parent/pane [? pane/:i]
	    print [indent "removing face" face/extra]
	    remove where
    	enum
	    print [indent "adding face" face/extra]
	    append p/pane face
    	enum
	][
		print [indent "!! NOT IN PANE:" face/extra]
	]
	take/last indent
	print [indent " " skip arrows2 -1 - length? indent face/extra]
]

view p: layout [
	at 10x10 box 200x200 draw [translate 100x100            fill-pen #FF000030 circle 0x-40 50] extra 'R on-over :hover
	at 10x10 box 200x200 draw [translate 100x100 rotate 60  fill-pen #FFFF0030 circle 0x-40 50] extra 'Y on-over :hover
	at 10x10 box 200x200 draw [translate 100x100 rotate 120 fill-pen #00FF0030 circle 0x-40 50] extra 'G on-over :hover
	at 10x10 box 200x200 draw [translate 100x100 rotate 180 fill-pen #00FFFF30 circle 0x-40 50] extra 'C on-over :hover
	at 10x10 box 200x200 draw [translate 100x100 rotate 240 fill-pen #0000FF30 circle 0x-40 50] extra 'B on-over :hover
	at 10x10 box 200x200 draw [translate 100x100 rotate 300 fill-pen #FF00FF30 circle 0x-40 50] extra 'M on-over :hover
]
```
Just hover the mouse around for a minute or so. In GUI console it crashes sooner.

Need a better (more automated) way to reproduce it, but I can't think of one so far.

What happens here:
1. `on-over` event gets often generated **during** the call to `remove`, so in the output we can see event depth reaching 5-6 easily
2. Call to `on-over` happens somewhere from inside `face!/on-deep-change*`, so the pane gets unexpectedly modified during it, and a wrong face gets removed when it finishes! See the log before and after `remove` of the same depth level.
3. As a result the pane ends up having duplicate of some faces and other faces are not present at all when the event fires, e.g. `PANE STATE: R : OK    Y : OK    M : OK    M : OK    M : OK    B : OK` tells us that Magenta face appears 3 times, and Green and Cyan ones are lost.
4. The havoc above happens very fast, but it takes some time (10-100 seconds) to crash it, and I've no clue what is causing the crash so far. `remove` calls `on-deep-change*`, which calls `on-change*`, during both `show` gets called a few times, and then I'm hopelessly lost on what's happening

#4800 may be affecting this bug as well.

**Expected behavior**

1) no crashes
2) no duplicated or lost faces
3) more predictable event chain, one that is possible to reason about and debug
4) maybe events should be queued when inside another event code rather than fired immediately? not sure, this model may have other drawbacks

**Platform version**
```
Red 0.6.4 for Windows built 20-Dec-2020/21:04:56+03:00 commit #7a6d9a9
```



Comments:
--------------------------------------------------------------------------------

On 2022-09-13T09:06:24Z, qtxie, commented:
<https://github.com/red/red/issues/4801#issuecomment-1245116725>

    No crashes anymore, but it froze my win10 after playing it a while. 😓 

--------------------------------------------------------------------------------

On 2022-09-13T09:19:18Z, hiiamboris, commented:
<https://github.com/red/red/issues/4801#issuecomment-1245131831>

    Can you test it on W7? I don't have access to it anymore.

--------------------------------------------------------------------------------

On 2022-09-13T09:23:59Z, qtxie, commented:
<https://github.com/red/red/issues/4801#issuecomment-1245137659>

    We don't support W7 anymore.

--------------------------------------------------------------------------------

On 2022-09-13T09:31:46Z, hiiamboris, commented:
<https://github.com/red/red/issues/4801#issuecomment-1245146876>

    I know people living on WinXP ;)

--------------------------------------------------------------------------------

On 2022-09-13T18:22:36Z, greggirwin, commented:
<https://github.com/red/red/issues/4801#issuecomment-1245794017>

    We need to make a matrix of what Redbol versions run on which platforms. I know a lot of businesses didn't want to move off WIn7, but it is officially unsupported now, so that's one of those things that a FOSS community has to take on if they need it. We have to pick our battles. Given the new roadmap and refocusing targets, I think we really need to look farther ahead than behind. Otherwise 64-bit will be the least of our problems.

