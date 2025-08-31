
#4875: Printing time! values gives odds results or crashes.
================================================================================
Issue is closed, was reported by hiiamboris and has 24 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4875>

**To reproduce**

Given this silly script:
```
Red []

cmp: routine [a [float!] b [float!] return: [integer!] /local r [integer!]] [
	print-wide [a b "^/"]
	loop 6 [
		r: compare-memory as byte-ptr! :a as byte-ptr! :b size? a
	]
	r
]

probe dt [probe cmp 1.0 1.0]
```
Let's change the number of iterations, then compile & run it..
**1. `loop 5` (or less than 5) prints something like:**
```
1 1
0
0:00:00
```
```
1 1
0
-0:00:00.0003531      ;) sometimes it returns a negative value!! and it's not a bug in dt
```
```
1 1
0
0:00:00.0005846
```

**2. `loop 6` prints:**

`-r` gives weird output in 60-70% cases when run:
```
>> red -r 1.red & 1.exe
1 1
0
0:00: e2147483647
```
```
1 1
0
-0:00: e2147483647             ;) looks like negative infinity
```
`-c` version crashes in ~30-40% cases:
```
>> red -c 1.red & 1.exe
1 1
0

*** Runtime Error 98: assertion failed
*** Cannot determine source file/line info.
***
```
**3. `loop 7` (or more) always prints:**
```
1 1
0
--2147483648:-2147483648:00
```

**Expected behavior**

Prints nonnegative small time value in the 3rd line

**Platform version**
```
Red 0.6.4 for Windows built 18-Mar-2021/22:28:01+03:00  commit #73d9bd2
```



Comments:
--------------------------------------------------------------------------------

On 2021-07-26T13:08:03Z, dockimbel, commented:
<https://github.com/red/red/issues/4875#issuecomment-886687328>

    Seems that `float/form-float` is producing an invalid string in some cases.

--------------------------------------------------------------------------------

On 2021-07-26T13:14:46Z, hiiamboris, commented:
<https://github.com/red/red/issues/4875#issuecomment-886692950>

    But how is it related to loop count?

--------------------------------------------------------------------------------

On 2021-07-26T13:23:46Z, dockimbel, commented:
<https://github.com/red/red/issues/4875#issuecomment-886700591>

    I think it's only indirectly related. The time difference depends on the amount of work done in the loop, but probably also on how the OS schedules the process (how much real CPU time is allocated). When the delta-time is measurable (> 0), but low enough, a close-to-zero float value is generated that seems to create an issue when serialized by our internal custom `dtoa()` implementation. 
    
    @qtxie It's a `dtoa` related issue (I get `e: -2147483648` after https://github.com/red/red/blob/master/runtime/dtoa.reds#L1907), please have a look.

--------------------------------------------------------------------------------

On 2021-07-27T02:29:07Z, qtxie, commented:
<https://github.com/red/red/issues/4875#issuecomment-887159598>

    In case  `loop 7 (or more)`:
    
    `platform/get-time` returns `NaN` which should not. https://github.com/red/red/blob/master/runtime/platform/win32.reds#L502
    @hiiamboris please have a look.

--------------------------------------------------------------------------------

On 2021-07-27T06:04:59Z, hiiamboris, commented:
<https://github.com/red/red/issues/4875#issuecomment-887235696>

    ```
    ...
    probe ["nano: " nano]
    		mi: as-float nano
    		mi: mi / 1e+9
    probe ["milli: " mi]
    		t: as-float h * 3600 + (m * 60) + sec
    		t: t + mi
    probe ["t: " t "^/"]
    		t
    ```
    Output:
    ```
    nano: 103918100
    milli: -1.#IND
    t: -1.#IND
    ```
    Well, what can I say?
    It's some compiler misbehavior obviously. #4937 or #4926 ?
    @dockimbel 

--------------------------------------------------------------------------------

On 2021-07-27T06:19:31Z, hiiamboris, commented:
<https://github.com/red/red/issues/4875#issuecomment-887243158>

    By the way, why `get-time` has `utc?` argument where it never uses it?

--------------------------------------------------------------------------------

On 2021-07-27T07:42:34Z, qtxie, commented:
<https://github.com/red/red/issues/4875#issuecomment-887287826>

    > By the way, why `get-time` has `utc?` argument where it never uses it?
    
    Don't remember... Maybe it's not implemented.

--------------------------------------------------------------------------------

On 2021-07-27T07:45:09Z, qtxie, commented:
<https://github.com/red/red/issues/4875#issuecomment-887289356>

    > ```
    > ...
    > probe ["nano: " nano]
    > 		mi: as-float nano
    > 		mi: mi / 1e+9
    > probe ["milli: " mi]
    > 		t: as-float h * 3600 + (m * 60) + sec
    > 		t: t + mi
    > probe ["t: " t "^/"]
    > 		t
    > ```
    
    If put the code in a simple R/S script, then it works fine.
    
    ```
    Red/System []
    
    nano: 103918100
    mi: as-float nano
    mi: mi / 1e+9
    ?? mi
    ```
    Ouput:
    ```
    mi: 0.1039181
    ```

--------------------------------------------------------------------------------

On 2021-07-27T08:00:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/4875#issuecomment-887298648>

    Yeah I also tried to isolate `get-time` from the runtime, but couldn't reproduce the issue this way.

--------------------------------------------------------------------------------

On 2021-07-27T11:02:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/4875#issuecomment-887417882>

    Finally.
    
    This is enough to reproduce it (`-c -d` and run):
    ```
    Red []
    
    #system [
    	gt: func [
    		return:  [float!]
    		/local
    			nano	[integer!]
    			mi		[float!]
    	][
    		probe "----------"
    		nano: 123
    		?? nano
    		mi: as-float nano
    		?? mi
    		mi: mi / 1e+9
    		?? mi
    		mi
    	]
    
    	f: func [a [float!] return: [integer!]] [
    		probe a
    		probe gt
    		loop 7 [size? a]
    		probe gt
    		0
    	]
    
    	f 1.0
    ]
    ```
    Output:
    ```
    1
    ----------
    nano: 123
    mi: 123
    mi: 1.23e-007
    1.23e-007
    ----------
    nano: 123
    mi: 123
    mi: -1.#IND
    -1.#IND
    ```
    
    As before, changing `Red []` to `Red/System []` makes the issue magically vanish.

--------------------------------------------------------------------------------

On 2021-07-28T15:44:18Z, dockimbel, commented:
<https://github.com/red/red/issues/4875#issuecomment-888416412>

    @hiiamboris It was a (R/S) compiler issue afterall. ;-)
    
    `size? a` was the guilty part. The compiler was wrongly generating code for loading `a` even though `size?` is statically evaluated by the compiler and replaced by a static integer value. Given that `a` was a float type, its value was pushed onto the x87 FPU stack, but never popped. That stack has a 7 slots limit. Running the loop 5 times was enough to leave only 2 slots free. When the [big float expression](https://github.com/red/red/blob/master/runtime/dtoa.reds#L874) is encountered in `dtoa` library, it requires 3 free slots on the FPU stack, which fails and results in producing a NaN value, which wreaks havoc in the rest of the code.
    
    Funny issue to debug! :man_facepalming:

--------------------------------------------------------------------------------

On 2021-07-28T16:59:38Z, greggirwin, commented:
<https://github.com/red/red/issues/4875#issuecomment-888469793>

    @dockimbel thanks for the writeup on it. I will add that to the new blog post. It shows the kind of things we (well, you) deal with.

