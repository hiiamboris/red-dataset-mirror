
#3942: View: Window lost focus after a modal window close
================================================================================
Issue is closed, was reported by endo64 and has 12 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3942>

**Describe the bug**
After closing a modal window the main window lost its focus and stays behind other windows.

Note that @toomasv [reported](https://gitter.im/red/bugs?at=5d3713ae5ea6e644ec063d18) that:
> build from May 21st, and there was no such problem.

**To reproduce**
```
view [button "Open Modal" 200 [view/flags [button 200 "Close Modal" [unview]] [modal] ] ]
```

**Expected behavior**
The window that opens the modal window should have focus after closing the modal.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 16-Jul-2019/18:28:15+03:00 commit #66ba8c8
```



Comments:
--------------------------------------------------------------------------------

On 2019-07-26T06:56:31Z, bitbegin, commented:
<https://github.com/red/red/issues/3942#issuecomment-515333837>

    Duplicate of #3309

--------------------------------------------------------------------------------

On 2019-07-27T10:18:53Z, bitbegin, commented:
<https://github.com/red/red/issues/3942#issuecomment-515673264>

    still exist another issue, after `close modal`, the cmd shell will get focus (foreground) like this:
    
    ![lost](https://user-images.githubusercontent.com/4469745/61993207-f85ff080-b09a-11e9-81dc-ce2376d90ddc.gif)
    
    

--------------------------------------------------------------------------------

On 2019-07-27T17:32:55Z, qtxie, commented:
<https://github.com/red/red/issues/3942#issuecomment-515701029>

    Actually the "Open Modal" window is on the foreground, not the cmd shell. Looks like z-order of the cmd shell been promoted. As the cmd shell is for debugging purpose, if there is no easy fix, I'll let it as is for now.

--------------------------------------------------------------------------------

On 2020-01-29T21:18:19Z, hiiamboris, commented:
<https://github.com/red/red/issues/3942#issuecomment-579964271>

    Do this in GUI console: `view/flags [base] 'modal`  then close the modal window.
    GUI console won't react to any key presses.

--------------------------------------------------------------------------------

On 2020-01-30T01:29:29Z, greggirwin, commented:
<https://github.com/red/red/issues/3942#issuecomment-580042717>

    Your test seems OK on Win10 @hiiamboris.

--------------------------------------------------------------------------------

On 2020-04-07T09:57:30Z, hiiamboris, commented:
<https://github.com/red/red/issues/3942#issuecomment-610293745>

    > 
    > 
    > Do this in GUI console: `view/flags [base] 'modal` then close the modal window.
    > GUI console won't react to any key presses.
    
    Also `alert "hi"` blocks the console after closing the window, as it's using `modal` flag.

