
#4622: error compiling GUI console on Windows XP
================================================================================
Issue is closed, was reported by WiseGenius and has 0 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/4622>

**Describe the bug**

The latest automated builds (see later below) run on Windows 10, but not on Windows XP:

```
Compiling Red GUI console...
*** Compilation Error: type mismatch on setting path: exec/terminal/wcex/lpfnWndProc
*** expected: [function! [
        [stdcall]
        hWnd [pointer! [integer!]]
        msg [integer!]
        wParam [integer!]
        lParam [integer!]
        return: [integer!]
    ]]
***    found: [function! [hWnd [pointer! [integer!]] msg [integer!] wParam [integer!] lParam [integer!] return: [integer!]]]
*** in file: %/H/Documents%20and%20Settings/All%20Users/Application%20Data/Red/GUI/old/windows.reds
*** at line: 617
*** near: [
    wcex/cbClsExtra: 0
    wcex/cbWndExtra: wc-extra
    wcex/hInstance: hInstance
    wcex/hIcon: null
]
```

**To reproduce**
Steps to reproduce the behavior:
1. Execute the automated build on Windows XP.

**Expected behavior**
Success, as before the regression.

**Platform versions**
As obtained from `about` after using `--cli`:
Red 0.6.4 for Windows built 13-Aug-2020/3:09:16+10:00 commit #b1a0417

These are the latest automated builds I had available to test (sorry for the 6-month gap):

Regression applies to:
* red-12aug20-b1a041709.exe
* red-06aug20-3d5490f23.exe
* red-23apr20-58093a5bc.exe
* red-16nov19-88b3ff08.exe

Works correctly for:
* red-14may19-fa2e9797.exe


