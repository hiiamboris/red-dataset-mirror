
#412: Crash on out of scope word
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/412>

```
Red []

f: func [
    /local x
][
    [x]
]
do f
```

**\* Runtime Error 1: access violation
**\* at: 08061AA5h

R3 has the same problem with local values on the stack and solves it like this:

*\* Script error: x word is not bound to a context



Comments:
--------------------------------------------------------------------------------

On 2013-02-15T10:59:46Z, dockimbel, commented:
<https://github.com/red/red/issues/412#issuecomment-13601692>

    Now you will get the following error message:
    
    ```
    *** Error: undefined context for word 'x
    ```

--------------------------------------------------------------------------------

On 2013-02-25T12:23:01Z, PeterWAWood, commented:
<https://github.com/red/red/issues/412#issuecomment-14038503>

    The current message seems a bit confusing to me. The compiler clearly knows the context of 'x, it is the function f. The word is defined in the /local section of the function spec but I guess the logical value for it is unset!.
    Wouldn't a message to indicate that the definition of 'x in function f is incomplete be more appropriate?

--------------------------------------------------------------------------------

On 2013-02-26T23:26:13Z, dockimbel, commented:
<https://github.com/red/red/issues/412#issuecomment-14146625>

    The error is a runtime error, not a compilation one. It happens, _after_ `f` call, when `do` has to process the returned value which is `[x]`. So, `x` there is bound to `f` context (that is why I found the R3 error description inaccurate), but `f` context doesn't exist anymore (as in R3, a function context in Red is created/destroyed on each call, as it uses the stack for storing its values, so it is not even possible to return `unset` as it needs a value slot in the context).
    
    Given that, I agree that the error message is not good, I propose to replace `undefined` by `unreachable`.

