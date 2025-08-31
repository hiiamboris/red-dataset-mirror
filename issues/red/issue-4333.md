
#4333: [VID] FIELD should be able to derive it's size from the font alone
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[GUI]
<https://github.com/red/red/issues/4333>

:point_up: [March 12, 2020 10:54 PM](https://gitter.im/red/bugs?at=5e6a938ed243a0017407a20c)

**Describe the bug**

Consider this example:
`view [field field font-size 30 field font-size 30 "x"]`
![](https://user-content.gitter-static.net/c3527cee49e39ef850745ae7a00d8302dcd20644/68747470733a2f2f692e6779617a6f2e636f6d2f64323636653163326365386330623637623661333234396563633038613032342e706e67)

Second field has big font selected, which won't fit in when user starts typing:
![](https://i.gyazo.com/e40241319c12e8809a890486d0ef21b0.png)

Note: assigning empty text `field font-size 30 ""` doesn't work either.

**Expected behavior**

Second field should have the same height as the third.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 10-Mar-2020/16:22:26+03:00
```



Comments:
--------------------------------------------------------------------------------

On 2020-07-02T19:05:13Z, hiiamboris, commented:
<https://github.com/red/red/issues/4333#issuecomment-653174404>

    Curiously, current build infers height correctly from font with `text = none` but not with `text = ""`:
    `view [field` `field font-size 30` `field font-size 30 ""` `field font-size 30 "x"]`
    ![](https://i.gyazo.com/e8e1b23f58d076ed684982f07c39c1c4.png)

--------------------------------------------------------------------------------

On 2023-08-07T09:50:10Z, hiiamboris, commented:
<https://github.com/red/red/issues/4333#issuecomment-1667547885>

    `text` has the same issue:
    ```
    view [t: text "" font [size: 20] on-created [t/text: "TEST"]]
    ```
    ![](https://i.gyazo.com/38478ab2c0bb3ea698d25d19c7a68dc7.png)

