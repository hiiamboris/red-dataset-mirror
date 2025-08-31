
#217: Problems with float operations
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/217>

Following code throws `*** Runtime Error 11: float stack check` under Windows 7 and `*** Runtime Error 9: float invalid operation` under Ubuntu (VirtualBox):

``` rebol
i: 1
f: 0.0
arr: as pointer! [float!] allocate 10 * size? float!

while [i <= 10] [
    arr/i: f
    f: f + 0.1
    i: i + 1
]
```



