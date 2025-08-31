
#681: Regression on running the %hello.red script from interpreter
================================================================================
Issue is closed, was reported by dockimbel and has 2 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/681>

Running the %hello.red script from interpreter crashes:

```
C:\Dev\Red>red tests/hello.red

*** Script error: action 38 not defined for type: 10
```

If compiles, the %hello.red script runs fine.



Comments:
--------------------------------------------------------------------------------

On 2014-02-11T18:21:59Z, dockimbel, commented:
<https://github.com/red/red/issues/681#issuecomment-34786951>

    The runtime lexer does not support Unicode input yet.

