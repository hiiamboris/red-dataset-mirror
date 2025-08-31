
#2794: [mac VID] Same style, difference appearances.
================================================================================
Issue is closed, was reported by JenniferLee520 and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/2794>

In the following code, the two "OK" buttons should look exactly the same. But they don't.
```Red
view [
    style button2: button font-size 25
    button2 "OK"
    button2 "OK"
]
```
This bug is only on macOS.


Comments:
--------------------------------------------------------------------------------

On 2017-06-28T13:07:44Z, dockimbel, commented:
<https://github.com/red/red/issues/2794#issuecomment-311654410>

    Fixed by commit: [d47f3c48](https://github.com/red/red/commit/bab135491c00a45b5004c2544234a571d47f3c48).

