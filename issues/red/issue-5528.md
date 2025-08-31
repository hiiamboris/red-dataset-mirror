
#5528: #call causes crashes in some cases
================================================================================
Issue is open, was reported by qtxie and has 2 comment(s).
<https://github.com/red/red/issues/5528>

**To reproduce**
Steps to reproduce the behavior:
Create two files:

%ss.reds
```
Red/System []
_blk: as red-block! 0

test: func [
	blk [red-block!]
	/local
		p [red-value!]
][
	_blk: blk
	p: block/rs-head blk
	?? p
	#call [prin-value p]
	p: block/rs-head blk
	?? p
]
```
%test.red
```
Red []
blk: [1 2 3 4]

#system [
	#include %ss.reds
]
prin-value: func [val][
	prin val
]
test2: routine [
	blk [block!]
][
	test blk
]
test2 blk
```
Compiles `%test.red` and run it.
```
PS D:\EE\QW> .\test.exe
p: 055DC174
1
*** Runtime Error 1: access violation
*** at: 004330ACh
```

**Expected behavior**
No crashes

**Platform version**
Tested on Windows 11, master branch



Comments:
--------------------------------------------------------------------------------

On 2024-07-21T00:09:55Z, qtxie, commented:
<https://github.com/red/red/issues/5528#issuecomment-2241344058>

    It's related to `#include`. If inline the code in the `#system []` instead of `#include`, all works fine.

