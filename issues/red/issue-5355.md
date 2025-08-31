
#5355: [VID] Bugged automatic window centering
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/5355>

**Describe the bug**

Here I'm creating windows with increasing height (in steps of 100 from 500 to 1000):
<img width=400 src=https://i.gyazo.com/416053681538bd8b3d814d80dfa4911f.png />
<img width=400 src=https://i.gyazo.com/59c5b6082d9ba5dd4a063b644a6744b7.png />
<img width=400 src=https://i.gyazo.com/105fdd00825c432ffe73f8c3b1c424e5.png />
<img width=400 src=https://i.gyazo.com/240b26f05725a5362190b22ab4310163.png />
<img width=400 src=https://i.gyazo.com/7c0ebe49067cc10b588aa5c6e24097e2.png />
<img width=400 src=https://i.gyazo.com/ca6000ba5e644d6176316377df5053e3.png />
Then with 2000 height:
<img width=400 src=https://i.gyazo.com/dcd5f01e990ba2ece421c7f8d3af36fc.jpg />
After 2200 window just becomes invisible.

I can see a whole bunch of bugs:
1. Window is never centered, because it doesn't subtract taskbar size from screen size, and because it doesn't account for own title height
2. Window soon gets clipped by the taskbar, even though there's free space above it
3. After occupying screen/size offset goes totally awry and eventually hides the window

**To reproduce**

`view [base 10000x5000 react [face/parent/text: form face/size]]`

**Expected behavior**

1. Taskbar should be subtracted from screen/size for centering purposes. `SPI_GETWORKAREA` is one useful metric on Windows.
2. Title bar should be added to total window height for centering purposes.
3. Once window becomes bigger than the screen, title bar should never be obscured.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4805 date: 18-Jul-2023/19:56:01 commit: #af3d35a2f444b3d02058226effd63714eb4bf2bc ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-08-22T07:22:38Z, qtxie, commented:
<https://github.com/red/red/issues/5355#issuecomment-1687618113>

    > Window is never centered, because it doesn't subtract taskbar size from screen size, and because it doesn't account for own title height
    
    The issue is that `center-face` function doesn't know those information (taskbar size and window title height).

