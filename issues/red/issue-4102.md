
#4102: [R/S] ASSERT false doesn't work
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4102>

**Describe the bug**

The pattern `assert false` occurs some places in the Red sources.
But it's reversed:
```
Red/System [] 
              
assert false  
assert no     
print-line "1"
              
assert true   
print-line "2"
```
Outputs (with `-d`):
```
1                                           
                                            
*** Runtime Error 98: assertion failed      
*** in file: /D/devel/red/red-src/red/1.reds
*** at line: 8                              
***                                         
```
This applies only to constants `false` and `true`, not the comparison expressions.

**Expected behavior**

`assert false` should fail
`assert true` should not

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 18-Oct-2019/15:33:41+03:00 commit #ed913ef
```



