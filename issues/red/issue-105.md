
#105: Fix to #100 has caused new issue
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/105>

i would have been quite happy without the fix that allowed full `pointer![...]` and `struct![...]` specs as argument to `size?`

Now we have the following side-effect:

```
if 4 = size? pointer! [print "OK"]
*** Compilation Error: expected a block of code
```

The compiler eats up the `[print "OK"]` block as belonging to the pointer type.



Comments:
--------------------------------------------------------------------------------

On 2011-06-24T08:21:18Z, dockimbel, commented:
<https://github.com/red/red/issues/105#issuecomment-1431024>

    Thanks, looks like I will need to remove the "base-type only" option for `size?`.

--------------------------------------------------------------------------------

On 2011-06-24T08:50:35Z, meijeru, commented:
<https://github.com/red/red/issues/105#issuecomment-1431125>

    OR, you go back to base-type only, since all structs resp. pointers are guaranteed to take up the same space (full address).
    
    Moreover, the `size?` entry in the built-in functions table is (a) only used to determine the return type (b) not correct anymore in its argument types; therefore it can be omitted and the line `last-type: get-return-type 'size?` can be replaced by `last-type: 'integer!`

--------------------------------------------------------------------------------

On 2011-06-26T15:28:06Z, dockimbel, commented:
<https://github.com/red/red/issues/105#issuecomment-1441566>

    Agreed on your proposed fixes.

