
#2708: DOC: result of modulo, when zero, is always of type integer
================================================================================
Issue is open, was reported by meijeru and has 4 comment(s).
[type.bug]
<https://github.com/red/red/issues/2708>

`modulo` is defined for `scalar!` and `vector!` types (minus `char!` see issue #2700). Its result is normally of the type of the first operand, or in case of integer + another type, of that other type. However, when the result is determined to be zero, it is set at integer zero. This is not necessarily obvious to everyone.


Comments:
--------------------------------------------------------------------------------

On 2020-08-20T13:17:08Z, 9214, commented:
<https://github.com/red/red/issues/2708#issuecomment-677658790>

    `modulo` doesn't really work with `vector!` and `tuple!`, because none of the two support `absolute`.
    ```red
    >> modulo make vector! [8] make vector! [3]
    *** Script Error: absolute does not allow vector for its value argument
    *** Where: absolute
    *** Stack: modulo mod  
    
    >> modulo 8.0.0 3.0.0
    *** Script Error: absolute does not allow tuple for its value argument
    *** Where: absolute
    *** Stack: modulo mod  
    ```
    
    `pair!`s are also problematic:
    ```red
    >> modulo 8x8 3x3
    *** Script Error: cannot compare 2x2 with 0
    *** Where: <
    *** Stack: modulo mod  
    ```

--------------------------------------------------------------------------------

On 2020-08-20T18:08:16Z, hiiamboris, commented:
<https://github.com/red/red/issues/2708#issuecomment-677817588>

    https://gitlab.com/hiiamboris/red-mezz-warehouse/-/blob/master/modulo.red

