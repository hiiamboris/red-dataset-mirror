
#2482: Compiled `loop` doesn't complain about wrong argument type
================================================================================
Issue is closed, was reported by x8x and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2482>

Lets have `test.red` with:
```red
Red []

f: function [][
	c: 0
	loop "hello" [
		prin 1
		c: c + 1
		if c > 10 [quit]
	]
]
f 
```

Now, run it interpreted:
```
  % red test.red
*** Script Error: loop does not allow string! for its count argument
*** Where: loop
```
Error as expected.

Now compile it with `red -c -r test.red` and run it:
```
  % ./test
11111111111
```
Compiled, `loop` doesn't complain about the wrong argument type and would run indefinitely.


