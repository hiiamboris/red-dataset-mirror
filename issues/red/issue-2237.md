
#2237: RETURN inside PARSE rule crashes when compiled
================================================================================
Issue is closed, was reported by rebolek and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2237>

This is basically #1866, but not in interpreter.

Code:

```
Red []
parse "abc" [(return 1)]
```

Output:

```
λ test

*** Runtime Error 95: no CATCH for THROW
*** at: 0040D780h
```



Comments:
--------------------------------------------------------------------------------

On 2017-03-02T06:08:18Z, dockimbel, commented:
<https://github.com/red/red/issues/2237#issuecomment-283565583>

    Additional fixes are needed for other exceptions cases:
    ```
    parse "abc" [(break)]
    parse "abc" [(continue)]
    parse "abc" [(throw 123)]
    loop 2 [parse "abc" [(break)]]
    ```

