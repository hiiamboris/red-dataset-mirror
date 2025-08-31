
#4271: [GTK] NO-BUTTONS window flag has no effect
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
[status.built] [status.tested] [GUI]
<https://github.com/red/red/issues/4271>

**Describe the bug**

`no-buttons` flag removes all window buttons on Windows and macOS, but has no effect on GTK.

**To reproduce**

```red
view/flags [] 'no-buttons
```

`no-min` and `no-max` also have no effect.

**Expected behavior**

I expect all of the buttons to be removed.

**Platform version**

```
Red 0.6.4 for Linux built 30-Jan-2020/13:22:38+01:00
```



Comments:
--------------------------------------------------------------------------------

On 2020-03-22T11:59:04Z, 9214, commented:
<https://github.com/red/red/issues/4271#issuecomment-602188279>

    Closing this as resolved.

