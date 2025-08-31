
#233: Can't compile passing #enum type parameter in nested call
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/233>

```
#enum type! [
    x
]

f: function [
    a [type!]
][
]

g: function [
    a [type!]
][
    f a
]
```

**\* Compiler Internal Error: Script Error : first expected series argument of type: series pair event money date object port time tuple any-function library struct event 
**\* Where: check-expected-type 
**\* Near:  [if all [
not all [object? expr expr/action = 'null] 
not none? expr 
first type: resolve-expr-type expr
] [
type: resolve-aliased type 
if alias: select aliased-types expected/1 [expected: alias]
] 
if
]

This crashes again with:

**\* Compiler Internal Error: Script Error : resolve-aliased expected type argument of type: block 
**\* Where: resolve-expr-type 
**\* Near:  [forall args [
either all [decimal? args/1 spec/2/1 = 'float32!] [
args/1: make action-class [
action: 'type-cast 
type: [float32!] 
data: args/1
] 
append/only list spec/2
] [
append/only list check-expected-type name args/1 spec/2
] 
spec: skip spec 2
] 
if all
]



Comments:
--------------------------------------------------------------------------------

On 2012-08-17T20:56:10Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/233#issuecomment-7834870>

    Works now. Thanks.

