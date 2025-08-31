
#2403: The block argument to make typeset! should be allowed to contain typesets
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/2403>

Currently, the block argument to `make typeset!` may only contain datatypes. I had a situation where I wanted to construct a new typeset out of the type spec block of a particular argument of a function; this type spec block was a mixture of datatypes and typesets (allowed in that case). The following error occured:
```
red>> make typeset! [datatype! block! paren! any-path! any-string!]
*** Script Error: invalid argument: any-path!
*** Where: make
```



Comments:
--------------------------------------------------------------------------------

On 2017-02-14T14:29:39Z, dockimbel, commented:
<https://github.com/red/red/issues/2403#issuecomment-279721633>

    Alternatively, you can use *set* functions to construct your typeset:
    ```
    union union make typeset! [datatype! block! paren!] any-path! any-string!
    ```

--------------------------------------------------------------------------------

On 2017-02-14T19:35:38Z, meijeru, commented:
<https://github.com/red/red/issues/2403#issuecomment-279811696>

    I agree about the alternative, but the point was that sometimes one has a *block* of types and typesets. If such a block is allowed in a function spec, it would be nice to have it allowed in make typeset!

--------------------------------------------------------------------------------

On 2017-02-20T09:58:58Z, dockimbel, commented:
<https://github.com/red/red/issues/2403#issuecomment-281035506>

    Indeed.

