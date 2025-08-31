
#2439: DO/NEXT applied to string does not skip entire expression
================================================================================
Issue is closed, was reported by meijeru and has 10 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2439>

Example:
```
red>> do/next "1 + 2" 'p
== 3
red>> p
== " 2"
```
I suppose `do/next` is meant to work only on blocks, but that is neither documented nor checked


Comments:
--------------------------------------------------------------------------------

On 2017-02-16T04:05:16Z, dockimbel, commented:
<https://github.com/red/red/issues/2439#issuecomment-280225314>

    The returned series is wrong, it should be a block.

--------------------------------------------------------------------------------

On 2017-02-20T10:53:26Z, meijeru, commented:
<https://github.com/red/red/issues/2439#issuecomment-281048161>

    The solution is not correct:
    ```
    red>> do/next "1 + 2" 'p
    == 3
    red>> p
    == 3
    ```
    IMHO `p` should be `[ ]` or `""` 

--------------------------------------------------------------------------------

On 2017-02-20T11:06:10Z, dockimbel, commented:
<https://github.com/red/red/issues/2439#issuecomment-281051062>

    It should be `[]`. The fix for #2342 created a regression on this one.

--------------------------------------------------------------------------------

On 2017-02-20T11:09:14Z, meijeru, commented:
<https://github.com/red/red/issues/2439#issuecomment-281051680>

    It is in R3, but there is something curious in that implementation:
    ```
    >> do/next "1 + 2" 'p
    == 3
    >> p
    == [ ]
    >> head p
    == [none 1 + 2]
    ```

--------------------------------------------------------------------------------

On 2017-02-20T11:19:30Z, dockimbel, commented:
<https://github.com/red/red/issues/2439#issuecomment-281053627>

    @meijeru Looks like a R3 bug.

