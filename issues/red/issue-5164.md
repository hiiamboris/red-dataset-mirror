
#5164: [D2D, Draw] `text` ignores pen alpha channel, inherits image alpha channel
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [GUI]
<https://github.com/red/red/issues/5164>

**Describe the bug**

Try this in console:
`? (draw make image! reduce [50x50 glass] [pen red text 0x0 "ABCD" box 10x10 40x40 circle 25x25 20])`

Output:
![](https://i.gyazo.com/7b52772db3025da4b75ca1405b0797b1.png)

**Expected behavior**

Text should be visible.
On GTK it's visible, but suffers from https://github.com/red/red/issues/4901
On W10 - no text.

**Platform version**
```
Red 0.6.4 for Windows built 27-Jun-2022/11:51:28+03:00  commit #ed73e33
```



Comments:
--------------------------------------------------------------------------------

On 2022-07-17T16:45:03Z, hiiamboris, commented:
<https://github.com/red/red/issues/5164#issuecomment-1186564867>

    tags: GUI Draw View

