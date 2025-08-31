
#3392: VID actors creation doesn't merge in predefined actors from style
================================================================================
Issue is closed, was reported by gurzgri and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/3392>

### Expected behavior
VID face actors creation code _should merge actors declared per face with actors predefined in the style_ of which the face is derived from.
This problem isn't restricted to the ON-TIME actor used in the example code below but happens to all actors declared for a style.
 
### Actual behavior
VID face actors creation code only creates explicit actors and/or default actor, but doesn't merge in actors already defined for the style the face is generated from.
 
### Steps to reproduce the problem

1. Run the following code:
```
layout [
    style clock: base rate 0:00:01 on-time [probe 'on-time]
    a-clock: clock
    b-clock: clock [probe 'on-down]
]
? a-clock/actors
? b-clock/actors 
```
2. See how the output
```
A-CLOCK/ACTORS is an object! with the following words and values:
     on-time  function!     [face [object!] event [event! none!]]
B-CLOCK/ACTORS is an object! with the following words and values:
     on-down  function!     [face [object!] event [event! none!]]
]
```
shows how B-CLOCK has been created without merging in ON-TIME actor from its style because of the explicit ON-DOWN actor.

3. Check how A-CLOCK declared without explicit actors keeps the ON-TIME actor.

### Red and platform version
```
RED: [ branch: "master" tag: #v0.6.3 ahead: 712 date: 16-May-2018/9:52:18 commit: #1fd3e99c516a900d562ad9a7744e0c74b5e2613d ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 16299 ]
```


