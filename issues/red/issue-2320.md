
#2320: integer: pair/x: <number> results in corrupted pair!
================================================================================
Issue is closed, was reported by rebolek and has 6 comment(s).
[status.built] [status.tested] [status.duplicate]
<https://github.com/red/red/issues/2320>

```
red>> p: 0x0
== 0x0
red>> a: p/x: 0
== 0
red>> p
== 454x0
```


Comments:
--------------------------------------------------------------------------------

On 2016-11-15T23:18:33Z, qtxie, commented:
<https://github.com/red/red/issues/2320#issuecomment-260801925>

    It's an issue about multiple assignment: `a: p/x: 0`.
    
    This works:
    
    ```
    p: 0x0
    p/x: 0
    p
    == 0x0
    ```

--------------------------------------------------------------------------------

On 2016-11-16T10:30:43Z, rebolek, commented:
<https://github.com/red/red/issues/2320#issuecomment-260910791>

    Yes, I should have been more verbose with my description ;)

--------------------------------------------------------------------------------

On 2016-11-18T17:01:19Z, dockimbel, commented:
<https://github.com/red/red/issues/2320#issuecomment-261583940>

    It's a duplicate ticket, there are 2 or 3 issues related to that bug already.

