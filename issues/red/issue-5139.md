
#5139: [View] Hard CRASH with stack overflows when drawing rich-text
================================================================================
Issue is open, was reported by hiiamboris and has 8 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/5139>

**Describe the bug**

Title.

**To reproduce**

Run this in `--cli` mode (GUI just hangs silently):
```
Red []

r: rtd-layout ["abc"]
view [
	box rate 99 on-time [
		loop 999 [face/draw: compose [text 0x0 (copy/deep r)]]
	]
]
```
After ~1 second it rapidly streams things like:
```
*** Internal Error: stack overflow
*** Where: reduce
*** Near : self word
*** Stack: view do-events do-actor do-safe error? show do-actor do-safe error? s
r? show do-actor do-safe error? show do-actor do-safe error? show do-actor do-sa
o-safe error? show do-actor do-safe error? show do-actor do-safe error? show do-
 do-actor do-safe error? show do-actor do-safe error? show do-actor do-safe erro
error? show do-actor do-safe error? show do-actor do-safe error? show do-actor d
or do-safe error? show do-actor do-safe error? show do-actor do-safe error? show
show do-actor do-safe error? show do-actor do-safe error? show do-actor do-safe
*** Internal Error: stack overflow
*** Where: do
*** Near : handler face event
*** Stack: view do-events do-actor do-safe error? show do-actor do-safe error? s
r? show do-actor do-safe error? show do-actor do-safe error? show do-actor do-sa
o-safe error? show do-actor do-safe error? show do-actor do-safe error? show do-
 do-actor do-safe error? show do-actor do-safe error? show do-actor do-safe erro
error? show do-actor do-safe error? show do-actor do-safe error? show do-actor d
or do-safe error? show do-actor do-safe error? show do-actor do-safe error? show
show do-actor do-safe error? show do-actor do-safe error? show do-actor do-safe
```
If you manage to close the window before it stack-overflows, you get:
```
*** Runtime Error 95: no CATCH for THROW
*** in file: common.reds
*** at line: 282
***
***   stack: ***-uncaught-exception
***   stack: ***-uncaught-exception
***   stack: ***-uncaught-exception
```

**Expected behavior**

No errors

**Platform version**
```
Red 0.6.4 for Windows built 15-May-2022/2:37:39+03:00  commit #2b72c44
```



Comments:
--------------------------------------------------------------------------------

On 2022-05-15T12:50:55Z, hiiamboris, commented:
<https://github.com/red/red/issues/5139#issuecomment-1126933310>

    Linking this to other no cat for throw issues: https://github.com/red/red/issues/4990#issuecomment-957477940

--------------------------------------------------------------------------------

On 2022-05-16T07:32:56Z, qtxie, commented:
<https://github.com/red/red/issues/5139#issuecomment-1127327602>

    No error if just `copy r`. 

--------------------------------------------------------------------------------

On 2022-05-16T08:11:30Z, qtxie, commented:
<https://github.com/red/red/issues/5139#issuecomment-1127364361>

    I think it's caused by OS resources cannot be freed by the GC. A weird workaround:
    ```
    r: rtd-layout ["abc"]
    view [
    	box rate 99 on-time [
    		loop 999 [face/draw: compose [text 0x0 (r)]]
    		loop 999 [face/draw: compose [text 0x0 (copy/deep r)]]
    	]
    ]
    ```

--------------------------------------------------------------------------------

On 2022-05-21T15:55:34Z, hiiamboris, commented:
<https://github.com/red/red/issues/5139#issuecomment-1133659793>

    No problems with this:
    ```
    Red []
    view [
    	box rate 99 on-time [
    		loop 999 [face/draw: compose [text 0x0 (rtd-layout ["abc"])]]
    	]
    ]
    ```
    so it's unlikely related to resources.

