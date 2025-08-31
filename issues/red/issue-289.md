
#289: Adding an integer to a string: when is it checked?
================================================================================
Issue is closed, was reported by meijeru and has 8 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/289>

When provoking the previous issue, I noticed that `1 + "c"` will compile without protest, but `print 1 + "c"` will give an math-code error, as will the assignment `a:  1 + "c"`. 

Moreover, `"c" + 1` compiles happily, whereas `print "c" + 1` will give:

```
*** Compiler Internal Error: Script Error : Invalid argument: none
*** Where: emit-integer-operation
*** Near:  [forall list [
expr: list/1
if block? unbox expr [comp-expression expr yes]
if object? expr [cast expr]
if type <> 'inline [
emitter/target/emit-argument expr functions/:name
]
]]
```



Comments:
--------------------------------------------------------------------------------

On 2012-11-01T14:17:59Z, meijeru, commented:
<https://github.com/red/red/issues/289#issuecomment-9981492>

    It does not make a difference!

--------------------------------------------------------------------------------

On 2012-11-01T20:38:27Z, dockimbel, commented:
<https://github.com/red/red/issues/289#issuecomment-9994948>

    A few type checkings are obviously missing.

--------------------------------------------------------------------------------

On 2012-11-04T20:08:01Z, dockimbel, commented:
<https://github.com/red/red/issues/289#issuecomment-10054774>

    It is a side-effect of pointer arithmetics. No distinction is made between a literal string and non-literal one. I need to add some checking to raise a compilation error.

--------------------------------------------------------------------------------

On 2012-11-04T22:39:51Z, dockimbel, commented:
<https://github.com/red/red/issues/289#issuecomment-10056581>

    `1 + "c"` (or reversed expression) will compile silently because this expression will be caught by the dead code detection routine (added 2-3 months ago) and will not generate any native code. As the functions arguments type checking appends later in the compilation process, no error is raised.

