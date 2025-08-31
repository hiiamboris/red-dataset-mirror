
#1240: Cause-error crashing when used from console
================================================================================
Issue is closed, was reported by dockimbel and has 2 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/1240>

It crashes when used from console

```
red>> cause-error 'math 'zero-dive []
*** Runtime Error 98: assertion failed
*** in file: block.reds
*** at line: 168
```

instead of returning this output:

```
*** Math error: attempt to divide by zero
*** Where: do
```



Comments:
--------------------------------------------------------------------------------

On 2015-06-12T08:46:28Z, dockimbel, commented:
<https://github.com/red/red/issues/1240#issuecomment-111416368>

    `'zero-dive` argument is invalid, causing the underlying `make error!` to crash. So closing this ticket and replacing it by a new one with `make error!`.

