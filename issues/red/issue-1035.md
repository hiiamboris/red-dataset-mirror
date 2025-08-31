
#1035: Access uninitialized local word define in function will crash interpreter
================================================================================
Issue is closed, was reported by qtxie and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1035>

```
global-count: 0

global-count-inc: function [
    condition [logic!]
][
    if condition [global-count: global-count + 1]
]
global-count-inc true
```



Comments:
--------------------------------------------------------------------------------

On 2019-02-14T16:59:56Z, hiiamboris, commented:
<https://github.com/red/red/issues/1035#issuecomment-463705812>

    There's a recent regression in the compiler (between Dec 07 and Dec 18). Should be reopened.
    
    `1.red`:
    ```
    Red []
    do [
    global-count: 0
    
    global-count-inc: function [
    	condition [logic!]
    ][
    	if condition [global-count: global-count + 1]
    ]
    global-count-inc true
    ]
    ```
    
    `red -r -d 1.red`:
    ```
    ***   stack: red/object/rs-select 0274D264h 0315CD3Ch                                                   
    ***   stack: red/error/reduce 0274D284h 0274D264h                                                       
    ***   stack: red/error/form 0274D264h 0274D274h 0274D254h -18                                           
    ***   stack: red/actions/form 0274D264h 0274D274h 0274D254h 0                                           
    ***   stack: red/actions/form* -1                                                                       
    ***   stack: red/natives/prin* false                                                                    
    ***   stack: red/natives/print* false                                                                   
    ***   stack: red/stack/throw-error 0274D334h                                                            
    ***   stack: red/fire 1 0018FB80h                                                                       
    ***   stack: red/interpreter/eval-infix 02850CD4h 0315C970h 0315C970h true                              
    ***   stack: red/interpreter/eval-expression 0315C950h 0315C970h false true false                       
    ***   stack: red/interpreter/eval-expression 0315C940h 0315C970h false false false                      
    ***   stack: red/interpreter/eval 0274D2D4h true                                                        
    ***   stack: red/natives/if* false                                                                      
    ***   stack: red/interpreter/eval-arguments 0284F8C4h 0315C91Ch 0315C91Ch 00000000h 00000000h           
    ***   stack: red/interpreter/eval-code 0284F8C4h 0315C8FCh 0315C91Ch false 00000000h 00000000h 0284F8C4h
    ***   stack: red/interpreter/eval-expression 0315C8FCh 0315C91Ch false false false                      
    ***   stack: red/interpreter/eval 0315C888h true                                                        
    ***   stack: red/interpreter/eval-function 0274D274h 0315C888h                                          
    ***   stack: red/_function/call 0274D274h 003E3884h                                                     
    ***   stack: red/interpreter/eval-code 0274D274h 028FB668h 028FB668h false 00000000h 00000000h 02852DF4h
    ***   stack: red/interpreter/eval-expression 028FB658h 028FB668h false false false                      
    ***   stack: red/interpreter/eval 0274D264h true                                                        
    ***   stack: red/natives/do* true -1 -1 -1                                                              
    ```

--------------------------------------------------------------------------------

On 2019-02-20T23:39:01Z, greggirwin, commented:
<https://github.com/red/red/issues/1035#issuecomment-465799959>

    Another one where the interpreter is still fine.

