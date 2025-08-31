
#1703: WAIT does not seem to work
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/1703>

In the interpreter, `wait 1000` should return after 1 second. It does not. When complied, the resulting `.exe` hangs up.

Incidentally, the documentation does not say the argument is milliseconds.



Comments:
--------------------------------------------------------------------------------

On 2016-03-11T14:33:48Z, xqlab, commented:
<https://github.com/red/red/issues/1703#issuecomment-195391000>

    `     red>> help wait
    
    ```
     USAGE:
         wait value  /all  /only
    
    DESCRIPTION:
       Waits for a duration, port, or both. 
       wait is of type: native!
    ```
    
    `
    1000 are 1000 seconds. 0.001 would be 1 millisecond

--------------------------------------------------------------------------------

On 2016-03-11T14:44:39Z, dockimbel, commented:
<https://github.com/red/red/issues/1703#issuecomment-195395504>

    `wait` takes seconds as argument.

--------------------------------------------------------------------------------

On 2016-03-11T16:30:19Z, dockimbel, commented:
<https://github.com/red/red/issues/1703#issuecomment-195439888>

    The description message now mentions `duration in seconds`.

