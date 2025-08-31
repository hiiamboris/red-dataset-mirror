
#5459: money-test.red is not re-runnable
================================================================================
Issue is open, was reported by PeterWAWood and has 0 comment(s).
<https://github.com/red/red/issues/5459>

**Describe the bug**
Test custom-3 in `money-test.red` is not re-runnable, causing a crash if it is run a second time.

```
>> do %money-test.red
~~~started test~~~ money
~~~finished test~~~  money
  Number of Tests Performed:      375
  Number of Assertions Performed: 1027
  Number of Assertions Passed:    1027
  Number of Assertions Failed:    0

== 1621
>> do %money-test.red
~~~started test~~~ money
===group=== currency list
--test-- custom-3 FAILED**************
*** Script Error: protected value or series - cannot modify
*** Where: do
*** Near :
*** Stack: do-file
```
The issue is that the test adds currency codes to the currency list, an operation that its not repeatable.

**To reproduce**
Run `money-test.red` twice in a single console session.

**Expected behavior**
The test should add currency codes that are known not to be in the current list or there should be a method to remove such "custom" currency codes from the list of currencies. 

**Platform version**
```
-----------RED & PLATFORM VERSION-----------
RED: [ branch: "master" tag: #v0.6.4 ahead: 5075 date: 22-Dec-2023/9:07:34 commit: #6cb7d502bcbfae8b00630adee6561909eee2b478 ]
PLATFORM: [ name: "Raspbian GNU/Linux 11 (bullseye)" OS: 'Linux arch: 'aarch64 version: 6.1.21 build: "#1642 SMP PREEMPT Mon Apr  3 17:24:16 BST 2023" ]
--------------------------------------------
```


