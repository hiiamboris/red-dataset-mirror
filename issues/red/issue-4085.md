
#4085: debug console builds crash on empty sets
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4085>

**Describe the bug**
```
>> unique ""                                                                                            
                                                                                                        
*** Runtime Error 98: assertion failed                                                                  
*** in file: /d/devel/red/red-src/red/runtime/allocator.reds                                            
*** at line: 898                                                                                        
***                                                                                                     
***   stack: red/alloc-series-buffer 98 4352366 43326132                                                
***   stack: red/alloc-series-buffer 0 1 0                                                              
***   stack: red/alloc-series 0 1 0                                                                     
***   stack: red/string/rs-make-at 029515E4h 0                                                          
***   stack: red/string/do-set-op false 029515C4h 8                                                     
***   stack: red/natives/do-set-op -1 -1 8                                                              
***   stack: red/natives/unique* false -1 -1                                                            
***   stack: red/interpreter/eval-arguments 02A50724h 02C40AE8h 02C40AE8h 00000000h 00000000h           
***   stack: red/interpreter/eval-code 02A50724h 02C40AD8h 02C40AE8h false 00000000h 00000000h 02A50724h
***   stack: red/interpreter/eval-expression 02C40AD8h 02C40AE8h false false false                      
***   stack: red/interpreter/eval 029515A4h true                                                        
***   stack: red/natives/catch* true 1                                                                  
***   stack: ctx||513~try-do 003F0934h                                                                  
***   stack: ctx||513~do-command 003F0934h                                                              
***   stack: ctx||513~eval-command 003F0934h                                                            
***   stack: ctx||513~run 003F0934h                                                                     
***   stack: ctx||513~launch 003F0934h                                                                  
***   stack: ctx||530~launch 003F0488h                                                                  
```
Any set operation with an empty string does, or `union` with both strings empty.

**Expected behavior**

No crash.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 1-Oct-2019/19:41:56+03:00 commit #297665
```



Comments:
--------------------------------------------------------------------------------

On 2020-05-18T12:48:31Z, qtxie, commented:
<https://github.com/red/red/issues/4085#issuecomment-630160129>

    Fixed in commit 18ccd920820e7a1f7aa8cf1be0a7449c11421d23 .

