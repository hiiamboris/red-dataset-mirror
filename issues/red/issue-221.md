
#221: Assigning float! result of EITHER function throws 11: float stack check error
================================================================================
Issue is closed, was reported by rebolek and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/221>

This code throws **11: float stack check** error. When using integer!, it works.

```
x: -1.0
y: either x < 0.0 [0.0 - x][x]
print [y lf]
```

This workaround works, but it's just a workaround:

```
x: -1.0
either x < 0.0 [y: 0.0 - x][y: x]
print [y lf]
```



Comments:
--------------------------------------------------------------------------------

On 2012-07-20T12:44:11Z, dockimbel, commented:
<https://github.com/red/red/issues/221#issuecomment-7129214>

    This is more a compilation current limitation than a bug. Expressions inside `either` true/false blocks are not aware that an assignment is occurring at higher level, so wrong float stack termination code is generated for nested float expressions.
    
    I will improve expression compilation today in order to find a clean solution for this class of issues.

--------------------------------------------------------------------------------

On 2012-07-22T20:54:25Z, dockimbel, commented:
<https://github.com/red/red/issues/221#issuecomment-7165528>

    Following code produces same crash:
    
    ```
    fabs: func [x [float!] return: [float!] ][
        either x < 0.0 [0.0 - x][x]
    ]
    print [fabs -3.14 lf]
    ```

