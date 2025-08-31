
#5544: Mouse drags a base with image without hitting the face
================================================================================
Issue is open, was reported by GiuseppeChillemi and has 6 comment(s).
[type.bug] [status.reviewed]
<https://github.com/red/red/issues/5544>

**Describe the bug**
Hit the image button and KEEP IT PRESSED, the console will open. Move the mouse cursor down to the console and release the mouse button. Now go back to the gui and move the mouse OVER the button without pressing it. The cursor will capture the arrow and start dragging it around.

**To reproduce**
```
view [
	base 50x50 %../media/bbs.png loose [Print "Here is a BBS"]
]
```
**Attached**
%bbs.png
![BBS](https://github.com/user-attachments/assets/d10b883c-0542-4609-bb25-f2fcb436d446)

**Platform version**
RED: [ branch: "master" tag: #v0.6.5 ahead: 186 date: 6-Sep-2024/10:31:12 commit: #f5c9214f6b545dc7aa7a551ac57851f86f8fd5ec ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22631 ]


Comments:
--------------------------------------------------------------------------------

On 2024-10-04T13:46:39Z, gurzgri, commented:
<https://github.com/red/red/issues/5544#issuecomment-2393747279>

    Has nothing to do with the particular image or an image at all.
    
    To reproduce, save 
    ```
    Red [] view [base loose [print "click"]]
    ```
    as a file and then run it
    ```
    PS C:\Users\Christian Ensel> red-view .\bug.red
    ```
    
    Not 100% sure that it is to be considered a bug. If the window with the loose base face is a top-most window always in front (tried that using PowerTools' Always On Top Utility) or is a modal window (`view/options ... [flags: [modal]]`) and the view console opens behind it, then there is no such problem. And it might be Windows only.

--------------------------------------------------------------------------------

On 2024-10-05T03:41:57Z, qtxie, commented:
<https://github.com/red/red/issues/5544#issuecomment-2394908376>

    It's caused by the `mouse up` event send to the popup gui-console window instead of the base face. Related issue #5083, #4602.

--------------------------------------------------------------------------------

On 2024-10-05T07:46:11Z, qtxie, commented:
<https://github.com/red/red/issues/5544#issuecomment-2394968791>

    More complicated than I thought. The fixes for those issues are conflicting. 😓 

