
#3753: [View] CRASH in `set-focus` with field & area on W8+
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/3753>

**Describe the bug**

`Red [Needs: View] view [a: area on-created [set-focus a]]`
or
`Red [Needs: View] view [a: field on-created [set-focus a]]`

When:
- run from CLI console with View support, as `do %1.red`, or
- compiled as `red -r -e -d 1.red` & ran
- perhaps some other circumstances

On W8 and W10 results in:
```
*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/modules/view/backends/windows/gui.reds
*** at line: 143
***
*** stack: gui/get-node-facet 00000000h 0
*** stack: gui/get-facet 0050AD3Ch 0
*** stack: gui/process-command-event 003B003Ah 273 16777216 14484762
*** stack: gui/WndProc 003B003Ah 273 16777216 14484762
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 19-Jan-2019/17:04:42+03:00
```



Comments:
--------------------------------------------------------------------------------

On 2019-01-22T19:00:53Z, greggirwin, commented:
<https://github.com/red/red/issues/3753#issuecomment-456521287>

    Can't reproduce on Win10. What Win OS are you on?

--------------------------------------------------------------------------------

On 2019-01-22T19:39:06Z, hiiamboris, commented:
<https://github.com/red/red/issues/3753#issuecomment-456534701>

    Win7 (but no bug there). But this was discovered by @toomasv on W10. I tested it on W81 and there it crashes. Looks like everyone's W10 is different...
    
    Thanks for testing @greggirwin. I have updated the issue to reflect more specific details on how to reproduce the bug.

--------------------------------------------------------------------------------

On 2019-01-23T13:06:04Z, toomasv, commented:
<https://github.com/red/red/issues/3753#issuecomment-456794247>

    I confirm the above issue appears on my W10:
    Compiled:
    ```
    *** Runtime Error 1: access violation
    *** in file: /C/Users/Toomas/Documents/Red/modules/view/backends/windows/gui.reds
    *** at line: 143
    ***
    ***   stack: gui/get-node-facet 00000000h 0
    ***   stack: gui/get-facet 004F2314h 0
    ***   stack: gui/process-command-event 000E149Ch 273 16777216 7736260
    ***   stack: gui/WndProc 000E149Ch 273 16777216 7736260
    ```
    On cli:
    ```
    *** Runtime Error 1: access violation
    *** at: 004CB4FBh
    ```
    ```
    Red 0.6.4 for Windows built 5-Jan-2019/3:37:59+02:00 commit #1c0642e
    ```

--------------------------------------------------------------------------------

On 2019-01-26T23:57:53Z, endo64, commented:
<https://github.com/red/red/issues/3753#issuecomment-457876634>

    Confirmed on Win10. 
    This could be the reason `on-create actor which will be called when the face is shown for the first time, just before system resources are allocated for it.`

