
#2114: Set+Get function causes Script Error (Bug?)
================================================================================
Issue is open, was reported by ghost and has 2 comment(s).
[status.deferred] [type.review] [type.compiler]
<https://github.com/red/red/issues/2114>

Works when interpreted, does not once compiled

```
set 'fn get 'function
square: fn [x [integer!]] [x * x] ; Removing the type still causes the error
print [square 5]
```

When run from binary yields:

```
*** Script Error: square does not allow integer! for its spec argument
*** Where: square
*** Stack: print square
```

This looks related to #360, but proc'd by attempting to alias rather than redefine 



Comments:
--------------------------------------------------------------------------------

On 2016-07-14T15:03:07Z, dockimbel, commented:
<https://github.com/red/red/issues/2114#issuecomment-232692079>

    The following workaround will work with the compiler:
    
    ```
    fn: :function
    square: do [fn [x [integer!]] [x * x]]
    print [square 5]
    ```
    
    In your `square: fn ...` code, `fn` is not identified as a function call by the compiler, so it just returns its value (which is `:function`), and that function cannot then accept an integer as argument obviously.
    
    What the compiler is currently missing, is a dynamic way to recognize function calls (which is a hard problem in the general case). That is the purpose of the `dyn-stack` development branch, which would allow that once completed (though currently stalled because of other higher-priority tasks). In the meantime, workarounds using `do [...]` will make it work properly with the compiler.

