
#5297: Drop-down data being corrupted after 'selected set
================================================================================
Issue is closed, was reported by mikeyaunish and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5297>

**Describe the bug**
The data in a drop-down widget is corrupted when the 'selected facet is used.

**To reproduce**
Steps to reproduce the behavior:
1. Click on drop-down to see the data
2. Click on "Select Drop Down"
3. Click on drop-down to see changed data
```
view [
    my-drop-down: drop-down data  [ "A" "B" "C" "D"]
        on-change [
            print [ "face/data =(" mold face/data ")"]
        ]
    button "Select Drop Down" on-click [my-drop-down/selected: 3]
]
```
**Expected behavior**
Data in a drop-down widget should not change by using 'selected on the drop down.


**Platform version**
RED: [ branch: "master" tag: #v0.6.4 ahead: 4655 date: 16-Mar-2023/16:01:30 commit: #1b62437c6143ebc35613e989fd7816f541b0b2bd ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19045 ]



