
#1290: drop-down and drop-list can crash
================================================================================
Issue is closed, was reported by WiseGenius and has 32 comment(s).
[status.problem] [type.bug]
<https://github.com/red/red/issues/1290>

On Windows XP (with `load-lib?: false`):

Run `view-test.exe`.
Click to drop down either the drop-down or the drop-list.
Click on a different window.
Result:

```
H:\red-gui>view-test
Windows XP build 2600
slider changed: 25%
do-event-loop
event> type: down offset: 68x12 key: none
event> type: up offset: 68x12 key: none

*** Runtime Error 1: access violation
*** at: 0044A760h

H:\red-gui>
```



Comments:
--------------------------------------------------------------------------------

On 2015-11-06T10:28:32Z, dockimbel, commented:
<https://github.com/red/red/issues/1290#issuecomment-154373461>

    This issue has been fixed in recent commits.

--------------------------------------------------------------------------------

On 2015-11-07T14:39:06Z, WiseGenius, commented:
<https://github.com/red/red/issues/1290#issuecomment-154711262>

    Unfortunately, I'm still observing this problem.
    
    It now seems fine if I drop-down and then click on most other windows. However, if I drop-down and then click on the any of the following, it still crashes:
    - Any CMD window, including view-test's own output console.
    - Any Windows Explorer Window.
    - The Desktop (so far, always in XP but only sometimes in Windows 7).
    - The Taskbar (so far, always in XP but never in Windows 7).
    
    Windows XP output:
    
    ```
    *** Runtime Error 1: access violation
    *** in file: /H/Work/Red/Tests Red/2015-11-07-22-56-57-red-gui/red-gui/modules/v
    iew/backends/windows/gui.reds
    *** at line: 119
    ```
    
    Windows 7 output:
    
    ```
    *** Runtime Error 1: access violation
    *** at: 00475B45h
    ```

--------------------------------------------------------------------------------

On 2015-11-07T15:45:11Z, dockimbel, commented:
<https://github.com/red/red/issues/1290#issuecomment-154717035>

    Thanks for the detailed reporting.

--------------------------------------------------------------------------------

On 2015-11-08T14:07:32Z, dockimbel, commented:
<https://github.com/red/red/issues/1290#issuecomment-154828703>

    @WiseGenius Can you confirm that the issue is effectively fixed for you too?

--------------------------------------------------------------------------------

On 2015-11-08T15:49:30Z, WiseGenius, commented:
<https://github.com/red/red/issues/1290#issuecomment-154834705>

    In Windows XP:
    1. If I run view-test.exe from a CMD console:
    - If I first click to drop down the `drop-down`:
      - **It's fixed for clicking on:**
      - Any Windows Explorer window.
      - Its own output console.
      - **It still crashes when clicking on:**
      - Any other CMD window.
      - The Desktop.
      - **It sometimes crashes when clicking on:**
      - The Taskbar.
    - If I first click to drop down the `drop-list`:
      - **It still crashes when clicking on:**
      - Any Windows Explorer window.
      - Its own output console.
      - Any other CMD window.
      - The Desktop.
      - The Taskbar.
      - If I run view-test.exe by double-clicking it in Windows explorer:
    - If I first click to drop down the `drop-down`:
      - **It's fixed for clicking on:**
      - Any Windows Explorer window.
      - The Desktop.
      - **It still crashes when clicking on:**
      - The Taskbar (everywhere except the far right areas of it).
      - **It sometimes crashes when clicking on:**
      - Its own output console.
      - Any other CMD window.
    - If I first click to drop down the `drop-list`:
      - **It still crashes when clicking on:**
      - Any Windows Explorer window.
      - Its own output console.
      - Any other CMD window.
      - The Desktop.
      - The Taskbar.
    
    In Windows 7:
    1. If I run view-test.exe from a CMD console:
    - If I first click to drop down the `drop-down`:
      - **It's fixed for clicking on:**
      - Any Windows Explorer window.
      - Its own output console.
      - Any other CMD window.
      - The Taskbar.
      - **It still crashes when clicking on:**
      - The Desktop.
    - If I first click to drop down the `drop-list`:
      - **It's fixed for clicking on:**
      - The Taskbar.
      - **It still crashes when clicking on:**
      - Any Windows Explorer window.
      - Its own output console.
      - Any other CMD window.
      - The Desktop.
      - If I run view-test.exe by double-clicking it in Windows explorer:
    - If I first click to drop down the `drop-down`:
      - **It's fixed for clicking on:**
      - Any Windows Explorer window.
      - **It sometimes crashes when clicking on:**
      - Its own output console.
      - Any other CMD window.
      - The Desktop.
      - The Taskbar (everywhere except the far right areas of it).
    - If I first click to drop down the `drop-list`:
      - **It still crashes when clicking on:**
      - Any Windows Explorer window.
      - Its own output console.
      - Any other CMD window.
      - The Desktop.
      - **It sometimes crashes when clicking on:**
      - The Taskbar.
    
    The error for Windows XP is the same as before. On Windows 7, it's now:
    
    ```
    *** Runtime Error 1: access violation
    *** at: 0047638Ch
    ```

--------------------------------------------------------------------------------

On 2015-11-09T06:19:47Z, dockimbel, commented:
<https://github.com/red/red/issues/1290#issuecomment-154956476>

    Thanks a lot for the very detailed testing!

--------------------------------------------------------------------------------

On 2015-11-11T08:26:55Z, qtxie, commented:
<https://github.com/red/red/issues/1290#issuecomment-155702183>

    Here is the fix: 0a61770

--------------------------------------------------------------------------------

On 2015-11-11T14:06:23Z, WiseGenius, commented:
<https://github.com/red/red/issues/1290#issuecomment-155792395>

    In none of the above situations does it any longer crash **every** time.
    
    **In Windows XP:**
    Whether view-test is run from CMD or the GUI, clicking any one of the following and **then** back on either a `drop-down` a `drop-list` will sometimes cause it to crash with the same error as before.
    - The Desktop.
    - Its own output console.
    - Any other CMD window.
    
    This apparently doesn't happen with:
    - Any Windows Explorer window.
    - The Taskbar.
    
    This new behaviour in Windows XP hasn't ever been certainly observed in Windows 7.
    
    **In Windows 7:**
    Whether view-test is run from CMD or the GUI, the original problem still occurs, but only when one of the following is clicked very quickly after either a `drop-down` or the `drop-list`:
    - Any Windows Explorer window.
    - Its own output console.
    - Any other CMD window.
    - The Desktop.
    - The Taskbar (with one possible exception)
    
    Note:
    - The only combination not observed to crash so far, is The Taskbar after `drop-down` when view-test is run from a CMD console.
    - When clicking quickly enough, the crash can be caused almost every time for the first 3. The Desktop sometimes not, and the Taskbar seems hardest to do.
    - If any of the above are clicked quickly enough after the `drop-down`, and if there is no crash, the text “type” is always removed from the `drop-down` instead.
    - Once “type” disappears this way, it becomes difficult to crash it with the `drop-down` for the rest of the session, but it's still possible each time.
    - “type” is also removed when clicking quickly enough on any other window not on the above list. This is what they do each time instead of ever crashing.
    
    **In Windows XP:**
    Seems to also have the same new behaviour as in Windows 7 (including “type” disappearing if any window is clicked fast enough), but it seems I need to click faster than in Windows 7. This makes it hard to try for each combination without crashing it the other way, so I didn't test every combination of this way on Windows XP.
    
    The error for Windows XP is the same as before, but now the Windows 7 error is like the XP one:
    
    ```
    *** Runtime Error 1: access violation
    *** in file: /C/Tests/Tests Red/2015-11-11-19-54-51-red-gui/red-gui/modules/view
    /backends/windows/gui.reds
    *** at line: 119
    ```

--------------------------------------------------------------------------------

On 2015-11-11T15:01:46Z, qtxie, commented:
<https://github.com/red/red/issues/1290#issuecomment-155805380>

    @WiseGenius Thanks a lot for the testing. Here is a more robust fix. :sunglasses: In my test, it's not crash anymore. But I don't remember if the "type" is disappearing in previous version and I cannot reproduce it with the fix (maybe I didn't do it fast enough ;-) )

--------------------------------------------------------------------------------

On 2015-11-11T16:50:11Z, WiseGenius, commented:
<https://github.com/red/red/issues/1290#issuecomment-155842932>

    Unfortunately, now 3 combinations cause a crash every time, no matter how slowly they're clicked:
    - Windows 7 / double-click view-test.exe in Windows Explorer / click `drop-down` / click view-test's own output console
    - Windows 7 / double-click view-test.exe in Windows Explorer / click `drop-list` / click view-test's own output console
    - Windows XP / double-click view-test.exe in Windows Explorer / click `drop-list` / click view-test's own output console
    
    And this one only crashes sometimes, no matter how slowly it's clicked:
    - Windows XP / double-click view-test.exe in Windows Explorer / click `drop-down` / click view-test's own output console
    
    Also, if any of the above are clicked and then the mouse is quickly **pointed/hovered** over the output console, it crashes: Every time in Windows XP, but only sometimes in Windows 7.
    
    The above don't crash at all when view-test is run from the CMD console, or when any other CMD window is clicked.
    In fact, although they all still make “type” disappear if clicked quickly, all the other combinations of **menu-then-window** no longer crash, even when clicked quickly.
    
    I haven't tested the **window-then-menu** combinations.

--------------------------------------------------------------------------------

On 2015-11-18T04:24:24Z, WiseGenius, commented:
<https://github.com/red/red/issues/1290#issuecomment-157601456>

    Conditions:
    - If the code is compiled, then doing the following instructions only crashes when the binary is double clicked from Windows Explorer. Not when run from CMD.
    - If the code is entered in the console or a file is `do`ne from the console, then doing the following instructions only crashes when the console binary is double clicked from Windows Explorer, and not run from CMD.
    
    Providing the above conditions are met, doing any of the followng instructions crashes every time on both Windows XP and Windows 7:
    - In view-test:
      1. Click to drop down the `drop-down` or `drop-list`.
      2. Click on the output console.
    - In a window generated by VID code:
      1. Select any item from a `drop-down` or `drop-list`.
      2. Click to drop it down again.
      3. Click on the output console.
    
    Windows 7 gives a chance to see the error message:
    
    ```
    *** Runtime Error 1: access violation
    *** in file: /C/red-gui/modules/view/backends/windows/gui.reds
    *** at line: 127
    ```

--------------------------------------------------------------------------------

On 2016-03-14T08:19:27Z, dockimbel, commented:
<https://github.com/red/red/issues/1290#issuecomment-196195313>

    @WiseGenius What is the state of this issue right now? Can you still reproduce it?

--------------------------------------------------------------------------------

On 2016-03-14T10:03:58Z, WiseGenius, commented:
<https://github.com/red/red/issues/1290#issuecomment-196234424>

    @dockimbel Yes. It's still exactly as described in my previous comment, except that:
    - It doesn't crash if the code is `do`ne from the GUI console - only the CLI console.
    - In view-test, the `drop-list` still causes a crash every time, but the `drop-down` only sometimes. However, if an option is chosen first (as in the instructions for VID above), then `drop-down` crashes every time too.

--------------------------------------------------------------------------------

On 2019-05-09T22:16:47Z, hiiamboris, commented:
<https://github.com/red/red/issues/1290#issuecomment-491087911>

    Here's another attempt https://github.com/red/red/pull/3867
    
    I didn't test under WinXP, only on W7. @WiseGenius please let us know if the fix works for you.
    
    Most annoying thing about this issue is how to see the output after it crashes. How I tested it:
    - compile the view-test: `red -r -d view-test.red` (or from the modified source tree: `rebol --do "do/args %red.r {-r -d %tests/view-test.red}"`)
    - run it from the GUI console without the explicit shell window and capture & display the output: `call/show/wait/output {view-test.exe} a: ""  print skip tail a -1000` (should be done from /tests folder)
    - drop down either `drop-list` or `drop-down` and move the mouse pointer away into the shell console window (this is when it crashes)
    
    The output is:
    ```
    *** Runtime Error 1: access violation
    *** in file: /D/devel/red/red-src/red/tests/modules/view/backends/windows/gui.reds
    *** at line: 189
    ***
    ***   stack: gui/get-widget-handle 0018FE98h
    ***   stack: gui/get-event-face 028503B4h
    ***   stack: event/eval-path 028503B4h 02848684h 00000000h 00000000h false
    ***   stack: red/actions/eval-path 028503B4h 02848684h 00000000h 00000000h false
    ***   stack: red/eval-path* 028503B4h 02848684h
    ***   stack: ctx365~awake 003CAB5Ch
    ***   stack: gui/make-event 0018FE98h 67108864 12
    ***   stack: gui/process 0018FE98h
    ***   stack: gui/do-events false
    ***   stack: ctx373~do-event-loop false
    ***   stack: do-events
    ***   stack: view
    ```
    
    Now for the reason, let's inspect the source of `get-widget-handle` before the fix (my comments start with a `;)`):
    ```
    get-widget-handle: func [
    	msg		[tagMSG]
    	return: [handle!]
    	/local
    		hWnd   [handle!]
    		p	   [int-ptr!]
    		id	   [integer!]
    ][
    	hWnd: msg/hWnd
    
    	;) msg/hWnd refers to the temporary window that contains the dropped down content
    	;) (never created by Red explicitly)
    
    	if no-face? hWnd [
    		hWnd: GetParent hWnd							;-- for composed widgets (try 1)
    		if no-face? hWnd [
    
    			;) we reach here since `no-face?` failed for that window
    
    			hWnd: WindowFromPoint msg/x msg/y			;-- try 2
    
    			;) hWnd now contains the HWND of the console window
    			;) that was created automatically
    
    			if no-face? hWnd [
    				id: 0
    				GetWindowThreadProcessId hWnd :id
    				if id <> process-id [return as handle! -1]
    
    				;) as it appears, in the scenario when console does not belong
    				;) to any parent PID, it does belong to the same PID we're in
    				;) (even although this console window was created implicitly),
    				;) so the flow goes here
    
    				p: as int-ptr! GetWindowLong hWnd 0		;-- try 3
    				either null? p [
    					hWnd: as handle! -1					;-- not found
    				][
    					;) it turns out that console window does have a nonzero value at offset=0,
    					;) but we cannot know what that value holds
    					;) so we're coming here with a pointer `p` containing unknown data
    					;) and are trying to dereference it:
    
    					hWnd: as handle! p/2
    
    					;) and `p/2` results in a segfault...
    
    					if no-face? hWnd [hWnd: as handle! -1]	;-- not found
    				]
    			]
    		]
    	]
    	hWnd
    ]
    ```

--------------------------------------------------------------------------------

On 2019-05-11T03:35:02Z, greggirwin, commented:
<https://github.com/red/red/issues/1290#issuecomment-491475958>

    It's a legacy design issue in Windows that the desktop owns the drop portion of certain controls. I don't know the more recent status of that. 
    
    Great details @hiiamboris. @WiseGenius hasn't been around in a while, so if nobody can confirm the fix on XP, we'll merge this an wait for further reports.

--------------------------------------------------------------------------------

On 2019-05-14T06:50:06Z, WiseGenius, commented:
<https://github.com/red/red/issues/1290#issuecomment-492101991>

    I can confirm this fix works for me on XP, thanks.

