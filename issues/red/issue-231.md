
#231: Get address of undeclared variable as typed func arg crashes compiler
================================================================================
Issue is closed, was reported by PeterWAWood and has 2 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/231>

If a call to a typed function includes an arg which is the "get address" of an non-existant value, the compiler crashes:

Code

``` rebol
Red/System []

f: func [
  [typed]
  count           [integer!]
  list            [typed-value!]
][
  pi: declare pointer! [integer!]
  pi: as pointer! [integer!] list/value
]

f [:i]
```

Compiler output

```

-= Red/System Compiler =- 
Compiling /Users/peter/VMShare/Code/Red-System/test.reds ...
Script: "Red/System IA-32 code emitter" (none)
*** Compiler Internal Error: Script Error : Cannot use path on none! value 
*** Where: get-type 
*** Near:  [switch/default type/1 [
function! [type] 
integer! byte! float! float32! [compose/deep [pointer! [(type/1)]]]
] [
throw-error ["invalid datatype for a get-word:" mold type]
]] 
```



Comments:
--------------------------------------------------------------------------------

On 2012-08-03T11:43:15Z, dockimbel, commented:
<https://github.com/red/red/issues/231#issuecomment-7481497>

    Now the compiler catches this case and outputs an adequate error message.

