
#1768: Lexer Issue: No error reported for invalid format %{...}
================================================================================
Issue is closed, was reported by ghost and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1768>

Currently -

```
red>> %{test ing.txt}
== "test ing.txt"
red>> a: %{test ing.txt}
== "test ing.txt"
red>> print read a
*** Access error: cannot open: %""
*** Where: read
red>> a
== %""
red>> print a

red>>
```

Instead an error should be reported for invalid format `%{...}`



Comments:
--------------------------------------------------------------------------------

On 2018-12-04T17:07:50Z, hiiamboris, commented:
<https://github.com/red/red/issues/1768#issuecomment-444178019>

    0.6.4: not fixed yet (no error is reported)
    In fact, the result is unexpected:
    ```
    >> try [load {a: %{test ing.txt}}]
    == [a: % "test ing.txt"]
    >> do try [load {a: %{test ing.txt}}]
    *** Script Error: % does not allow set-word! for its value1 argument
    *** Where: %
    *** Stack:
    ```
    It adds a space where there shouldn't be one

--------------------------------------------------------------------------------

On 2018-12-04T17:54:30Z, 9214, commented:
<https://github.com/red/red/issues/1768#issuecomment-444194544>

    @hiiamboris I believe this is an expected behavior. `%` gets parsed as a word bound to modulo operator. Values don't "stick" to brackets (i.e. `[]`, `()` and `{}`).

--------------------------------------------------------------------------------

On 2018-12-04T19:29:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/1768#issuecomment-444226870>

    @9214 you're right, I agree. `%` is one token, and `{..}` becomes a normal string. Makes sense.

