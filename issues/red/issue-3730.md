
#3730: Can't change attributes of text in VID box
================================================================================
Issue is closed, was reported by dsunanda and has 8 comment(s).
[status.built] [status.tested] [type.bug] [status.reviewed] [GUI]
<https://github.com/red/red/issues/3730>

**Describe the bug**
 You can change attributes of text in VID TEXT boxes (eg font color and size). But it seems not possible to do so for any other VID style. 

**To reproduce**
```
view/no-wait [
    b: box "BOX" font-color blue font-size 10
    t: text "TEXT" font-color blue font-size 10
]
b/font/size:  t/font/size: 20
b/font/color: t/font/color: green
```

b/text remains as original. No amount of coaxing (with SHOW etc) helps.

**Expected behavior**
Change of attributes on screen

HiIamBoris comments: 
It works for base but doesn't work for box or any base with non zero alpha. Mention that it's the same for W7, W8 and W10.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 11-Jan-2019/2:18:27 commit #5e37a10
Also with 0.6.4 stable under Win10
```



Comments:
--------------------------------------------------------------------------------

On 2019-01-14T16:19:38Z, hiiamboris, commented:
<https://github.com/red/red/issues/3730#issuecomment-454064374>

    Snapshot:
    ![](https://i.gyazo.com/052b488a137c409efeb47eb6c0ba0855.png)

--------------------------------------------------------------------------------

On 2019-01-14T16:22:53Z, nedzadarek, commented:
<https://github.com/red/red/issues/3730#issuecomment-454065705>

    It doesn't work with the old version as well: `Red for Windows version 0.6.3 built 26-Mar-2018/1:14:22+02:00` on Win 8.1 64x

--------------------------------------------------------------------------------

On 2022-09-28T21:55:02Z, dockimbel, commented:
<https://github.com/red/red/issues/3730#issuecomment-1261504402>

    It works fine on latest commit.

--------------------------------------------------------------------------------

On 2022-09-28T22:07:45Z, hiiamboris, commented:
<https://github.com/red/red/issues/3730#issuecomment-1261513138>

    Is it though @dockimbel ?
    ![](https://i.gyazo.com/5242166ff0d48fab34b124fe55c4e930.png)
    `Red 0.6.4 for Windows built 25-Sep-2022/4:45:17+03:00  commit #499b279`
    same on latest-latest `Red 0.6.4 for Windows built 27-Sep-2022/21:44:14+03:00  commit #a0e6cf7`

