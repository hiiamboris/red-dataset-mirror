
#4597: Regression: body-of action/native/op does not work anymore
================================================================================
Issue is closed, was reported by meijeru and has 8 comment(s).
<https://github.com/red/red/issues/4597>

red/REP/51 was granted by #4289
expected:
```
>> load rejoin [body-of :now reflect :negate 'body]
== 9214
```
currently:
```
>> load rejoin [body-of :now reflect :negate 'body]
*** Internal Error: reserved for future use (or not yet implemented)
*** Where: reflect
*** Stack: load rejoin empty? body-of  
```




Comments:
--------------------------------------------------------------------------------

On 2020-08-02T15:53:49Z, 9214, commented:
<https://github.com/red/red/issues/4597#issuecomment-667691117>

    @meijeru the PR was never merged, so it's not a regression. And it doesn't implement `body-of` on `op!`, though it can be added if needed.

--------------------------------------------------------------------------------

On 2020-08-02T16:07:03Z, meijeru, commented:
<https://github.com/red/red/issues/4597#issuecomment-667692715>

    (1) do you have info on why it wasn't merged? (2) `op!` seems a logical extension (need to check though whether the op was created from a native or action)
    I'll close after your reply

--------------------------------------------------------------------------------

On 2020-08-02T16:14:39Z, 9214, commented:
<https://github.com/red/red/issues/4597#issuecomment-667693675>

    @meijeru 
    1. Nope.
    1. `body-of op!` can return ID of a `native!`/`action!` as an `integer!`, or body of a `function!`/`routine!` as a `block!`; it's a bit problematic though, because that doesn't tell you from where the result came from: is ID from native or action, is body block from function or routine? As of now, there's no way to check `op!`'s "parent" in userspace. Perhaps `parent-of <op>` would be more beneficial (albeit very ad-hoc) alternative.

--------------------------------------------------------------------------------

On 2020-08-02T16:34:32Z, meijeru, commented:
<https://github.com/red/red/issues/4597#issuecomment-667696017>

    (1) pity! (2) I understand

