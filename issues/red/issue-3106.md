
#3106: red hangs up trying to display/format some numbers
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3106>

Simply entering 0.0016849578929099 into the interpreter causes the bug.
Initially found by this script, though it's obviously a matter of luck:
```
Red []

bc: 1.0
ac: 1.0
th: 1e-3

data: []
repeat i 1000 [append data  (0.1 * (sine 360.0 * i / 100) + 1.0)]

foreach p data [
	bw: bc * 1.0
	aw: ac * p
	wdev: bw - aw
	abswdev: either wdev < 0 [negate wdev][wdev]
	if abswdev > th [
		am: 0.5 * (ac - (bc / p))
		bc: bc + am
		print "let's try"
		probe am
		print "got here again"
		ac: ac - (am / p)
	]
]
```
### Red version and build date, operating system with version.
0.62, 0.63, 10nov17-6413a38 on w7 x64 6.1.7601



Comments:
--------------------------------------------------------------------------------

On 2017-11-11T23:35:02Z, greggirwin, commented:
<https://github.com/red/red/issues/3106#issuecomment-343702008>

    Problem range seems to be:
    ```
    0.0099999999999999
    0.0009999999999999
    ```
    and the number has to end with at least 2 9s as the last digits.

--------------------------------------------------------------------------------

On 2017-11-12T00:29:30Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3106#issuecomment-343704686>

    The issue seems to be in the runtime as the following program will hang when compiled and run:
    ```text
    Red []
    probe 0.0016849578929099
    ``` 

--------------------------------------------------------------------------------

On 2017-11-12T00:33:04Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3106#issuecomment-343704832>

    No problem with Red/System. The following code runs correctly.
    
    ```test
    Red/System []
    print [0.0016849578929099 lf]
    ```

--------------------------------------------------------------------------------

On 2017-11-12T00:51:47Z, greggirwin, commented:
<https://github.com/red/red/issues/3106#issuecomment-343705628>

    My guess is that it's in https://github.com/red/red/blob/master/runtime/datatypes/float.reds#L84 as that is where the Red float! gets formed, and has simple `until` checks.

