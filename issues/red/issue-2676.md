
#2676: inconsistency in char! + pair! 
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2676>

adding a pair! value to a char! value uses the first component of the pair; the converse is forbidden


Comments:
--------------------------------------------------------------------------------

On 2017-06-07T08:35:41Z, dockimbel, commented:
<https://github.com/red/red/issues/2676#issuecomment-306728581>

    It seems to have been fixed already:
    ```lisp
    >> #"a" + 3x3
    *** Script Error: pair! type is not allowed here
    *** Where: +
    *** Stack: 
    >> 3x3 + #"a"
    *** Script Error: char! type is not allowed here
    *** Where: +
    *** Stack: 
    ```

