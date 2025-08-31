
#5286: Changing the last VID object using a style, changes all VID objects using the same style.
================================================================================
Issue is closed, was reported by mikeyaunish and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5286>

**Describe the bug**

Changing the last VID object using a style, changes all VID objects using the same style.


**To reproduce**

Run this:
```
view  [
    style custom-style: button font-size 15
    b2: custom-style "one"
    b3: custom-style "two" 
    b4: custom-style "three" font-size 10
]
```
All three buttons have had their font-size changed.

**Expected behavior**

Button 'one' and button 'two' should maintain their font-size as described in the style. The screenshot below shows the output - there seems to be some pixilation on button 'one' and 'two'  that shouldn't be there.

**Screenshots**

![style-reset-issue](https://user-images.githubusercontent.com/29316525/220480261-cf0cebb7-a497-4314-9466-98be9ae09eda.png)

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4647 date: 21-Feb-2023/21:51:41 commit: #adf44b8dba4a30c741d8b2bb65b8b60c23769d94 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19045 ]
--------------------------------------------
```


