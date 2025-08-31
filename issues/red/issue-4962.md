
#4962: [Regression] FORALL overshoots on vectors now
================================================================================
Issue is closed, was reported by hiiamboris and has 12 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4962>

**Describe the bug**
```
v: make vector! 10
forall v [print ["at" index? v "=" v/1]]
```
Output:
```
...
at 158 = none
at 159 = none
at 160 = none
```

**Expected behavior**
`at 10 = 0`

**Platform version**
```
Red 0.6.4 for Windows built 12-Sep-2021/20:36:44+03:00  commit #9aea165
```



Comments:
--------------------------------------------------------------------------------

On 2021-09-16T11:53:06Z, hiiamboris, commented:
<https://github.com/red/red/issues/4962#issuecomment-920835017>

    https://github.com/red/red/commit/15a8edf26b33cdd5477830c5eda143292aa5f6ec ?

--------------------------------------------------------------------------------

On 2021-09-16T13:29:09Z, dockimbel, commented:
<https://github.com/red/red/issues/4962#issuecomment-920903585>

    @hiiamboris Most probably, yes.

--------------------------------------------------------------------------------

On 2021-09-16T21:42:40Z, hiiamboris, commented:
<https://github.com/red/red/issues/4962#issuecomment-921275514>

    Caught another one:
    ```
    >> b: [1 2 3 4]
    == [1 2 3 4]
    >> forall b [probe index? b b: next b b/1: b/1 * 2]
    1
    3
    5
    *** Script Error: * does not allow none! for its value1 argument
    *** Where: *
    *** Stack:
    
    >> head b
    == [1 4 3 8]
    ```

--------------------------------------------------------------------------------

On 2021-09-16T21:47:21Z, hiiamboris, commented:
<https://github.com/red/red/issues/4962#issuecomment-921277826>

    Let's include the tests as well.

--------------------------------------------------------------------------------

On 2021-09-17T10:27:50Z, dockimbel, commented:
<https://github.com/red/red/issues/4962#issuecomment-921688679>

    You should have opened a new ticket, the cause is not the same as the original issue here, for which a proper fix has been provided. So this ticket should stay closed as the new issue is not related to the old one, nor is the fix.

--------------------------------------------------------------------------------

On 2021-09-17T11:19:53Z, hiiamboris, commented:
<https://github.com/red/red/issues/4962#issuecomment-921717093>

    mkay
    #4967 

