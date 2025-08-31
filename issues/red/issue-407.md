
#407: Can't SET global value when reference local
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 12 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/407>

```
Red []

f: func [
    /local x
][
    x: 'y
    set x 1
]
f
probe y
```

unset

```
f: func [
    /local x
][
    x: 'y
    do [set x 1]
]
f
probe y
```

**\* Runtime Error 1: access violation
**\* at: 0805A575h



Comments:
--------------------------------------------------------------------------------

On 2013-02-09T16:38:10Z, dockimbel, commented:
<https://github.com/red/red/issues/407#issuecomment-13333749>

    Fixed in `lex-scope` branch.

--------------------------------------------------------------------------------

On 2013-02-10T15:31:37Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/407#issuecomment-13351368>

    The interpreter case has been fixed, but the compiler case not.

--------------------------------------------------------------------------------

On 2013-02-10T22:08:11Z, dockimbel, commented:
<https://github.com/red/red/issues/407#issuecomment-13362375>

    Same as issue #408, the compiler cannot compile that case correctly as `y` is never directly assigned. Only the interpreted version can work.

--------------------------------------------------------------------------------

On 2013-02-10T22:11:59Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/407#issuecomment-13362455>

    Unlike #408, it can compile it, but doesn't find the symbol at runtime.

--------------------------------------------------------------------------------

On 2013-02-10T22:26:47Z, dockimbel, commented:
<https://github.com/red/red/issues/407#issuecomment-13362730>

    It doesn't compile anymore after the last fixes, this is what you would get now:
    
    ```
    *** Compilation Error: undefined word y
    *** in file: %/C/dev/Red/red/tests/bug.red
    *** near: [y]
    ```

--------------------------------------------------------------------------------

On 2013-02-11T01:14:12Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/407#issuecomment-13365497>

    Apart from the new compilation error, the main report is still the case: SET does not work in the compiler when the reference variable is local. When I check the result with `probe do [y]` or `get 'y`, I still get `unset`.

