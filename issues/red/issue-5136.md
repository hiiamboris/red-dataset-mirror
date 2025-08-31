
#5136: [View] Platform discrepancy in dragging behavior
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[GUI] [type.design]
<https://github.com/red/red/issues/5136>

**Describe the bug**

On Windows:
- `up` event is received by the same face that got `down` event
- `alt-up` event is received by the face under the pointer, disregarding where `alt-down` event went

On Linux:
- both `up` and `alt-up` events are received by the face that got `down` and `alt-down` events

Didn't test on Mac.

<img width=300 src=https://i.gyazo.com/bbf92f9a131666f2127f6fb509518f0d.gif></img>

**To reproduce**

```
view/tight [
	below
	base 200x100 white "start dragging here"
	on-up     [print ["ABOVE" event/type tab event/offset]]
	on-alt-up [print ["ABOVE" event/type tab event/offset]]
	base 200x100 yellow "drop here"
	on-up     [print ["BELOW" event/type tab event/offset]]
	on-alt-up [print ["BELOW" event/type tab event/offset]]
]
```
Follow instructions on the screen.

**Expected behavior**

This is worth figuring out who's doing this, Red or OS, if later then whether we want consistency or there are arguments against it. And what kind of behavior we want?

Dragging is used by a few UX mechanisms:
- for scrolling we care about `over` events going to the same face (scroller), not so much for `up` event.
- for drag-n-drop we care about `up` event, and we're more interested in where it landed than where it started
- [pie menu](https://en.wikipedia.org/wiki/Pie_menu) selection is often made by dragging, in this case `*down` event is received by a face that shows the menu, while `*up` event should go into the newly shown menu face (ideally - other window) if it lands on one of it's items

My impression is that whoever receives `down` or `alt-down` (or presses of other buttons) should be able to control whether this face is now capturing the movement or not, so UX designer can have a choice.

**Platform version**
```
Red 0.6.4 for Windows built 15-Apr-2022/11:42:52+03:00  commit #502097e
Red 0.6.4 for Linux built 15-Mar-2022/17:14:51+03:00  commit #af98e79
```



