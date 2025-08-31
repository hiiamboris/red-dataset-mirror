
#4787: [CRASH] on-deep-change* locals cannot point to itself & `local` corruption
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4787>

**Describe the bug**

Snippet 1:
```
?: func ['x] [print [x uppercase form type? x: get x tab mold/flat :x]]
o: make deep-reactor! [
	on-deep-change*: func [o w t a n i p /local x] [
		y: context? 'o
		; local: p: x: :y
		p: x: :y
		? y
		? p
		? x
		? local
	]
	x: []
	append x 1
]
```
Produces output:
```
y FUNCTION 	func [o w t a n i p /local x][y: context? 'o p: x: :y ? y ? p ? x ? local]
p FUNCTION 	func [o w t a n i p /local x][y: context? 'o p: x: :y ? y ? p ? x ? local]
x WORD 	x
local FUNCTION 	func ['x][print [x uppercase form type? x: get x tab mold/flat :x]]
y FUNCTION 	func [o w t a n i p /local x][y: context? 'o p: x: :y ? y ? p ? x ? local]
p FUNCTION 	func [o w t a n i p /local x][y: context? 'o p: x: :y ? y ? p ? x ? local]
x WORD 	x
local FUNCTION 	func ['x][print [x uppercase form type? x: get x tab mold/flat :x]]
```
Note:
(1) `x` does not point to `on-deep-change*` whereas `p` (also local) does, as well as global `y`
(2) `local` referring to `?` (???)

---
Snippet 2 (added `local: `):
```
?: func ['x] [print [x uppercase form type? x: get x tab mold/flat :x]]
o: make deep-reactor! [
	on-deep-change*: func [o w t a n i p /local x] [
		y: context? 'o
		local: p: x: :y
		? y
		? p
		? x
		? local
	]
	x: []
	append x 1
]
```
Crashes (3):
```
*** Runtime Error 1: access violation
*** Cannot determine source file/line info.
***
```


**Expected behavior**
```
y FUNCTION 	func [o w t a n i p /local x][y: context? 'o p: x: :y ? y ? p ? x ? local]
p FUNCTION 	func [o w t a n i p /local x][y: context? 'o p: x: :y ? y ? p ? x ? local]
x FUNCTION 	func [o w t a n i p /local x][y: context? 'o p: x: :y ? y ? p ? x ? local]
local FUNCTION 	func [o w t a n i p /local x][y: context? 'o p: x: :y ? y ? p ? x ? local]
(and again)
```
(1) `x` should point to on-deep-change
(2) `local` should point to on-deep-change
(3) no crash


**Platform version**
```
Red 0.6.4 for Windows built 20-Dec-2020/21:04:56+03:00 commit #7a6d9a9
```



Comments:
--------------------------------------------------------------------------------

On 2020-12-29T19:02:00Z, hiiamboris, commented:
<https://github.com/red/red/issues/4787#issuecomment-752206504>

    Related to https://github.com/red/red/issues/4543 and maybe https://github.com/red/red/issues/3804

--------------------------------------------------------------------------------

On 2020-12-31T17:48:21Z, hiiamboris, commented:
<https://github.com/red/red/issues/4787#issuecomment-753015076>

    Same corruption in `on-change*`:
    ```
    Red []
    
    o1: object [
    	on-change*: func [word old new] []		;) somehow this line triggers the corruption!
    ]
    
    o2: make o1 [
    	on-change*: function [word old new /local x] [
    		?? x
    		?? local
    		if all [none? x false = local] [print "OK"]
    	]
    	v: 0
    ]
    o2/v: 1
    ```
    Outputs:
    ```
    x: func [
        "Prints a word and the value it refers to (molded)" 
        'value [word! path!]
    ][
        prin mold :value 
        prin ": " 
        print either value? :value [mold get/any :value] ["unset!"]
    ]
    local: none
    *** Script Error: x is missing its then-blk argument
    *** Where: x
    *** Stack: on-change* none? 
    ```
    Expected:
    ```
    x: none
    local: false
    OK
    ```
    Note that even without the first `on-change*` it prints `local: none` whereas expected `local: false`.

--------------------------------------------------------------------------------

On 2022-08-25T09:15:09Z, dockimbel, commented:
<https://github.com/red/red/issues/4787#issuecomment-1227000291>

    I spent about 4 hours analyzing this issue inside out and it helped me uncover several flaws in object events implementation, so I'll push some fixes about that later today.

