
#4270: [View] Window offset reports inconsistent values
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/4270>

**Describe the bug**

![](https://i.gyazo.com/32a4b5f2c2dbc10549b08adcba75729d.gif)

When window is just shown - window offset is set to the offset of *client* area
After offset changes - it is set to the offset of *non-client* area

`react` shows that offset changes 3 times during `show`:
```
none
718x410
718x410
720x432         ;) this value is inconsistent with the rest
```

**To reproduce**

`view [text react [face/text: form probe face/parent/offset]]`
1. Remember the original value
2. Move the window and return back - compare the value

Or with predefined offset:

`view/options [text react [face/text: form probe face/parent/offset]] [offset: 0x0]`

This variant has only 2 offset changes:
```
none
0x0
2x23      ;) inconsistent - this is the offset of client area
```

**Expected behavior**

Offset should at least be consistent. Although I strongly recommend to implement a way to measure non-client area size as well, otherwise I always have to resort to routines (and that's not portable).

**Platform version (please complete the following information)**
```
W7
Red 0.6.4 for Windows built 29-Jan-2020/15:29:32+03:00
```



