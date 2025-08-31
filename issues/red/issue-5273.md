
#5273: [Reactivity] causes missing argument error in on-deep-change on orphaned faces
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/5273>

**Describe the bug**

The following code adds a button to panel, and adds a reaction:
```
Red [needs: view]

i: 0
view [
    p: panel green []
    rate 2 on-time [
	    append clear p/pane layout/only compose [b: button (form i: i + 1)]
	    react/link func [p b] [[p/size]] [p b]
		p/size: p/size + 1
    ]
]
```
It also clears the pane so old reactions must be removed. 
But it seems that they (1) are not being removed and (2) start producing errors beginning with 2nd iteration:
```
*** Script Error: func [p b][[p/size]] is missing its b argument
*** Where: try
*** Near : func [p b][[p/size]] make object! [type: 'panel ]
*** Stack: view do-events do-actor do-safe error? check
*** Near: [func [p b][[p/size]] make object! [type: 'panel offset: 10x10 size: 205x205 tex
*** Script Error: func [p b][[p/size]] is missing its b argument
*** Where: try
*** Near : func [p b][[p/size]] make object! [type: 'panel ]
*** Stack: view do-events do-actor do-safe error? check
*** Near: [func [p b][[p/size]] make object! [type: 'panel offset: 10x10 size: 205x205 tex
*** Script Error: func [p b][[p/size]] is missing its b argument
*** Where: try
```

**Expected behavior**

1. No runtime errors
2. As View calls `stop-reactor` on removed faces, reactions should also be deactivated

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4623 date: 29-Dec-2022/20:00:14 commit: #6af0b708408aeab6ca70dcdf7522d03278b7586e ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


