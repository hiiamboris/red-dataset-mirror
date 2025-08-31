
#3057: Windows opened with view/no-wait do not respond to unview on macOS
================================================================================
Issue is closed, was reported by PeterWAWood and has 6 comment(s).
[type.bug] [status.resolved] [GUI]
<https://github.com/red/red/issues/3057>

On macOS, Windows opened with view/no-wait do not respond to unview or to mouse-clicks on the window minimise and close buttons.
<img width="756" alt="unview issue" src="https://user-images.githubusercontent.com/697434/30842401-bc370530-a2b4-11e7-9a53-52c2a02748f3.png">



Comments:
--------------------------------------------------------------------------------

On 2017-09-26T06:19:08Z, qtxie, commented:
<https://github.com/red/red/issues/3057#issuecomment-332097690>

    It caused by no event loop is running. The same behaviour on Windows when using CLI console. 

--------------------------------------------------------------------------------

On 2018-04-25T08:32:18Z, qtxie, commented:
<https://github.com/red/red/issues/3057#issuecomment-384205554>

    Works on GUI console.

--------------------------------------------------------------------------------

On 2019-09-05T17:00:05Z, qtxie, commented:
<https://github.com/red/red/issues/3057#issuecomment-528461934>

    `unview` works fine on macOS 10.14 on both CLI console and GUI console.

