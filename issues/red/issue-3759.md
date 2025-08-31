
#3759: `round/to .. integer!` is not always correct with `/floor` and `/ceiling` refinements
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/3759>

**Describe the bug**

```
>> foreach x [-2.4 -1.6 -1.4 -0.6 -0.4 -0.0 0.0 0.4 0.6 1.4 1.6 2.4] [
  print collect [keep copy [x]
    foreach s [1.0 2.0 1 2] [
      keep reduce ["^-" round/to/floor x s round/to/ceiling x s]
]]]
; x     /to 1.0         /to 2.0         /to 1   /to 2
-2.4 	-3.0 -2.0 	-4.0 -2.0 	-2 -2 	-2 -2
-1.6 	-2.0 -1.0 	-2.0 0.0 	-2 -2 	-2 -2
-1.4 	-2.0 -1.0 	-2.0 0.0 	-1 -1 	-2 0
-0.6 	-1.0 0.0 	-2.0 0.0 	-1 -1 	-2 0
-0.4 	-1.0 0.0 	-2.0 0.0 	0 0 	0 0
0.0 	0.0 0.0 	0.0 0.0 	0 0 	0 0
0.0 	0.0 0.0 	0.0 0.0 	0 0 	0 0
0.4 	0.0 1.0 	0.0 2.0 	0 0 	0 0
0.6 	0.0 1.0 	0.0 2.0 	1 1 	0 2
1.4 	1.0 2.0 	0.0 2.0 	1 1 	0 2
1.6 	1.0 2.0 	0.0 2.0 	2 2 	2 2
2.4 	2.0 3.0 	2.0 4.0 	2 2 	2 2
```

Results in the columns 2-3 are correct, but those in 4-5 aren't (they should be the same as in 2-3 but of integer type)

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 25-Jan-2019/6:49:24+03:00 commit #702ec38
```



Comments:
--------------------------------------------------------------------------------

On 2019-01-29T07:54:54Z, greggirwin, commented:
<https://github.com/red/red/issues/3759#issuecomment-458441434>

    Good catch. R2 and R3 both appear to be correct.

