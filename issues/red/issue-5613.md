
#5613: Context not available after UNVIEW
================================================================================
Issue is closed, was reported by GiuseppeChillemi and has 6 comment(s).
[status.built] [status.tested] [GUI]
<https://github.com/red/red/issues/5613>

**Describe the bug**

Context not available when it should.

**To reproduce**
Run this code:
```
notes-group: [
	%test.txt
	%test2.txt
]

view-start-panel: func [
	notes-group2 [block!]
	/local start-panel list
][
	view [
		Text "Start panel"
		list: text-list data notes-group on-dbl-click [
			unview
			view-edit-schemes notes-group2	
		]
	]
]

view-edit-schemes: func [
	notes-group3 [block!]
	/local edit-schemes list
][
print "enter"
	View [
		Text "View-Edit-Schemes"

		Button "New" [
			append notes-group3 %test-new.txt
		]
	]
print "exit"
]

view-start-panel notes-group
```

Double click on an item of the list and then click NEW

A Context not available will appear. Remove "unview" and it will work

**Expected behavior**

Context should be available.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.6 ahead: 53 date: 9-May-2025/20:49:07 commit: #1f24c7686b622be8770cb4ee0ed4a9a183eba24a ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 26100 ]
--------------------------------------------
```

Tried older version upto february 2025 and pproblem was already there.




Comments:
--------------------------------------------------------------------------------

On 2025-05-12T13:15:31Z, dockimbel, commented:
<https://github.com/red/red/issues/5613#issuecomment-2872537703>

    @qtxie When running this code from the GUI console, the call to `unview` is causing the `view` call in the same event handler code to exit immediatly instead of blocking. Seems like the event loops internal counter is messed up by this code.

--------------------------------------------------------------------------------

On 2025-05-28T11:48:27Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5613#issuecomment-2916011954>

    Thank you for the fix
    

--------------------------------------------------------------------------------

On 2025-05-28T12:33:47Z, planetsizecpu, commented:
<https://github.com/red/red/issues/5613#issuecomment-2916144574>

    Now with `Red 0.6.6 for Windows built 28-May-2025/4:36:02+02:00  commit #8905efb`   `unview`  close the window, but the code flow blocks at this point, does not return to caller context, is this the correct behavior?

