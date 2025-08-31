
#4824: [D2D, Regression] Clipping region is not restored by push/pop anymore
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4824>

**Describe the bug**

`draw 80x80 [push [clip 0x0 40x40 pen red] box 10x10 70x70]`
After `push` `clip` should not apply, but it does:
<img src=https://i.gyazo.com/8721ebe2e04d923a84e7136bd0f46462.png width=200></img>

**Expected behavior**

Square drawn

**Platform version**
```
Red 0.6.4 for Windows built 28-Jan-2021/14:26:17+03:00 commit #bae0c34
```



Comments:
--------------------------------------------------------------------------------

On 2021-02-15T08:24:22Z, qtxie, commented:
<https://github.com/red/red/issues/4824#issuecomment-779045717>

    Direct2D's API does not save the clipping region like GDI+ does which causes the issue.

