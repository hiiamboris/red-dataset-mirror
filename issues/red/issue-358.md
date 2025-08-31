
#358: interpreter does not seem to handle reflect
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/358>

```
red>> f: func [][]
== [] ; BTW, I suppose this should be make function! [[][]], eventually
red>> reflect :f 'spec
*** Runtime Error 1: access violation
*** at: 00000000h
```



Comments:
--------------------------------------------------------------------------------

On 2012-12-31T08:13:33Z, dockimbel, commented:
<https://github.com/red/red/issues/358#issuecomment-11773881>

    Functions constructors (`func`, `function`, ...) have not yet been implemented for the interpreter. `reflect` does seem to have a problem anyway:
    
    ```
    red>> spec-of :first
    == [s [series!]]
    red>> reflect :first 'spec
    
    *** Runtime Error 1: access violation
    *** at: 00000000h
    ```

