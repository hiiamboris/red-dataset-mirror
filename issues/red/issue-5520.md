
#5520: [View] `over` events order is non intuitive
================================================================================
Issue is open, was reported by hiiamboris and has 8 comment(s).
[GUI]
<https://github.com/red/red/issues/5520>

**Describe the bug**

When the pointer moves from face A into face B, it would be natural to expect the following event sequence:
- a sequence of over (away?=false) events for face A
- over (away?=true) event for face A
- a sequence of over (away?=false) events for face B

But in reality it's twisted:
```
...
over A away?: false
over A away?: false
over B away?: false       <- this should come after we finish with A events
over A away?: true
over B away?: false
over B away?: false
...
```

**To reproduce**

1. Run this code:
```
view/tight [
	base all-over 100x100 magenta "A"	on-over [print ["over A away?:" event/away?]]
	base all-over 100x100 yello "B"		on-over [print ["over B away?:" event/away?]]
]
```
2. Move the pointer from base A into base B
3. Observe the AAAA-B-A-BBBB twisted pattern

**Expected behavior**

AAAAA-BBBBB

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.5 ahead: 175 date: 1-Jul-2024/17:21:21 commit: #bbecb7eb6c23ef1040208187fb0fe160a4223c7f ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19045 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2024-07-04T19:42:04Z, greggirwin, commented:
<https://github.com/red/red/issues/5520#issuecomment-2209497380>

    I imagine Red is just passing the events as they occur from the OS. To change the order would require state management. With default spacing I wasn't able to make it happen out of order, but with 1x1 spacing I could. 
    
    ```
    view [
            base all-over 100x100 magenta "A"       on-over [prin 'A]
            base all-over 100x100 yello "B"         on-over [prin 'B]
    ]
    
    view [
    	space 1x1
            base all-over 100x100 magenta "A"       on-over [prin 'A]
            base all-over 100x100 yello "B"         on-over [prin 'B]
    ]
    ```
    I agree it's not intuitive, but I don't know if our target OSs guarantee event determinism. My guess is that they don't. So the question is how critical this is, and for what scenarios.

--------------------------------------------------------------------------------

On 2024-07-05T05:49:09Z, hiiamboris, commented:
<https://github.com/red/red/issues/5520#issuecomment-2210222670>

    Spacing is always 'zero' when you're dealing with popups. Also with touchscreen you can jump the pointer from face to face.
    
    I wanted to detect when pointer leaves a space to send an 'away' event to it (to close the popup in this case), so I tried using a simple state `last-face: face` which would, before it's changed to a new value, generate such an event (but it's mainly used for other purposes: for tracking space movement under still pointer). 
    
    But now I have to disentangle this mess, and I don't even know how yet. I probably will have to use an 'away' event from the face as an indicator that the next event should switch the face. And ignore or queue somewhere events that come into the wrong face before the 'away' event, then resend them after it. 

--------------------------------------------------------------------------------

On 2024-07-05T13:51:32Z, greggirwin, commented:
<https://github.com/red/red/issues/5520#issuecomment-2210917270>

    Thanks for the explanation. If you can figure out the logic, that may be the same thing that the internal event dispatcher would have to do, so the R&D isn't wasted. If that isn't changed in the core, then others would use your logic at mezz level.

--------------------------------------------------------------------------------

On 2024-07-05T15:14:07Z, hiiamboris, commented:
<https://github.com/red/red/issues/5520#issuecomment-2211049685>

    What seems to work is stashing all out of order events, then flushing them right after the `away=true` event processing.
    
    Note that such events are too valuable to ignore. E.g. if a new face gets shown under still pointer, you only ever get 2 over events: non-away, then away.

