
#90: Indexing a string with a non-integer variable is wrongly allowed. 
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/90>

If the variable is a byte!, I have seen the compiler go off the deep end (no REBOL error message even). If the variable is logic! it compiles and runs without any warning (presumably because true and false are 32-bit 1and 0).



Comments:
--------------------------------------------------------------------------------

On 2011-06-09T20:22:11Z, meijeru, commented:
<https://github.com/red/red/issues/90#issuecomment-1336916>

    The same goes for indexing a pointer value!

--------------------------------------------------------------------------------

On 2011-06-09T21:00:11Z, dockimbel, commented:
<https://github.com/red/red/issues/90#issuecomment-1337197>

    Proper compilation errors are now raised for all the mentioned use cases.
    
    Tested OK.

