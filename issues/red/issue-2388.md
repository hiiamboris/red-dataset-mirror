
#2388: Red crashes on calling composed func
================================================================================
Issue is closed, was reported by maximvl and has 4 comment(s).
[type.bug] [status.resolved]
<https://github.com/red/red/issues/2388>

I wanted to create `func`s dymanically, but found this:
```
--== Red 0.6.1 ==-- 
Type HELP for starting information. 

red>> f: function [x]  [ func [] compose [z: (x) ] ]
== func [x /local z][func [] compose [z: (x)]]
red>> f2: f 3
== func [][z: 3]
red>> f2

*** Runtime Error 1: access violation
*** at: F7614AE6h
```

If I use `func` instead of `function` it works:
```
red>> f: func [x]  [ func [] compose [z: (x) ] ]
== func [x][func [] compose [z: (x)]]
red>> f2: f 3
== func [][z: 3]
red>> f2
== 3
```


Comments:
--------------------------------------------------------------------------------

On 2016-12-31T13:07:32Z, maximvl, commented:
<https://github.com/red/red/issues/2388#issuecomment-269864287>

    Looks like it has something to do with names:
    ```
    --== Red 0.6.1 ==-- 
    Type HELP for starting information. 
    
    red>> f: func [x] [ func [] compose [x: (x)] ]
    == func [x][func [] compose [x: (x)]]
    red>> f2: f 5
    == func [][x: 5]
    red>> f2
    
    *** Runtime Error 1: access violation
    *** at: F764BAE6h
    ```
    
    And if I change set-word `x:` inside on `z:`:
    ```
    --== Red 0.6.1 ==-- 
    Type HELP for starting information. 
    
    red>> f: func [x] [ func [] compose [z: (x)] ]
    == func [x][func [] compose [z: (x)]]
    red>> f2: f 5
    == func [][z: 5]
    red>> f2
    == 5
    red>> 
    ```

--------------------------------------------------------------------------------

On 2017-03-01T17:31:15Z, dockimbel, commented:
<https://github.com/red/red/issues/2388#issuecomment-283410479>

    You will get a `word is not bound to a context` error now instead of crashes, thanks to recent fixes for other tickets.

