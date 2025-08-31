
#4342: [View] `on-over` spams the queue when layout changes within the actor
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/4342>

**Describe the bug**

A change of any face's size or offset during `on-over` actor re-queues this event immediately

**To reproduce**

1. Run this in the console
`view [base gold black "HOVER OVER ME" all-over on-over [print event/offset b/size: 161x161 - b/size] b: base]` (you can even add `hidden` at the tail)
2. Hover over the golden base and stop moving it
3. See the unending stream of events in the console

Note that I'm changing the parameters of another (unrelated to the event) face.

**Expected behavior**

A new event should only be produced if:
1. Pointer offset within the bounds of a certain face changes:
- while pointer is either within that face and it is visible and enabled
- or that face has capture (e.g. during dragging)
2. Pointer gets in or out of the face (e.g. as a result of face's resize)


**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 27-Feb-2020/6:07:00+03:00 commit #bf15211
```



