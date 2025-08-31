
#3725: [View] `draw [text ...]` on layered base face applies DPI-factor twice
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/3725>

**Describe the bug**

1) See the title.
2) It also uses the default font, regardless of what's specified for the face.
3) It also doesn't care about system default text color (although this may be by design)

**To reproduce**

## 1 & 3
```
font: make font! [name: system/view/fonts/fixed size: 20]
view [backdrop white
	base "ABC" white left top font font draw [font font text 0x0 "ABC"]
	box  "ABC"       left top font font draw [font font text 0x0 "ABC"]
]
```
![](https://i.gyazo.com/4f8b747879a3035d1a7daee5c76a5eda.png)

## 2
```
font: make font! [name: system/view/fonts/fixed size: 20]
view [backdrop white
	base "ABC" white left top font font draw [text 0x0 "ABC"]
	box  "ABC"       left top font font draw [text 0x0 "ABC"]
]
```
![](https://i.gyazo.com/f325b0925d682b57c4653c31f274321c.png)


**Expected behavior**

Displayed text size should be equal for all 4 strings.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 9-Jan-2019/5:46:16+03:00 commit #acf3492
```



Comments:
--------------------------------------------------------------------------------

On 2019-01-14T12:15:32Z, qtxie, commented:
<https://github.com/red/red/issues/3725#issuecomment-453985418>

    The text was scaled by the OS already. We scale the DC in draw which cause the problem.

--------------------------------------------------------------------------------

On 2020-03-04T16:20:33Z, hiiamboris, commented:
<https://github.com/red/red/issues/3725#issuecomment-594640056>

    Results are as expected on `Red 0.6.4 for Windows built 27-Feb-2020/6:07:00+03:00 commit #bf15211`
    ![](https://i.gyazo.com/155c8a3002c8da744398bf9fbf25498b.png)
    ![](https://i.gyazo.com/4e170649bbbac78f1aa1973d78def4f4.png)
    On second picture `draw` does not apply the face's font, by design.

