
#4549: [View] `return or exit not in function` seemingly random error & CRASH
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[GUI]
<https://github.com/red/red/issues/4549>

**Describe the bug**

Run this script with `red --cli` (GUI console will hang):
```
Red [needs: view]

insert-event-func func [fa ev] [
	unless ev/type = 'close [return 'nowai]
	none
]

extend system/view/VID/styles [
	baad: [
		template: [
			type:   'base
			rate:   3			;) generate events
			size:   10x10
			react/later [self/size]
		]
	]
]

view/no-wait [c: baad]
f: does [if yes [c/size: 100x100]]
f

do-events
```
This is the output I'm getting on time events (3 times per sec):
```
*** Throw Error: return or exit not in function 
*** Where: return                               
*** Stack: do-events do-safe                    
*** Throw Error: return or exit not in function 
*** Where: return                               
*** Stack: do-events do-safe                    
*** Throw Error: return or exit not in function 
*** Where: return                               
*** Stack: do-events do-safe                    
*** Throw Error: return or exit not in function 
*** Where: return                               
*** Stack: do-events do-safe                    
*** Throw Error: return or exit not in function 
*** Where: return                               
*** Stack: do-events do-safe                    
```
After closing the window:
```                                                                          
*** Runtime Error 1: access violation                                     
*** in file: /D/devel/red/red-src/red-master/runtime/datatypes/object.reds
*** at line: 103                                                          
***                                                                       
***   stack: red/object/get-values 02B78014h                              
***   stack: red/error/form 02B78014h 02B78024h 02B78004h 0               
***   stack: red/actions/form 02B78014h 02B78024h 02B78004h 0             
***   stack: red/actions/form* -1                                         
***   stack: red/natives/do-print true true                               
***   stack: red/natives/print* true                                      
***   stack: ctx||572~launch 00321ED4h                                    
***   stack: ctx||591~launch 00321998h                                    
```
Timer events produce a nonsensical error. I saw this bug initially on other events, so it's not a timer thing. The code is magical - all if's and unless's are important, or the bug won't surface.

Could be related to https://github.com/red/red/issues/4543 ~~or missing `none` [here](https://github.com/red/red/blob/bb32462428d9fa0bf7f10079b9e91791e5717d73/modules/view/view.red#L1205)~~ (update: `none` doesn't fix it)

**Expected behavior**

No errors in the output. https://github.com/red/red/pull/4529 does not exhibit the error output (not sure why).

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 20-Jun-2020/20:24:25+03:00 commit #4d864b1
```



Comments:
--------------------------------------------------------------------------------

On 2021-01-15T12:48:37Z, zwortex, commented:
<https://github.com/red/red/issues/4549#issuecomment-760923101>

    Following discussion on [gitter](https://gitter.im/red/bugs?at=6001796099549911fc233e06 ), here is another use case for this issue, that may be similar.
    
    To reproduce, you need to retrieve this [script](https://gist.github.com/zwortex/56b0d90befb1b01e189c1aa044b4a2ce) and run it with the console gui (tested on windows 64, latest build 13/01/2021). 
    
    A view appears, in which you have to enter with the buttons the following sequence : **1>+1>**
    
    This error appears in the console :
    ```
    *** Throw Error: return or exit not in function
    *** Where: return
    *** Stack: do-file run view do-events do-actor do-safe error? on-expression-update as-string rejoin empty?
            compute _compute-rec _compute-rec _compute-rec _compute-rec
    ```
    
    However, if you modify the script changing line 938, from 
    ```
    return _compute-rec node/child 
    ```
    
    to 
    ```
    return (_compute-rec node/child)
    ```
    
    the same test sequence runs through as expected without any error.
    

