
#1753: Building function body with COMPOSE fails to compile
================================================================================
Issue is closed, was reported by RenaudG and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1753>

Using "compose" to build a function body seems to have issues: works well in interpreter but fails to compile with this error:

> Red Compiler Internal Error: Script Error : bind-function expected body argument of type: block Where: comp-func
> - Near: [bind-function body shadow
>   body-code: either
>   ]

Simple code exhibiting the problem:

```
thing: func [x] compose [x + 10]
```



Comments:
--------------------------------------------------------------------------------

On 2016-03-30T09:10:53Z, RenaudG, commented:
<https://github.com/red/red/issues/1753#issuecomment-203337126>

    Also:
    
    ```
    ;; Works in interpreter, but don't compile
    make-adder: func [n] [
        func [x] compose [x + (n)]
    ]
    
    f: make-adder 5
    print f 10
    
    
    ;; Works in interpreter, compile but then don't give the expected result
    make-adder: func [n] [
        do compose/deep [func [x] [x + (n)]]
    ]
    
    f: make-adder 5
    print f 10
    ```

--------------------------------------------------------------------------------

On 2016-05-09T03:37:14Z, dockimbel, commented:
<https://github.com/red/red/issues/1753#issuecomment-217769774>

    Compilation crash was fixed, though, your code still need some extra care to work identically as in the interpreter until the work on `dyn-stack` branch is complete. Until then, the compiler cannot figure out that `f` refers to a function, so he won't generate a call to it. In order to solve that you need to wrap calls to `f` in a `do [f...]` expression:
    
    ```
    make-adder: func [n] [
        func [x] compose [x + (n)]
    ]
    
    f: make-adder 5
    print do [f 10]
    ```
    
    and 
    
    ```
    make-adder: func [n] [
        do compose/deep [func [x] [x + (n)]]
    ]
    
    f: make-adder 5
    print do [f 10]
    ```

