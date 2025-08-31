
#2511: Compile error with FUNCTION collecting final FUNC
================================================================================
Issue is open, was reported by greggirwin and has 6 comment(s).
[status.deferred] [type.compiler]
<https://github.com/red/red/issues/2511>

I've tried to narrow this down, and will see if I can reduce it more.
```
Red []

; 'func is OK. Has to do with 'function
my-func: function [][
	stack: copy []
	pop:  does [also  take back tail stack  cur-frame: last stack]
	; Seems returning this func is the issue. 
	emit: func [key val][cur-frame/:key: val]
	;none			; this is fine
	;emit: func [][] 		; this is fine
	;emit: 1 			; This is fine
]
```
```
-=== Red Compiler 0.6.2 ===- 

Compiling D:\Red\temp\help-compile.red ...
...compilation time : 919 ms

Target: MSDOS 

Compiling to native code...
*** Compilation Error: argument type mismatch on calling: red/set-path* 
*** expected: [struct! [
        header [integer!] 
        data1 [integer!] 
        data2 [integer!] 
        data3 [integer!]
    ]], found: [struct! [
        header [integer!] 
        ctx [pointer! [integer!]] 
        symbol [integer!] 
        index [integer!]
    ]] 
*** in file: %/D/Red/temp/help-compile.red 
*** in function: exec/f_emit
*** at line: 1 
*** near: [
    stack/unwind 
    stack/unwind-last 
    ctx/values: saved
]
```


Comments:
--------------------------------------------------------------------------------

On 2017-03-29T02:15:00Z, greggirwin, commented:
<https://github.com/red/red/issues/2511#issuecomment-289961289>

    Ah! Of course you see it after you post. Must be the set-path! in `emit`.

--------------------------------------------------------------------------------

On 2017-03-29T02:17:19Z, greggirwin, commented:
<https://github.com/red/red/issues/2511#issuecomment-289961658>

    This reproduces it as well:
    ```
    my-func: function [][
    	cur-frame: none
    	emit: func [key][cur-frame/:key: 1]
    ]
    ```

--------------------------------------------------------------------------------

On 2017-03-29T09:23:21Z, dockimbel, commented:
<https://github.com/red/red/issues/2511#issuecomment-290033663>

    Functions in functions compilation is not officially supported yet, the compiler can handle some simple cases, but not all of them for now. I plan to work on that when we'll get to HOF support.

