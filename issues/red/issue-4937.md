
#4937: [Compiler] Seemingly simple script results in some weird random errors
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.problem] [type.bug] [Red/System] [type.compiler]
<https://github.com/red/red/issues/4937>

**Describe the bug**
```
Red/System []

sum: func [
	ofs  [integer!]
	len  [integer!]
	return: [float!]
	/local r [float!] half [integer!]
][
	r: 0.0
	assert len <> 0
	either len = 1 [
		r: data/1
		; probe r
		assert r = r
		; probe r
	][
		half: len >>> 1
		r: (sum ofs        half)
		 + (sum ofs + half len - half)
	]
	r
]

n: 100
data: as float-ptr! allocate 8 * n
i: 0
while [i < n] [
	i: i + 1
	data/i: 1.0
]

probe sum 0 n
```

Output after compiled with `-r -d` and run:
```
*** Runtime Error 98: assertion failed
*** in file: /D/devel/red/red-src/red/2.reds
*** at line: 19
***
***   stack: sum 98 4206112
***   stack: sum 99 1
***   stack: sum 98 2
***   stack: sum 96 4
***   stack: sum 93 7
***   stack: sum 87 13
***   stack: sum 75 25
***   stack: sum 50 50
***   stack: sum 0 100
```
Notice 2 commented out `probe`s.
If we uncomment the 1st one output is:
```
...
1.0
1.0
-1.#IND
```
If we uncomment the 2nd one instead:
```
*** Runtime Error 98: assertion failed
*** in file: /D/devel/red/red-src/red/2.reds
*** at line: 14
***
***   stack: sum 98 4206112
***   stack: sum 99 1
***   stack: sum 98 2
***   stack: sum 96 4
***   stack: sum 93 7
***   stack: sum 87 13
***   stack: sum 75 25
***   stack: sum 50 50
***   stack: sum 0 100
```
Now we get assertion at line 14 to report NaN, where previously it reported line 19, but there's no assertion on line 19.

**Expected behavior**

Expected output: `100`

**Platform version**
```
Red 0.6.4 for Windows built 22-Jul-2021/20:44:06+03:00  commit #3c8d386
```



Comments:
--------------------------------------------------------------------------------

On 2021-07-26T17:01:50Z, hiiamboris, commented:
<https://github.com/red/red/issues/4937#issuecomment-886871453>

    No corruption seems to happen if I write:
    ```
    r: sum ofs half
    r: r + sum ofs + half len - half
    ```
    instead of 
    ```
    r: (sum ofs half) + (sum ofs + half len - half)
    ```

--------------------------------------------------------------------------------

On 2021-07-28T18:18:35Z, dockimbel, commented:
<https://github.com/red/red/issues/4937#issuecomment-888520841>

    It's an FPU stack overflow (specific issue with the x87 stack), which results in pushing a NaN instead of the right value.
    
    ![image](https://user-images.githubusercontent.com/411393/127375148-e37fcc3c-9ae7-4e2b-b043-dc11df6edd33.png)
    
    The recursive calls reflect on the FPU stack due to R/S convention of returning a float! result in `ST0` register in FPU (at `00402EC0`). The `faddp` and subsequent `fstp` instructions don't have the opportunity to pop the stack before a new recursion happens. So the deeper the recursion, the more slots are in use on the stack. So around recursion of depth 7, things start to go wild.
    
    If `n` is raised to 200 instead of 100 with `probe` and `assert` both commented, then the final result becomes `-1.#IND`. So the presence of `probe` and `assert` are just delaying the moment where the FPU stack overflows.
    
    > No corruption seems to happen if I write:
    ```
    r: sum ofs half
    r: r + sum ofs + half len - half
    ```
    
    Right, because it breaks the pattern of tying the recursion to the FPU stack usage (the FPU stack is not used anymore to hold the intermediary results, they are stored in `r` instead).
    
    There is nothing that can be done currently to improve that. Just avoid using such multiple-recursion patterns inside a math expression. We plan to move to SSE to handle floats at some point, so that issue (and all other x87 stack related issues) will then no longer exist.

--------------------------------------------------------------------------------

On 2021-07-28T18:38:56Z, hiiamboris, commented:
<https://github.com/red/red/issues/4937#issuecomment-888533470>

    Great explanation, thanks!

