
#1935: Invalid path crashes console
================================================================================
Issue is closed, was reported by philipyi and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1935>

Type the following into the console and it will crash:
test/:



Comments:
--------------------------------------------------------------------------------

On 2019-02-14T16:44:06Z, hiiamboris, commented:
<https://github.com/red/red/issues/1935#issuecomment-463699629>

    There's a recent regression in the compiler (between Dec 07 and Dec 18). Should be reopened.
    
    `1.red`:
    ```
    Red []
    do load {test/:}
    ```
    
    `red -r -d 1.red`:
    ```
    *** Runtime Error 1: access violation                              
    *** in file: /D/devel/red/red-src/red/runtime/datatypes/object.reds
    *** at line: 97                                                    
    ***                                                                
    ***   stack: red/object/rs-select 0284D274h 0325C548h              
    ***   stack: red/error/reduce 0284D294h 0284D274h                  
    ***   stack: red/error/form 0284D274h 0284D284h 0284D264h -18      
    ***   stack: red/actions/form 0284D274h 0284D284h 0284D264h 0      
    ***   stack: red/actions/form* -1                                  
    ***   stack: red/natives/prin* false                               
    ***   stack: red/natives/print* false                              
    ***   stack: red/stack/throw-error 0284DBB4h                       
    ***   stack: red/natives/do* true -1 -1 -1                         
    ***   stack: ctx264~transcode 0030E3E4h                            
    ***   stack: load                                                  
    ```

--------------------------------------------------------------------------------

On 2019-02-18T22:41:03Z, greggirwin, commented:
<https://github.com/red/red/issues/1935#issuecomment-464908629>

    This should be a new ticket I think, as it's not the console crashing, but a compiler issue now.

--------------------------------------------------------------------------------

On 2019-02-18T22:41:18Z, greggirwin, commented:
<https://github.com/red/red/issues/1935#issuecomment-464908687>

    We can reference this ticket there though.

