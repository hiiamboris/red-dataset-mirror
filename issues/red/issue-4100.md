
#4100: request-file/filter with incorrect argument crashes console
================================================================================
Issue is closed, was reported by ushakov-s and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4100>

```
request-file/filter ["MD files" *.md]
```
crashes console without any notifications or error messages. 

Windows 7 32 Home
```
Red 0.6.4 for Windows built 22-Oct-2019/2:09:13+03:00 commit #d7fd282
```



Comments:
--------------------------------------------------------------------------------

On 2019-10-22T17:22:35Z, hiiamboris, commented:
<https://github.com/red/red/issues/4100#issuecomment-545066906>

    ```
    *** Runtime Error 1: access violation
    *** in file: /D/devel/red/red-src/red/datatypes/string.reds
    *** at line: 931
    ***
    ***   stack: red/string/alter 0295FF74h 02CA0D08h -1 0 true 0
    ***   stack: red/string/concatenate 0295FF74h 02CA0D08h -1 0 true false
    ***   stack: gui/file-filter-to-str 0295FF44h
    ***   stack: gui/OS-request-file 0295FF24h 0295FF34h 0295FF44h false false
    ***   stack: ctx||411~request-file 0295FF24h 0295FF34h 0295FF44h false false
    ***   stack: request-file
    ***   stack: red/_function/call 0295FE94h 00313884h
    ***   stack: red/interpreter/eval-code 0295FE94h 02CA0CB0h 02CA0CB0h true 02CA0C90h 02CA0CC4h 02A64DB4h
    ***   stack: red/interpreter/eval-path 02CA0C90h 02CA0CA0h 02CA0CB0h false false false false
    ***   stack: red/interpreter/eval-expression 02CA0CA0h 02CA0CB0h false false false
    ***   stack: red/interpreter/eval 0295FE84h true
    ***   stack: red/natives/do* true -1 -1 -1
    ```

