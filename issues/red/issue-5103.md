
#5103: Reactions within a generated pane don't activate
================================================================================
Issue is closed, was reported by mikeyaunish and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5103>

**Describe the bug**
The following codes' reaction does not work. 
Worked fine in: 

Red 0.6.3 for Windows built 24-May-2018/7:28:58-06:00 commit #ba9cabe

**To reproduce**
Steps to reproduce the behavior:
1. Run this code 
```
view [
    output: panel 200x200 gray
    button "load layout" [
        output/pane: layout/only load {			
            b1: button "move me" loose
            f1: field react [ f1/text: to-string b1/offset ] 
        }
    ]
]
```
2. Click on "load layout" button
3. Drag the "move me" button around
4. Notice no change in the fields' text

**Expected behavior**
The fields text should  update to reflect the buttons offset as the button is dragged around.

**Platform version**
```
Red 0.6.4 for Windows built 14-Jan-2022/11:43:17-06:00  commit #92feb0c```



