
#3815: [View] Scroller won't move by steps smaller than 1%
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[type.review] [GUI] [type.design]
<https://github.com/red/red/issues/3815>

**Describe the bug**

```
view [
   scroller with [steps: 1.0 / 100] on-change [probe face/data] return
   scroller with [steps: 1.0 / 101] on-change [probe face/data]
]
```
![](https://i.gyazo.com/f921157491c5571f20d81e82b42debab.gif)
For example, for lists bigger than 100 lines, a click on the scroller up/down buttons should move the list view by 1 line. This corresponds to `1 / N < 0.01` offset to scroller data facet, which is now ignored. When there are 10000 lines, moving the view by 100 lines at once is useless.

**Expected behavior**

Scroller should support `steps` size of any magnitude, adapting its internal integer maximum as needed for that.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 5-Mar-2019/0:09:36+03:00 commit #53b5b37
```



Comments:
--------------------------------------------------------------------------------

On 2019-03-12T18:44:44Z, dockimbel, commented:
<https://github.com/red/red/issues/3815#issuecomment-472132444>

    `scroller` widget is undocumented and unfinished. It shouldn't have been released yet. Agreed on the expected behavior.

