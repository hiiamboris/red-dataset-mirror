
#308: functions: from within a function, calling another function defined after the current one, fails
================================================================================
Issue is closed, was reported by earl and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/308>

A basic call to a function that was defined before the current function works fine:

``` rebol
foo: func [] [42]
bar: func [] [foo]
bar ; == 42
```

However, calling a function that is not yet defined, results in a runtime error. Example code:

``` rebol
bar: func [] [foo]
foo: func [] [42]
bar
```

Runtime error:

> **\* Script error: action 5 not defined for type: 28



Comments:
--------------------------------------------------------------------------------

On 2012-11-21T00:00:30Z, dockimbel, commented:
<https://github.com/red/red/issues/308#issuecomment-10580067>

    In the non-working case, `foo` is resolved to a variable access instead of a function call, as the compiler does compile fully `bar` before `foo`. This will probably require a deferred function body compilation approach to solve it, the same way Red/System does. If you can see a simpler solution, let me know.

