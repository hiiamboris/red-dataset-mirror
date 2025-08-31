
#225: 11: float stack check when using pointer! to float! in WHILE loop
================================================================================
Issue is closed, was reported by rebolek and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/225>

See this code:

```
i: 1.0
data: declare pointer! [float!]
while [i < 10.0][
    data/value: i
    i
    i: i + 1.0
]
```



Comments:
--------------------------------------------------------------------------------

On 2012-07-30T16:02:12Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/225#issuecomment-7372642>

    Here, as in #226, you're not allocating memory for the pointer to point to, so the result is undefined.

--------------------------------------------------------------------------------

On 2012-07-30T16:23:19Z, rebolek, commented:
<https://github.com/red/red/issues/225#issuecomment-7373280>

    Code fixed, error still present:
    
    ```
    i: 1.0
    f: 1.0
    data: declare pointer! [float!]
    data: :f
    while [i < 10.0][
        data/value: i
        i
        i: i + 1.0
    ]
    ```

