
#2016: list-env (wine + windowsXP) will crash on empty env variables
================================================================================
Issue is closed, was reported by SteeveGit and has 4 comment(s).
[status.built] [status.tested] [status.reviewed]
<https://github.com/red/red/issues/2016>

Tested on wine 32-bits (WindowsXP emulation) under Ubuntu-64bits system

**list-env** will crash when an environment variable is set to a null string!

> set-env "TEST" "" 

now **list-env** will crash

```
*** Runtime Error : assertion failed
*** in file: /Z/home/a/Desktop/Git/red/runtime/allocator.reds
*** at line: 
***
***   stack: red/alloc-series-buffer   
***   stack: red/alloc-series-buffer   
***   stack: red/alloc-series   
***   stack: red/unicode/load-utf16 h  h false
***   stack: red/string/load-in h  h 
***   stack: red/list-env
***   stack: red/natives/list-env* false
***   stack: red/interpreter/eval-arguments h h 20392002203A2002203B2371111002203A6002203A6002203B6002203C6002203D6002203E6002203F6002204060022041611181002203D0002203D0002203E0002203F0002204000022041000220420002204300022044001985479842742260010010002203D0000000000002203D0000683D70-10071206C0079A9980079A9h h h
***   stack: red/interpreter/eval-code h h h false h h h
***   stack: red/interpreter/eval-expression h h false false
***   stack: red/interpreter/eval h true
***   stack: red/natives/catch* true 
***   stack: ctx275~try-do h
***   stack: ctx275~do-command h
***   stack: ctx275~eval-command h
***   stack: ctx275~run h
***   stack: ctx275~launch h
***   stack: ctx294~launch h
9800000000000000000071206C0079A9980079A99800000000000000000071206C0079A9980079A99800683D5010033C2F40033C2F40033C2F40033C2F40033C2F40033BDF8
```
### Note that the bug could not be replicated on W10 system



Comments:
--------------------------------------------------------------------------------

On 2016-06-14T09:33:14Z, meijeru, commented:
<https://github.com/red/red/issues/2016#issuecomment-225829069>

    On W10:
    
    ```
    red>> set-env "TEST" ""
    == ""
    red>> get-env "TEST"
    == ""
    red>> probe list-env
    #(
    ; ... some lines omitted!
        "TEMP" "C:\Users\RudolfW\AppData\Local\Temp"
        "TEST" ""
        "TMP" "C:\Users\RudolfW\AppData\Local\Temp"
    ; more lines omitted ...
        "windir" "C:\WINDOWS"
    )
    ```

--------------------------------------------------------------------------------

On 2016-06-14T09:45:58Z, SteeveGit, commented:
<https://github.com/red/red/issues/2016#issuecomment-225832233>

    @meijeru  Then, there is something different in the format of the c-strings array returned by **platform/GetEnvironmentStrings** But I can't test it myself.

