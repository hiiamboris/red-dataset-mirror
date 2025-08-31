
#1291: red-gui hangs after print
================================================================================
Issue is closed, was reported by WiseGenius and has 4 comment(s).
[status.resolved]
<https://github.com/red/red/issues/1291>

On Windows XP,
In red-gui source,
Using either Rebol 2 View (with `load-lib?: false`) or Rebol 2 Core,

Compile `test.red` with this simple content:

```
Red []

print "This is the test output."
```

Run `test.exe` and it hangs with the text cursor blinking immediately below the printed output:

![hang1](https://cloud.githubusercontent.com/assets/7657453/8902090/89490e18-3491-11e5-95a3-ccb3c6dc1133.png)

The window does not respond to closing:

![hang2](https://cloud.githubusercontent.com/assets/7657453/8902095/92e2d530-3491-11e5-9089-ad7f1219fe9c.png)



Comments:
--------------------------------------------------------------------------------

On 2015-11-07T01:28:43Z, qtxie, commented:
<https://github.com/red/red/issues/1291#issuecomment-154595351>

    @WiseGenius Is it problem still exist in your system with the latest repo?

--------------------------------------------------------------------------------

On 2015-11-07T13:41:02Z, WiseGenius, commented:
<https://github.com/red/red/issues/1291#issuecomment-154706689>

    @qtxie No. It seems to be working now, on both Windows XP and Windows 7.

