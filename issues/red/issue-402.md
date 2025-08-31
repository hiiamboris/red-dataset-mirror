
#402: Single refinement can't precede refinement with arguments
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/402>

```
Red []

f: func [
    /r
    /x a
][
]
f/x 0
```

**\* Red Compiler Internal Error: Script Error : loop expected count argument of type: integer 
**\* Where: forskip 
**\* Near:  [forall path [
switch/default type?/word value: path/1 [
word! [
if all [not set not get? entry: find functions value] [
if alter: select ssa-names value [
entry: find functions alter
] 
either head? path [
pc: next pc 
comp-call path entry/2 
exit
] [
--not-implemented--
] 
emit?: no
]
] 
get-word! [
if head? path [
get?: yes 
change path to word! path/1
]
] 
integer! paren! string! [
if head? path [path-head-error]
]
] [
throw-error ["cannot use" mold type? value "value in path:" pc/1]
]
] 
if emit?
]



