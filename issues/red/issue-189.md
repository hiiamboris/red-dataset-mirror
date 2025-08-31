
#189: Nested loops issue
================================================================================
Issue is closed, was reported by Oldes and has 6 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/189>

With code like this:

```
r: 0
c: 0
width:  10
height: 10
print ["height: " height " width:" width "^/"]
while [r < height][
    while [c < width][
        print [r " " c "^/"]
        c: c + 1
    ]
    r: r + 1
]
```

the inner loops stops the outer loop



Comments:
--------------------------------------------------------------------------------

On 2011-12-19T21:01:52Z, dockimbel, commented:
<https://github.com/red/red/issues/189#issuecomment-3209479>

    The loops work fine, the issue is that `c` is never reset to `0`, so when `r` is incremented the nested `print` is not reached anymore because `c < width` is always true for `r > 0`.
    
    This version will run as you expect:
    
    ```
    r: 0
    c: 0
    width:  10
    height: 10
    print ["height: " height " width:" width "^/"]
    while [r < height][
        c: 0
        while [c < width][
            print [r " " c "^/"]
            c: c + 1
        ]
        r: r + 1
    ]
    ```

--------------------------------------------------------------------------------

On 2011-12-19T21:30:44Z, Oldes, commented:
<https://github.com/red/red/issues/189#issuecomment-3209895>

    eh... I'm so stupid... sorry

--------------------------------------------------------------------------------

On 2011-12-19T22:31:44Z, dockimbel, commented:
<https://github.com/red/red/issues/189#issuecomment-3210824>

    Happens to me often too. ;-)

