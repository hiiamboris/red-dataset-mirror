
#220: Problem when accessing pointer! [float!] value
================================================================================
Issue is closed, was reported by rebolek and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/220>

Following code throws `** Runtime Error 12: float underflow`:

``` rebol
i: 1
f: 0.0
arr: as pointer! [float!] allocate 10 * size? float!

while [i <= 10] [
    arr/i: f
    f: f + 0.1
    i: i + 1
    print [i ":" arr/i lf]
]
```



Comments:
--------------------------------------------------------------------------------

On 2012-07-15T21:57:19Z, dockimbel, commented:
<https://github.com/red/red/issues/220#issuecomment-6995427>

    There are several issues there:
    1. `print` is located after the `i: i + 1` part which results in out of bounds access on last loop.
    2. `print` on a float! path causes a crash, but if you type cast it to float32!, it works fine. Another workaround for this bug, is to assign `arr/i` to a variable, and then pass that variable to `print`.
    
    So, you could rewrite the loop as: 
    
    ```
    while [i <= 10] [
        arr/i: f
        f: f + 0.1
        print [i ":" as-float32 arr/i lf]
        i: i + 1
    ]
    ```

--------------------------------------------------------------------------------

On 2012-07-15T22:00:48Z, dockimbel, commented:
<https://github.com/red/red/issues/220#issuecomment-6995465>

    Another way to more simply workaround this bug is to use `print-line` instead of `print [...lf]`. The bug is caused by `arr/i` being followed by an extra argument.

