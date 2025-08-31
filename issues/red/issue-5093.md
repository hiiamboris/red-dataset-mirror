
#5093: Compiler doesn't always warn about uninitialized var usage
================================================================================
Issue is open, was reported by hiiamboris and has 6 comment(s).
[type.compiler]
<https://github.com/red/red/issues/5093>

**Describe the bug**

This produced a crash in `fire [TO_ERROR(...)]` for me until I found out the real cause was corruption of some memory cell left on the stack from some previous function calls

This script compiles and runs:
```
Red []

#system [
	cond: false
	fn: func [/local x [integer!]][
		if cond [x: 0]
		?? x
	]
	
	fn
]
```
Output:
```
D:\devel\red\red-src\red\environment>red -c 3.red

-=== Red Compiler 0.6.4 ===-

Compiling D:\devel\red\red-src\red\environment\3.red ...
...using libRedRT built on 3-Mar-2022/17:38:40
...compilation time : 40 ms

Target: MSDOS

Compiling to native code...
...compilation time : 1466 ms
...global words     : 11645 (35.40%)
...linking time     : 66 ms
...output file size : 81920 bytes
...output file      : D:\devel\red\red-src\red\environment\3.exe

D:\devel\red\red-src\red\environment>3
x: 3727360
```

**Expected behavior**

`*** Compilation Error: local variable x used before being initialized!`

**Platform version**
```
Red 0.6.4 for Windows built 22-Feb-2022/5:26:32+03:00  commit #8126da7
```



Comments:
--------------------------------------------------------------------------------

On 2022-03-05T17:05:15Z, dockimbel, commented:
<https://github.com/red/red/issues/5093#issuecomment-1059797698>

    That behavior has been changed several times. This currently mimics C semantics, where it's user's responsability to handle when/how each locals would be initialized. Making it more strict means that all variables would have to be set first at function's root level, no more first setting in `if`, `either`, `loop`, `while`, ...

--------------------------------------------------------------------------------

On 2022-03-05T17:06:14Z, hiiamboris, commented:
<https://github.com/red/red/issues/5093#issuecomment-1059797902>

    Could it be a *warning*, not an error?

--------------------------------------------------------------------------------

On 2022-03-05T17:07:41Z, dockimbel, commented:
<https://github.com/red/red/issues/5093#issuecomment-1059798133>

    Should be possible, I'll look into that.

