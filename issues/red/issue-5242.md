
#5242: Text in field is not centered, with default values for face size and text font size, W11
================================================================================
Issue is open, was reported by meijeru and has 8 comment(s).
[status.built] [status.tested] [type.review] [GUI]
<https://github.com/red/red/issues/5242>

Instead, with default values for face size and text font size, the text seems aligned towards the top. Example: `view [field "abcd"]` gives
![Screenshot_20221122_170607](https://user-images.githubusercontent.com/743227/203365129-46d43f98-654f-4c7a-b7f9-cbe563a3d438.png)



Comments:
--------------------------------------------------------------------------------

On 2022-11-22T16:38:52Z, hiiamboris, commented:
<https://github.com/red/red/issues/5242#issuecomment-1323956041>

    You should have used the bug report template. Anyway, what's your scaling setting?

--------------------------------------------------------------------------------

On 2022-11-22T17:33:18Z, meijeru, commented:
<https://github.com/red/red/issues/5242#issuecomment-1324024095>

    Scaling is 200%.

--------------------------------------------------------------------------------

On 2022-11-23T03:51:14Z, qtxie, commented:
<https://github.com/red/red/issues/5242#issuecomment-1324514996>

    Fixed in commit https://github.com/red/red/commit/ee723a91c5007c4338b8252956063dcd668cf012.

--------------------------------------------------------------------------------

On 2022-11-24T02:44:17Z, qtxie, commented:
<https://github.com/red/red/issues/5242#issuecomment-1325876848>

    The root issue is that no vertical alignment for the native `field` control on Windows. It may looks bad with a custom font. As a workaround, define your custom style if you want to use a custom font.

