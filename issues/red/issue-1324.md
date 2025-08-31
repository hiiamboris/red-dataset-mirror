
#1324: Error on return without colon
================================================================================
Issue is closed, was reported by JacobGood1 and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1324>

I get an internal error when I accidentally forget a colon on my return type...
just in case you did not know about it
# import [

```
    some-lib cdecl [
                lol: "funny" [
                    return  [whoops!]
                ]
    ] 
]
```

error:
Compiling to native code...
**\* Red/System Compiler Internal Error: Script Error : emit-push expected value argument of type: char
 logic integer word block string tag path get-word object decimal
**\* Where: emit-argument
**\* Near:  [forall list [
expr: list/1
if block? unbox expr [comp-expression expr yes]
if object? expr [cast expr]
if type <> 'inline [
emitter/target/emit-argument expr functions/:name
]
]]



