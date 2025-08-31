
#3799: [CRASH] in set-many inside a reactor
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3799>

**Describe the bug**

Requires 4+ words at once:
```
r: make reactor! [
	d: i: e: !: none
	set [d i e !] 1
]
```
```
*** Runtime Error 1: access violation                                                                   
*** in file: /D/devel/red/red-src/red/runtime/datatypes/series.reds                                     
*** at line: 330                                                                                        
***                                                                                                     
***   stack: red/_series/pick 02B80494h 4 00000000h                                                     
***   stack: red/natives/set-many 02B80494h 02B804A4h 4 false false                                     
***   stack: red/natives/set* false -1 -1 -1 -1                                                         
***   stack: red/interpreter/eval-arguments 02C7F8E4h 02ED8268h 02ED8268h 00000000h 00000000h           
***   stack: red/interpreter/eval-code 02C7F8E4h 02ED8248h 02ED8268h false 00000000h 00000000h 02C7F8E4h
***   stack: red/interpreter/eval-expression 02ED8248h 02ED8268h false false false                      
***   stack: red/interpreter/eval 02B80454h false                                                       
***   stack: red/object/make 02B80444h 02B80454h 32                                                     
***   stack: red/actions/make 02B80444h 02B80454h                                                       
***   stack: red/actions/make*                                                                          
***   stack: red/interpreter/eval-arguments 02C7FC44h 02ED7E10h 02ED7E10h 00000000h 00000000h           
***   stack: red/interpreter/eval-code 02C7FC44h 02ED7DF0h 02ED7E10h true 00000000h 00000000h 02C7FC44h 
***   stack: red/interpreter/eval-expression 02ED7DF0h 02ED7E10h false true false                       
***   stack: red/interpreter/eval-expression 02ED7DE0h 02ED7E10h false false false                      
***   stack: red/interpreter/eval 02B80404h true                                                        
***   stack: red/natives/catch* true 1                                                                  
***   stack: ctx474~try-do 003F1C00h                                                                    
***   stack: ctx474~do-command 003F1C00h                                                                
***   stack: ctx474~switch-mode 003F1C00h                                                               
***   stack: ctx474~eval-command 003F1C00h                                                              
***   stack: ctx474~run 003F1C00h                                                                       
***   stack: ctx474~launch 003F1C00h                                                                    
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 5-Mar-2019/0:09:36+03:00 commit #53b5b37
```



Comments:
--------------------------------------------------------------------------------

On 2019-03-04T23:45:31Z, hiiamboris, commented:
<https://github.com/red/red/issues/3799#issuecomment-469473686>

    Found a 3-word variant (2nd block contents don't matter):
    ```
    r: make reactor! [
    	d: i: e: none
    	set [d i e] []
    ]
    ```
    ```
    *** Runtime Error 1: access violation                                                                   
    *** in file: /D/devel/red/red-src/red/runtime/datatypes/series.reds                                     
    *** at line: 330                                                                                        
    ***                                                                                                     
    ***   stack: red/_series/pick 02CC03E4h 3 00000000h                                                     
    ***   stack: red/natives/set-many 02CC03D4h 02CC03E4h 3 false false                                     
    ***   stack: red/natives/set* false -1 -1 -1 -1                                                         
    ***   stack: red/interpreter/eval-arguments 02DBF8E4h 02F8982Ch 02F8982Ch 00000000h 00000000h           
    ***   stack: red/interpreter/eval-code 02DBF8E4h 02F8980Ch 02F8982Ch false 00000000h 00000000h 02DBF8E4h
    ***   stack: red/interpreter/eval-expression 02F8980Ch 02F8982Ch false false false                      
    ***   stack: red/interpreter/eval 02CC0394h false                                                       
    ***   stack: red/object/make 02CC0384h 02CC0394h 32                                                     
    ***   stack: red/actions/make 02CC0384h 02CC0394h                                                       
    ***   stack: red/actions/make*                                                                          
    ***   stack: red/interpreter/eval-arguments 02DBFC44h 02F88800h 02F88800h 00000000h 00000000h           
    ***   stack: red/interpreter/eval-code 02DBFC44h 02F887E0h 02F88800h true 00000000h 00000000h 02DBFC44h 
    ***   stack: red/interpreter/eval-expression 02F887E0h 02F88800h false true false                       
    ***   stack: red/interpreter/eval-expression 02F887D0h 02F88800h false false false                      
    ***   stack: red/interpreter/eval 02CC0344h true                                                        
    ***   stack: red/natives/catch* true 1                                                                  
    ***   stack: ctx474~try-do 003F1C00h                                                                    
    ***   stack: ctx474~launch 003F1C00h                                                                    
    ```

--------------------------------------------------------------------------------

On 2019-03-05T00:19:51Z, hiiamboris, commented:
<https://github.com/red/red/issues/3799#issuecomment-469481621>

    #3800 hints that the crash reason might lie in `on-change*` and `on-deep-change*` funcs.

--------------------------------------------------------------------------------

On 2019-03-14T16:39:44Z, dockimbel, commented:
<https://github.com/red/red/issues/3799#issuecomment-472954194>

    Crash was caused by corrupted stack frame, as `set` can internally trigger object events (in case of reactors like here), and the event handler call in `natives/set-many` insufficiently protects the current stack frame.

