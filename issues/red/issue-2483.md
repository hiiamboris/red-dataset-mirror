
#2483: Compiled `repeat` crash when provided bad argument type
================================================================================
Issue is closed, was reported by x8x and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2483>

Lets have `test.red` with:
```red
Red []

f: function [][
	repeat n "hello" [
		prin 1
		if n > 10 [quit]
	]
]
f
```

Now, run it interpreted:
```
  % red test.red
*** Script Error: repeat does not allow string! for its value argument
*** Where: repeat
```
Error as expected.

Now compile it with `red -c -r test.red` and run it:
```
  % ./test
1
*** Runtime Error 1: access violation
*** at: 0002310Bh
```

May be related to issue https://github.com/red/red/issues/2482


