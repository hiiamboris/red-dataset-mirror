
#5499: Custom panel actors completely overwrite the actors object.
================================================================================
Issue is closed, was reported by luce80 and has 14 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5499>

**Describe the bug**
Custom panel actors completely overwrite the actors object.

**To reproduce**
```
system/view/VID/styles/test-panel: [
	default-actor: on-down
	template: [
		type: 'panel
		size: 200x200
		actors: [
			test-func: func [a b][]
		]
	]
	init: [
		?? actors
		actors/test-func 1 2
	]
]
view [test-panel [button "test"] on-created [print "created"]]
```

**Expected behavior**
Custom actor functions should overwrite ONLY an already existing function with the same name.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.5 ahead: 32 date: 16-Mar-2024/20:36:50 commit: #181d7faeab0381d7a86575847918a4ab05e68503 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22631 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2024-04-14T20:05:41Z, gurzgri, commented:
<https://github.com/red/red/issues/5499#issuecomment-2054170740>

    Sounds like we've been there before with issue #3392.

--------------------------------------------------------------------------------

On 2024-04-14T20:41:35Z, hiiamboris, commented:
<https://github.com/red/red/issues/5499#issuecomment-2054179019>

    with the only difference that that was an inline VID `style` and this is a template

--------------------------------------------------------------------------------

On 2024-04-15T18:28:02Z, luce80, commented:
<https://github.com/red/red/issues/5499#issuecomment-2057551827>

    A template of a `panel`. A template of something else works.

--------------------------------------------------------------------------------

On 2024-04-15T23:41:58Z, greggirwin, commented:
<https://github.com/red/red/issues/5499#issuecomment-2057991044>

    https://github.com/red/red/blob/master/modules/view/VID.red#L819

--------------------------------------------------------------------------------

On 2024-10-03T19:56:25Z, dockimbel, commented:
<https://github.com/red/red/issues/5499#issuecomment-2392218648>

    When I try to run the code above from the GUI console on Windows, I get:
    ```
    *** Script Error: cannot access test-func in path actors/test-func
    *** Where: either
    *** Near : actors/test-func 1 2
    *** Stack: view layout
    ```
    Is that the expected error or did something change since this ticket was opened?

--------------------------------------------------------------------------------

On 2024-10-03T20:18:36Z, hiiamboris, commented:
<https://github.com/red/red/issues/5499#issuecomment-2392257530>

    That's why the ticket was opened I believe.

--------------------------------------------------------------------------------

On 2024-10-04T15:08:47Z, dockimbel, commented:
<https://github.com/red/red/issues/5499#issuecomment-2393925859>

    Indeed, it's specific to containers. The issue is caused by late creation of the actors object for panels, while it is created earlier for other widgets.

