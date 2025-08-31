
#5492: GROUP-BOX frame is not always conforming to its size.
================================================================================
Issue is closed, was reported by luce80 and has 6 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5492>

**Describe the bug**
`group-box` frame is not reacting to size changes.

**To reproduce**
```
win: layout [
	gb: group-box "test" [
		button "Hi"
	]
]
react compose [gb/size: win/size - (win/size - gb/size)]
view/flags win 'resize
```

**Expected behavior**
`group-box` frame should always "conform" to its size.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.5 ahead: 22 date: 17-Feb-2024/7:32:56 commit: #58b8f8937178a1748df17841d0d8efdd169b7c50 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22631 ]
--------------------------------------------```



Comments:
--------------------------------------------------------------------------------

On 2024-02-28T20:34:56Z, dockimbel, commented:
<https://github.com/red/red/issues/5492#issuecomment-1969872842>

    > gb/size: win/size - (win/size - gb/size)
    
    That is equivalent to `gb/size: gb/size`. ;-)
    
    I suggest changing the test code to:
    
    ```
    win: layout [
    	gb: group-box "test" [
    		button "Hi"
    	]
    ]
    react compose [gb/size: win/size - (2 * gb/offset)]
    view/flags win 'resize
    ```
    which effectively changes the group-box size and still demonstrates the issue.

--------------------------------------------------------------------------------

On 2024-02-28T20:47:10Z, hiiamboris, commented:
<https://github.com/red/red/issues/5492#issuecomment-1969891440>

    Note it's composed :)

--------------------------------------------------------------------------------

On 2024-02-28T20:47:49Z, dockimbel, commented:
<https://github.com/red/red/issues/5492#issuecomment-1969892223>

    Sorry, missed that.

