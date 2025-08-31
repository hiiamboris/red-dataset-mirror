
#1171: Console: Crash on closing square bracket not matching an opening one
================================================================================
Issue is closed, was reported by x8x and has 18 comment(s).
[type.bug] [status.reviewed]
<https://github.com/red/red/issues/1171>

``` rebol
red>> ]

*** Runtime Error 98: assertion failed
*** in file: stack.reds
*** at line: 204
```

``` rebol
red>> a: [1 2 3]]

*** Runtime Error 98: assertion failed
*** in file: stack.reds
*** at line: 204
```



Comments:
--------------------------------------------------------------------------------

On 2015-05-11T00:37:54Z, qtxie, commented:
<https://github.com/red/red/issues/1171#issuecomment-100724100>

    It does not crash on Windows. @x8x Which OS are you using?

--------------------------------------------------------------------------------

On 2015-05-11T00:43:45Z, x8x, commented:
<https://github.com/red/red/issues/1171#issuecomment-100724636>

    Same for `"` `}` `)` `a/`
    
    ``` rebol
    red>> "
    
    *** Runtime Error 1: access violation
    *** in file: datatypes/context.reds
    *** at line: 26
    ```
    
    ``` rebol
    red>> }
    
    *** Runtime Error 1: access violation
    *** in file: 
    *** at line: -376451138
    ```
    
    ``` rebol
    red>> )
    
    *** Runtime Error 98: assertion failed
    *** in file: stack.reds
    *** at line: 204
    ```
    
    ``` rebol
    red>> a/
    
    *** Runtime Error 98: assertion failed
    *** in file: stack.reds
    *** at line: 204
    ```

--------------------------------------------------------------------------------

On 2015-05-11T00:43:57Z, x8x, commented:
<https://github.com/red/red/issues/1171#issuecomment-100724691>

    I'm on OS X

--------------------------------------------------------------------------------

On 2015-05-11T02:57:56Z, qtxie, commented:
<https://github.com/red/red/issues/1171#issuecomment-100749353>

    A regression introduced recently.

--------------------------------------------------------------------------------

On 2015-05-11T03:13:57Z, x8x, commented:
<https://github.com/red/red/issues/1171#issuecomment-100752617>

    Yep, regression from yesterday commit https://github.com/red/red/commit/f8775d1c00ab8f8e1466bf4fabe31c3c97aed3af

--------------------------------------------------------------------------------

On 2015-05-11T10:53:41Z, qtxie, commented:
<https://github.com/red/red/issues/1171#issuecomment-100867891>

    It crashs on Linux too.

--------------------------------------------------------------------------------

On 2016-01-16T17:54:00Z, x8x, commented:
<https://github.com/red/red/issues/1171#issuecomment-172237894>

    look like it's fixed for all above cases, so closing this one.

--------------------------------------------------------------------------------

On 2019-02-14T17:04:16Z, hiiamboris, commented:
<https://github.com/red/red/issues/1171#issuecomment-463707512>

    There's a recent regression in the compiler (between Dec 07 and Dec 18). Should be reopened.
    
    `1.red`:
    ```
    Red []
    load {]}
    ```
    
    `red -r -d 1.red`:
    ```
    *** Runtime Error 1: access violation                        
    *** in file: /D/devel/red/red-src/red/datatypes/object.reds  
    *** at line: 97                                              
    ***                                                          
    ***   stack: red/object/rs-select 0298D264h 0339C8ACh        
    ***   stack: red/error/reduce 0298D284h 0298D264h            
    ***   stack: red/error/form 0298D264h 0298D274h 0298D254h -18
    ***   stack: red/actions/form 0298D264h 0298D274h 0298D254h 0
    ***   stack: red/actions/form* -1                            
    ***   stack: red/natives/prin* false                         
    ***   stack: red/natives/print* false                        
    ***   stack: red/stack/throw-error 0298DBA4h                 
    ***   stack: red/natives/do* true -1 -1 -1                   
    ***   stack: ctx264~transcode 0036E3CCh                      
    ***   stack: load                                            
    ```

--------------------------------------------------------------------------------

On 2019-02-20T23:41:51Z, greggirwin, commented:
<https://github.com/red/red/issues/1171#issuecomment-465800610>

    Interpreter OK on windows, but someone needs to test on Mac, given the history that it's related there.

