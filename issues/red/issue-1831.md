
#1831: Repeat causes runtime error in function
================================================================================
Issue is closed, was reported by JiaChen-Zeng and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1831>

```
red>> repeat a/1
*** Script error: repeat does not allow path! for its 'word argument
*** Where: repeat
red>> func [a][repeat a/1]
== func [a][repeat a/1]
red>> function [a][repeat a/1]

*** Runtime Error 1: access violation
*** at: 00426218h
```



Comments:
--------------------------------------------------------------------------------

On 2016-04-21T11:03:12Z, dockimbel, commented:
<https://github.com/red/red/issues/1831#issuecomment-212858929>

    Minimal code for reproducing the crash:
    
    ```
    function [a][repeat a/1]
    ```

