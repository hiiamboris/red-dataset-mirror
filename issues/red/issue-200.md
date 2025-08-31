
#200: quick-test does not highlight runtime failures
================================================================================
Issue is closed, was reported by PeterWAWood and has 2 comment(s).
[type.bug]
<https://github.com/red/red/issues/200>

When running tests which result in runtime failures, quick-test does not highlight them. This is the output from two tests which both encountered runtime failures.

Summary output:

```
Red/System - Float Partial Tests

ok - float..............................0 / 0
ok - float-lib-auto.....................0 / 0

ok - Red/System - Float Partial Tests...0 / 0
       in 0:00:00.558568 

```

Console log:

```
***Starting***Red/System - Float Partial Tests
~~~started test~~~ float

===group=== float assignment
--test-- float-2 FAILED**************
--test-- float-3 FAILED**************
--test-- float-4 FAILED**************

*** Runtime Error 9: float invalid operation
*** at: 000025A2h

~~~started test~~~ library - float

*** Runtime Error 101: no value matched in SWITCH
*** at: 00001A4Fh


***Finished*** Red/System - Float Partial Tests
No of tests   0
No of asserts 0
Passed        0
Failed        0

```



Comments:
--------------------------------------------------------------------------------

On 2012-01-20T11:31:28Z, PeterWAWood, commented:
<https://github.com/red/red/issues/200#issuecomment-3582263>

    Now produces 
    
    ```
    
    Red/System - Float Partial Tests
    
    ** - float******************************0 / 1 **
    ** - float-lib-auto*********************0 / 1 **
    
    ** - Red/System - Float Partial Tests***0 / 2 **
           in 0:00:00.562424 
    
    ```

