
#1974: Crash on passing word! as argument instead of a string!
================================================================================
Issue is closed, was reported by Zamlox and has 8 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1974>

Following sequence will crash console:

```
f1: func [p [string!]][print p]
reflect f1 'spec
```

Call stack:

```
*** Runtime Error 1: access violation
*** in file: /D/work/red/source/red/runtime/datatypes/context.reds
*** at line: 270
***
***   stack: red/_context/get 028E69E4h
***   stack: red/error/get-call-argument 0
***   stack: red/interpreter/eval-arguments 028F3BD8h 029311ACh 029311ACh 00000000h 00000000h
***   stack: red/interpreter/eval-code 028F3BD8h 0293119Ch 029311ACh true 00000000h 00000000h 028F3BD8h
***   stack: red/interpreter/eval-expression 0293119Ch 029311ACh false true
***   stack: red/interpreter/eval-arguments 028EEE78h 0293118Ch 029311ACh 00000000h 00000000h
***   stack: red/interpreter/eval-code 028EEE78h 0293118Ch 029311ACh false 00000000h 00000000h 028EEE78h
***   stack: red/interpreter/eval-expression 0293118Ch 029311ACh false false
***   stack: red/interpreter/eval 02863CB0h true
***   stack: red/natives/catch* true 1
***   stack: ctx270~try-do 0028C5DCh
***   stack: ctx270~do-command 0028C5DCh
***   stack: ctx270~eval-command 0028C5DCh
***   stack: ctx270~run 0028C5DCh
***   stack: ctx270~launch 0028C5DCh
***   stack: ctx289~launch 0028C0E0h
```



Comments:
--------------------------------------------------------------------------------

On 2016-06-05T21:08:40Z, meijeru, commented:
<https://github.com/red/red/issues/1974#issuecomment-223837758>

    Curiously, if the `spec` is empty, there is no crash but an `unset` error.

--------------------------------------------------------------------------------

On 2016-06-16T17:54:34Z, dockimbel, commented:
<https://github.com/red/red/issues/1974#issuecomment-226562604>

    The issue is that you are calling `f1` instead of getting a reference to the function (using `:f1`). So, it's not related to `reflect`:
    
    ```
    f1: func [p [string!]][print p]
    reflect :f1 'spec
    == [p [string!]]
    
    f1: func [p [string!]][print p]
    f1 'spec
    == <crash>
    ```

--------------------------------------------------------------------------------

On 2019-02-14T16:47:34Z, hiiamboris, commented:
<https://github.com/red/red/issues/1974#issuecomment-463700925>

    There's a recent regression in the compiler (between Dec 07 and Dec 18). Should be reopened.
    
    `1.red`:
    ```
    Red []
    do [
    	f1: func [p [string!]][print p]
    	reflect f1 'spec
    ]
    ```
    
    `red -r -d 1.red`:
    ```
    *** Runtime Error 1: access violation                                                                   
    *** in file: /D/devel/red/red-src/red/datatypes/object.reds                                             
    *** at line: 97                                                                                         
    ***                                                                                                     
    ***   stack: red/object/rs-select 027BD264h 031CCA2Ch                                                   
    ***   stack: red/error/reduce 027BD284h 027BD264h                                                       
    ***   stack: red/error/form 027BD264h 027BD274h 027BD254h -18                                           
    ***   stack: red/actions/form 027BD264h 027BD274h 027BD254h 0                                           
    ***   stack: red/actions/form* -1                                                                       
    ***   stack: red/natives/prin* false                                                                    
    ***   stack: red/natives/print* false                                                                   
    ***   stack: red/stack/throw-error 027BD2C4h                                                            
    ***   stack: red/fire 1 0018FC88h                                                                       
    ***   stack: red/interpreter/eval-arguments 028C2DE4h 0296B5B8h 0296B5B8h 00000000h 00000000h           
    ***   stack: red/interpreter/eval-code 028C2DE4h 0296B5A8h 0296B5B8h true 00000000h 00000000h 028C2DE4h 
    ***   stack: red/interpreter/eval-expression 0296B5A8h 0296B5B8h false true false                       
    ***   stack: red/interpreter/eval-arguments 028BFCB4h 0296B598h 0296B5B8h 00000000h 00000000h           
    ***   stack: red/interpreter/eval-code 028BFCB4h 0296B598h 0296B5B8h false 00000000h 00000000h 028BFCB4h
    ***   stack: red/interpreter/eval-expression 0296B598h 0296B5B8h false false false                      
    ***   stack: red/interpreter/eval 027BD264h true                                                        
    ***   stack: red/natives/do* true -1 -1 -1                                                              
    ```

--------------------------------------------------------------------------------

On 2019-02-18T22:46:24Z, greggirwin, commented:
<https://github.com/red/red/issues/1974#issuecomment-464910144>

    This should be a new ticket @hiiamboris. Console handles things correctly.
    ```
    >> do [f1: func [p [string!]] [print p]  reflect :f1 'spec]
    == [p [string!]]
    >> do [f1: func [p [string!]] [print p]  reflect f1 'spec]
    *** Script Error: f1 does not allow word! for its p argument
    *** Where: f1
    *** Stack: f1  
    ```

