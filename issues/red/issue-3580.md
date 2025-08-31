
#3580: GUI console crash with clock demo
================================================================================
Issue is closed, was reported by dander and has 12 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3580>

**Describe the bug**
Paste the following snippet into the GUI console on Win 10, and it crashes. It seems to be related to the timer and initial load. If the `clock-demo` string is empty or commented when the snippet is run, no crash occurs, and then it may be added back, and runs fine.

According to @toomasv it worked in a Sep 28 build.

```
clock-demo: {
    base rate 1 now
}

view [
    title "test"

    source: area 410x300 clock-demo 

    panel 200x300 react [
        attempt/safer [face/pane: layout/tight/only load source/text]
    ]
]
```

**To Reproduce**
Steps to reproduce the behavior:
1. launch GUI console
2. paste above snippet
3. crash

**Expected behavior**
VID window should pop up.

**Platform version(please complete the following information):**
```
Red 0.6.3 for Windows built 29-Oct-2018/23:30:29-07:00 commit #a5dc0e1
```


Comments:
--------------------------------------------------------------------------------

On 2018-10-30T21:05:07Z, qtxie, commented:
<https://github.com/red/red/issues/3580#issuecomment-434469251>

    It crashes in parse when GC is on. Turn off the GC, no crashes.

--------------------------------------------------------------------------------

On 2020-03-08T17:00:14Z, hiiamboris, commented:
<https://github.com/red/red/issues/3580#issuecomment-596226931>

    This works OK:
    ```
    clock-demo: {base rate 1 now}
    recycle/off
    view [
        source: area 410x300 clock-demo 
        panel 200x300 react [
            attempt/safer [face/pane: layout/tight/only load source/text]
        ]
    ]
    ```
    ---
    This crashes the GUI console (I just inserted `g:`!!!):
    ```
    clock-demo: {base rate 1 now}
    recycle/off
    view [
        source: area 410x300 clock-demo 
        panel 200x300 react [
            attempt/safer [face/pane: layout/tight/only g: load source/text]
        ]
    ]
    ```
    ```
    == "base rate 1 now"
    *** Script Error: invalid id field in spec block
    *** Where: body
    *** Stack:
    ```
    This error can only come from `make error! [..]` (complaint about error/id).
    
    ---
    Now I also add `probe` before `g:` (run in GUI console):
    ```
    clock-demo: {base rate 1 now}
    recycle/off
    view [
        source: area 410x300 clock-demo 
        panel 200x300 react [
            attempt/safer [face/pane: layout/tight/only probe g: load source/text]
        ]
    ]
    ```
    ```
    *** Runtime Error 98: assertion failed
    *** in file: /D/devel/red/red-src/red/runtime/parse.reds
    *** at line: 1068
    ***
    ***   stack: red/parser/process 00000062h 004757A6h 154181824 48724000 00000001h
    ***   stack: red/parser/process 092B9E68h 02A51C84h 0 0 02A51C64h
    ***   stack: red/natives/parse* true -1 0 -1
    ***   stack: react 0039AA34h
    ***   stack: ctx||417~process-reactors 003C2694h
    ***   stack: layout 003C2694h
    ***   stack: red/_function/call 02A513B4h 003C2694h
    ***   stack: red/interpreter/eval-code 02A513B4h 09300528h 09300528h true 093004D8h 09300578h 02B449A0h
    ***   stack: red/interpreter/eval-path 093004D8h 093004E8h 09300528h false false true false
    ***   stack: red/interpreter/eval-expression 093004E8h 09300528h false true false
    ***   stack: red/interpreter/eval-expression 093004D8h 09300528h false false false
    ***   stack: red/interpreter/eval 02A513A4h true
    ***   stack: red/natives/try* true 0
    ***   stack: attempt
    ***   stack: red/_function/call 02A51364h 003A3884h
    ***   stack: red/interpreter/eval-code 02A51364h 09300478h 09300478h true 09300458h 09300490h 02B41380h
    ***   stack: red/interpreter/eval-path 09300458h 09300468h 09300478h false false false false
    ***   stack: red/interpreter/eval-expression 09300468h 09300478h false false false
    ***   stack: red/interpreter/eval 02A51354h true
    ***   stack: red/natives/do* true -1 -1 -1
    ***   stack: ctx||322~eval 0039AA34h
    ***   stack: red/_function/call 02A512E4h 0039AA34h
    ***   stack: red/interpreter/eval-code 02A512E4h 02D78358h 02D78358h false 00000000h 00000000h 02C07370h
    ***   stack: red/interpreter/eval-expression 02D78348h 02D78358h false false false
    ***   stack: red/interpreter/eval 02A512D4h true
    ***   stack: red/natives/unless* false
    ***   stack: red/interpreter/eval-arguments 02B40350h 02D782C8h 02D782E8h 00000000h 00000000h
    ***   stack: red/interpreter/eval-code 02B40350h 02D782A8h 02D782E8h false 00000000h 00000000h 02B40350h
    ***   stack: red/interpreter/eval-expression 02D782A8h 02D782E8h false false false
    ***   stack: red/interpreter/eval 02A512A4h true
    ***   stack: red/natives/if* false
    ***   stack: red/interpreter/eval-arguments 02B3F8D0h 02D77CC8h 02D77CF8h 00000000h 00000000h
    ***   stack: red/interpreter/eval-code 02B3F8D0h 02D77C98h 02D77CF8h false 00000000h 00000000h 02B3F8D0h
    ***   stack: red/interpreter/eval-expression 02D77C98h 02D77CF8h false false false
    ***   stack: red/interpreter/eval 02D77A88h false
    ***   stack: red/parser/eval 02D77A88h true true
    ***   stack: red/parser/process 092B9E48h 02A51264h 0 0 02A51244h
    ***   stack: red/natives/parse* true -1 0 -1
    ***   stack: react 0039AA34h
    ***   stack: ctx||417~process-reactors 003C2694h
    ```
    
    Note that GC was disabled throughout all tests.
    Another note is that `attempt` expression was called 23 times!! (insert a counter to see it)

--------------------------------------------------------------------------------

On 2020-03-08T18:29:38Z, hiiamboris, commented:
<https://github.com/red/red/issues/3580#issuecomment-596235887>

    This snippet sheds some light:
    ```
    clock-demo: {base rate 1 now}
    recycle/off
    i: 0
    view [
        source: area 410x300 clock-demo 
        panel 200x300 react [
            print try/all [
            	if i < 22 [
    	        	print ["IN" i: i + 1]
    	        	print also
    	        		form reduce ["OUT" i]
    	       			layout load source/text
    			]
           		'ok
            ]
        ]
    ]
    ```
    It should work, although it looks like a definite bug that it first enters the reaction 22 times, then leaves it 22 times.
    
    But if you change `i < 22` to 23 or more, you'll see a chained stack overflow:
    ```
    *** Internal Error: stack overflow
    *** Where: do
    *** Stack: view layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout
    *** Script Error: none! type is not allowed here
    *** Where: do
    *** Stack: view layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout react eval also layout
    *** Script Error: none! type is not allowed here
    *** Where: do
    
    ...
    
    *** Script Error: none! type is not allowed here
    *** Where: do
    *** Stack: view layout react eval also layout
    *** Script Error: none! type is not allowed here
    *** Where: do
    *** Stack: view layout
    ```
    But it seems to never recover from it as after that it outputs a totally random error 1615 times:
    ```
    *** Script Error: none! type is not allowed here
    *** Where: +
    *** Stack:
    ```
    And then finishes with a crash:
    ```
    *** Runtime Error 19: stack error or overflow                                                              
    *** in file: /D/devel/red/red-src/red/runtime/datatypes/context.reds                                       
    *** at line: 311                                                                                           
    ***                                                                                                        
    ***   stack: red/_context/get-in 02DD5458h 02C65B68h                                                       
    ***   stack: red/_context/get 02DD5458h                                                                    
    ***   stack: red/interpreter/eval-expression 02DD5448h 02DD5468h false true false                          
    ***   stack: red/interpreter/eval-arguments 02B60650h 02DD5448h 02DD5468h 00000000h 00000000h              
    ***   stack: red/interpreter/eval-code 02B60650h 02DD5448h 02DD5468h true 00000000h 00000000h 02B60650h    
    ***   stack: red/interpreter/eval-expression 02DD5448h 02DD5468h false true false                          
    ***   stack: red/interpreter/eval-arguments 02B5F960h 02DD5438h 02DD5468h 00000000h 00000000h              
    ***   stack: red/interpreter/eval-code 02B5F960h 02DD5438h 02DD5468h false 00000000h 00000000h 02B5F960h   
    ***   stack: red/interpreter/eval-expression 02DD5438h 02DD5468h false false false                         
    ***   stack: red/interpreter/eval 02DD5388h true                                                           
    ***   stack: red/interpreter/eval-expression 02DD5388h 02DD53B8h false true false                          
    ***   stack: red/interpreter/eval-arguments 02C67CA8h 02DD5388h 02DD53B8h 02DD5368h 02DD5400h              
    ***   stack: red/interpreter/eval-code 02C67CA8h 02DD5378h 02DD53B8h false 02DD5368h 02DD5400h 02C65FF8h   
    ***   stack: red/interpreter/eval-path 02DD5400h 02DD5378h 02DD53B8h false false false false               
    ***   stack: red/interpreter/eval-expression 02DD5378h 02DD53B8h false false false                         
    ***   stack: red/interpreter/eval 02A63004h true                                                           
    ***   stack: red/natives/if* false                                                                         
    ***   stack: red/interpreter/eval-arguments 02B5F8D0h 02DD5268h 02DD5268h 00000000h 00000000h              
    ***   stack: red/interpreter/eval-code 02B5F8D0h 02DD5238h 02DD5268h false 00000000h 00000000h 02B5F8D0h   
    ***   stack: red/interpreter/eval-expression 02DD5238h 02DD5268h false false false                         
    ***   stack: red/interpreter/eval 02DD51C0h true                                                           
    ***   stack: red/interpreter/eval-function 02DD5608h 02DD51C0h                                             
    ***   stack: red/_function/call 02DD5608h 003BC018h                                                        
    ***   stack: red/object/fire-on-set 02CB10C0h 02A614C4h 02A62F94h 02A62F84h                                
    ***   stack: red/object/eval-path 02CB10C0h 02A614C4h 02A62F84h 00000000h false                            
    ***   stack: red/actions/eval-path 02CB10C0h 02A614C4h 02A62F84h 00000000h false                           
    ***   stack: red/set-path* 02CB10C0h 02A614C4h                                                             
    ***   stack: ctx||583~calc-top 0039ECB0h                                                                   
    ***   stack: ctx||583~add-line 0039ECB0h                                                                   
    ***   stack: ctx||583~vprint 0039ECB0h                                                                     
    ***   stack: red-print-gui 02A62E94h true                                                                  
    ***   stack: red/dyn-print/red-print 02A62E94h true                                                        
    ***   stack: red/natives/do-print false true                                                               
    ***   stack: red/natives/print* false                                                                      
    ***   stack: red/stack/throw-error 02A63084h                                                               
    ***   stack: red/fire 0 000938F8h                                                                          
    ***   stack: red/integer/do-math 0                                                                         
    ***   stack: red/integer/add                                                                               
    ***   stack: red/actions/add*                                                                              
    ***   stack: ctx||583~scroll-lines 0039ECB0h                                                               
    ```
    
    Notice `recycle/off`. My current guess is that GC has nothing to do with the original bug, but that stack overflow is leaving something in undefined state, and it just so happens that GC falls first. It looks like usual undefined behavior to me.
    
    So I suspect there are 2 bugs here:
    - `layout` restarting reactions for no apparent reason (#4322 should cure it)
    - stack overflow wreaking havoc on the interpreter

--------------------------------------------------------------------------------

On 2020-07-13T18:53:58Z, hiiamboris, commented:
<https://github.com/red/red/issues/3580#issuecomment-657731935>

    The 2nd bug is probably the same as this one: https://github.com/red/red/issues/4323
    We have so many opened issues that they start to multiply ;)

--------------------------------------------------------------------------------

On 2021-06-30T06:06:32Z, qtxie, commented:
<https://github.com/red/red/issues/3580#issuecomment-871122163>

    @hiiamboris Does it still crash in the latest version?

--------------------------------------------------------------------------------

On 2021-06-30T07:41:11Z, hiiamboris, commented:
<https://github.com/red/red/issues/3580#issuecomment-871171302>

    Nope, all good.

