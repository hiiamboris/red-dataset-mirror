
#5055: [R/S] modulo result is bigger than the divisor (ex-#1515)
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.dismissed] [type.bug] [Red/System]
<https://github.com/red/red/issues/5055>

**Describe the bug**

Compile & run the following script:
```
Red/System []

#import [
	LIBC-file cdecl [
	        fmod:       "fmod" [
            x           [float!]
            y           [float!]
            return:     [float!]
        ]
	]
]

x: 1e20
loop 21 [
	print-line [x " -> " x % 1e10 tab x // 1e10 tab fmod x 1e10]
	x: x * 10
]
```
It compares `%` `//` and `fmod`:
```
1e+020 -> 0.0   0.0     0.0
1e+021 -> 0.0   0.0     0.0
1e+022 -> 0.0   0.0     0.0
1e+023 -> 9.99161e+009  9.99161e+009    9.99161e+009
1e+024 -> 9.98322e+009  9.98322e+009    9.98322e+009
1e+025 -> 8.75849e+009  8.75849e+009    8.75849e+009
1e+026 -> 7.58486e+009  7.58486e+009    7.58486e+009
1e+027 -> 5.8486e+009   5.8486e+009     5.8486e+009
1e+028 -> 3.11974e+009  3.11974e+009    3.11974e+009
1e+029 -> 3.15086e+009  3.15086e+009    3.15086e+009
1e+030 -> 1.66198e+019  1.66198e+019    7.13648e+009
1e+031 -> 3.73488e+019  3.73488e+019    6.38812e+009
1e+032 -> 2.98927e+019  2.98927e+019    3.69491e+009
1e+033 -> 4.13014e+019  4.13014e+019    9.87043e+008
1e+034 -> 2.64671e+019  2.64671e+019    9.87043e+009
1e+035 -> 9.27851e+018  9.27851e+018    7.91798e+009
1e+036 -> 1.89981e+019  1.89981e+019    4.34155e+009
1e+037 -> 2.91818e+019  2.91818e+019    4.70984e+009
1e+038 -> 3.6217e+019   3.6217e+019     7.45317e+009
1e+039 -> 7.88637e+028  7.88637e+028    4.53175e+009
1e+040 -> 5.07673e+028  5.07673e+028    5.31748e+009
```
Ideally we want `0.0` result, but understandably, floating point precision imposes limitations on what is achievable. `fmod` guarantees `|result| < |divisor|`, while the operators do not.

Note: because of #5054 this won't compile in current builds and an older build (below) is required to reproduce the issue.

**Expected behavior**

Not worse than `fmod`.

**Platform version**

Compiles in `red-01jun19-66d20bd7.exe`




Comments:
--------------------------------------------------------------------------------

On 2022-01-26T11:18:14Z, hiiamboris, commented:
<https://github.com/red/red/issues/5055#issuecomment-1022103727>

    closing considering https://github.com/red/red/issues/5054#issuecomment-1021777378

