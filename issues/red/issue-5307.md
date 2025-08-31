
#5307: [View] Calendar doesn't focus itself on clicks
================================================================================
Issue is closed, was reported by hiiamboris and has 10 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5307>

**Describe the bug**

`view [field calendar]` after clicking focus stays in the field:
![](https://i.gyazo.com/ce40aac8a2c95cf62bdf5b18af40450b.gif)

`view [field calendar focus]` handles key events when focused manually:
![](https://i.gyazo.com/e2c2936f8e2d3b0782a353bbdff47d91.gif)

Bug is Windows-specific

**Expected behavior**

`calendar` gets focus on click

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4667 date: 9-Apr-2023/3:24:34 commit: #d36108eeffeafbf14839b5a9cadc9a0acd87f34a ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-04-30T08:38:17Z, qtxie, commented:
<https://github.com/red/red/issues/5307#issuecomment-1528971099>

    > Calendar doesn't focus itself on clicks
    
    This is the default behavior on Windows. Need to be handled manually.

--------------------------------------------------------------------------------

On 2023-05-02T22:55:10Z, hiiamboris, commented:
<https://github.com/red/red/issues/5307#issuecomment-1532253325>

    > the default behavior on Windows
    
    @qtxie is this documented on MSDN somewhere?

--------------------------------------------------------------------------------

On 2023-05-03T02:47:51Z, qtxie, commented:
<https://github.com/red/red/issues/5307#issuecomment-1532395874>

    @hiiamboris I checked some GUI frameworks, they subclass the control and handle the CLICK manually. I don't find any docs about it. I guess MS don't care. Nowadays you can rarely find an APP which use this native calendar control. 

--------------------------------------------------------------------------------

On 2023-05-03T14:17:21Z, hiiamboris, commented:
<https://github.com/red/red/issues/5307#issuecomment-1533110176>

    I still think if it accepts keyboard focus it should focus itself on clicks, just for consistency across widgets and platforms. Though it's of low importance indeed.

--------------------------------------------------------------------------------

On 2023-05-04T03:40:55Z, qtxie, commented:
<https://github.com/red/red/issues/5307#issuecomment-1534053296>

    @hiiamboris Sorry. I mean the GUI frameworks handle it manually, not the users. This issue is fixed in Red View.

