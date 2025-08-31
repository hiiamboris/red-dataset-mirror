
#5553: DO-FILE hides evaluation stack from errors
================================================================================
Issue is closed, was reported by hiiamboris and has 12 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/5553>

**Describe the bug**

Example script output:
```
*** User Error: error message
*** Where: do
*** Near : do make error! e
*** Stack: do-file
```
I can only tell that the error generating function was called at someplace, but not where, not even in what file.

**To reproduce**

1. Save these scripts:
- `1.red`:
   ```
   Red [] do %2.red
   ```
- `2.red`:
   ```
   Red []
   e: func [e] [do make error! e]
   f: does [g]
   g: does [e "error message"]
   f
   ```
2. Run `1.red`
3. Observe the vague error report shown above

**Expected behavior**

Since `where` and `near` become non-informative when an error generating expression is used, stack trace is the only clue left. `do-file` shouldn't hide it.

**Platform version**
`Red 0.6.5 for Windows built 23-Oct-2024/2:43:13+07:00  commit #17c374f`


Comments:
--------------------------------------------------------------------------------

On 2024-11-05T12:08:20Z, dockimbel, commented:
<https://github.com/red/red/issues/5553#issuecomment-2457000687>

    How is `near` non-informative? It looks pretty accurate.

--------------------------------------------------------------------------------

On 2024-11-06T08:48:52Z, hiiamboris, commented:
<https://github.com/red/red/issues/5553#issuecomment-2459027966>

    Non-informative, because it doesn't point at the place where the actual error has happened. Only to an expression in an error-raising function (wrapper), where `do make error!` is by design.

--------------------------------------------------------------------------------

On 2024-11-06T12:37:41Z, dockimbel, commented:
<https://github.com/red/red/issues/5553#issuecomment-2459644284>

    >  Only to an expression in an error-raising function (wrapper), where do make error! is by design.
    
    That's exactly where the error is raised. You can't have expectations for semantics that don't exist in the language. What you're really asking for indirectly is the support for an equivalent to the `[catch]` attribute from R2.

--------------------------------------------------------------------------------

On 2024-11-06T16:50:06Z, hiiamboris, commented:
<https://github.com/red/red/issues/5553#issuecomment-2460292840>

    Not necessarily. If I had a stack trace I would find the point of interest. But sure, `[catch]` would help.

--------------------------------------------------------------------------------

On 2024-11-06T22:30:33Z, dockimbel, commented:
<https://github.com/red/red/issues/5553#issuecomment-2460923718>

    Compiled `try` was not honoring the `/keep` refinement, that was fixed by the commit.
    
    About input files tracking, it might be possible to extend `do-file` to track them and make them available to the error object when created somehow... I will look into it.

--------------------------------------------------------------------------------

On 2024-11-08T21:56:27Z, dockimbel, commented:
<https://github.com/red/red/issues/5553#issuecomment-2465811659>

    Now you'll get:
    ```
    *** User Error: error message
    *** Where: do
    *** Near : do make error! e
    *** Stack: do-file do-file f g e
    *** Files: %1.red %2.red
    ```
    The source files reporting is a bit raw, but at least the info is there and should be useful in big codebases. Only scripts run by `do` are tracked.

