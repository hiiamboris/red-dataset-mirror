
#1977: Red compiler does not allow an object to be created by a function
================================================================================
Issue is closed, was reported by philipyi and has 2 comment(s).
[status.deferred] [type.review]
<https://github.com/red/red/issues/1977>

The following compiles with no errors.  When run the last 2 lines cause problems.

```
Red []
proto: object [
    m: 100
    foo: func [][m]
]

create: func [
    x [integer!]
][
    make proto [m: x]
]

obj: create 25
print obj/m      ;-- correctly prints 25
print obj/foo    ;-- ?function? instead of 25
obj/foo  /  2    ;-- Script error: / does not allow function! for its value1 argument
```



Comments:
--------------------------------------------------------------------------------

On 2016-06-07T04:20:05Z, dockimbel, commented:
<https://github.com/red/red/issues/1977#issuecomment-224171059>

    The compiler cannot generate function calls for the last two lines, you need to wrap them in DO [...] for now, until the `dyn-stack` branch is completed:
    
    ```
    print do [obj/foo]
    do [obj/foo  /  2]
    ```
    
    Note that this is a compiler-specific current limitation, the interpreter can handle it fine. The word on `dyn-stack` branch is not scheduled yet, though it needs to be done before 1.0 (hopefully, way before that).
    
    See more info about that in #1748.

