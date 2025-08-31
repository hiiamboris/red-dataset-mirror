
#639: In %bitset.reds: bitset-op! defined but not used
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [type.review]
<https://github.com/red/red/issues/639>

The #enum bitset-op! is not used in the various function definitions that expect the values (OP_MAX etc.) as parameter. Instead, the parameter is given integer! type.
Thus, at the minimum, some documentation value is lost.



Comments:
--------------------------------------------------------------------------------

On 2014-02-06T22:16:35Z, dockimbel, commented:
<https://github.com/red/red/issues/639#issuecomment-34378916>

    Personnally, I prefer to stick to primitive type declarations as much as possible. It allows me to spend less time thinking about what the value real storage space is, and more time focusing on the code doing the real work. If we had a Red IDE already, it would be much more easier for me to systematically use enum names for type declarations.
    
    Anyway, I am sensitive to the "documentation" argument, so I will pass the changes you are proposing.

