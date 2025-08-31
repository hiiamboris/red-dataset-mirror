
#926: object return from function can't invoke method
================================================================================
Issue is closed, was reported by WayneCui and has 6 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/926>

for compiler:

```
f: does [
    make object! [
        a: 1
        g: does [a]
    ]
]

probe obj: f
probe obj/g
```

output:

```
make object! [
    a: 1
    g: func [][a]
]
func [][a]
```



Comments:
--------------------------------------------------------------------------------

On 2014-09-12T11:51:22Z, dockimbel, commented:
<https://github.com/red/red/issues/926#issuecomment-55392539>

    This class of use cases is not yet supported by the compiler. In fact, the static compiler cannot support dynamically created functions invocation, simply because it cannot identify them as functions reliably in the general case (I will develop this topic in the future blog post for object release).
    
    A simple fallback strategy like leaving the rest of the code block to be processed by the interpreter is the default solution (performance impact would depend on the depth of that code block, worst case could be that almost all of your program would be interpreted). Though, there are mitigation options to avoid that fallback, that could be implemented for functions with a limited number of arguments (maybe 4 or 5 max, refinements arguments included). Another option is to let the user enclose the undetermined invocation and its arguments in a DO [...] construction.
    
    The ultimate solution for such cases is the future JIT compiler in Red 2.0.

--------------------------------------------------------------------------------

On 2014-09-26T16:25:44Z, dockimbel, commented:
<https://github.com/red/red/issues/926#issuecomment-56984918>

    I have implemented the mitigation option mentioned above. It works better than expected and has no argument number limitation. I will release the code very soon. The source code is still entirely compiled, but the function detection and invocation are done at runtime rather than compile-time, so _little_ generated code size and speed overheads are to be expected here.

--------------------------------------------------------------------------------

On 2014-09-27T01:51:25Z, WayneCui, commented:
<https://github.com/red/red/issues/926#issuecomment-57038790>

    Cool! Expecting the release! :-)

