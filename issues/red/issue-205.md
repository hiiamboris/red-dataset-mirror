
#205: Float expression corrupted when calling functions
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/205>

```
f1: function [
    return: [float!]
][
    1.0
]
f2: function [
    return: [float!]
][
    2.0
]

print [
    1.0 / 2.0  newline
    f1 / f2  newline
]
```

bash-4.0# ./test 
0.5
-nan3FF00000

Computing with function results corrupts the expression and anything following it.



Comments:
--------------------------------------------------------------------------------

On 2012-02-18T06:44:45Z, PeterWAWood, commented:
<https://github.com/red/red/issues/205#issuecomment-4032400>

    Using a returned float value directly in an expression causes a runtime error 9 when the return value is second in the expression but works when it is first. So:
    
    f1: function [return [float!]] [1.0]
    
    f1 \* 1.0 ;; okay
    1.0 \* f1 ;; runtime error
    
    I've added a few tests to float-test.reds & float32-test.reds to reflect this issue.

