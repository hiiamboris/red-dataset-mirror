
#3733: [Crash] Compiled script crashes on Red error from some unsupported function calls
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
<https://github.com/red/red/issues/3733>

**Describe the bug**

1.red:
```
Red []
f: does [1]
do [f/q]
```

executed:
```
> red -r -d 1.red & 1.exe
root size: 2156, root max: 4130, cycles: 0
root size: 2156, root max: 4130, cycles: 1
root size: 2156, root max: 4130, cycles: 2

*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-exp/datatypes/object.reds
*** at line: 97
***
***   stack: red/object/rs-select 026ED2A4h 030FCBF0h
***   stack: red/error/reduce 026ED2C4h 026ED2A4h
***   stack: red/error/form 026ED2A4h 026ED2B4h 026ED294h -18
***   stack: red/actions/form 026ED2A4h 026ED2B4h 026ED294h 0
***   stack: red/actions/form* -1
***   stack: red/natives/prin* false
***   stack: red/natives/print* false
***   stack: red/stack/throw-error 026ED2F4h
***   stack: red/fire 0 0018FCD0h
***   stack: red/_function/preprocess-func-options 026ED2D4h 0289B904h 0289B928h 023E21E0h 0289B928h 0289B948h 01DEC958h
***   stack: red/_function/preprocess-options 027F1754h 0289B904h 0289B928h 023E21E0h 0289B928h true
***   stack: red/interpreter/eval-arguments 027F1754h 0289B914h 0289B914h 0289B904h 0289B928h
***   stack: red/interpreter/eval-code 027F1754h 0289B914h 0289B914h true 0289B904h 0289B928h 027F1754h
***   stack: red/interpreter/eval-path 0289B904h 0289B914h 0289B914h false false false false
***   stack: red/interpreter/eval-expression 0289B914h 0289B914h false false false
***   stack: red/interpreter/eval 026ED2A4h true
***   stack: red/natives/do* true -1 -1 -1
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 9-Jan-2019/5:46:16+03:00 commit #acf3492
```



Comments:
--------------------------------------------------------------------------------

On 2019-01-15T11:22:33Z, hiiamboris, commented:
<https://github.com/red/red/issues/3733#issuecomment-454358868>

    This also looks closely related to me:
    
    2.red:
    ```
    Red []
    do [f: func [/q] bind [1] context []]
    f/q
    ```
    
    executed:
    ```
    > red -r -d 2.red & 2.exe
    root size: 2153, root max: 4127, cycles: 0
    root size: 2153, root max: 4127, cycles: 1
    root size: 2153, root max: 4127, cycles: 2
    
    *** Runtime Error 1: access violation
    *** in file: /d/temp/datatypes/object.reds
    *** at line: 97
    ***
    ***   stack: red/object/rs-select 026DD274h 0318CE54h
    ***   stack: red/error/reduce 026DD294h 026DD274h
    ***   stack: red/error/form 026DD274h 026DD284h 026DD264h -18
    ***   stack: red/actions/form 026DD274h 026DD284h 026DD264h 0
    ***   stack: red/actions/form* -1
    ***   stack: red/natives/prin* false
    ***   stack: red/natives/print* false
    ***   stack: red/stack/throw-error 026DD294h
    ***   stack: red/fire 0 0018FF00h
    ***   stack: red/actions/get-action-ptr-path 027E1754h 7 0049DB44h
    ***   stack: red/actions/eval-path 027E1754h 026D5224h 00000000h 00000000h false
    ***   stack: red/eval-path* 027E1754h 026D5224h
    ```
    
    Apparently both cases do throw an error, but it gets screwed on its way.

--------------------------------------------------------------------------------

On 2019-07-22T19:25:35Z, dockimbel, commented:
<https://github.com/red/red/issues/3733#issuecomment-513920209>

    That 2.red example is a different problem, should have its own ticket.

