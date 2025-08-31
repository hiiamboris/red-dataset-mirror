
#916: Using a refinement that doesn't exist for a func crashes 0.4.3
================================================================================
Issue is closed, was reported by greggirwin and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/916>

```
round/x 1
append/y [] 2
```



Comments:
--------------------------------------------------------------------------------

On 2014-10-07T11:51:11Z, OneArb, commented:
<https://github.com/red/red/issues/916#issuecomment-58172551>

    also system/noexist

--------------------------------------------------------------------------------

On 2015-02-25T02:45:56Z, dockimbel, commented:
<https://github.com/red/red/issues/916#issuecomment-75895793>

    With the latest version of the **interpreter**, there are no crashes anymore, but the undefined refinements are silently ignored. They should report an error rather.
    
    For `system/noexist`, it now reports an error:
    
    ```
    red>> system/noexist
    *** Script error: noexist has no value
    *** Where: try
    ```
    
    The error is not accurate enough though, this could be improved too.

--------------------------------------------------------------------------------

On 2019-02-14T16:55:28Z, hiiamboris, commented:
<https://github.com/red/red/issues/916#issuecomment-463704071>

    There's a recent regression in the compiler (between Dec 07 and Dec 18). Should be reopened.
    
    `1.red`:
    ```
    Red []
    do [round/x 1]
    ```
    
    `red -r -d 1.red`:
    ```
    *** Runtime Error 1: access violation                                                                           
    *** in file: /D/devel/red/red-src/red/datatypes/object.reds                                                     
    *** at line: 97                                                                                                 
    ***                                                                                                             
    ***   stack: red/object/rs-select 0289D264h 032AC770h                                                           
    ***   stack: red/error/reduce 0289D284h 0289D264h                                                               
    ***   stack: red/error/form 0289D264h 0289D274h 0289D254h -18                                                   
    ***   stack: red/actions/form 0289D264h 0289D274h 0289D254h 0                                                   
    ***   stack: red/actions/form* -1                                                                               
    ***   stack: red/natives/prin* false                                                                            
    ***   stack: red/natives/print* false                                                                           
    ***   stack: red/stack/throw-error 0289D2B4h                                                                    
    ***   stack: red/fire 0 0018FCD8h                                                                               
    ***   stack: red/native/preprocess-options 0289D294h 0299FDE4h 02A4B500h 02A4B534h 003A2224h 02A4B534h 02A4B554h
    ***   stack: red/_function/preprocess-options 0299FDE4h 02A4B500h 02A4B534h 003A2224h 02A4B534h false           
    ***   stack: red/interpreter/eval-arguments 0299FDE4h 02A4B510h 02A4B520h 02A4B500h 02A4B534h                   
    ***   stack: red/interpreter/eval-code 0299FDE4h 02A4B510h 02A4B520h true 02A4B500h 02A4B534h 0299FDE4h         
    ***   stack: red/interpreter/eval-path 02A4B500h 02A4B510h 02A4B520h false false false false                    
    ***   stack: red/interpreter/eval-expression 02A4B510h 02A4B520h false false false                              
    ***   stack: red/interpreter/eval 0289D264h true                                                                
    ***   stack: red/natives/do* true -1 -1 -1                                                                      
    ```

