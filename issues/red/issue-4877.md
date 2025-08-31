
#4877: Draw leaks on text rendering
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4877>

**Describe the bug**
```
Red []
s: append/dup "" "x" 100000
b: compose [text 0x0 (s)]
view [
	below
	base 1000x300 rate 66 on-time [face/draw: b]
	text rate 1 on-time [face/text: form stats]
]
```
Eats ~100MB per second of OS RAM (`stats` continues to display small consumption)

**Expected behavior**

No leaks

**Platform version**
```
Red 0.6.4 for Windows built 18-Mar-2021/22:28:01+03:00  commit #73d9bd2
```



Comments:
--------------------------------------------------------------------------------

On 2021-04-13T16:07:23Z, dockimbel, commented:
<https://github.com/red/red/issues/4877#issuecomment-818857028>

    Minimal script to reproduce the issue:
    ```
    s: append/dup "" "x" 100000
    b: compose [text 0x0 (s)]
    view [base 1000x300 rate 66 on-time [face/draw: b]]
    ```
    
    The issue does not occur on pre-D2D backend.

