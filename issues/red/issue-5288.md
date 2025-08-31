
#5288: Tab panel imagery remains after panel contents have changed
================================================================================
Issue is closed, was reported by mikeyaunish and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5288>

**Describe the bug**
using VID, Tab panel imagery remains after panel contents have changed

**To reproduce**
Steps to reproduce the behavior:
1. Run this code:
```
view [
    output-panel: panel 200x200 gray [
        tab-panel1: tab-panel 
            "tab-panel1" [
                "Tab-A" [tab-a-btn1: button "tab-A-btn1"] 
                "Tab-B" [tab-b-btn1: button "tab-B-btn1"]
            ]    
    ]
    button "new panel" [
        output-panel/pane: layout/only [
            button "Panel 2 button" 
        ]
    ]
]
```

3. Click on 'Panel 2' button
4. Notice that the previous tab panel imagery remains visible.

**Expected behavior**
When a new panel displays the previous imagery of the tab panel should not
be visible.

**Screenshots**

![tab-panel-remains](https://user-images.githubusercontent.com/29316525/221602699-b7e62f2c-a1fc-4d9f-b0be-b2eb346faabd.gif)

**Platform version**

RED: [ branch: "master" tag: #v0.6.4 ahead: 4648 date: 22-Feb-2023/4:28:04 commit: #8bac102834adef06a368d96d246676908e1b0ea2 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19045 ]




Comments:
--------------------------------------------------------------------------------

On 2023-02-27T15:32:36Z, hiiamboris, commented:
<https://github.com/red/red/issues/5288#issuecomment-1446547447>

    https://github.com/red/red/issues/5275 https://github.com/red/red/issues/5255 https://github.com/red/red/issues/5252 other tab-panel bugs

