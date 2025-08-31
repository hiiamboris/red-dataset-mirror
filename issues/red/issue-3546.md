
#3546: Ghost button visible when a check  face has focus in Windows
================================================================================
Issue is closed, was reported by PeterWAWood and has 8 comment(s).
[GUI]
<https://github.com/red/red/issues/3546>

### Expected behavior
There should be no visible ghost button when a check face has focus.
### Actual behavior
Windows 7:
<img width="546" alt="windows 7" src="https://user-images.githubusercontent.com/697434/46122369-d911f000-c24a-11e8-9b27-0ed80e274eb9.png">

Windows 10:
<img width="556" alt="windows 10" src="https://user-images.githubusercontent.com/697434/46122376-e4fdb200-c24a-11e8-85e2-9ff0858314b5.png">

Clicking on the ghost button alters the state of the check face.
### Steps to reproduce the problem
Enter the following expression in a Windows GUI console:
``` view [ check focus check ]

### Red and platform version
```
commit 47c6fed063e376a06d6e5ba85889c48b3c5c3434 (HEAD -> master, upstream/master)
Date:   Thu Sep 27 03:44:03 2018 +0800

Windows 7
Windows 10
```


Comments:
--------------------------------------------------------------------------------

On 2018-09-27T18:16:12Z, qtxie, commented:
<https://github.com/red/red/issues/3546#issuecomment-425192644>

    That's caused by the default size of the checkbox in VID. Setting the width of the checkbox to a small value will fix it.
    ```
     view [check 15 focus check 15]
    ```

--------------------------------------------------------------------------------

On 2018-09-28T22:30:30Z, greggirwin, commented:
<https://github.com/red/red/issues/3546#issuecomment-425583816>

    Peter, I can't see any way around that, for native controls.

--------------------------------------------------------------------------------

On 2018-09-29T08:05:07Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3546#issuecomment-425625917>

    I don't see the visible artefact with libUI, a native control library. 

--------------------------------------------------------------------------------

On 2018-10-01T04:45:32Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3546#issuecomment-425788175>

    I now see the artefact with a different libUI layout in Windows 10. It took me longtime to see it as it hard to imagine such poor native UI quality.

