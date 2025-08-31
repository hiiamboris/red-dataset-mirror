
#5200: Console cannot ellipsize the text properly and it wraps to the next line
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5200>

**Describe the bug**

GUI console:
![](https://i.gyazo.com/9dc143c2262c5f6fee1e861e2570cba6.png)
![](https://i.gyazo.com/75a3ccc164a12891d6870d6c3889cd03.png)

CLI console:
![](https://i.gyazo.com/d1558472c31835bab48cd29726923e46.png)
![](https://i.gyazo.com/e21a43c8d91501b19ced5ac1eb51683e.png)

**To reproduce**
```
"123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789"
```

**Expected behavior**

Ellipsis does not wrap

**Platform version**
```
Red 0.6.4 for Windows built 3-Sep-2022/17:53:01+03:00  commit #cb83eca
```



Comments:
--------------------------------------------------------------------------------

On 2022-09-04T13:08:55Z, hiiamboris, commented:
<https://github.com/red/red/issues/5200#issuecomment-1236337874>

    GUI one is also affected by the recent wrapping mode change as it seems.

