
#293: Can't pass enum in CONTEXT
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/293>

```
Red/System []

c: context [
    #enum e! [x]

    f: function [
        a       [e!]
        return: [logic!]
    ][
        zero? a
    ]
]
```

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

On 2012-11-06T22:34:06Z, dockimbel, commented:
<https://github.com/red/red/issues/293#issuecomment-10130754>

    This is a regression caused by the fix for #290.

