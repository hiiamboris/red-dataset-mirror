
#5442: [View, Regression] Grid panel is broken by point2D size
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5442>

**Describe the bug**

This code fails now with an error when it receives floating point width from 1st row:
```
view [
	panel 2 [
		text "text must be longer than 80px" field
		text field
	]
]
```
```
*** Script Error: float! type is not allowed here
*** Where: either
*** Near : face/offset/:axis: list/:index/offset/:axis
*** Stack: dorc view layout fetch-options layout  
```

**Expected behavior**

No error.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 5060 date: 22-Nov-2023/14:24:25 commit: #34f26dff0dfc467b9df7862f59c5220c5f508110 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-12-27T15:18:05Z, hiiamboris, commented:
<https://github.com/red/red/issues/5442#issuecomment-1870398845>

    @qtxie I don't think you've committed it to master.

