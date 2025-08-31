
#4416: WISH: Pass through or re-throw all control flow
================================================================================
Issue is open, was reported by hiiamboris and has 18 comment(s).
[type.wish]
<https://github.com/red/red/issues/4416>

**Describe the bug**

It is possible to catch `return`, `break` and `throw` via `try/all`, but the resulting error object does not contain some essential info that may be used when implementing custom loops:
```
>> probe try/all [return 420]
make error! [
    code: 1
    type: 'throw
    id: 'return
    arg1: none           ;) I'd like this to be = 420 for return and unset for exit; compare:
    arg2: none           ;)  >> f: does [exit] type? f
    arg3: none           ;)  == unset!
    near: none
    where: 'return
    stack: 34538224
]
>> probe try/all [break/return 420]
make error! [
    code: 0
    type: 'throw
    id: 'break
    arg1: none           ;) this should be 420 if /return is used and unset if not; compare:
    arg2: none           ;)  >> type? until [break]
    arg3: none           ;)  == unset!
    near: none
    where: 'break
    stack: 34538224
]
>> probe try/all [throw/name 420 'qwe]
make error! [
    code: 2
    type: 'throw
    id: 'throw
    arg1: 420            ;) cool!
    arg2: none           ;) I'd like this to be = 'qwe when /name is used, none otherwise
    arg3: none
    near: none
    where: 'throw
    stack: 34538224
]
```

**To reproduce**
```
probe try/all [return 420]
probe try/all [break/return 420]
probe try/all [throw/name 420 'qwe]
```

**Expected behavior**

See above in the code comments

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 4-Apr-2020/0:17:39+03:00
```



Comments:
--------------------------------------------------------------------------------

On 2020-04-28T15:34:04Z, dockimbel, commented:
<https://github.com/red/red/issues/4416#issuecomment-620681376>

    The word "miss" is wrong in the title, the `arg1`, `arg2` and `arg3` in the error object are not related to the user code that caused the error, but internal error arguments for forming the error message.
    
    You should not create custom code workflows based on error throwing, that is a hack. `catch/throw` are there for user-made exceptions handling.

--------------------------------------------------------------------------------

On 2020-04-28T15:54:17Z, hiiamboris, commented:
<https://github.com/red/red/issues/4416#issuecomment-620693820>

    (: 
    `catch/throw` is not as reliable when building custom loops though. Because even if I bind the loop body to custom `continue` and `break` functions, this `bind` will never reach indirectly referenced blocks, e.g. `my-code: [continue] ... my-loop [... do my-code]` -- uses native `continue` no matter what I do ;)
    
    Although it might be faster than my hacks...
    
    > arg1, arg2 and arg3 in the error object are not related to the user code that caused the error
    
    Good point. Still it would be nice to have that info.

--------------------------------------------------------------------------------

On 2020-04-29T19:50:49Z, greggirwin, commented:
<https://github.com/red/red/issues/4416#issuecomment-621426482>

    @dockimbel will this be solved with `catch/throw` func attributes (as in R2)?
    
    Ultimately, and this is a good question for you @hiiamboris, as we look at HOFs, how much of the need for custom loops can we eliminate, and is it OK if the remaining cases have certain limitations (for which we can provide templates and best practices)? 

--------------------------------------------------------------------------------

On 2020-04-29T19:53:44Z, greggirwin, commented:
<https://github.com/red/red/issues/4416#issuecomment-621427927>

    This also applies to a new dialected `loop/repeat`, and finding use cases it can't solve either.

--------------------------------------------------------------------------------

On 2021-04-01T09:36:34Z, hiiamboris, commented:
<https://github.com/red/red/issues/4416#issuecomment-811786089>

    I just widened the scope of this issue. While not losing the info is a good thing in itself, having transparency to chosen forms of control flow is even better (and I know it was planned all along, just never implemented).
    
    E.g. part of the other https://github.com/red/red/issues/3755 issue is that we can rethrow a `throw` caught with `catch` but not `throw/name`, because we never even know that there was a `/name`.
    
    Creating custom mezzanines that should be control-flow transparent, or partially-transparent, is a wide area, and just one part of it is custom loops.
    
    Another annoyance to address is that there is no way to break from inner loop: one can't write
    `loop N [loop M [if found? [break/2]]]` or something. Requires `catch`/`throw`. This issue pops up more often than one may think, although I can live with it.
    
    A few thoughts on solution:
    - Like Rebol, have a `[throw]` attribute to mark a function transparent. This will still require that the `code` this function works on is not wrapped in any loops. I had to rewrite my [`trace`](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/raw/master/trace.red) mezz recently to use recursion instead of a loops just because of that, or otherwise it hanged the moment it saw `continue` in the user code.
    - Maybe crazy: bind every `return` & `exit` the same way we do bind function arguments/locals, so that they know their scope from the context they are bound to. But then if we write `code: [return 1] f: does [do code]` it won't work. Trading one limitation for another, plus likely more complexity in interpreter code. And we can't bind `break`/`continue` as there is no context for loops...

--------------------------------------------------------------------------------

On 2023-10-09T17:23:53Z, hiiamboris, commented:
<https://github.com/red/red/issues/4416#issuecomment-1753388593>

    Trying to make a `parse` wrapper and this issue interferes again: any rule that uses any nonlocal control flow cannot be handled by the wrapper.

--------------------------------------------------------------------------------

On 2023-10-09T17:33:45Z, hiiamboris, commented:
<https://github.com/red/red/issues/4416#issuecomment-1753399999>

    Note: `[throw]` or `[catch]` attributes are **not** a solution, while [scope guards](https://ddili.org/ders/d.en/scope.html) are. Because often you need to finalize something, free resources, etc. Only then restore the control flow. 

--------------------------------------------------------------------------------

On 2023-10-10T17:29:03Z, hiiamboris, commented:
<https://github.com/red/red/issues/4416#issuecomment-1755917981>

    [Closest I've got](https://codeberg.org/hiiamboris/red-common/src/commit/44857bc45778bcf1535f5dffc8ea7c2107ca37fd/catchers.red#L174) to control flow transparency (using tracing):
    ```
    >> catch [following [print "init" throw 42] [print "cleanup"]]
    init
    cleanup
    == 42
    ```
    Drawbacks:
    - `return` and `exit` are still trapped
    - ~20-25% slowdown of wrapped code
    - it only works at the top level:
      ```
      >> following [throw 1] [following [print 2][print 3]]
      2
      *** Throw Error: no catch for throw: 1
      *** Where: following
      *** Near : throw 1
      *** Stack:  
      ```

--------------------------------------------------------------------------------

On 2024-11-08T15:04:54Z, hiiamboris, commented:
<https://github.com/red/red/issues/4416#issuecomment-2464985833>

    Ultimately, what I often want is to write:
    ```
    [
        #scope this/path: some expression
        #scope other/path: other expression
        ...
        code evaluated here
        has this/path and other/path set
        to given expressions evaluation results
        ...
        ;; when this scope is closed, this/path and other/path are restored to their original values
    ]
    ```
    I've no problem with macro being in userspace, but it has no good facility to be based upon. `do/trace` is rarely a good solution because of the 20-25% slowdown. `try/keep` with subsequent rethrow is also rather heavy (on GC in particular), especially if there's more than one expression to set/restore. Even in some cases simple `do` (without exception control) is sufficient because I know that catches and errors are handled nearby for that same scope. A native solution (like the `following` above) would be a big help :)

