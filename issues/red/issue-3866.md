
#3866: [Regression, Compiler] A failed type check results in a crash in compiled code
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[type.bug]
<https://github.com/red/red/issues/3866>

**Describe the bug**

Consider the following snippet (any mismatch between accepted types of `x` and the actual argument works the same, not just string!/integer!)
```
Red []
f: func [x [string!]][probe x]
f 1
```

It was working at some point, but now it crashes when compiled (I did with `-r -d`):

Build Dec 07, 2018:
```
*** Script Error: f does not allow integer! for its x argument
*** Where: f
*** Stack: f
```
Build Dec 18, 2018:
```
*** Runtime Error 1: access violation
*** at: 0043672Bh                    
```
Build Dec 30, 2018 (and including any build up to the current - May 01, 2019):
```
*** Runtime Error 1: access violation                        
*** in file: /D/devel/red/red-src/red/datatypes/object.reds  
*** at line: 97                                              
***                                                          
***   stack: red/object/rs-select 029DD604h 03890A28h        
***   stack: red/error/reduce 029DD624h 029DD604h            
***   stack: red/error/form 029DD604h 029DD614h 029DD5F4h -18
***   stack: red/actions/form 029DD604h 029DD614h 029DD5F4h 0
***   stack: red/actions/form* -1                            
***   stack: red/natives/prin* false                         
***   stack: red/natives/print* false                        
***   stack: red/stack/throw-error 029DD634h                 
***   stack: red/fire 1 0018FF10h                            
***   stack: red/type-check 029CDB14h 0 029DD604h            
***   stack: f                                               
```

**Expected behavior**

Should work like the Dec 07 build did.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 22-Apr-2019/19:40:30+03:00 commit #9ac4430
```



Comments:
--------------------------------------------------------------------------------

On 2019-05-09T15:34:04Z, hiiamboris, commented:
<https://github.com/red/red/issues/3866#issuecomment-490954192>

    After some research I've come to a conclusion that the source of this bug is the same as in the other issues mentioned in https://github.com/red/red/pull/3781 - commit https://github.com/red/red/commit/4414d6473cfea80aecf32c6b8aa5ee99b161715d of Dec 11

