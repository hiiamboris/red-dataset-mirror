
#586: FIND doesn't work on types
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/586>

red>> t: reduce [block!]
== [block!]
red>> find t block!
== none
red>> find t type? []
== none
red>> block! = type? []
== true



Comments:
--------------------------------------------------------------------------------

On 2013-12-03T09:20:45Z, qtxie, commented:
<https://github.com/red/red/issues/586#issuecomment-29694151>

    find this line of code cause the issue: 
    
    ```
    ; In block.reds. line number: 793
    type = TYPE_OF(slot)                ;-- simple type comparison
    ```
    
    But don't know how to fix it.

--------------------------------------------------------------------------------

On 2013-12-03T09:28:19Z, qtxie, commented:
<https://github.com/red/red/issues/586#issuecomment-29694657>

    change it to
    
    ```
    dt: as red-datatype! slot
    type = dt/value                     ;-- simple type comparison
    ```
    
    can solve this issue. Is it OK?

--------------------------------------------------------------------------------

On 2013-12-03T12:36:32Z, dockimbel, commented:
<https://github.com/red/red/issues/586#issuecomment-29706037>

    I had a quick look at the code and proposed fix, it looks like the right fix to do. If it passes all tests in %red/tests/run-all.r script, please submit it as a PR.

