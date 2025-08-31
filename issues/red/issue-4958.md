
#4958: The header in Red scripts is inaccessible
================================================================================
Issue is closed, was reported by RaycatWhoDat and has 6 comment(s).
[status.built] [status.tested] [type.task.wish]
<https://github.com/red/red/issues/4958>

**Describe the bug**
Currently, there isn't a simple way to access the header of a Red script. The REBOL approach implies that it should be accessible via `system/script/header` but that is currently a `none` value in Red (since the code hasn't been implemented).

**To reproduce**
Steps to reproduce the behavior:
```red
; reproduction.red
Red [
  Title: "Repro Test"
]

?? system/script/header
```
```red
system/script/header: none
```

**Expected behavior**
`system/script/header` should return an OBJECT! with the header's words inside.

**Platform version**
Red 0.6.4 for Linux built 2-Sep-2021/7:40:47-05:00  commit #579b9d3


Comments:
--------------------------------------------------------------------------------

On 2021-09-07T12:47:26Z, dockimbel, commented:
<https://github.com/red/red/issues/4958#issuecomment-914277217>

    I will try to make a quick implementation for that feature today.

--------------------------------------------------------------------------------

On 2021-09-07T14:04:53Z, hiiamboris, commented:
<https://github.com/red/red/issues/4958#issuecomment-914335223>

    My thoughts:
    
    > > On that same note, should system/script/header contain the header of the script that was originally called? Or the header of the currently-visited script?
    > 
    > Great question. We usually want to access header of the called script (the app) rather than  utility files it may include (and share with other apps). However, there's value of `header` *during* script loading phase (`#include`, `do`), and after it's loaded and accessed from other functions.
    > 
    > IDK what R2 did, but I think if code is evaluated during load phase we may let it access the header of the file that code is read from. But after it's loaded, header may return to that of the calling script. 
    > 
    > This then will also work if we `do` a file from console itself. During `do` the header is changed, and then reverted after it returns.
    >
    > Example:
    > ```
    > Red [title: "utility function"]
    > print ["including" system/script/header/title]        ;) shows "utility function"
    > show-title: does [alert system/script/header/title]   ;) shows title of the program that calls it
    > ```
    >
    > We don't have module design yet, but this should be considered in modules context ultimately.
    

--------------------------------------------------------------------------------

On 2021-09-07T16:44:44Z, dockimbel, commented:
<https://github.com/red/red/issues/4958#issuecomment-914462047>

    @hiiamboris Good points. R2 used to have `system/script/parent` to chain parent scripts metadata. Though, that does not seem to be enough to cover all cases either. Until we figure out the best way to handle that, I've made a simple addition to load current script headers in system object, so at least current script metadata are accessible.

