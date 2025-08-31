
#136: Are logic! fields not aligned in a struct!
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/136>

I get the impression from the result of the `size?` function that `logic!` fields are not aligned on word boundaries, and I find some corroboration in the text of `emitter/member-offset?` which has a test on types to be aligned, where `logic!` is missing. Is this on purpose?



Comments:
--------------------------------------------------------------------------------

On 2011-07-13T15:26:20Z, dockimbel, commented:
<https://github.com/red/red/issues/136#issuecomment-1563542>

    Sounds like an error.

--------------------------------------------------------------------------------

On 2011-07-13T15:37:47Z, dockimbel, commented:
<https://github.com/red/red/issues/136#issuecomment-1563626>

    The memory alignment of logic! struct members was correct, only the `size?` calculation was wrong. So now:
    
    ```
    a: declare struct! [x [byte!] y [logic!]]
    prin-int size? a
    ```
    
    correctly returns: `8`

