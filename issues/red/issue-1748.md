
#1748: Different behaviour of interpreted and compiled code
================================================================================
Issue is closed, was reported by muspellsson and has 4 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/1748>

I have the following code

```
Red []

adder: object [
   six: func [] [ 6 ]
   twelve: func [/local o][
     o: make self []
     o/six + o/six
   ]
]

print adder/twelve
```

It runs well using interpreter but the compiled version of this code says that a function! type is not allowed as the argument of the operation +. What's wrong with it? Or maybe I just didn't get how to work with functions in Red?



Comments:
--------------------------------------------------------------------------------

On 2016-03-29T11:45:30Z, dockimbel, commented:
<https://github.com/red/red/issues/1748#issuecomment-202845432>

    The current compiler cannot determine that `f1/value` and `f2/value` are function calls, so it generates code for just fetching the function values, generating an error on `+` attempt to add them. Wrapping the expression in a `do [...]` block is a workaround: `return do [f1/value + f2/value]`. Running the compiled version then gives:
    
    ```
    C:\Dev\Red>bug
    55
    
    *** Error: arguments stack overflow!
    ```
    
    I guess that the `make self` is wrongly analyzed, so there's something we can do to improve that. The current compiler cannot determine accurately if a path is a function call or not, as Red code is not statically analyzable in the general case (typical example: `foo: func [o][o/bar] foo load "[bar 123]"`). The `dyn-stack` branch is a work-in-progress to provide a general solution for such dynamic calls to the compiler, though, not sure when that work will be completed (needs to be re-scheduled).
    
    Also, note that the GC is not yet plugged in, so benchmarking with heavy allocations might lead to memory exhaustion.

--------------------------------------------------------------------------------

On 2016-05-09T05:27:45Z, dockimbel, commented:
<https://github.com/red/red/issues/1748#issuecomment-217778735>

    So, using `do [...]` wrapping workaround will make it work on both compiler and interpreter*:
    
    ```
    adder: object [
       six: func [] [ 6 ]
       twelve: func [/local o][
         o: make self []
         do [o/six + o/six]
       ]
    ]
    
    print adder/twelve
    ```
    
    This is the best we can have right now, until the `dyn-stack` branch is completed.

