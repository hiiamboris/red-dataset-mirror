
#533: Compiler crash on uninitialised local variable
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/533>

```
Red/System []

f: function [
    /local x
][
    print :x
]
```

-= Red/System Compiler =- 
**\* Compiler Internal Error: Script Error : Cannot use path on none! value 
**\* Where: get-type 
**\* Near:  [switch/default type/1 [
function! [type] 
integer! byte! float! float32! [compose/deep [pointer! [(type/1)]]]
] [
throw-error ["invalid datatype for a get-word:" mold type]
]]



