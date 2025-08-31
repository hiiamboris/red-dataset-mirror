
#4248: parent window does not regain focus on macOS
================================================================================
Issue is open, was reported by 9214 and has 4 comment(s).
[type.bug] [GUI] [GUI.macOS]
<https://github.com/red/red/issues/4248>

**Describe the bug**

When you open another window from the parent one (e.g. `view [button [view []]`) and close it whereafter, the parent window will regain focus. That works on Windows and Linux (GTK branch), but not on macOS.

**To reproduce**

```red
view []
```

Type this in the console (either CLI or GUI one), then close the View window. Note that you need to click on console's window again so that you can continue typing.

**Expected behavior**

I expect the parent window to regain focus.

**Platform version**

The latest release, macOS 10.14 (Mojave).



Comments:
--------------------------------------------------------------------------------

On 2020-02-07T04:00:25Z, bitbegin, commented:
<https://github.com/red/red/issues/4248#issuecomment-583223838>

    https://github.com/red/red/issues/4276

--------------------------------------------------------------------------------

On 2020-05-13T03:44:50Z, qtxie, commented:
<https://github.com/red/red/issues/4248#issuecomment-627726872>

    Notes that a non-modal window created by `view []` is a sibling of the other windows. It's parent is the `screen` by default. 

