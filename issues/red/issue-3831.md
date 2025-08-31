
#3831: [Crash] In compiled (even embedded) code involving invalid loops
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
<https://github.com/red/red/issues/3831>

**Describe the bug**

Source script 1.red:
`Red [] repeat x none []`

```
> red 1.red
*** Script Error: repeat does not allow none! for its value argument
*** Where: repeat
*** Stack:

> red -r -e -d 1.red & 1.exe
root size: 2169, root max: 4139, cycles: 0
root size: 2169, root max: 4139, cycles: 1
root size: 2169, root max: 4139, cycles: 2

*** Runtime Error 1: access violation
*** in file: /D/devel/red/mindmap/datatypes/object.reds
*** at line: 97
***
***   stack: red/object/rs-select 0279D434h 035AD718h
***   stack: red/error/reduce 0279D454h 0279D434h
***   stack: red/error/form 0279D434h 0279D444h 0279D424h -18
***   stack: red/actions/form 0279D434h 0279D444h 0279D424h 0
***   stack: red/actions/form* -1
***   stack: red/natives/prin* false
***   stack: red/natives/print* false
***   stack: red/stack/throw-error 0279D494h
***   stack: red/fire 1 0018FDC0h
***   stack: red/interpreter/eval-arguments 028A0314h 0294C384h 0294C394h 00000000h 00000000h
***   stack: red/interpreter/eval-code 028A0314h 0294C364h 0294C394h false 00000000h 00000000h 028A0314h
***   stack: red/interpreter/eval-expression 0294C364h 0294C394h false false false
***   stack: red/interpreter/eval 0279D434h true
***   stack: red/natives/do* true -1 -1 -1
````

Source script 2.red:
`Red [] loop none []`

```
> red 2.red
*** Script Error: loop does not allow none! for its count argument
*** Where: loop
*** Stack:

> red -r -e -d 2.red & 2.exe
root size: 2169, root max: 4139, cycles: 0                                                              
root size: 2169, root max: 4139, cycles: 1                                                              
root size: 2169, root max: 4139, cycles: 2                                                              
                                                                                                        
*** Runtime Error 1: access violation                                                                   
*** in file: /D/devel/red/mindmap/datatypes/object.reds                                                 
*** at line: 97                                                                                         
***                                                                                                     
***   stack: red/object/rs-select 0264D434h 034FD718h                                                   
***   stack: red/error/reduce 0264D454h 0264D434h                                                       
***   stack: red/error/form 0264D434h 0264D444h 0264D424h -18                                           
***   stack: red/actions/form 0264D434h 0264D444h 0264D424h 0                                           
***   stack: red/actions/form* -1                                                                       
***   stack: red/natives/prin* false                                                                    
***   stack: red/natives/print* false                                                                   
***   stack: red/stack/throw-error 0264D484h                                                            
***   stack: red/fire 1 0018FDC0h                                                                       
***   stack: red/interpreter/eval-arguments 02750304h 027FC374h 027FC384h 00000000h 00000000h           
***   stack: red/interpreter/eval-code 02750304h 027FC364h 027FC384h false 00000000h 00000000h 02750304h
***   stack: red/interpreter/eval-expression 027FC364h 027FC384h false false false                      
***   stack: red/interpreter/eval 0264D434h true                                                        
***   stack: red/natives/do* true -1 -1 -1                                                              
```

and so on

**Expected behavior**

`-e` option should follow interpreted behavior.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 25-Mar-2019/13:11:08+03:00 commit #e6c96aa
```



