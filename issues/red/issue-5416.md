
#5416: [Draw] Unexpected speed difference between `pen off` and `line-width 0`
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [GUI]
<https://github.com/red/red/issues/5416>

**Describe the bug**

It turns out that shapes drawn with `line-width 0` are slower than with `pen off`:
- on W10 up to 9-10 times
- on GTK up to 3 times
```
-----------RED & PLATFORM VERSION-----------
RED: [ branch: "master" tag: #v0.6.4 ahead: 5035 date: 27-Oct-2023/7:22:30 commit: #d13526fb24e8cc4c36c7be7955d3644b97ca80c5 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
line-width 0
10.6 ms [draw i b1]
2.36 ms [draw i b2]
2.43 ms [draw i b3]
pen off
1.07 ms [draw i b1]
2.34 ms [draw i b2]
2.50 ms [draw i b3]

-----------RED & PLATFORM VERSION-----------
RED: [ branch: "master" tag: #v0.6.4 ahead: 5021 date: 10-Oct-2023/16:32:02 commit: #2a2ce39323f1832a00f599b54724e4e182e64cf5 ]
PLATFORM: [ name: "Ubuntu 20.04.1 LTS" OS: 'Linux arch: 'x86_64 version: 5.15.90 build: "#1 SMP Fri Jan 27 02:56:13 UTC 2023" ]
--------------------------------------------
line-width 0
2.83 ms [draw i b1]
5.89 ms [draw i b2]
5.99 ms [draw i b3]
pen off
825 μs  [draw i b1]
3.67 ms [draw i b2]
3.73 ms [draw i b3]
```

**To reproduce**

Run this script:
```
Red []

about/debug
by: make op! :as-pair
b1: [line-width 0 fill-pen black]
b2: [line-width 0 fill-pen black shape [line]]
b3: [line-width 0 fill-pen black shape []]
repeat i 1000 [
	h: random 100
	repend b1 ['box (i - 1 by 0) (i by h)]
	repend b2/shape [(i - 1 by 0) (i - 1 by h) (i by h) (i by 0)]
	repend b3/shape ['hline i - 1 'vline h 'hline i 'vline 0]
]
append b2/shape [close]
append b3/shape [close]

i: make image! 1000x100
;; test identicity of shapes:
; ? (draw copy i b1)
; ? (draw copy i b2)
; ? (draw copy i b3)
print "line-width 0"
clock/times [draw i b1] 1000
clock/times [draw i b2] 1000
clock/times [draw i b3] 1000
change b1 [pen off]
change b2 [pen off]
change b3 [pen off]
print "pen off"
clock/times [draw i b1] 1000
clock/times [draw i b2] 1000
clock/times [draw i b3] 1000
```

**Expected behavior**

Equally fast operation.




