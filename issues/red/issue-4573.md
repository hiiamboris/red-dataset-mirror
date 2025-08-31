
#4573: Set operations with any-block! produce random results
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [type.bug] [test.written]
<https://github.com/red/red/issues/4573>

Originally discovered [here](https://github.com/red/red/issues/3195), where it is discussed that the design is suboptimal and not R2-compatible. It's however also bugged:

**Describe the bug**

```
intersect [[1] [2] [3] [4] [5]] [[3] [4] [5] [6] [7]]   => [42601 42548 13516 1335 0 0 0 0 0 0 0]         
intersect [(1) (2) (3) (4) (5)] [(3) (4) (5) (6) (7)]   => [42512 42138 13867 1483 0 0 0 0 0 0 0]         
intersect ["1" "2" "3" "4" "5"] ["3" "4" "5" "6" "7"]   => [0 0 0 100000 0 0 0 0 0 0 0]                   
union [[1] [2] [3] [4] [5]] [[3] [4] [5] [6] [7]]       => [0 0 0 0 0 0 0 78 2425 24512 72985]            
union [(1) (2) (3) (4) (5)] [(3) (4) (5) (6) (7)]       => [0 0 0 0 0 0 0 90 2485 24578 72847]            
union ["1" "2" "3" "4" "5"] ["3" "4" "5" "6" "7"]       => [0 0 0 0 0 0 0 100000 0 0 0]                   
difference [[1] [2] [3] [4] [5]] [[3] [4] [5] [6] [7]]  => [0 0 0 0 447 1499 6742 13862 27951 26868 22631]
difference [(1) (2) (3) (4) (5)] [(3) (4) (5) (6) (7)]  => [0 0 0 0 449 1456 6555 14092 28046 27098 22304]
difference ["1" "2" "3" "4" "5"] ["3" "4" "5" "6" "7"]  => [0 0 0 0 100000 0 0 0 0 0 0]                   
exclude [[1] [2] [3] [4] [5]] [[3] [4] [5] [6] [7]]     => [0 0 1424 13589 42278 42709 0 0 0 0 0]         
exclude [(1) (2) (3) (4) (5)] [(3) (4) (5) (6) (7)]     => [0 0 1405 13712 42352 42531 0 0 0 0 0]         
exclude ["1" "2" "3" "4" "5"] ["3" "4" "5" "6" "7"]     => [0 0 100000 0 0 0 0 0 0 0 0]                   
```

**To reproduce**
```
Red []

recycle/off
foreach op [intersect union difference exclude] [
	foreach [a b] [
		[[1][2][3][4][5]] [[3][4][5][6][7]]
		[(1)(2)(3)(4)(5)] [(3)(4)(5)(6)(7)]
		["1""2""3""4""5"] ["3""4""5""6""7"]
	][
		len: copy [0 0 0 0 0 0 0 0 0 0 0]
		oper: get op
		loop 100000 [i: length? r: oper copy/deep a copy/deep b len/(i + 1): len/(i + 1) + 1]
		print [mold op mold a mold b tab "=>" mold len]
	]
]
```

**Expected behavior**

String results are correct:
```
intersect ["1" "2" "3" "4" "5"] ["3" "4" "5" "6" "7"]   => [0 0 0 100000 0 0 0 0 0 0 0]                   
union ["1" "2" "3" "4" "5"] ["3" "4" "5" "6" "7"]       => [0 0 0 0 0 0 0 100000 0 0 0]                   
difference ["1" "2" "3" "4" "5"] ["3" "4" "5" "6" "7"]  => [0 0 0 0 100000 0 0 0 0 0 0]                   
exclude ["1" "2" "3" "4" "5"] ["3" "4" "5" "6" "7"]     => [0 0 100000 0 0 0 0 0 0 0 0]                   
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 28-Jun-2020/23:30:17+03:00 commit #b452716
```



