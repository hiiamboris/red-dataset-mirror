
#2866: Compiler crash with custom operator created directly from function
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2866>

Following code:
```Red
|>: make op! func [x 'f][f x]

[1 2 3] |> :reverse |> :print
```
Interpreted:
```Red
3 2 1
```
Compiled:
```Red
*** Compilation Error: invalid path value: intrinsics/func*
*** in file: %<snip>
*** at line: 332
*** near: [
    get-word/get ~reverse
    intrinsics/func*
    stack/unwind
    get-word/get ~print
    intrinsics/func*
    stack/unwind
]
```
Alternatively:
```Red
++: make op! func [x y][append x y]

print "hello " ++ "world" ++ "!"
```
```Red
*** Compilation Error: invalid path value: intrinsics/func*
*** in file: %<snip>
*** at line: 332
*** near: [get-root 5
    intrinsics/func*
    stack/unwind
    string/push as red-string! get-root
]
```
Possible workarounds:
- make separate function and only then make `op!` from it
```Red
pipe: func [x 'f][f x]
|>: make op! :pipe

[1 2 3] |> :reverse |> :print
```
- rebind block of code
```Red
|>: make op! func [x 'f][f x]

do bind [[1 2 3] |> :reverse |> :print] system/words
```


Comments:
--------------------------------------------------------------------------------

On 2017-07-29T11:32:50Z, dockimbel, commented:
<https://github.com/red/red/issues/2866#issuecomment-318823913>

    Now the following code will compile and work fine:
    ```
    |>: make op! func [x 'f][do [f x]]
    
    [1 2 3] |> :reverse |> :print
    ```
    
    Notice that in `func [x 'f][f x]`, there is no way that the compiler can guess that you will pass a function as `f`, nor the arity or type of such function, so it cannot consider `f x` as a function call. In order to allow that expression to be evaluated as a function call at run-time, you need to enclose it in a `do [...]`, so that the decision about how to evaluate it is deferred to run-time. The `dyn-branch` branch for the compiler should bring a more satisfying solution to such cases, avoiding such manual adjustment.

