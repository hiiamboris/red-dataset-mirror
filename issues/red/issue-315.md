
#315: Documentation: casting from function![...] to function![...] is allowed.
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested] [type.review] [Red/System]
<https://github.com/red/red/issues/315>

The specification says it gives an error, this is NOT the case. Actually, it is used quite a lot in the Red runtime, isn't it? See `action.reds`



Comments:
--------------------------------------------------------------------------------

On 2012-11-26T00:16:39Z, dockimbel, commented:
<https://github.com/red/red/issues/315#issuecomment-10700921>

    Actually not, the type castings in `action.reds` cast `integer!` values to `function!` pointers. The type checker should catch such cases of type casting when the functions specifications differ. If they are the same, a warning should be output. Let me know if it is not the case.

--------------------------------------------------------------------------------

On 2012-11-26T08:24:32Z, meijeru, commented:
<https://github.com/red/red/issues/315#issuecomment-10707751>

    Nothing is checked, apparently:
    
    ```
    f: func[i [integer!]][] g: as function! [j [integer!]] :f h: as function! [b [byte!]] :f
    -= Red/System Compiler =-
    Compiling tests/mytest.reds ...
    ...compilation time:     719 ms
    ...linking time:         1359 ms
    ...output file size:     15360 bytes
    ```

