
#2606: move does not trigger refresh in View
================================================================================
Issue is closed, was reported by DideC and has 4 comment(s).
[status.resolved]
<https://github.com/red/red/issues/2606>

Using `move` in view does not trigger the refresh of the face after the change. `show` must be used.
Demonstrate here with a text-list:
```
view [
	tl: text-list data ["Pierre" "Paul" "Jacques" "Henri"]
	button "remove" [remove tl/data]
	button "insert" [insert tl/data random first tl/data]
	button "move" [move tl/data tail tl/data]
	button "probe" [probe tl/data]
	button "show" [show tl]
]
```


Comments:
--------------------------------------------------------------------------------

On 2017-04-21T09:12:52Z, DideC, commented:
<https://github.com/red/red/issues/2606#issuecomment-296137441>

    I add a strange behaviour, related or not.
    In this exemple, second text-list is updated by `show` but not the first one:
    ```
    unselected: ["Pierre" "Paul" "Jacques" "Henri"]
    selected: []
    view [
    	t1: text-list data unselected [
    		move at face/data face/selected tail selected
    		show [t1 t2]
    	]
    	t2: text-list data selected
    ]
    ```

--------------------------------------------------------------------------------

On 2017-07-28T15:15:23Z, dockimbel, commented:
<https://github.com/red/red/issues/2606#issuecomment-318680185>

    MOVE is a silent action wrt face events, it will not trigger any event there. This is required to enable MOVE to move faces between panes without triggering an expensive cycle of destruction/recontruction. 
    
    So in order to trigger a proper face refresh in the second example, you need to make a non-MOVE modification, otherwise SHOW will consider the face unchanged and not do any refresh (SHOW works in a lazy way for performance reason). For example:
    ```
    unselected: ["Pierre" "Paul" "Jacques" "Henri"]
    selected: []
    view [
    	t1: text-list data unselected [
    		move at face/data face/selected tail selected
    		face/data: face/data
    		show [t1 t2]
    	]
    	t2: text-list data selected
    ]
    ```
    
    A better and cleaner way for handling that will be added in the future.

