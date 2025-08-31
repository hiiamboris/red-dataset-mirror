
#4887: [Draw] CRASH when drawing cyclic blocks
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [GUI]
<https://github.com/red/red/issues/4887>

**Describe the bug**
```
append/only b: [box 0x0 100x100 scale 0.9 0.9] b
draw 100x100 b
```
Output:
```
*** Runtime Error 19: stack error or overflow
*** Cannot determine source file/line info.
***
```

Two bugs here:
1. No stack trace
2. Draw doesn't handle cyclic scenarios

**Expected result**

Not sure.
I was trying to use this effect to produce infinity mirror effect.
Like what this manual solution does:
```
copy-deep-limit: function [b n] [
	n: n - 1
	either n >= 0 [
		also b: copy b
		forall b [if block? :b/1 [change/only b copy-deep-limit b/1 n]]
	][[]]
]
append/only b: [box 0x0 100x100 scale 0.95 0.95] b
b: copy-deep-limit b 200
? (draw 100x100 b)
```
![](https://i.gyazo.com/aa7c39810d422e44b8a2755022e2d9fa.png)

Possible options:
1. Internally draw could just stop from descending further when it hits a certain limit. Then we could use this to produce such fun graphics.
2. OTOH if no scaling is applied, it would draw the same thing over and over, simply slowing Draw down hundreds of times. And such cyclic block can as well be a bug, which we could help detect by throwing an error.

**Platform version**
```
Red 0.6.4 for Windows built 18-Mar-2021/22:28:01+03:00  commit #73d9bd2
```



Comments:
--------------------------------------------------------------------------------

On 2021-07-25T08:23:06Z, qtxie, commented:
<https://github.com/red/red/issues/4887#issuecomment-886165894>

    Throws an error after the fix.
    ```
    *** Internal Error: circular reference not allowed
    *** Where: draw-image
    *** Stack: draw
    ```

