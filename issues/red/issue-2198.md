
#2198: Internal compiler error when using non-existing refinement
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2198>

This code crashes compiler

```
Red []

f: func [x] [x]
f/only 3
```

with this error:

```
Compiling E:\Code\red-bugs\test.red ...
*** Red Compiler Internal Error: Script Error : copy expected value argument of type: series port bitset
*** Where: comp-call
*** Near:  [forall path [
switch/default type?/word value: path/1 [
word! [
if all [
not set? not get?
all [
alter: get-prefix-func value
entry: find-function alter value
name: alter
]
] [
if head? path [
if alter: select-ssa name [entry: find functions alter]
pc: next pc
either ctx: any [
obj-func-call? value
pick entry/2 5
] [
comp-call/with path entry/2 name ctx
] [
comp-call path entry/2
]
exit
]
]
add-symbol value
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
self?: path/1
]
```



