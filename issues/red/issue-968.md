
#968: Compiler error on IF local object! path
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 18 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/968>

```
Red []

f: func [
    o [object!]
][
    if find o/a none []
]
```

**\* Compilation Error: expected a block for IF-BODY instead of word! value 
**\* near: [none []]



Comments:
--------------------------------------------------------------------------------

On 2014-10-31T04:53:04Z, dockimbel, commented:
<https://github.com/red/red/issues/968#issuecomment-61217912>

    This is a legitimate error from the compiler as it has no possible mean to guess what are the boundaries of the expression following IF, as `o/a` is undefined at compile-time (for example, `o/a` could be a function eating several arguments).
    
    The workaround for such cases is to wrap the right expression in parens (no performance impact):
    
    ```
    Red []
    
    f: func [
        o [object!]
    ][
        if (find o/a none) []
    ]
    ```
    
    Another alternative solution could be to introduce an `[interpret]` optional function flag to enable relaxed expression writing, but at the expense of slower performance. Let me know if you think such additional option is worth it.

--------------------------------------------------------------------------------

On 2014-11-01T01:04:12Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/968#issuecomment-61350951>

    Would that interpret the entire function? I guess that's not worth it, because the problem remains that you have to identify a non-intuitive need to give the compiler a hint.

--------------------------------------------------------------------------------

On 2014-11-01T23:47:15Z, dockimbel, commented:
<https://github.com/red/red/issues/968#issuecomment-61388187>

    Yes, entire function. That could be used for cases like this one where the compiler signals that it cannot handle a relaxed syntax, so you can choose either to provide parens around the faulty expression or relax the syntax of the whole function at the cost of performance.

--------------------------------------------------------------------------------

On 2014-11-02T01:40:27Z, earl, commented:
<https://github.com/red/red/issues/968#issuecomment-61390867>

    Why not make the compiler automatically detect that it can't compile this function and thus fall back to having it interpreted (i.e. why not make the compiler automatically infer your suggested `interpret` attribute)?

--------------------------------------------------------------------------------

On 2014-11-10T15:53:54Z, dockimbel, commented:
<https://github.com/red/red/issues/968#issuecomment-62404295>

    @earl, yes that could be done, though, the user needs to be notified somehow that such function is run in a sub-optimal way. 
    
    I am leaving this ticket open for now, I will try to research more on such case to see if a better alternative can be found.

--------------------------------------------------------------------------------

On 2015-06-13T07:28:49Z, dockimbel, commented:
<https://github.com/red/red/issues/968#issuecomment-111684357>

    Good news, I have found a good candidate solution for this whole class of problems, affecting functions treated as keywords by the compiler. The compiler is currently doing some premature optimization by aggressively mapping those keywords to their closest Red/System counterparts, generating higher constraints at Red level. It is possible to detect cases where undetermined paths are involved and generate less optimized code (but still much faster than interpreted), relaxing the constraints on user code. :-)
    
    Not sure in which release it will be implemented, but this is high priority, so it needs to be fixed asap.

--------------------------------------------------------------------------------

On 2019-09-25T19:44:35Z, dockimbel, commented:
<https://github.com/red/red/issues/968#issuecomment-535181364>

    The Red compiler can now compile such expressions but will assume a non-active `o/a` path, so if that evaluates to a function, it will not be called.  `do` can be used to enforce a call in such case if needed.

--------------------------------------------------------------------------------

On 2019-09-25T20:21:52Z, meijeru, commented:
<https://github.com/red/red/issues/968#issuecomment-535196510>

    Is this worth a warning in the documentation?

--------------------------------------------------------------------------------

On 2019-09-25T20:45:25Z, greggirwin, commented:
<https://github.com/red/red/issues/968#issuecomment-535213316>

    It's absolutely something we should note.

