
#520: ALL [] returns NONE or block!
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/520>

```
Red []

probe all []
```

none

red>> all []
== []

REBOL:

> > all []
> > == true



Comments:
--------------------------------------------------------------------------------

On 2016-09-12T09:22:25Z, rebolek, commented:
<https://github.com/red/red/issues/520#issuecomment-246293593>

    In 0.6.1:
    
    ## Interpreter
    
    ```
    red>> all []
    == none
    ```
    
    ## Compiler
    
    Source:
    
    ```
    Red []
    
    probe all []
    ```
    
    Output:
    
    ```
    E:\Code\red (master)
    λ test
    none
    ```
    
    @dockimbel  So, should it behave as Rebol (returning `true`), or is `none` the right output?

