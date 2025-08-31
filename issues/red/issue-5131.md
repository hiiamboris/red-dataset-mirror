
#5131: [Windows] GC-related View CRASH it when adding/removing faces
================================================================================
Issue is closed, was reported by hiiamboris and has 12 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5131>

**Describe the bug**

When removal and addition of faces to a window happens fast enough, Red crashes.

**To reproduce**

Run this script:
```
Red [needs: view]

; window: view/no-wait [base rate 34]						;-- doesn't crash!
window: view/no-wait [base rate 67]						;-- crashes in a few secs!

shown: []
insert-event-func function [base event] [
	if event/type = 'time [
		remove find/same window/pane take shown
		face: first layout/only [text "fhtagn"]
		face/offset: random 100x100
		append window/pane face
		append shown face
	]
	none
]

do-events
```
Wait a few seconds (sometimes it crashes under 1 seconds, sometimes in 4-5 seconds)
In any case the trace is:
```
*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/modules/view/backends/windows/gui.reds
*** at line: 141
***
***   stack: gui/get-face-values 01B71A96h
***   stack: gui/WndProc 02E9148Ah 312 2013346056 28777110
```
With `recycle/off` - no crash. On GTK - no crash.

**Expected behavior**

- no crashes
- no leftover faces
- no stack overflow
- no null window handle

**Platform version**
```
Red 0.6.4 for Windows built 15-Apr-2022/11:42:52+03:00  commit #502097e
```



Comments:
--------------------------------------------------------------------------------

On 2022-05-02T14:10:43Z, hiiamboris, commented:
<https://github.com/red/red/issues/5131#issuecomment-1114927765>

    Here's another script:
    ```
    Red []
    
    other: none
    view [
    	base white 200x200 all-over on-over [
    		if other [remove find/same event/window/pane other]
    		other: make-face/spec 'base [5x5 blue]
    		other/offset: event/offset + 15x5
    		append event/window/pane other
    	]
    ]
    ```
    Removed faces do not always get removed (though they're not in the `pane` anymore, they're still visible):
    ![](https://i.gyazo.com/f6c7743a1af7b848368c5b7cd55e6494.gif)
    And it crashes momentarily:
    ```
    VIEW: WARNING: free null window handle!
    VIEW: WARNING: free null window handle!
    VIEW: WARNING: free null window handle!
    VIEW: WARNING: free null window handle!
    root: 4813/7510, runs: 0, mem: 3250004 => 2316020, mark: 3.0ms, sweep: 2.0ms
    VIEW: WARNING: free null window handle!
    VIEW: WARNING: free null window handle!
    VIEW: WARNING: free null window handle!
    VIEW: WARNING: free null window handle!
    VIEW: WARNING: free null window handle!
    VIEW: WARNING: free null window handle!
    VIEW: WARNING: free null window handle!
    VIEW: WARNING: free null window handle!
    VIEW: WARNING: free null window handle!
    VIEW: WARNING: free null window handle!
    VIEW: WARNING: free null window handle!
    VIEW: WARNING: free null window handle!
    root: 4813/7510, runs: 1, mem: 3250820 => 2341152, mark: 2.0ms, sweep: 1.0ms
    VIEW: WARNING: free null window handle!
    VIEW: WARNING: free null window handle!
    VIEW: WARNING: free null window handle!
    
    *** Runtime Error 1: access violation
    *** in file: /D/devel/red/red-src/red/modules/view/backends/windows/gui.reds
    *** at line: 141
    ***
    ***   stack: gui/get-face-values 003E150Eh
    ***   stack: gui/BaseWndProc 003E150Eh 15 0 0
    ```
    Eventually even with `recycle/off` it triggers multiple stack overflows and crashes without a R/S stack trace:
    ```
    *** Internal Error: stack overflow
    *** Where: set
    *** Near : none
    *** Stack: view do-events do-actor do-safe error?
    -deep-change* do-actor do-safe error? on-face-dee
    * do-actor do-safe error? on-face-deep-change* do
    o-safe error? on-face-deep-change* do-actor do-sa
    ? on-face-deep-change* do-actor do-safe error? on
    ep-change* do-actor do-safe error? on-face-deep-c
    o-actor do-safe error? on-face-deep-change* do-ac
    afe error? on-face-deep-change* do-actor do-safe
    n-face-deep-change* do-actor do-safe error? on-fa
    change* do-actor do-safe error? on-face-deep-chan
    ctor do-safe error? on-face-deep-change* do-actor
     error? on-face-deep-change* do-actor do-safe err
    ace-deep-change* do-actor do-safe error? on-face-
    nge* do-actor do-safe error? on-face-deep-change*
    r do-safe error? on-face-deep-change* do-actor do
    *** Script Error: invalid id field in spec block
    *** Where: body
    *** Near : none
    *** Stack:
    ```
    
    ~~I'm just trying to make tooltips working, but haven't found a workaround yet.~~
    Workaround is to reuse previously created faces.

--------------------------------------------------------------------------------

On 2022-09-09T11:27:28Z, qtxie, commented:
<https://github.com/red/red/issues/5131#issuecomment-1241852677>

    Seems no crashes now.

--------------------------------------------------------------------------------

On 2022-09-09T11:31:06Z, hiiamboris, commented:
<https://github.com/red/red/issues/5131#issuecomment-1241858241>

    I get crashes in Sep 3 build.

--------------------------------------------------------------------------------

On 2022-09-09T11:38:16Z, hiiamboris, commented:
<https://github.com/red/red/issues/5131#issuecomment-1241869470>

    Confirmed, no crashes in Sep 9 build.

--------------------------------------------------------------------------------

On 2022-09-09T11:41:57Z, hiiamboris, commented:
<https://github.com/red/red/issues/5131#issuecomment-1241873213>

    Could be related to recent event system fixes?

--------------------------------------------------------------------------------

On 2022-09-09T13:32:57Z, qtxie, commented:
<https://github.com/red/red/issues/5131#issuecomment-1241981411>

    A side effect of fixing issue #5125.

