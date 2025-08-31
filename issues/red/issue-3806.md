
#3806: Debug prints are being output to the run-all quick-test.log file
================================================================================
Issue is closed, was reported by PeterWAWood and has 6 comment(s).
<https://github.com/red/red/issues/3806>

**Describe the bug**
``` text
~~~started test~~~ run-all-comp1





1
1
2
1
 -->
   match: ["1" to end] 
   input: "12345678"   
   ==> matched
   match: [to end] 
   input: "2345678"   
   -->
     ==> not matched
   <--
   match: [to end] 
   input: "345678"   
   ==> not matched
 <--
 match: [to end] 
input: "45678" 
 ==> not matched
 <--
 match: [to end] 
input: "5678" 
 ==> not matched
 <--
 match: [to end] 
input: "678" 
 ==> not matched
 <--
 match: [to end] 
input: "78" 
 ==> not matched
 <--
 match: [to end] 
input: "8" 
 ==> not matched
 <--
 match: [to end] 
input: "" 
 ==> matched
 <--
 <--
return: true
1
integer
a1807: 1
func []['MD5]
~~~finished test~~~  run-all-comp1
  Number of Tests Performed:      2254
  Number of Assertions Performed: 4592
  Number of Assertions Passed:    4592
  Number of Assertions Failed:    0
```

**To reproduce**
Run the Red tests.


**Expected behavior**

```text
~~~started test~~~ run-all-comp1
~~~finished test~~~  run-all-comp1
  Number of Tests Performed:      2254
  Number of Assertions Performed: 4592
  Number of Assertions Passed:    4592
  Number of Assertions Failed:    0
```

**Platform version (please complete the following information)**
```text
>> about
Red 0.6.4 for macOS built 8-Mar-2019/13:50:57+08:00
```



Comments:
--------------------------------------------------------------------------------

On 2019-03-12T18:59:46Z, dockimbel, commented:
<https://github.com/red/red/issues/3806#issuecomment-472137806>

    For the integer values, I don't know. For the rest, it's the verbose output from `parse-trace`.

--------------------------------------------------------------------------------

On 2019-03-13T03:45:49Z, PeterWAWood, commented:
<https://github.com/red/red/issues/3806#issuecomment-472268468>

    I have commented out the tests that were producing console output. They need to be reformulated.

--------------------------------------------------------------------------------

On 2019-05-15T14:37:40Z, dockimbel, commented:
<https://github.com/red/red/issues/3806#issuecomment-492682623>

    I am closing this ticket now, feel free to re-open it if needed.

