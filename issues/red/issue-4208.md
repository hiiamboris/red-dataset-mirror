
#4208: [R/S] crashes when access nested struct value
================================================================================
Issue is closed, was reported by qtxie and has 2 comment(s).
[status.built] [status.tested] [type.bug] [Red/System] [test.written]
<https://github.com/red/red/issues/4208>

**To reproduce**
Compile and run the following code:
```
Red/System []

RECT_F!: alias struct! [
	left	[float32!]
	top	[float32!]
	right	[float32!]
	bottom	[float32!]
]

D2D1_IMAGE_BRUSH_PROPERTIES: alias struct! [
	sourceRectangle	[RECT_F! value]
	extendModeX	[integer!]
	extendModeY	[integer!]
	interpolationMode [integer!]
]

testss: func [/local props [D2D1_IMAGE_BRUSH_PROPERTIES value]][
	probe "start"
	props/sourceRectangle/left: as float32! 2
	probe "end"
]

testss
```
Got error::
```
start

*** Runtime Error 1: access violation
*** at: 00402218h
```
**Expected behavior**
No crashes.

**Platform version (please complete the following information)**
```
Latest commit in master branch. Win 7 64bit.
```



Comments:
--------------------------------------------------------------------------------

On 2020-11-10T03:14:19Z, bitbegin, commented:
<https://github.com/red/red/issues/4208#issuecomment-724421964>

    ```
    Red/System []
    
    STRUCT_F!: alias struct! [
    	n	[integer!]
    	f	[float32!]
    ]
    
    STRUCT_N!: alias struct! [
    	f	[STRUCT_F! value]
    ]
    x: as float32! 2
    testxx: func [/local props [STRUCT_N! value]][
    	probe "a"
    	props/f/n: 2
    	probe "b"
    	props/f/f: x
    	probe "c"
    	props/f/f: as float32! 2
    	probe "d"
    ]
    
    testyy: func [/local props [STRUCT_F! value]][
    	probe "x"
    	props/n: 2
    	probe "y"
    	props/f: x
    	probe "z"
    	props/f: as float32! 2
    	probe "w"
    ]
    
    testyy
    
    testxx
    ```
    
    ```
    x
    y
    z
    w
    a
    b
    c
    
    *** Runtime Error 1: access violation
    *** in file: /D/vmware/focal-share/red/struct-access.reds
    *** at line: 18
    ***
    ***   stack: testxx
    ```

