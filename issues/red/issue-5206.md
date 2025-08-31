
#5206: [View] Crashes on out of memory
================================================================================
Issue is closed, was reported by hiiamboris and has 10 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5206>

**Describe the bug**

@koba-yu tried to make an image viewer with Red ;)
You can guess the result..
Simple ways to reproduce:
```
>> loop 1e6 [i: make image! 1920x1080]
*** Internal Error: not enough memory
*** Where: make
*** Near : 1920x1080
*** Stack:

>> view [image i]

*** Runtime Error 1: access violation
*** Cannot determine source file/line info.
***
```
---

Or:
```
loop 5 [
	view [
		panel 500x500 [] rate 99 on-time [face/size: face/size - 1]
		react [face/size 
			print n: length? append face/pane layout/only [image 19200x10800]
			unview
		]
	]
]
```
```
1
2

*** Runtime Error 1: access violation
*** in file: /d/devel/red/red-src/master/runtime/platform/image-wic.reds
*** at line: 1189
***
***   stack: red/OS-image/to-gpbitmap 05762948h 0106F368h
***   stack: gui/update-base-image 77730592 05762948h 28800 16200
***   stack: gui/update-base 0137146Ch 00FD1DCCh 0106F4E4h 05762908h
***   stack: gui/init-base-face 0137146Ch 16588236 05762908h true
***   stack: gui/OS-make-view 052ADEBCh 16588236
***   stack: ctx||457~make-view 052ADEBCh 052ADECCh
***   stack: show
***   stack: show
***   stack: show
***   stack: view
***   stack: red/_function/call 052AD9FCh 049E3884h 0573E9D8h 0
***   stack: red/interpreter/eval-code 05393E48h 0573E9F8h 0573E9F8h 052AD9ECh false 00000000h 00000000h 05393E48h
***   stack: red/interpreter/eval-expression 0573E9E8h 0573E9F8h 052AD9ECh false false false
***   stack: red/interpreter/eval 052AD9ECh true
***   stack: red/natives/loop* false
***   stack: red/interpreter/eval-arguments 052AD9CCh 0573EA40h 0573EA40h 052AD9BCh 00000000h 00000000h 05390BA8h
***   stack: red/interpreter/eval-code 05390BA8h 0573EA20h 0573EA40h 052AD9BCh false 00000000h 00000000h 05390BA8h
***   stack: red/interpreter/eval-expression 0573EA20h 0573EA40h 052AD9BCh false false false
***   stack: red/interpreter/eval 052AD9BCh true
***   stack: red/natives/do* false -1 -1 -1 -1
***   stack: red/interpreter/eval-arguments 052AD9ACh 0573E390h 0573E390h 052AD98Ch 00000000h 00000000h 05390CA8h
***   stack: red/interpreter/eval-code 05390CA8h 0573E380h 0573E390h 052AD98Ch false 00000000h 00000000h 05390CA8h
***   stack: red/interpreter/eval-expression 0573E380h 0573E390h 052AD98Ch false false false
***   stack: red/interpreter/eval 052AD98Ch true
***   stack: red/natives/catch* true 1
***   stack: ctx||601~try-do 04A00D10h
***   stack: ctx||601~do-command 04A00D10h
***   stack: ctx||601~eval-command 04A00D10h
***   stack: ctx||601~run 04A00D10h
***   stack: ctx||601~launch 04A00D10h
***   stack: ctx||620~launch 04A00720h
```
---
Or (this one is a bit random, wait a minute for the event loop to hang, then close the window manually):
```
loop 5 [
	view [
		panel 500x500 [] rate 99 on-time [face/size: face/size - 1]
		react later [face/size 
			print n: length? append face/pane layout/only append/dup copy [] [image 1920x1080] 80
			unview
		]
	]
]
```
```
root: 5116/7807, runs: 0, mem: 3254316 => 2880860, mark: 4.0ms, sweep: 0.0ms
root: 5116/7807, runs: 1, mem: 3251748 => 3110452, mark: 4.0ms, sweep: 0.0ms
root: 5116/7807, runs: 2, mem: 3251728 => 3195424, mark: 5.0ms, sweep: 0.0ms
root: 5116/7807, runs: 3, mem: 3251396 => 3232628, mark: 3.9ms, sweep: 1.0ms
80
root: 5116/7807, runs: 4, mem: 5410380 => 4536744, mark: 5.0ms, sweep: 2.0ms
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

*** Runtime Error 95: no CATCH for THROW
*** in file: common.reds
*** at line: 282
***
***   stack: ***-uncaught-exception
***   stack: ***-uncaught-exception
```
(no cat again!)

**Expected behavior**

Out of memory error, no crashes.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4443 date: 9-Sep-2022/11:26:21 commit: #2ba818862bda796d302e3e3ddb5fdf7f61c3687c ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```
Related: https://github.com/red/red/issues/4559


Comments:
--------------------------------------------------------------------------------

On 2022-09-11T02:31:13Z, qtxie, commented:
<https://github.com/red/red/issues/5206#issuecomment-1242852299>

    ```
    >> loop 1e6 [i: make image! 1920x1080]
    *** Internal Error: not enough memory
    *** Where: make
    *** Near : 1920x1080
    *** Stack:
    ```
    
    We don't have a way to recycle image! yet.
    
    Why it's related to https://github.com/red/red/issues/4559 ?

--------------------------------------------------------------------------------

On 2022-09-11T07:19:50Z, hiiamboris, commented:
<https://github.com/red/red/issues/5206#issuecomment-1242904748>

    > We don't have a way to recycle image! yet.
    
    Aware of that. Still doesn't mean it should be allowed to crash ;)
    
    > Why it's related to #4559 ?
    
    Actually, maybe not. I just assumed something messes up the stack on out of memory.

--------------------------------------------------------------------------------

On 2022-09-11T07:20:31Z, hiiamboris, commented:
<https://github.com/red/red/issues/5206#issuecomment-1242904883>

    By the way, it crashes upon reaching 2.1GB, not 4.2GB.

--------------------------------------------------------------------------------

On 2022-09-11T17:24:30Z, greggirwin, commented:
<https://github.com/red/red/issues/5206#issuecomment-1243007624>

    Historically, IIRC, 32-bit user processes only have access to 3GB of memory under Windows. I don't remember why, but I'm sure we can find out. The 2GB limit is likely specific to Red's implementation. Not worth the time to go from 2 to 3 for 32-bit at this point.
    

--------------------------------------------------------------------------------

On 2022-09-11T18:06:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/5206#issuecomment-1243014002>

    ```
    >> b1: make binary! 2e9
    == #{}
    >> b2: make binary! 1e9
    == #{}
    ```

