
#223: Assigning float! value followed by two commands in 'while loop throws 11: float stack check
================================================================================
Issue is closed, was reported by rebolek and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/223>

See this code:

```
s: 0.0
i: 1
while [i < 10][
    s: 0.0
    0.0      ; some float! constant or variable
    i: i + 1 ; another command is needed to trigger the bug
]
```

last two lines can be replaced by almost anything (must be two different commands and one must access float! value).



Comments:
--------------------------------------------------------------------------------

On 2012-07-24T15:33:54Z, rebolek, commented:
<https://github.com/red/red/issues/223#issuecomment-7210525>

    Simpler version:
    
    ```
    i: 1
    while [i <= 10][    ; lowest count to trigger the error. 9 works fine
        0.0
        i: i + 1
    ]
    ```

--------------------------------------------------------------------------------

On 2012-07-26T11:56:33Z, rebolek, commented:
<https://github.com/red/red/issues/223#issuecomment-7275613>

    I can still reproduce it with this code:
    
    ```
    a: as pointer! [float!] allocate 10 * size? float!
    i: 1
    f: 1.0
    while [i <= 7][
        f: f * 0.8
        print [f lf]
        a/i: f 
        i: i + 1
    ]
    ```

--------------------------------------------------------------------------------

On 2012-07-27T07:14:46Z, rebolek, commented:
<https://github.com/red/red/issues/223#issuecomment-7299081>

    Unfortunately, to trigger this bug again, I just needed to increase loop count:
    
    ```
    a: as pointer! [float!] allocate 10 * size? float!
    i: 1
    f: 1.0
    while [i <= 10][
        f: f * 0.8
        print [f lf]
        a/i: f 
        i: i + 1
    ]
    ```

