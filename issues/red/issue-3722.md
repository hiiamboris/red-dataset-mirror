
#3722: [View] `event/window` returns a wrong face under very specific circumstances
================================================================================
Issue is closed, was reported by hiiamboris and has 10 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/3722>

**Describe the bug**

`event/window` is supposed to return a window face, but sometimes it returns the very face provided to the event actor.

**To reproduce**

Try this:
```
system/view/VID/styles/bomb: [
	template: [
		type: 'base		size: 50x50
		actors: [on-created: func [f] [f/color: random white]]
	]
]

view [ bomb on-down [? event/window/type] ]
```

Click on the base, and it outputs:
```
EVENT/WINDOW/TYPE is a word! value: base
```

**Expected behavior**
`EVENT/WINDOW/TYPE is a word! value: window`

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 9-Jan-2019/5:46:16+03:00 commit #acf3492
W7 x64
```



Comments:
--------------------------------------------------------------------------------

On 2019-01-13T00:09:04Z, endo64, commented:
<https://github.com/red/red/issues/3722#issuecomment-453791040>

    Confirmed on Win10.

--------------------------------------------------------------------------------

On 2020-03-05T19:30:41Z, hiiamboris, commented:
<https://github.com/red/red/issues/3722#issuecomment-595405655>

    Smaller snippet: `view [base #FF007001 on-down [? event/window/type]]`
    The key here is to have non-zero alpha in base's initial color. 

--------------------------------------------------------------------------------

On 2020-05-20T07:40:54Z, qtxie, commented:
<https://github.com/red/red/issues/3722#issuecomment-631297647>

    Seems fixed in the version red-20may20-053dece4c.

--------------------------------------------------------------------------------

On 2020-05-20T08:50:13Z, hiiamboris, commented:
<https://github.com/red/red/issues/3722#issuecomment-631336167>

    @qtxie 
    ![](https://i.gyazo.com/01df43a996965eab2076e1f8a9ce4cc2.png)
    W7

--------------------------------------------------------------------------------

On 2020-05-20T13:26:02Z, qtxie, commented:
<https://github.com/red/red/issues/3722#issuecomment-631472319>

    OK. Another layered window issue.

