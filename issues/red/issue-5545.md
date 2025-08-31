
#5545: Appending a loose button to a panel cause error
================================================================================
Issue is closed, was reported by GiuseppeChillemi and has 6 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5545>



**Describe the bug**
Appending a `loose` button to a face cause this error:

```
*** Script Error: + does not allow none! for its value1 argument
*** Where: +
*** Near : handler face event
*** Stack: do-file view do-events do-safe 
```

**To reproduce**

```
view [
	panel 200x200 [
		button "Add Button" [
			append face/parent/pane make-face/spec 'button ["hello" 100x30 loose]
		]
	]
]

```

**Platform version**

RED: [ branch: "master" tag: #v0.6.5 ahead: 186 date: 6-Sep-2024/10:31:12 commit: #f5c9214f6b545dc7aa7a551ac57851f86f8fd5ec ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22631 ]


Comments:
--------------------------------------------------------------------------------

On 2024-10-05T07:48:47Z, qtxie, commented:
<https://github.com/red/red/issues/5545#issuecomment-2394969390>

    Not just `button` face, append any type of face causes the error.

--------------------------------------------------------------------------------

On 2024-10-05T08:15:02Z, qtxie, commented:
<https://github.com/red/red/issues/5545#issuecomment-2394976451>

    Set the face/offset make it  work.
    ```
    view [
    	panel 200x200 [
    		button "Add Button" [
    			f: make-face/spec 'base ["hello" 100x30 loose]
    			probe f/offset
    			f/offset: 0x0
    			append face/parent/pane f
    		]
    	]
    ]
    ```

--------------------------------------------------------------------------------

On 2024-10-06T00:04:00Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5545#issuecomment-2395231715>

    So it is not a bug but a missing information?

