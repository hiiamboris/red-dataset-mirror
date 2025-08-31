
#4897: [CRASH] `size-text` punches WORMHOLES in code space-time
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4897>

**Describe the bug**

Took hours to track this pirate ☻
When `size-text` is called on a rich-text face that has negative width, flow of code becomes totally unpredictable, leading to most annoying debug sessions.

**To reproduce**
```
Red [needs: view]

recycle/off					

depth: 0
wrap: func [code [block!]] [		;) should display "OUT" for every "IN"
	print ["IN" depth: depth + 1]
	print try/all code
	print ["OUT" also depth depth: depth - 1]
]

rigged?: none
rig: has [r] [						;) wormhole generator
	print "rigging"
	rigged?: yes
	r: make-face 'rich-text
	r/size/x: -1					;) has to be negative
	size-text r						;) ends here
	quit							;) never reached
]

view [								;) somehow simple forever [try/all []] is not enough
	field rate 3 on-time [
		wrap [print "heartbeat"]
		wrap [rig]
		; unless rigged? [wrap [rig]]
	]
]
```
`wrap` function is supposed to finish normally regardless of what happens. However it never does, so every call of it leaves `stack` in an invalid state.

It then crashes on closing the view:
```
IN 1
heartbeat

OUT 1
IN 1
rigging
IN 2
heartbeat

OUT 2
IN 2
rigging
IN 3
heartbeat

OUT 3
IN 3
rigging
IN 4
heartbeat

OUT 4
IN 4
rigging

*** Runtime Error 95: no CATCH for THROW
*** at: 0041E0B5h
```

**Expected behavior**

`quit` should be reached:
```
IN 1
heartbeat

OUT 1
IN 1
rigging
```

If we comment `quit` out then:
```
IN 1
heartbeat

OUT 1
IN 1
rigging
0x0       ;) or some other pair
OUT 1

(repeats 3 times per sec)
```

**Platform version**
```
Red 0.6.4 for Windows built 18-Mar-2021/22:28:01+03:00  commit #73d9bd2
```



Comments:
--------------------------------------------------------------------------------

On 2021-05-11T11:59:46Z, hiiamboris, commented:
<https://github.com/red/red/issues/4897#issuecomment-838348319>

    I intentionally left the longer snippet above, as it looks like it highlights a problem with Red interpreter itself. @dockimbel 
    
    However it can be allowed to crash to see the size-text issue (@qtxie):
    ```
    Red []
    recycle/off					
    
    r: make-face 'rich-text
    r/size/x: -1					;) has to be negative
    size-text r						;) ends here
    ```
    ```
    *** Runtime Error 1: access violation
    *** in file: /D/devel/red/red-src/red/modules/view/backends/windows/text-box.reds
    *** at line: 220
    ***
    ***   stack: gui/OS-text-box-metrics 02CF2398h 0295BF3Ch 3
    ***   stack: ctx||445~text-box-metrics 0295BF2Ch 0295BF3Ch 3
    ***   stack: size-text
    ***   stack: red/_function/call 0295BEACh 00EE3884h
    ***   stack: red/interpreter/eval-code 02A43CB8h 02CEC2D0h 02CEC3C0h false 00000000h 00000000h 02A43CB8h
    ***   stack: red/interpreter/eval-expression 02CEC2C0h 02CEC3C0h false false false
    ***   stack: red/interpreter/eval 0295BE8Ch true
    ***   stack: red/natives/catch* true 1
    ***   stack: ctx||548~try-do 00F01D58h
    ***   stack: ctx||548~launch 00F01D58h
    ***   stack: ctx||566~launch 00F017F4h
    ```

--------------------------------------------------------------------------------

On 2021-05-11T12:08:08Z, hiiamboris, commented:
<https://github.com/red/red/issues/4897#issuecomment-838359683>

    Other issues where `95: no CAT for THROW` appears (may be somewhat related): 
    https://github.com/red/red/issues/4547 https://github.com/red/red/issues/4497#issuecomment-639074552 https://github.com/red/red/issues/4375 https://github.com/red/red/issues/4323#issuecomment-819673337 https://github.com/red/red/issues/4319#issuecomment-631968841

--------------------------------------------------------------------------------

On 2021-05-12T19:50:04Z, greggirwin, commented:
<https://github.com/red/red/issues/4897#issuecomment-840052945>

    Nice research. :+1:

--------------------------------------------------------------------------------

On 2021-09-28T01:10:21Z, qtxie, commented:
<https://github.com/red/red/issues/4897#issuecomment-928553588>

    I'll close it as the size-text issue has been fixed.

