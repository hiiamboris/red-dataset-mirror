
#57: function definition is allowed in the code block of a conditional statement
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[status.built] [status.tested]
<https://github.com/red/red/issues/57>

Try

```
either true [f: func [][print "hello"]]  [f: func [][print "goodbye"]] f
```

and you will see that the function re-definition is registered even if the second code block is NOT to be executed.



Comments:
--------------------------------------------------------------------------------

On 2011-06-01T10:21:39Z, dockimbel, commented:
<https://github.com/red/red/issues/57#issuecomment-1273444>

    It is registered because it is done at compilation-time, and there is no dead-code elimination optimization in the compiler. Anyway, we do not want to allow such construction, so it should raise a compilation error. Conditional compilation (not supported yet) should rely on compiler directives rather than user code.

--------------------------------------------------------------------------------

On 2011-06-01T10:49:20Z, meijeru, commented:
<https://github.com/red/red/issues/57#issuecomment-1273567>

    I agree totally.

--------------------------------------------------------------------------------

On 2011-06-01T15:55:02Z, dockimbel, commented:
<https://github.com/red/red/issues/57#issuecomment-1275234>

    A new compilation error is returned for such cases. Function declaration is only allowed at root level of a script or root level of a function's own body (for private functions definition, to be added to specification soon).
    
    Tested OK.

