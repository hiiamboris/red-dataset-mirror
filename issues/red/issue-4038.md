
#4038: [R/S] cast integer to float32 in math expression gives wrong result
================================================================================
Issue is closed, was reported by qtxie and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4038>

**Describe the bug**
Compile and run the following code.
```
Red/System []
RECT_F: alias struct! [
	left		[float32!]
	top			[float32!]
	right		[float32!]
	bottom		[float32!]
]

test: func [
	/local
		rc [RECT_F value]
][
	rc/right: as float32! 0.0
probe rc/right
	rc/right: rc/right + as float32! (1 + 2)
probe rc/right
]

test
```
Output: 
```
0.0
1.70374e+006.0           ;-- should be 3.0
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 19-Sep-2019/9:08:42+02:00
```



Comments:
--------------------------------------------------------------------------------

On 2019-09-19T07:24:28Z, qtxie, commented:
<https://github.com/red/red/issues/4038#issuecomment-533003531>

    Related issue: #3265

