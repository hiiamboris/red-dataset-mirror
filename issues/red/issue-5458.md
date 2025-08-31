
#5458: float-test.red fails if run twice due to system/words/pi being overwritten
================================================================================
Issue is closed, was reported by PeterWAWood and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5458>

**Describe the bug**
```
>> pi
== 3.141592653589793
>> do %float-test.red
~~~started test~~~ float
~~~finished test~~~  float
  Number of Tests Performed:      623
  Number of Assertions Performed: 1793
  Number of Assertions Passed:    1793
  Number of Assertions Failed:    0

== 623
>> do %float-test.red
~~~started test~~~ float
===group=== trigonometric function
--test-- float-cosine-3 FAILED**************
~~~finished test~~~  float
  Number of Tests Performed:      623
  Number of Assertions Performed: 1793
  Number of Assertions Passed:    1792
  Number of Assertions Failed:    1
****************TEST FAILURES****************

== 1246
>> pi
== 3.14159265358979
>> 0.0 = cosine/radians pi / 2
== false
>> pi: 3.141592653589793
== 3.141592653589793
>> 0.0 = cosine/radians pi / 2
== true
```

The issue appears to be caused by tests in the Float-Locals group which overwrite `pi`.

**To reproduce**
Run float-test.red twice in the same console session

**Expected behavior**
The tests should not overwrite the "builtin" pi. 

**Platform version**
```
-----------RED & PLATFORM VERSION-----------
RED: [ branch: "master" tag: #v0.6.4 ahead: 5075 date: 22-Dec-2023/9:07:34 commit: #6cb7d502bcbfae8b00630adee6561909eee2b478 ]
PLATFORM: [ name: "Raspbian GNU/Linux 11 (bullseye)" OS: 'Linux arch: 'aarch64 version: 6.1.21 build: "#1642 SMP PREEMPT Mon Apr  3 17:24:16 BST 2023" ]
--------------------------------------------
```


