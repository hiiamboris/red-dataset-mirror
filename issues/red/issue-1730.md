
#1730: Reduce <function> will crash in interpreter
================================================================================
Issue is closed, was reported by dockimbel and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1730>

`reduce` will crash if the argument is a function.

It might be wiser to make non-block values pass through (like in Rebol) rather than trying to evaluate them...



Comments:
--------------------------------------------------------------------------------

On 2016-05-09T05:07:56Z, dockimbel, commented:
<https://github.com/red/red/issues/1730#issuecomment-217776922>

    Works fine now both in interpreter and compiler:
    
    ```
    red>> reduce does [print "ok"]
    ok
    ``
    ```

