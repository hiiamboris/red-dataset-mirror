
#5163: Weird bugs when using inaccessible word in Draw
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/5163>

**Describe the bug**

When Draw from any of the View or reactivity code accesses a word local to some function that's not on the stack, a whole bunch of errors surfaces.

**To reproduce**

Run this script & resize the window:
```
Red []
f: has [c] [[pen c]]
view/flags [base draw f] 'resize
```
Quits and outputs:
```
*** Internal Error: circular reference not allowed
*** Where: do-event-loop
*** Near : none
*** Stack: do-events
```
---
Run the same script and close the window without resizing:
```
*** Script Error: launch does not allow none! for its <anon> argument
*** Where: launch
*** Near : no
*** Stack:
```
---
Change `base` to `box`:
```
Red []
f: has [c] [[pen c]]
view [box draw f] 
```
Output when run:
```
*** Script Error: field word is not bound to a context
*** Where: foreach
*** Near : [all [not empty? srs: system/reactivity/source ] ]
*** Stack:
```

**Expected behavior**

Error caught during Draw, like in this example:
```
f: has [c] [[pen c]]
draw 10x10 f
```
```
*** Script Error: context for c is not available
*** Where: draw-image
*** Near : [...]
*** Stack: draw
```

**Platform version**
```
Red 0.6.4 for Windows built 27-Jun-2022/11:51:28+03:00  commit #ed73e33
```



