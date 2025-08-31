
#1120: Interpreter crash on missing open paren
================================================================================
Issue is closed, was reported by x8x and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1120>

``` rebol
red>> b: [] parse "1" [copy t to end (append b t)])
missing matching (
*** Syntax Error: invalid Red value at: )

== true
red>> b: [] parse "1" [some [copy t to end (append b t)]])
missing matching (
*** Syntax Error: invalid Red value at: )

Memory error: allocate memory > 2MB (--NOT_IMPLEMENTED--)

*** Runtime Error 1: access violation
*** at: 0001C394h
```



Comments:
--------------------------------------------------------------------------------

On 2015-04-27T09:39:59Z, x8x, commented:
<https://github.com/red/red/issues/1120#issuecomment-96584995>

    Just tested your latest fixes, is the `Syntax error` supposed to exit the console?
    
    ``` rebol
    user ~
      % red                                                                                                                              [16:33:41] !8183
      b: [] parse "1" [copy t to end (append b t)])
    *** Syntax error: missing ( at t)])
    *** Where: do
    
    user ~
      % red                                                                                                                              [16:34:18] !8184
      b: [] parse "1" [some [copy t to end (append b t)]])
    *** Syntax error: missing ( at )]])
    *** Where: do
    
    user ~
    ```

--------------------------------------------------------------------------------

On 2019-02-14T17:02:02Z, hiiamboris, commented:
<https://github.com/red/red/issues/1120#issuecomment-463706628>

    There's a recent regression in the compiler (between Dec 07 and Dec 18). Should be reopened.
    
    `1.red`:
    ```
    Red []
    load {b: [] parse "1" [some [copy t to end (append b t)]])}
    ```
    
    `red -r -d 1.red`:
    ```
    *** Runtime Error 1: access violation                        
    *** in file: /D/devel/red/red-src/red/datatypes/object.reds  
    *** at line: 97                                              
    ***                                                          
    ***   stack: red/object/rs-select 027CD264h 031DE96Ch        
    ***   stack: red/error/reduce 027CD284h 027CD264h            
    ***   stack: red/error/form 027CD264h 027CD274h 027CD254h -18
    ***   stack: red/actions/form 027CD264h 027CD274h 027CD254h 0
    ***   stack: red/actions/form* -1                            
    ***   stack: red/natives/prin* false                         
    ***   stack: red/natives/print* false                        
    ***   stack: red/stack/throw-error 027CDBA4h                 
    ***   stack: red/natives/do* true -1 -1 -1                   
    ***   stack: ctx264~transcode 006AE3CCh                      
    ***   stack: load                                                                                                      
    ```

--------------------------------------------------------------------------------

On 2019-02-20T23:40:33Z, greggirwin, commented:
<https://github.com/red/red/issues/1120#issuecomment-465800283>

    Interpreter OK:
    ```
    >> load {b: [] parse "1" [some [copy t to end (append b t)]])}
    *** Syntax Error: invalid 'value at ")"
    *** Where: do
    *** Stack: load  
    ```

