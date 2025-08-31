
#4481: [Draw] Line stops after 1000 coordinates
================================================================================
Issue is closed, was reported by hiiamboris and has 10 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4481>

**Describe the bug**

![](https://i.gyazo.com/2ab3c7262beb404c6ea2dfdd83048ca8.gif)

**To reproduce**
```
Red [needs: view]

line: [line]
view/no-wait [
    base purple yello 200x200 "MOVE POINTER AROUND"
    all-over on-over [append line event/offset]
    draw compose/only [pen gold (line)]
    return text 100 rate 10 on-time [face/data: length? line]
]
```

Or more automatic:
```
Red [needs: view]

line: [line 0x0]
repeat i 4200 [append line as-pair i % 21 * 10  i / 21]
view/no-wait [base 200x200 purple draw compose/only [pen gold (line)]]
```

Same bug for `shape [line ...]`, but `shape [curve ...]` and `curv` are okay.

**Expected behavior**

Should continue rendering after 1000th coordinate.
Second snippet should produce a fully yellow square.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 28-May-2020/17:51:04+03:00 commit #36857eb
```



Comments:
--------------------------------------------------------------------------------

On 2020-05-31T07:06:54Z, qtxie, commented:
<https://github.com/red/red/issues/4481#issuecomment-636432437>

    Known limitation in the GDI+ implementation. Should not be hard to fix it.

--------------------------------------------------------------------------------

On 2020-06-01T06:26:05Z, qtxie, commented:
<https://github.com/red/red/issues/4481#issuecomment-636637750>

    The second snippet is not fully yellow on Windows. Seem GDI+ doesn't handle this pattern correctly.
    ```
    view [base 200x200 purple draw [pen gold line 0x0 200x0 0x1 200x1 0x2 200x2]]
    ```

--------------------------------------------------------------------------------

On 2020-06-01T07:22:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/4481#issuecomment-636660930>

    Yeah some antialiasing problem I think. Unlikely we'll be able to fix that. And it doesn't matter much.

--------------------------------------------------------------------------------

On 2020-06-01T11:06:01Z, rebolek, commented:
<https://github.com/red/red/issues/4481#issuecomment-636788891>

    I believe I reported it already, but can't find the issue right now, maybe I did it just in chat. I remember it was fine on Linux.

--------------------------------------------------------------------------------

On 2020-06-01T11:18:41Z, hiiamboris, commented:
<https://github.com/red/red/issues/4481#issuecomment-636795630>

    @qtxie it disappears if I remove DPI dependency:
    ```
    view [base 200x200 purple draw [scale 0.8 0.8 pen gold line 0x0 200x0 0x1 200x1 0x2 200x2 0x3 200x3 0x4 200x4 0x5 200x5]]
    ```
    This is why I used `scale 0.8`:
    ```
    >> system/view/metrics/dpi
    == 120
    ```

