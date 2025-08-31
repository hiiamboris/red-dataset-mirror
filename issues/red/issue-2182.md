
#2182: Runtime crash on using forall with word! that value isn't series.
================================================================================
Issue is closed, was reported by ifgem and has 12 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2182>

```
sym: 10 ; 10.0, ...
forall sym []
*** Runtime Error 1: access violation
*** at: 004485F5h
```



Comments:
--------------------------------------------------------------------------------

On 2016-08-28T15:31:44Z, dockimbel, commented:
<https://github.com/red/red/issues/2182#issuecomment-242980981>

    Fixed for both compiler and interpreter.

--------------------------------------------------------------------------------

On 2016-08-28T15:56:47Z, greggirwin, commented:
<https://github.com/red/red/issues/2182#issuecomment-242982227>

    Is this the expected error message?
    
    red>> n: 10 forall n []
    **\* Script Error: forall does not allow series! for its 'word argument
    **\* Where: forall
    
    Seems like it should say "requires a series!"

--------------------------------------------------------------------------------

On 2016-08-28T23:45:14Z, dockimbel, commented:
<https://github.com/red/red/issues/2182#issuecomment-243007215>

    Good catch!

--------------------------------------------------------------------------------

On 2019-02-14T17:13:05Z, hiiamboris, commented:
<https://github.com/red/red/issues/2182#issuecomment-463710669>

    There's a recent regression in the compiler (between Dec 07 and Dec 18). Should be reopened.
    
    `1.red`:
    ```
    Red []
    sym: 10 forall sym []
    ```
    
    `red -r -d 1.red`:
    ```
    *** Runtime Error 1: access violation                        
    *** in file: /D/devel/red/red-src/red/datatypes/object.reds  
    *** at line: 97                                              
    ***                                                          
    ***   stack: red/object/rs-select 027DD254h 031EC58Ch        
    ***   stack: red/error/reduce 027DD274h 027DD254h            
    ***   stack: red/error/form 027DD254h 027DD264h 027DD244h -18
    ***   stack: red/actions/form 027DD254h 027DD264h 027DD244h 0
    ***   stack: red/actions/form* -1                            
    ***   stack: red/natives/prin* false                         
    ***   stack: red/natives/print* false                        
    ***   stack: red/stack/throw-error 027DD294h                 
    ***   stack: red/fire 1 0018FF38h                            
    ***   stack: red/type-check 027CD964h 0 027DD254h            
    ```

--------------------------------------------------------------------------------

On 2019-02-20T23:45:16Z, greggirwin, commented:
<https://github.com/red/red/issues/2182#issuecomment-465801424>

    Interpreter OK.
    
    @hiiamboris, let's make a list of all these regressions, so we can give it to @dockimbel and @qtxie for easy referencing.

--------------------------------------------------------------------------------

On 2019-02-21T00:15:27Z, hiiamboris, commented:
<https://github.com/red/red/issues/2182#issuecomment-465808873>

    @greggirwin OK just added the list to the https://github.com/red/red/pull/3781

