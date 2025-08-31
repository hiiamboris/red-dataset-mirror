
#2577: WISH: context? becomes context-of and is short for reflect <word> 'context
================================================================================
Issue is open, was reported by meijeru and has 4 comment(s).
[type.task.wish] [type.design]
<https://github.com/red/red/issues/2577>

See the docstring of reflect: "Returns internal details about a value via reflection." This applies perfectly to `context?`. Moreover, it is somewhat confusing that `context?` ends in a question mark., given that there is a pseudo-type `context!`.


Comments:
--------------------------------------------------------------------------------

On 2017-04-14T10:47:32Z, meijeru, commented:
<https://github.com/red/red/issues/2577#issuecomment-294134692>

    I don't want to restart the very lengthy discussion in #255; in fact the main object is to bring the function that yields the context of a word into the reflection sphere.

--------------------------------------------------------------------------------

On 2017-04-15T03:43:46Z, dockimbel, commented:
<https://github.com/red/red/issues/2577#issuecomment-294269714>

    > Moreover, it is somewhat confusing that context? ends in a question mark., given that there is a pseudo-type context!.
    
    There is no `context!` word or type in Red language, such pseudo-type only exists internally and is an implementation detail.
    ```
    >> context!
    *** Script Error: context! has no value
    *** Where: catch
    ```
    
    Moreover, we have other ways to define access to values metadata, so we first need to decide how to handle metadata globally before deciding on what should be handled by `reflect` and what not.

