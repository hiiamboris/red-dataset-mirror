
#82: Reminder on bind/only
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
<https://github.com/red/REP/issues/82>

Once we have `bind/only` implemented we need to change the `layout` func: 
https://github.com/red/red/blob/ea1d1399b6c4adbdc325abef0be46af04705db40/modules/view/VID.red#L670
`if all [style/init not styling?][do bind style/init 'face]`

Because as confirmed by Nenad, `init` should only have `face` exposed. 

Problem is: `layout` has 62 local words in it's spec and counting, so chances to get weird errors like this are high:
```
list: []
i: 0
extend system/view/VID/styles [
	cell: [
		template: [type: 'panel color: gold]
		init: [append list i: i + 1]
	]
]
view [cell]
```
Guess what this code results in?
```
*** Script Error: path none is not valid for integer! type
*** Where: eval-path
*** Stack: view layout align-faces 
```
Who would have thought...

**If you know any other places in Red code that should be patched eventually, let's list them here.**
FYI mezz implementation rests [here](https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/bind-only.red) for now.


