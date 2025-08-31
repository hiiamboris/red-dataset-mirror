
#3446: area/selected and on-select not working
================================================================================
Issue is closed, was reported by llbook and has 4 comment(s).
<https://github.com/red/red/issues/3446>

### Expected behavior
when selecting text with the mouse, the on-select callback should be executed and "area/selected" should be updated, and when writing to "area/selected" the corresponding text should be selected on the display
### Actual behavior
while it is possible to select with the mouse and write and read to "area/selected", there is no connection to what is displayed or executed
### Steps to reproduce the problem
run the code below, then test selecting with mouse and test the buttons
### Red and platform version
Red for Windows version 0.6.3 built 14-Sep-2017/13:45:14+02:00
Windows 8.1
```
Run below code in Red Console and replace these 3 lines enclosed in ``` with the result:
  any [attempt[about/debug] about]
(add OS version if not in above command result)
```
Red[needs: 'view]
view [
	a: area "testing"
	on-change [print a/selected]
	button "view" [print a/selected]
	button "select" [a/selected: 3x5]
	do [a/selected: 3x6]
]




Comments:
--------------------------------------------------------------------------------

On 2018-06-25T17:07:41Z, 9214, commented:
<https://github.com/red/red/issues/3446#issuecomment-400025528>

    >  built 14-Sep-2017
    
    Please check your bug findings using the latest build, your example works perfectly fine with it. Also, you can always double-check yourself in [`/bugs`](https://gitter.im/red/bugs) or [`/help`](https://gitter.im/red/help) Gitter community chat rooms before filing an issue.

--------------------------------------------------------------------------------

On 2018-06-26T12:10:39Z, llbook, commented:
<https://github.com/red/red/issues/3446#issuecomment-400284348>

    Indeed, it works fine with the latest build. Thanks!

