
#5377: `do-events/no-wait` alone is not enough to reproduce `do-events` behavior
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
<https://github.com/red/red/issues/5377>

**Describe the bug**

I'm using an experimental event scheduler in Spaces which replaces `do-events` with my own. However I can't make it work with the GUI console.

I've narrowed the problem down to the following script:
```
Red [needs: view]

;; replace native do-events with a recreated equivalent
native-do-events: :do-events
do-events: func spec-of :native-do-events [
	either no-wait [
		native-do-events/no-wait
	][
		if window: last head system/view/screens/1/pane [
			while [window/state] [native-do-events/no-wait]		;) this doesn't work!
			; native-do-events									;) this works!
			none
		]
	]
]

;; View and GUI console are using some functions with compiled version of 'do-events'
;; so have to recreate these to switch them to the new `do-events` as well
with: func [a b] [bind b a]
set 'view func spec-of :view body-of :view
if attempt [system/console/gui?] [
	; do with gui-console-ctx/terminal [do-ask-loop: :do-events]
	do with gui-console-ctx/terminal [ask: func spec-of :ask body-of :ask]
	do with system/words             [ask: func spec-of :ask body-of :ask]
	do with system/console           [run: func spec-of :run body-of :run]
]

;; re-enter the GUI console loop using the new 'do-events' handler
system/console/run quit
```
Look at the commented lines inside `do-events`. Somehow the `while`-based one reacts to all key presses and other events except `Enter`, so it's impossible to evaluate any commands. While `native-do-events` processes the `Enter` key fine.


**To reproduce**

1. Save the provided script
2. Run it with the **GUI console** (as CLI argument or with `do` - doesn't matter)
3. Try hitting `Enter` - no effect

**Expected behavior**

I want the custom loop to process the Enter key.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4949 date: 1-Sep-2023/16:17:00 commit: #8fa47cf440b0af7eaf1c35fcf1903f7f1c074aa3 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-09-02T19:19:50Z, hiiamboris, commented:
<https://github.com/red/red/issues/5377#issuecomment-1703917376>

    After some more digging, I see that `ask` is terminated by `exit-event-loop` which uses PostQuitMessage to force the loop to leave. What I need is some kind of way for Red code to know when to terminate the loop. 
    
    `do-events/no-wait` only returns: 
    - true if event was processed
    - false if no event in the queue
    - none if no windows are displayed
    
    Which is not enough, as it doesn't tell me whether WM_QUIT was encountered or not. My approach works for single event loop per window, but not when window can enter multiple event loops...

