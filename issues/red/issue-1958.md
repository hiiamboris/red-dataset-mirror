
#1958: Wish: POKE to be defined on pair! values
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.dismissed] [type.wish]
<https://github.com/red/red/issues/1958>

I cannot off-hand find a reason why it should not be defined.



Comments:
--------------------------------------------------------------------------------

On 2016-07-21T06:38:35Z, dockimbel, commented:
<https://github.com/red/red/issues/1958#issuecomment-234169602>

    It is not possible to support POKE on scalar values (values which fit entirely in a memory cell) with Rebol/Red language semantics.
    
    We allowed POKE for tuples, like Rebol2 did (but not Rebol3), but that's a mistake which needs correction.
    
    Here is an example:
    
    ```
    red>> t: 1.2.3
    == 1.2.3
    red>> poke t 2 99
    == 99
    red>> t
    == 1.2.3
    ```
    
    POKE arguments (like for any function arguments), are pushed on a evaluation stack (the Red internal stack), so they are copied there, which means only the copy on the stack gets changed, not the one pointed by the word `t` (or any other kind of reference to a tuple or pair value).
    
    Rebol2 returns the changed tuple value (though does not allow POKE on pair):
    
    ```
    >> z: 1.2.3
    == 1.2.3
    >> poke z 2 99
    == 1.99.3
    ```
    
    I am not sure that this changed returned value is useful enough to support POKE, as it would most probably lead to many wrong assumptions by users.

