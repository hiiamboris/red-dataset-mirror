
#2418: `switch` expects literal block as second argument -- refuses reduced block
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2418>

Smallest test program:
```
Red []
a: 1
switch 1 reduce [a []]
```

Result:
```
*** Compilation Error: SWITCH expects a block as second argument 
*** in file: %/C/Projects/Red/programs/test/test-switch.red
*** near: [reduce [a []]]
> Terminated with exit code 1.
```




Comments:
--------------------------------------------------------------------------------

On 2017-01-17T17:21:35Z, meijeru, commented:
<https://github.com/red/red/issues/2418#issuecomment-273236094>

    In contrast to the compiler, the interpreter *does*  accept reduced blocks.

--------------------------------------------------------------------------------

On 2017-02-13T07:43:22Z, dockimbel, commented:
<https://github.com/red/red/issues/2418#issuecomment-279314936>

    The fallback to the interpreter for (non-statically analyzable) `switch` (and several other control flow function) has not been implemented yet in the compiler. It is supposed to be implemented at a later stage, when we can figure out the most efficient way to support it. Though, for now, I will just add a simple fallback to the interpreter in the compiler code.

