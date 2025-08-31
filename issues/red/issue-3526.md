
#3526: unview while using lists
================================================================================
Issue is closed, was reported by Rebol2Red and has 6 comment(s).
<https://github.com/red/red/issues/3526>

```
view [
	text-list data ["a" "b" "c"] on-select [
		view [ 
			; remove selected listitem
			button "remove" [
				; put here some code to remove the selected listitem
				unview ; closes all windows, why not only the last one?
			]
			; change selected listitem
			field "" [
				; put here some code to change the selected listitem
				unview ; closes all windows, why not only the last one?				
			]
		]
	]
]
```
### Expected behavior
Unview must close the last opened window

### Actual behavior
All windows are being closed

### Steps to reproduce the problem
This problem seems to be with lists only (text-list, drop-list, drop-down). 
Some weird behaviour with radio also.

### Red and platform version
Red for Windows version 0.6.3 built 24-Aug-2018/22:01:34+02:00



Comments:
--------------------------------------------------------------------------------

On 2018-09-01T08:13:54Z, toomasv, commented:
<https://github.com/red/red/issues/3526#issuecomment-417841985>

    With `radio` instead of `text-list...` the window pops up again after editing/entering the field in second window. After second `enter`, while in field, it closes.

--------------------------------------------------------------------------------

On 2018-09-01T10:07:12Z, endo64, commented:
<https://github.com/red/red/issues/3526#issuecomment-417848065>

    It crashes on my PC (Win10 x64) when I click on "remove" button or close the second window from close button.
    
    ```
    *** Runtime Error 1: access violation
    *** at: 004C6F6Fh
    ```
    
    Tested both latest build of `master` and `simple-gc` branches:
    
    ```
    RED: [ branch: "master" tag: #v0.6.1 ahead: 3012 date: 25-Aug-2018/6:59:56 commit: #5559136cac5bab402b76ecc03c2780db90cfb98e ]
    
    RED: [ branch: "simple-gc" tag: #v0.6.3 ahead: 969 date: 1-Sep-2018/9:39:28 commit: #57bb3180df9e17d6e6f248089ed4dbd0ed9d121d ]
    
    PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]
    ```

--------------------------------------------------------------------------------

On 2018-09-02T09:08:42Z, Rebol2Red, commented:
<https://github.com/red/red/issues/3526#issuecomment-417915870>

    I think this is related:
    
    > Right, I should have used event/picked rather than face/selected. Though, the mouse events seem to not fill event/picked, so that we need to change the event type and add some extra code to ensure that the text-list's selection does not interfere
    https://gitter.im/red/red/gui-branch?at=5985cbff76a757f80878f1ea
    https://gitter.im/red/red/gui-branch?at=5985d5ad76a757f808790f0c

