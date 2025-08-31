
#3817: [Crash] between Rich-text and Parse
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3817>

**Describe the bug**
```
d: ["0" "1" "2" "3" "4" "5" "6" "7" "8" "9"]
rt: rtd-layout [""]
rt/text: t: ""
parse d [collect into t any keep string!]
```
Output:
```
*** Runtime Error 98: assertion failed                                                                  
*** in file: /D/devel/red/red-src/red/runtime/parse.reds                                                
*** at line: 1200                                                                                       
***                                                                                                     
***   stack: red/parser/process 00000062h 00466FFEh 0 0 02D00414h                                       
***   stack: red/parser/process 02E20C90h 02D00384h 0 0 02D00364h                                       
***   stack: red/natives/parse* false -1 0 -1                                                           
***   stack: red/interpreter/eval-arguments 02E005C4h 02FCB1B8h 02FCB1C8h 00000000h 00000000h           
***   stack: red/interpreter/eval-code 02E005C4h 02FCB198h 02FCB1C8h false 00000000h 00000000h 02E005C4h
***   stack: red/interpreter/eval-expression 02FCB198h 02FCB1C8h false false false                      
***   stack: red/interpreter/eval 02D00344h true                                                        
***   stack: red/natives/catch* true 1                                                                  
***   stack: ctx474~try-do 020C1C00h                                                                    
***   stack: ctx474~launch 020C1C00h                                                                    
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 5-Mar-2019/0:09:36+03:00 commit #53b5b37
```



Comments:
--------------------------------------------------------------------------------

On 2019-03-13T20:34:37Z, greggirwin, commented:
<https://github.com/red/red/issues/3817#issuecomment-472594416>

    Confirmed. If rt/text references the target string, it crashes. Nice find.

--------------------------------------------------------------------------------

On 2019-03-14T16:15:39Z, qtxie, commented:
<https://github.com/red/red/issues/3817#issuecomment-472942257>

    Seems it crashes with any face type. Maybe an issue related to the ownership system.
    ```
    d: ["0" "1" "2" "3" "4" "5" "6" "7" "8" "9"]
    win: layout []
    win/text: t: ""
    parse d [collect into t any keep string!]
    ```

--------------------------------------------------------------------------------

On 2019-04-19T19:17:31Z, dockimbel, commented:
<https://github.com/red/red/issues/3817#issuecomment-484990786>

    It was indeed caused by an object event triggering from Parse during `keep` evaluation. The stack was insufficiently protected there from the event handler call, causing a corruption.

