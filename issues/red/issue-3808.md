
#3808: [View] window & panel `selected` facets mess
================================================================================
Issue is open, was reported by hiiamboris and has 8 comment(s).
[GUI]
<https://github.com/red/red/issues/3808>

**Describe the bug**

When a face inside a panel is in focus, View changes the `selected` facet of a panel rather than of a window.

Example - fields (f3 & f4) below are inside a panel:
![](https://i.gyazo.com/d7c515109078686d89d40f3cc0077768.gif)
How one is supposed to know in what panel to look for the selected face? And that window/selected is wrong?


**To reproduce**
```
view [
    f1: field "f1"  f2: field "f2"  return
    p: panel [f3: field "f3"  f4: field "f4"]
    rate 1 on-time [
        print [
            attempt [p/parent/selected/text]
            attempt [p/selected/text]
        ]
    ]
]
```

**Expected behavior**
Window/selected should be changed instead.
Or a tree-like selection model should be used, where each window or panel `selected` facet refers to one of this face's immediate children (pane).

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 5-Mar-2019/0:09:36+03:00 commit #53b5b37
```



Comments:
--------------------------------------------------------------------------------

On 2019-03-08T18:34:38Z, hiiamboris, commented:
<https://github.com/red/red/issues/3808#issuecomment-471030346>

    https://github.com/red/red/issues/2792 could be related

--------------------------------------------------------------------------------

On 2019-03-12T18:58:29Z, dockimbel, commented:
<https://github.com/red/red/issues/3808#issuecomment-472137347>

    I remember a change done on panel/selected to reference the selected face, so that different panels when active, can have their own focused child face. But I agree that in such case, the window/selected value becomes irrevelant. This needs clarification.

--------------------------------------------------------------------------------

On 2019-08-14T15:11:43Z, dockimbel, commented:
<https://github.com/red/red/issues/3808#issuecomment-521288662>

    #2792 is not related, it's an issue specific to `tab-panel` widget.
    
    The fix for issue #3808 is directly related.

--------------------------------------------------------------------------------

On 2021-05-04T19:34:13Z, hiiamboris, commented:
<https://github.com/red/red/issues/3808#issuecomment-832191434>

    More to this mess:
    ```
    screen: system/view/screens/1
    dump: func [fa ev] [
    	print [
    		"in screen:"   all [f: screen/selected f/text]
    		", in window:" all [f: ev/window/selected f/text]
    		", in panel:"  all [f: ev/window/pane/1/selected f/text]
    	]
    ]
    w1: view/no-wait/options [title "w1" p1: panel "p1" [b1: button "b1" :dump]] [offset: 10x10]
    w2: view/no-wait/options [title "w2" p2: panel "p2" [b2: button focus "b2" :dump]] [offset: 150x10]
    ```
    1. `b2` should be focused initially, but it isn't (it works without a panel, or with `set-focus`)
    2. clicking any of `b1` or `b2` does not change any of the `/selected` facets, though OS shows the focus change
    3. `screen/selected` is always `none` (should point to an active top-level window when it belongs to current thread, `none` only if foreign window is active)

