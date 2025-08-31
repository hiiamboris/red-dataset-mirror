
#4319: [View] Irregularities in event processing
================================================================================
Issue is open, was reported by hiiamboris and has 14 comment(s).
[type.bug] [status.reviewed] [GUI]
<https://github.com/red/red/issues/4319>

This issue relates to https://github.com/red/red/issues/4184 (variant 4), but I'm not addressing the crash here

**Describe the bug**

`on-time` and `unview` can be concocted together to produce an undefined behavior.

**To reproduce**

Use this script `1.red`:
```
Red [Needs: View]
view/no-wait [base green]
loop 5 [
	view/no-wait/options [
		base rate 10
		on-time [
			face/rate: none
			print mold/all face/state
			unview/only face/parent
		]
	] [offset: random system/view/screens/1/size - 100x100]
]
do-events
```

1. Use CLI console, as the GUI one crashes!
2. Run it as `red --cli 1.red` or `console-view 1.red` multiple times

**Expected behavior**

It should automatically close 5 gray windows and leave open 1 green window, then terminate after you close the green window manually

**Observed behavior**

1) In reality, most of the time it terminates by itself, often after closing only some of the windows:
```
>console-view.exe 2.red
[#[handle! 0023232Ch] 0 #[none] #[false]]
[#[handle! 00232360h] 0 #[none] #[false]]
;) there should have been 5 closed windows!!
```

2) Sometimes, if you're lucky, it doesn't close the green window. Then if you close it manually - it does not exit the program.
3) Other times, it may not close some gray windows - and they won't respond to input.

But it seems that the more times I run this script, the lesser becomes probability of outcomes (2) and (3).

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 26-Feb-2020/23:25:04+03:00
```



Comments:
--------------------------------------------------------------------------------

On 2020-03-06T19:46:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/4319#issuecomment-595931033>

    Another fun variation is:
    ```
    Red [Needs: View]
    view/no-wait [base green]
    loop 100 [
        view/no-wait [
            base rate 100
            on-time [
                face/rate: none
                print mold/all face/state
                unview/only face/parent
            ]
        ]
    ]
    loop 100 [do-events/no-wait]
    do-events
    ```
    Which may produce either (often):
    ```
    *** Internal Error: stack overflow
    *** Where: find
    *** Stack: do-events do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-safe
    ```
    Or (rarely):
    ```
    *** Runtime Error 95: no CATCH for THROW
    *** at: 0041EB7Dh
    ```

--------------------------------------------------------------------------------

On 2020-05-21T07:06:55Z, qtxie, commented:
<https://github.com/red/red/issues/4319#issuecomment-631923352>

    `unview` will always exit an event loop, while `view/no-wait` didn't create one. That's why some windows are not closed.
    
    The view engine cannot help in this case, as the user may or may not create an event loop for `view/no-wait`. In order to make it work, the user should create the event loops for each window.
    ```
    view/no-wait [base green]
    loop 5 [
    	view/no-wait/options [
    		base rate 10
    		on-time [
    			face/rate: none
    			print mold/all face/state
    			unview/only face/parent
    		]
    	] [offset: random system/view/screens/1/size - 100x100]
    ]
    loop 6 [do-events]
    ```

--------------------------------------------------------------------------------

On 2020-05-21T07:49:39Z, hiiamboris, commented:
<https://github.com/red/red/issues/4319#issuecomment-631940758>

    Why would `do-events` terminate while some windows are still open? `loop 6 [do-events]` seems an overcomplication to me

--------------------------------------------------------------------------------

On 2020-05-21T08:42:30Z, qtxie, commented:
<https://github.com/red/red/issues/4319#issuecomment-631964614>

    > Why would do-events terminate while some windows are still open?
    
    `do-events` is not smart enough. If we `view` two windows, two event loops (two do-events) launched. Then we close one window, one window is still open, should we exit one event loop? 
    
    > loop 6 [do-events] seems an overcomplication to me
    
    Even manually use `do-events` seems complicated to me, no mention `/no-wait`. ;-) I think 99% of the view applications use `view` and `unview` is enough.

--------------------------------------------------------------------------------

On 2020-05-21T08:52:19Z, hiiamboris, commented:
<https://github.com/red/red/issues/4319#issuecomment-631968841>

    Anyway, using my [second snippet](https://github.com/red/red/issues/4319#issuecomment-595931033) today I get:
    - infinite console output (invisible) in the GUI console (expected termination as I ran it as `gui-console bug.red` which should terminate after the script finishes)
    - stack overflows in console-view:
    ```
    *** Internal Error: stack overflow
    *** Where: find
    *** Stack: do-events do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-actor do-safe error? unview on-face-deep-change* do-safe
    ```
    - runtime error 95 in console-view:
    ```
    *** Runtime Error 95: no CATCH for THROW
    *** in file: common.reds
    *** at line: 269
    ***
    ***   stack: ***-uncaught-exception
    ***   stack: ***-uncaught-exception
    ```
    Only 1 in 5 runs it performed without errors

--------------------------------------------------------------------------------

On 2020-06-30T18:58:03Z, hiiamboris, commented:
<https://github.com/red/red/issues/4319#issuecomment-651982282>

    The [original snippet](https://github.com/red/red/issues/4319#issue-576980649) doesn't work like you explain too.
    I modified it to have 5 `do-events` loops:
    ```
    Red [Needs: View]
    view/no-wait [base green]
    loop 5 [
    	view/no-wait/options [
    		base rate 10
    		on-time [
    			face/rate: none
    			print mold/all face/state
    			unview/only face/parent
    		]
    	] [offset: random system/view/screens/1/size - 100x100]
    ]
    loop 5 [do-events]
    ```
    Since I'm not `unview`-ing the green base, I expect the five gray bases to close before the interpreter quits. While the green base should be destroyed by program termination.
    However, it terminates prematurely quite often:
    ```
    D:\devel\red\common>red "2.red"
    [#[handle! 00B50E86h] 0 #[none] #[false]]
    [#[handle! 00581D90h] 0 #[none] #[false]]
    [#[handle! 00511CE8h] 0 #[none] #[false]]
    [#[handle! 006A2A6Ch] 0 #[none] #[false]]
    [#[handle! 00392672h] 0 #[none] #[false]]
    
    D:\devel\red\common>red "2.red"
    [#[handle! 00972570h] 0 #[none] #[false]]
    [#[handle! 004F2B94h] 0 #[none] #[false]]
    [#[handle! 00B60E86h] 0 #[none] #[false]]
    
    D:\devel\red\common>red "2.red"
    [#[handle! 00D217F2h] 0 #[none] #[false]]
    [#[handle! 005A1D90h] 0 #[none] #[false]]
    [#[handle! 0064223Eh] 0 #[none] #[false]]
    [#[handle! 00982570h] 0 #[none] #[false]]
    
    D:\devel\red\common>red "2.red"
    [#[handle! 00822CECh] 0 #[none] #[false]]
    [#[handle! 00992570h] 0 #[none] #[false]]
    [#[handle! 006D2A6Ch] 0 #[none] #[false]]
    [#[handle! 009F2C5Eh] 0 #[none] #[false]]
    [#[handle! 00D317F2h] 0 #[none] #[false]]
    
    D:\devel\red\common>red "2.red"
    [#[handle! 00A02C5Eh] 0 #[none] #[false]]
    [#[handle! 00D417F2h] 0 #[none] #[false]]
    [#[handle! 00832CECh] 0 #[none] #[false]]
    
    D:\devel\red\common>red "2.red"
    [#[handle! 00BA0E86h] 0 #[none] #[false]]
    [#[handle! 00F51714h] 0 #[none] #[false]]
    [#[handle! 01191460h] 0 #[none] #[false]]
    [#[handle! 005D1D90h] 0 #[none] #[false]]
    [#[handle! 00A12C5Eh] 0 #[none] #[false]]
    
    D:\devel\red\common>red "2.red"
    [#[handle! 003F2672h] 0 #[none] #[false]]
    [#[handle! 00F61714h] 0 #[none] #[false]]
    [#[handle! 00AE0ECCh] 0 #[none] #[false]]
    [#[handle! 00D617F2h] 0 #[none] #[false]]
    [#[handle! 00BB0E86h] 0 #[none] #[false]]
    
    D:\devel\red\common>red "2.red"
    [#[handle! 0069223Eh] 0 #[none] #[false]]
    [#[handle! 0047184Eh] 0 #[none] #[false]]
    [#[handle! 00402672h] 0 #[none] #[false]]
    ```
    I can see that 4 of 8 (50%) runs are wrong.
    
    With `loop 6 [do-events]` I expect it to never terminate until I manually close it, but in ~70% cases it terminates after 3-5 lines of output.

--------------------------------------------------------------------------------

On 2020-06-30T19:19:42Z, hiiamboris, commented:
<https://github.com/red/red/issues/4319#issuecomment-651992817>

    Here's a variation of the original snippet.
    ```
    Red [Needs: View]
    view/no-wait [base green]
    loop 5 [
    	view/no-wait/options [
    		base rate 10
    		on-time [
    			face/rate: none
    			print mold/all face/state
    			unview/only face/parent
    		]
    	] [offset: random system/view/screens/1/size - 100x100]
    ]
    loop 5 [do-events]
    print "FINISHED"
    unview/all
    ```
    Most of the time it prints something like
    ```
    [#[handle! 00F60E86h] 0 #[none] #[false]]             
    [#[handle! 012E16E2h] 0 #[none] #[false]]             
    [#[handle! 004F29A8h] 0 #[none] #[false]]             
    FINISHED                                              
    *** Script Error: path none is not valid for none type
    *** Where: eval-path                                  
    *** Stack: unview on-face-deep-change*                
    ```
    (any subsequent `unview/all` call results in the same error)
    
    Sometimes it's okay.
    And sometimes it does not reach the `FINISHED` string and leaves the green base open.

