
#1598: pair // float
================================================================================
Issue is closed, was reported by mikeparr and has 8 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1598>

;pair remainder float  on Windows 7, red-054.exe
red>> 3x4 // 1.1
**\* Math Error: unsupported right operand for pair operation
**\* Runtime Error 13: integer divide by zero
**\* at: 0042D497h
;then red-459 crashes.
Note that pair // integer is OK, but Red help says that float is OK as well.
The Math Error message is not the problem, but Red crashes immediately after displaying it.
The same problem happens with the remainder function.



Comments:
--------------------------------------------------------------------------------

On 2019-02-14T16:36:09Z, hiiamboris, commented:
<https://github.com/red/red/issues/1598#issuecomment-463696727>

    There's a recent regression in the compiler (between Dec 07 and Dec 18). Should be reopened.
    
    `1.red`:
    ```
    Red []
    3x4 // 1.1
    ```
    
    `red -r -d 1.red`:
    ```
    *** Runtime Error 1: access violation                              
    *** in file: /D/devel/red/red-src/red/runtime/datatypes/object.reds
    *** at line: 97                                                    
    ***                                                                
    ***   stack: red/object/rs-select 027AD264h 031BBCC8h              
    ***   stack: red/error/reduce 027AD284h 027AD264h                  
    ***   stack: red/error/form 027AD264h 027AD274h 027AD254h -18      
    ***   stack: red/actions/form 027AD264h 027AD274h 027AD254h 0      
    ***   stack: red/actions/form* -1                                  
    ***   stack: red/natives/prin* false                               
    ***   stack: red/natives/print* false                              
    ***   stack: red/stack/throw-error 027AD324h                       
    ***   stack: red/fire 0 0018FE88h                                  
    ***   stack: red/actions/compare 027AD2F4h 027AD304h 3             
    ***   stack: red/actions/compare* 3                                
    ***   stack: red/natives/lesser?* true                             
    ***   stack: mod                                                   
    ***   stack: modulo                                                
    ```

--------------------------------------------------------------------------------

On 2019-02-16T22:58:57Z, endo64, commented:
<https://github.com/red/red/issues/1598#issuecomment-464396871>

    Confirmed on Win10:
    
    ```
    C:\Users\endo\Documents\Red\red\build\bin>test.exe
    root size: 2153, root max: 4127, cycles: 0
    root size: 2153, root max: 4127, cycles: 1
    root size: 2153, root max: 4127, cycles: 2
    
    *** Runtime Error 1: access violation
    *** in file: /C/Users/endo/Documents/Red/red/build/bin/datatypes/object.reds
    *** at line: 97
    ***
    ***   stack: red/object/rs-select 026FD374h 029AC31Ch
    ***   stack: red/error/reduce 026FD394h 026FD374h
    ***   stack: red/error/form 026FD374h 026FD384h 026FD364h -18
    ***   stack: red/actions/form 026FD374h 026FD384h 026FD364h 0
    ***   stack: red/actions/form* -1
    ***   stack: red/natives/prin* false
    ***   stack: red/natives/print* false
    ***   stack: red/stack/throw-error 026FD434h
    ***   stack: red/fire 0 0019FE80h
    ***   stack: red/actions/compare 026FD404h 026FD414h 3
    ***   stack: red/actions/compare* 3
    ***   stack: red/natives/lesser?* true
    ***   stack: mod
    ***   stack: modulo
    ```

--------------------------------------------------------------------------------

On 2019-02-18T20:45:01Z, greggirwin, commented:
<https://github.com/red/red/issues/1598#issuecomment-464871745>

    Interpreted, I get this:
    ```
    >> 3x4 // 1.1
    *** Script Error: cannot compare 0x0 with 0
    *** Where: <
    *** Stack: mod  
    ```

--------------------------------------------------------------------------------

On 2019-02-20T19:54:26Z, endo64, commented:
<https://github.com/red/red/issues/1598#issuecomment-465729864>

    It is not actually about float:
    
    ```
    3x4 // 1
    ```
    
    gives `cannot compare 0x0 with 0` on REPL and `access violation` when compiled.

