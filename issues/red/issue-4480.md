
#4480: [View] Draw block cannot be shared!
================================================================================
Issue is closed, was reported by hiiamboris and has 14 comment(s).
<https://github.com/red/red/issues/4480>

**Describe the bug**

In the third row draw block is shared, and should be drawn on both left and right bases!
![](https://i.gyazo.com/01d9514dd263e67ab18485175ed1cd15.gif)

**To reproduce**
```
Red [needs: view]

line1: [line]
line2: [line]
line3: [line]
view/no-wait [
    base purple yello 200x100 "MOVE POINTER OVER HERE"
    all-over on-over [append line1 event/offset]
    base cyan   brown 200x100 "curve should ONLY be here"
    draw compose/only [pen blue (line1)]

    return
    base purple yello 200x100 "MOVE POINTER OVER HERE"
    all-over on-over [append line2 event/offset]
    draw compose/only [pen gold (line2)]
    base cyan   brown 200x100 "curve should NOT be here"

    return
    base purple yello 200x100 "MOVE POINTER OVER HERE"
    all-over on-over [append line3 event/offset]
    draw compose/only [pen gold (line3)]
    base cyan   brown 200x100 "curves should MIRROR each other"
    draw compose/only [pen blue (line3)]
]
```

**Expected behavior**

Same curves in both bases of the lower row.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 28-May-2020/17:51:04+03:00 commit #36857eb
```



Comments:
--------------------------------------------------------------------------------

On 2020-05-31T06:53:03Z, qtxie, commented:
<https://github.com/red/red/issues/4480#issuecomment-636431331>

    This is expected. According to the current ownership system, each series has only one owner. 
    https://www.red-lang.org/search/label/ownership
    

--------------------------------------------------------------------------------

On 2020-05-31T07:31:56Z, hiiamboris, commented:
<https://github.com/red/red/issues/4480#issuecomment-636434526>

    Hm. Right.
    ```
        a: base purple yello 200x100 "MOVE POINTER OVER HERE"
        all-over on-over [append line3 event/offset a/draw: a/draw b/draw: b/draw]
        draw compose/only [pen gold (line3)]
        b: base cyan   brown 200x100 "curves should MIRROR each other"
        draw compose/only [pen blue (line3)]
    ```
    This seems to fix it. But why do I have to reassign both draw blocks, not just the one not-owned?

--------------------------------------------------------------------------------

On 2020-06-03T06:52:04Z, qtxie, commented:
<https://github.com/red/red/issues/4480#issuecomment-637995806>

    `a/draw: a/draw b/draw: b/draw`, this is triggering `on-change*` event and then face `b` owns the draw block.

--------------------------------------------------------------------------------

On 2020-06-03T07:52:59Z, hiiamboris, commented:
<https://github.com/red/red/issues/4480#issuecomment-638026914>

    Aha. Got it. Closing then.

--------------------------------------------------------------------------------

On 2020-06-03T16:39:57Z, greggirwin, commented:
<https://github.com/red/red/issues/4480#issuecomment-638315243>

    We should add a note to Draw docs about this. We don't have a wiki page for object ownership either, but one for general Object notes.

--------------------------------------------------------------------------------

On 2020-06-03T18:46:21Z, hiiamboris, commented:
<https://github.com/red/red/issues/4480#issuecomment-638390368>

    Good idea. Updated https://github.com/red/red/wiki/%5BDOC%5D-Object-Notes

--------------------------------------------------------------------------------

On 2020-06-03T21:48:55Z, greggirwin, commented:
<https://github.com/red/red/issues/4480#issuecomment-638479674>

    Thanks!

