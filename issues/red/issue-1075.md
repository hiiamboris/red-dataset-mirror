
#1075: Runtime Error 11: float stack check
================================================================================
Issue is closed, was reported by qtxie and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1075>

```
Red []

#system [
    integer/to-float 1 print-line 1
    integer/to-float 1 print-line 2
    integer/to-float 1 print-line 3
    integer/to-float 1 print-line 4
    integer/to-float 1 print-line 5
    integer/to-float 1 print-line 6
    integer/to-float 1 print-line 7
    integer/to-float 1 print-line 8
]
```

**\* Runtime Error 11: float stack check
**\* at: 00441712h



Comments:
--------------------------------------------------------------------------------

On 2015-03-28T01:00:45Z, qtxie, commented:
<https://github.com/red/red/issues/1075#issuecomment-87134698>

    This works fine:
    
    ```
    Red []
    
    #system [
        x: integer/to-float 1 print-line 1
        integer/to-float 1 print-line 2
        integer/to-float 1 print-line 3
        integer/to-float 1 print-line 4
        integer/to-float 1 print-line 5
        integer/to-float 1 print-line 6
        integer/to-float 1 print-line 7
        integer/to-float 1 print-line 8
    ]
    ```

--------------------------------------------------------------------------------

On 2015-03-30T05:48:12Z, dockimbel, commented:
<https://github.com/red/red/issues/1075#issuecomment-87557294>

    The issue is caused by the x87 FPU stack limit of 7 entries that the compiler needs to keep track of. Sometimes, the need for cleaning up the FPU stack is difficult to guess for the compiler, so it applies a more aggressive approach. In this case, the approach was too aggressive, so I fine-tuned it for a more accurate behavior.

