
#4546: [CRASH] In `make face!`/`make reactor!` that contains a cyclic reference
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4546>

Likely related to https://github.com/red/red/issues/4461

**Describe the bug**

`make face! [self2: self]`

Crashes with:
```
*** Runtime Error 19: stack error or overflow                      
*** in file: /D/devel/red/red-src/red-master/runtime/hashtable.reds
*** at line: 1761                                                  
***                                                                
***   stack: red/ownership/unbind 02DD3390h                        
***   stack: red/ownership/unbind 02DD3390h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
***   stack: red/ownership/unbind 02DD3520h                        
```

**Expected behavior**

No crash.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 15-Jun-2020/13:16:24
```



Comments:
--------------------------------------------------------------------------------

On 2021-04-24T16:06:43Z, hiiamboris, commented:
<https://github.com/red/red/issues/4546#issuecomment-826114798>

    Scenario with plain reactor:
    ```
    a: reactor [
    	b: object [c: self]
    	b: none
    ]
    ```
    Same stack trace.
    
    `self` is no culprit, as the same issue occurs in more complex example or 2 objects referencing each other:
    ```
    a: reactor [
    	b: object [c: none]
    	b/c: object [x: b]
    	b: none
    ]
    ```

