
#3018: Type casting from function! to pointer! is not allowed 
================================================================================
Issue is closed, was reported by Oldes and has 2 comment(s).
[status.built] [status.tested] [type.wish]
<https://github.com/red/red/issues/3018>

Is there any reason for this limitation or is it just not implemented feature? One can get the pointer value anyway using intermediate casting like:
```
func-pointer: as int-ptr! as integer! :my-function
```

To have function pointer as a real pointer is useful for passing any function as an argument. Although one can use integer! type instead, it is more like a hack.


Comments:
--------------------------------------------------------------------------------

On 2017-09-12T12:05:14Z, dockimbel, commented:
<https://github.com/red/red/issues/3018#issuecomment-328832190>

    The double casting should not be allowed, though, in some pointer cases, the R/S compiler will not complain because `null` is internally handled as a type casting already, so type casting null values would not be possible otherwise.
    
    The `function!` pointer was limited from the beginning, because making `function!` first-class citizens was both a lot of extra work and could create issues in the language semantics. Anyway, there is a need for a more relaxed handling of function pointers, so I have implemented already similar features in our private Android repo, I will transfer the relevant commits to the public red/red repo.

