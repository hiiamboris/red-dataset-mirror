
#4726: R/S struct tests #3999-D and #3999-F are silently failing on Mac
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [test.written]
<https://github.com/red/red/issues/4726>

**Describe the bug**

The callbacks return NaNs, instead of `23.0`.

**To reproduce**

Let's modify the `struct-test.reds`:
https://github.com/red/red/blob/2efa09a7313f1f63192d675775b24bbe9d8b7f77/system/tests/source/units/struct-test.reds#L1133-L1134
and
https://github.com/red/red/blob/2efa09a7313f1f63192d675775b24bbe9d8b7f77/system/tests/source/units/struct-test.reds#L1153-L1154
we rewrite as:
```
		set_callback3999 as int-ptr! :callback-func-D
		x1: test_callback3999D
		probe x1
		dump-hex4 as int-ptr! :x1
		--assert (as-float32 23.0) = test_callback3999D
```
and
```
		set_callback3999 as int-ptr! :callback-func-F
		x2: test_callback3999F
		probe x2
		dump-hex4 as int-ptr! :x2
		--assert 23.0 = test_callback3999F
```
and then compile it with `-d` to get the output:
```
~~~started test~~~ struct!
nan.0

Hex dump from: 0000A8C4h

0000A8C4: FFC00000 41B80000  39393323 00452D39  ..??..?A#3999-E.
0000A8D4: 41B80000 39393323  00462D39 00000000  ..?A#3999-F.....
0000A8E4: 00000000 00000000  40370000 39393323  ..........7@#399
0000A8F4: 00472D39 00000000  40370000 35627673  9-G.......7@svb5
0000A904: 69250030 32302500  30250058 31005838  0.%i.%02X.%08X.1
0000A914: 614E232E 0000004E  00000000 00000000  .#NaN...........
0000A924: 00000000 20202020  20202020 20202020  ....            
0000A934: 20202020 20202020  20202020 2E672500              .%g.
nan.0

Hex dump from: 0000A8E0h

0000A8E0: 00000000 FFF80000  00000000 40370000  ......??......7@
0000A8F0: 39393323 00472D39  00000000 40370000  #3999-G.......7@
0000A900: 35627673 69250030  32302500 30250058  svb50.%i.%02X.%0
0000A910: 31005838 614E232E  0000004E 00000000  8X.1.#NaN.......
0000A920: 00000000 00000000  2E6E616E 20200030  ........nan.0.  
0000A930: 20202020 20202020  20202020 20202020                  
0000A940: 2E672500 2E250030  00673631 4E232E31  .%g.0.%.16g.1.#N
0000A950: 31004E61 4E49232E  312D0046 4E49232E  aN.1.#INF.-1.#IN
~~~finished test~~~ struct!
  Number of Tests Performed:      152
  Number of Assertions Performed: 571
  Number of Assertions Passed:    571
  Number of Assertions Failed:    0
```
as can be seen we get `FFC00000` and `FFF80000 00000000` returned, which are NaNs.

**Expected behavior**

float32 and float64 `23.0` should be returned

**Platform version**
```
Red 0.6.4 for Windows built 11-Nov-2020/5:05:03+03:00 commit #738c45d
```



Comments:
--------------------------------------------------------------------------------

On 2021-07-28T10:18:06Z, dockimbel, commented:
<https://github.com/red/red/issues/4726#issuecomment-888191848>

    Fixed by commit 47fb4c81ba09016a4f15fb280fe7ff3b77207027

