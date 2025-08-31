
#4756: Trying to LOAD Redbin file created in previous session crashes Red
================================================================================
Issue is closed, was reported by rebolek and has 2 comment(s).
[status.built] [status.tested] [type.bug] [status.reviewed]
<https://github.com/red/red/issues/4756>

When I create a Redbin file, save it and load it back, everything works fine. However when I save the file, close Red, run it again and try to load it, Red crashes with `Runtime Error: Access violation`.

**To reproduce**

1. run Red
2. make some testing Redbin. I used this:
```
save/as %test #(%ab/cd #(url: http://example.org date: 1-2-1934/5:6:7)) 'redbin
```
3. quit Red session and run Red again
4. `load/as %test 'redbin` -> crash

**Expected behavior**

Redbin file would be loaded


**Platform version**

```
Red 0.6.4 for macOS built 10-Dec-2020/16:04:06
```



Comments:
--------------------------------------------------------------------------------

On 2020-12-10T17:42:03Z, dockimbel, commented:
<https://github.com/red/red/issues/4756#issuecomment-742679437>

    I can reproduce the crash.

