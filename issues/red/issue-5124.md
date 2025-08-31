
#5124: [View] Bubbling event becomes invalid after `unview`
================================================================================
Issue is open, was reported by hiiamboris and has 8 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/5124>

**Describe the bug**

Before `unview`:
```
EVENT is an object! with the following words and values:
     type         word!         down
     face         object!       [type offset size text image color m
     window       object!       [type offset size text image color m
     offset       pair!         39x28
     key          none!         none
     picked       integer!      1
     flags        block!        length: 1  [down]
     orientation  none!         none
     away?        logic!        false
     down?        logic!        true
     mid-down?    logic!        false
     alt-down?    logic!        false
     aux-down?    logic!        false
     ctrl?        logic!        false
     shift?       logic!        false
```
After `unview`:
```
EVENT is an object! with the following words and values:
     type         word!         down
     face         none!         none
     window       none!         none
     offset       pair!         39x28
     key          none!         none
     picked       none!         none
     flags        block!        length: 1  [down]
     orientation  none!         none
     away?        logic!        false
     down?        logic!        true
     mid-down?    logic!        false
     alt-down?    logic!        false
     aux-down?    logic!        false
     ctrl?        logic!        false
     shift?       logic!        false
```

**To reproduce**
```
Red []

dump-event: function [event] [
	event: object collect [
		foreach w system/catalog/accessors/event! [
			keep reduce [to set-word! w 'quote event/:w]
		]
	]
	help event
]
append system/view/handlers func [face event] [
	if event/type = 'down [
		dump-event event
		unview
		dump-event event
	]
]
view [base white "CLICK ME"]
```
Run this **in CLI console** & click your base. Both `face` and `window` become `none`.
`picked` becomes none in both CLI and GUI console.

**Expected behavior**

Event should not be corrupted.

**Platform version**
```
Red 0.6.4 for Windows built 4-Apr-2022/15:09:55+03:00  commit #28dad01
```



Comments:
--------------------------------------------------------------------------------

On 2022-04-15T19:28:35Z, hiiamboris, commented:
<https://github.com/red/red/issues/5124#issuecomment-1100309201>

    Another undesired effect is exposed by this script (run in any console):
    ```
    Red []
    
    insert system/view/handlers func [face event] [
    	if event/type = 'up [unview]
    	none
    ]
    view [base white "CLICK ME"]
    ```
    After clicking there's an error in View code:
    ```
    *** Script Error: path event/face/type is not valid for none! type
    *** Where: =
    *** Near : event/face/type = 'window [switch event/type ]
    *** Stack: view do-events do-safe
    ```

--------------------------------------------------------------------------------

On 2022-09-09T13:38:15Z, qtxie, commented:
<https://github.com/red/red/issues/5124#issuecomment-1241987218>

    Event is OK now and no error anymore.

--------------------------------------------------------------------------------

On 2022-09-09T14:39:14Z, hiiamboris, commented:
<https://github.com/red/red/issues/5124#issuecomment-1242058454>

    Confirmed. Fixed by https://github.com/red/red/commit/508f4cfa75611a2d0f3ed01cd1adf411c6e91119

--------------------------------------------------------------------------------

On 2022-09-20T10:33:45Z, hiiamboris, commented:
<https://github.com/red/red/issues/5124#issuecomment-1252160278>

    I was too quick to close this. Original case: no error in GUI console, but error persists in CLI console. Additional case: worked in Sep 8-11 builds, regressed in Sep 17 build (errors out in GUI console as well).

