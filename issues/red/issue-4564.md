
#4564: [CRASH, View] in drop-down & drop-list when clicking outside the face
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4564>

Somewhat but not quite related to https://github.com/red/red/issues/4439

**To reproduce**

1. We need a background face that's shown with Red!
`view [size 1000x600 backdrop white]`
2. Start another console!
3. In the new console, show a drop-down:
`view [drop-down data ["1" "2" "3" "4" "5" "6"]]`
4. Arrange windows so that new window is on top of the background:
![](https://i.gyazo.com/db696ccb771e6ff23f16168ac7f4f9ef.png)
5. Click in drop-down menu on any item 2 to 6. What's *important* it to choose such a point that after dropped down menu disappears, **mouse will be above the background face**, belonging to another Red process.
6. It'll crash.

Another variant - the same but using drop-list: `view [drop-list data ["1" "2" "3" "4" "5" "6"]]`. As previously click on an item that sticks out of the window, on a background that belongs to another Red process. Crash log is the same.

```
*** Runtime Error 1: access violation                                                                    
*** in file: /D/devel/red/red-src/red/runtime/datatypes/context.reds                                     
*** at line: 26                                                                                          
***                                                                                                      
***   stack: red/_context/find-word 00000014h 106 true                                                   
***   stack: red/object/eval-path 026E1A24h 02B288F0h 00000000h 02B28288h false                          
***   stack: red/actions/eval-path 026E1A24h 02B288F0h 00000000h 02B28288h false                         
***   stack: red/interpreter/eval-path 02B288F0h 02B28298h 02B28328h false false true false              
***   stack: red/interpreter/eval-expression 02B28298h 02B28328h false true false                        
***   stack: red/interpreter/eval-arguments 027DF8D0h 02B28288h 02B28328h 00000000h 00000000h            
***   stack: red/interpreter/eval-code 027DF8D0h 02B28288h 02B28328h false 00000000h 00000000h 027DF8D0h 
***   stack: red/interpreter/eval-expression 02B28288h 02B28328h false false false                       
***   stack: red/interpreter/eval 02B281C0h true                                                         
***   stack: red/interpreter/eval-function 026E19C4h 02B281C0h                                           
***   stack: red/_function/call 026E19C4h 003C28D4h                                                      
***   stack: red/interpreter/eval-code 026E19C4h 02A8DE98h 02A8DE98h false 00000000h 00000000h 026E1934h 
***   stack: red/interpreter/eval-expression 02A8DE78h 02A8DE98h false false false                       
***   stack: red/interpreter/eval 026E19B4h true                                                         
***   stack: red/natives/try* true 0                                                                     
***   stack: do-safe                                                                                     
***   stack: ctx||416~awake 003C293Ch                                                                    
***   stack: gui/make-event 1637564 67108864 12                                                          
***   stack: gui/process 1637564                                                                         
***   stack: gui/do-events false                                                                         
***   stack: ctx||425~do-event-loop false                                                                
***   stack: do-events                                                                                   
***   stack: view                                                                                        
***   stack: red/_function/call 026E1804h 003A3884h                                                      
***   stack: red/interpreter/eval-code 026E1804h 02B448E8h 02B448E8h false 00000000h 00000000h 027E19D0h 
***   stack: red/interpreter/eval-expression 02B448D8h 02B448E8h false false false                       
***   stack: red/interpreter/eval 026E17E4h true                                                         
***   stack: red/natives/catch* true 1                                                                   
***   stack: ctx||534~try-do 003BFFA0h                                                                   
***   stack: ctx||534~launch 003BFFA0h                                                                   
***   stack: ctx||552~launch 003BFAE8h                                                                   
```

**Expected behavior**

No crash.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 28-Jun-2020/23:30:17+03:00 commit #b452716
```



Comments:
--------------------------------------------------------------------------------

On 2020-07-20T11:42:21Z, hiiamboris, commented:
<https://github.com/red/red/issues/4564#issuecomment-660976772>

    The fix works for me @qtxie, thanks.

