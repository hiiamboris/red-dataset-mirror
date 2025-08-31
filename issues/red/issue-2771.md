
#2771: Variable import does not suport `int-ptr!` type
================================================================================
Issue is closed, was reported by Oldes and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2771>

This code works:
```
#import [	libjulia cdecl [
    jl_string_type: "jl_string_type" [integer!]
]]
print jl_string_type
```
but this fails:
```
#import [	libjulia cdecl [
    jl_string_type: "jl_string_type" [int-ptr!]
]]
print jl_string_type
```
with:
```
*** Red/System Compiler Internal Error: Script Error : find-aliased expected type argument of type: word 
*** Where: get-type-id 
*** Near:  [either alias: find-aliased/position type/1 [
get-alias-id alias
```


