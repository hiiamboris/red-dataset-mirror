
#1880: Curious R/S internal error
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.deferred] [type.bug]
<https://github.com/red/red/issues/1880>

This error occurred when compiling a rather large program (1169 LOC) which runs perfectly OK when interpreted. I do not have the time (nor the courage) to isolate the cause of the error in my source :pensive:.
This is the message:

```
Compiling to native code...
*** Red/System Compiler Internal Error: Script Error : Cannot use path on none! value 
*** Where: branch 
*** Near:  [ptr/1: ptr/1 + size] 
```



Comments:
--------------------------------------------------------------------------------

On 2016-05-04T19:25:03Z, meijeru, commented:
<https://github.com/red/red/issues/1880#issuecomment-216973623>

    The error location seems to be line 117 in `system/emitter.r`

--------------------------------------------------------------------------------

On 2016-05-05T04:01:26Z, dockimbel, commented:
<https://github.com/red/red/issues/1880#issuecomment-217072508>

    That is the Rebol GC bug showing up, see #994. The usual way to work around it is to avoid deep nested code constructions in your script, until Carl finally releases the fixed Rebol version.

--------------------------------------------------------------------------------

On 2016-05-06T09:59:59Z, meijeru, commented:
<https://github.com/red/red/issues/1880#issuecomment-217401694>

    Since the code interprets fine, and it is not secret (I may publish it once I am satisfied with it) I will not change it and wait for the 1.0 toolchain to digest it without problems (I have no great expectations about Carl's updates :pensive:).

