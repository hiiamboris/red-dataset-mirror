
#4417: Window is deactivated after opening and closing a modal popup 
================================================================================
Issue is closed, was reported by ralfwenske and has 6 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4417>

Opening a modal popup view and unview-ing it leaves the main window deactivated.
According to @toomasv behaviour on Windows is as expected.

**To reproduce**
```
Red []

do-quit: does [
    res: false
    view/flags  [
        text "Quit?" return 
        button "OK" [res: true unview] 
        button "Cancel" [res: false unview ]
    ][modal popup]
    res
]

view  [
    title "Test"
    size 400x400
    b: button "Quit" [if do-quit [unview] ]
]
```
Steps to reproduce the behavior:
1. Click on 'Quit' button
2. In popup click on 'Cancel'

**Expected behavior**
The main window should be active

**Platform version (please complete the following information)**
```
Red 0.6.4 for macOS built 17-Apr-2020/13:50:14+10:00 commit #ca0a2d5.
```



Comments:
--------------------------------------------------------------------------------

On 2020-04-28T07:09:30Z, toomasv, commented:
<https://github.com/red/red/issues/4417#issuecomment-620423680>

    On Windows it works as expected, if focus is set to some of main window's faces after unviewing the popup. 

--------------------------------------------------------------------------------

On 2020-04-28T10:11:52Z, hiiamboris, commented:
<https://github.com/red/red/issues/4417#issuecomment-620512123>

    https://github.com/red/red/issues/3942 there was the same issue on Windows backend

--------------------------------------------------------------------------------

On 2020-04-28T10:37:35Z, meijeru, commented:
<https://github.com/red/red/issues/4417#issuecomment-620525750>

    @toomasv Your solution is effective, but one has to stress it is one of the main window's (sub-)faces that has to receive the focus, not the main window itself -- that does NOT work. I don't think that the team's solution to #3942 did actually work.

