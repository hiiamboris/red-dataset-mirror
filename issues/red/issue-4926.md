
#4926: [R/S] EITHER returns wrong result after a function call
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4926>

**Describe the bug**

```
Red []
#system [
	i: as red-value! integer/push 420
	probe integer/get i
	probe as-float integer/get i
	f: either true [
		as-float integer/get i
	][
		3.1415
	]
	probe f
]
```
Output:
```
420
420
-1.#IND
```

**Expected behavior**

https://github.com/red/red/issues/2504 dismissed this feature, but now even the official documentation uses it:
![](https://i.gyazo.com/7c1cdead72c60085d6b4e7fe985b58ef.png)
So it must work properly.
Related: https://github.com/red/red/issues/1096 https://github.com/red/red/issues/3620

**Platform version**
```
Red 0.6.4 for Windows built 4-Jul-2021/2:04:09+03:00  commit #1e4fb1b
```



Comments:
--------------------------------------------------------------------------------

On 2021-07-23T11:24:23Z, dockimbel, commented:
<https://github.com/red/red/issues/4926#issuecomment-885573446>

    The R/S compiler is not emitting code for the inner `as-float`, as it does not see the `f:` assignment, because it is shadowed by `either`.

--------------------------------------------------------------------------------

On 2021-07-24T13:53:26Z, dockimbel, commented:
<https://github.com/red/red/issues/4926#issuecomment-886056889>

    Type-casting will now pass through `either`, `case` and `switch`.

