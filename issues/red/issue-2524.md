
#2524: wrong error message when accessing email component by integer
================================================================================
Issue is closed, was reported by meijeru and has 10 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2524>

```
>> e: a@b
== a@b
>> e/1
*** Script Error: cannot access 1 in path [script invalid-path]
*** Where: catch
```
The path is not displayed, instead some other value is formed


Comments:
--------------------------------------------------------------------------------

On 2017-04-02T15:31:26Z, meijeru, commented:
<https://github.com/red/red/issues/2524#issuecomment-290993694>

    See lines 62 and 65 of `%email.reds`. Apparently `stack/arguments` is overwritten by `TO_ERROR` so the second argument to the `fire` function should be gotten from somewhere else (or save`stack/arguments` first?).

--------------------------------------------------------------------------------

On 2017-04-02T23:01:24Z, qtxie, commented:
<https://github.com/red/red/issues/2524#issuecomment-291021462>

    In Rebol it is allowed:
    ```
    >> e: a@b
    == a@b
    >> e/1
    == #"a"
    ```

--------------------------------------------------------------------------------

On 2017-04-03T02:17:16Z, dockimbel, commented:
<https://github.com/red/red/issues/2524#issuecomment-291034988>

    @meijeru Thank you for the code analysis!
    
    `email!` is part of `any-string!` and does not have specific semantics for path access like `file!` and `url!`, so by default, it should behave like a `string!` wrt path accessors.

--------------------------------------------------------------------------------

On 2017-04-03T06:23:05Z, meijeru, commented:
<https://github.com/red/red/issues/2524#issuecomment-291058023>

    Have you decided what it is going to be: alllowed or forbidden (with better error message)? My vote is for allowing.

--------------------------------------------------------------------------------

On 2017-07-28T16:51:13Z, dockimbel, commented:
<https://github.com/red/red/issues/2524#issuecomment-318705561>

    It is allowed since 0.6.3:
    ```
    >> e: a@b
    == a@b
    >> e/1
    == #"a"
    ```

