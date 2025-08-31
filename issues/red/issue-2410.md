
#2410: handling 'resize in global event handler before view could crash gui-console
================================================================================
Issue is closed, was reported by DideC and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/2410>

The following code **works**:
```
Red []
main: layout [text "test"]
view/flags/no-wait main 'resize
insert-event-func [
	if event/type = 'resize [show main 'done]
]
do-events
```
This one **CRASH** when interpreted:
```
Red []
main: layout [text "test"]
insert-event-func [
	if event/type = 'resize [show main  'done]
]
view/flags/no-wait main 'resize
do-events
```
Global event handler is just sets before the window is shown!.
That must triggered something at view time that cause the crash.


