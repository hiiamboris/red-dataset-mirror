
#2326: make datatype! <any-value> produces either datatype! or crashes
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2326>

It should give an error irrespective of the type of the value.


Comments:
--------------------------------------------------------------------------------

On 2016-11-18T07:39:36Z, meijeru, commented:
<https://github.com/red/red/issues/2326#issuecomment-261468025>

    I understand that `make datatype! <integer>` produces the type with the internal number equal to the integer value. Worth documenting?

--------------------------------------------------------------------------------

On 2016-11-18T15:58:39Z, dockimbel, commented:
<https://github.com/red/red/issues/2326#issuecomment-261567251>

    It should return an error (as per the MAKE matrix), a datatype! value should not be created by the user that way, only literally. The underlying types numbering should not be exposed as Red level, as such numbers can change, and in the future, have a dynamic assignment (instead of static currently).
    
    Moreover, it's still crashing even with the commit:
    
    ```
    red>> make datatype! 50
    
    *** Runtime Error 1: access violation
    *** at: 00423DFCh
    ```
    
    @qtxie No need to worry for %environment/datatype.red compilation, it is handled in a special way by the compiler, directly [converted](https://github.com/red/red/blob/master/compiler.r#L3346) to redbin data. ;-)

