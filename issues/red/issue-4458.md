
#4458: [VID] Fails when `with` is bound to a function
================================================================================
Issue is open, was reported by hiiamboris and has 10 comment(s).
[type.review] [type.design]
<https://github.com/red/red/issues/4458>

Keywords: View, VID, layout, bind

**Describe the bug**

When constructing a layout block from a function that has `with` among it's arguments, layout won't accept this block after leaving the function:
```
>> layout bind [base data 1 with []] has [with] []
*** Script Error: context for with is not available
*** Where: do
*** Stack: layout fetch-expr  
```
Curiously this is only bugged when `with` comes after `data`

**Expected behavior**

Unaffected by `with` binding.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 20-May-2020/11:46:36+03:00
```



Comments:
--------------------------------------------------------------------------------

On 2020-05-21T21:04:53Z, 9214, commented:
<https://github.com/red/red/issues/4458#issuecomment-632345290>

    > Curiously this is only bugged when with comes after data
    
    No, after any VID keyword that supports inlined expressions: `extra`, `data`, `draw` and `at`. And it's not related to `with`, any word bound to function's context will do. In fact, it's not even related to View or VID:
    
    ```red
    >> block: [1 foo]
    == [1 foo]
    >> do/next block 'bar
    == 1
    >> bind block has [foo][]
    == [1 foo]
    >> do/next block 'bar
    *** Script Error: context for foo is not available
    *** Where: do
    *** Stack:  
    ```
    
    https://github.com/red/red/blob/398d73317faf180f01da1b953b24c01fa2e59e62/modules/view/VID.red#L266

--------------------------------------------------------------------------------

On 2020-05-21T21:30:34Z, hiiamboris, commented:
<https://github.com/red/red/issues/4458#issuecomment-632356755>

    So it checks if it's an operator then. Not very useful in VID, but makes sense now.
    I guess we could make this check return false when no context is available.

--------------------------------------------------------------------------------

On 2020-05-21T21:45:24Z, 9214, commented:
<https://github.com/red/red/issues/4458#issuecomment-632362787>

    > So it checks if it's an operator then
    
    Indeed, and fixing it would require either to pass `yes` as a 3rd argument:
    
    https://github.com/red/red/blob/398d73317faf180f01da1b953b24c01fa2e59e62/runtime/natives.reds#L572
    
    https://github.com/red/red/blob/398d73317faf180f01da1b953b24c01fa2e59e62/runtime/interpreter.reds#L825
    
    Or to extend `CHECK_INFIX` with
    * a check of context's kind;
    * and a check of presence/absence of values on a stack if it's a function's context.
    
    https://github.com/red/red/blob/398d73317faf180f01da1b953b24c01fa2e59e62/runtime/interpreter.reds#L18
    
    The former solution is specific to VID case (and probably would require to turn `fetch-expr` into a `routine!`), the latter is more general and brings up the question of infix check refactoring that I know @dockimbel has in mind. 

--------------------------------------------------------------------------------

On 2020-05-22T11:18:01Z, hiiamboris, commented:
<https://github.com/red/red/issues/4458#issuecomment-632639501>

    I'm for pursuing both fixes at once. 
    Global fix would help avoid this error in user built DSLs.
    VID-specific fix would avoid this:
    ```
    with: make op! ...              ;) Isn't it a great name for an operator? ;)
    e.g.: a with b
    and then...
    view [.... data x with [...]]   ;) VID is totally broken by that op );
    ```
    Although I think what VID should rather do is look for it's own keywords ahead after the next token that comes after `data` (for `with` in this case) and limit the region `do/next` scans for an expression. This will still allow one to use operators in VID, but not those that are keywords (one should use parens for that). And `do/next` will benefit from `/part` as well, as it's not the only place where it's useful to limit it, e.g. [here](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/2c8f637be255d41f95e7bfb8c0e504b3150f548e/trace-deep.red#L74) and [here](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/2c8f637be255d41f95e7bfb8c0e504b3150f548e/trace-deep.red#L85) I have to `copy/part` only to tell `do` how far it should look ahead.

--------------------------------------------------------------------------------

On 2020-05-22T19:38:10Z, 9214, commented:
<https://github.com/red/red/issues/4458#issuecomment-632882047>

    I always mused over a possibility of something like `do/next/only [1 + 2 + 3] 'rest` to return `3` and set `rest` to `[3 + 3]`.
    
    Perhaps we can do away with `do/next` entirely and introduce a sane alternative to `preprocessor/fetch-next` that gives you the next expression (which you can then evaluate if you want).

