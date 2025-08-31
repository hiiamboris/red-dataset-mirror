
#2654: Path notation cannot be used on email! values
================================================================================
Issue is closed, was reported by gltewalt and has 8 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2654>

```
>> series? s: @gltewalt
== true
>> s/1
*** Script Error: cannot access 1 in path [script invalid-path]
*** Where: catch
```


Comments:
--------------------------------------------------------------------------------

On 2017-05-06T01:34:55Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2654#issuecomment-299607508>

    It seems the issue is with path notation:
    ```text
    >> pick @gltewalt 1
    == #"@"
    >> pick @gltewalt 6
    == #"w"
    >> s: @gltewalt
    == @gltewalt
    >> pick s 1
    == #"@"
    >> s/1
    *** Script Error: cannot access 1 in path [script invalid-path]
    *** Where: catch
    ```

--------------------------------------------------------------------------------

On 2017-05-06T08:26:33Z, meijeru, commented:
<https://github.com/red/red/issues/2654#issuecomment-299624506>

    @b is recognized as email by the interpreter, but NOT by the compiler: %lexer.r requires at least one character before the @. Apparently %lexer.red has a different definition. That is an additional issue.

--------------------------------------------------------------------------------

On 2017-05-08T02:29:46Z, gltewalt, commented:
<https://github.com/red/red/issues/2654#issuecomment-299758231>

    ```
    email-rule: [
        s: some [ahead email-end break | skip] #"@"
        any [ahead email-end break | skip] e: (type: email!)
    ]
    ```

--------------------------------------------------------------------------------

On 2017-07-25T13:35:07Z, dockimbel, commented:
<https://github.com/red/red/issues/2654#issuecomment-317739004>

    > @b is recognized as email by the interpreter, but NOT by the compiler: %lexer.r requires at least one character before the @. Apparently %lexer.red has a different definition. That is an additional issue.
    
    The lexer is left unfinished for email! rules, until we add ref! type (planned for 0.6.4).

