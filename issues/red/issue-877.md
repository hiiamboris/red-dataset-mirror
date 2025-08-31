
#877: Output float! value incorrectly on Linux-ARM.
================================================================================
Issue is closed, was reported by qtxie and has 2 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/877>

NOTE: only occur in Red/System context.

```
Red []
#system [
    print-line ["In Red/System 1.23 = " 1.23]
]

print ["In Red 1.23 =" 1.23]
```

Outputs:

```
In Red/System 1.23 = 8.0298925098574e+283           ;@@ Should be 1.23
In Red 1.23 = 1.23
```



Comments:
--------------------------------------------------------------------------------

On 2014-07-04T06:29:15Z, qtxie, commented:
<https://github.com/red/red/issues/877#issuecomment-48012658>

    No hurry to fix this issue since it works fine in Red.

