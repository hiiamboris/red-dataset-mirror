# Issue #5651: [RS] Passing `[1]` as `int-ptr!` causing compiler internal error
<https://github.com/red/red/issues/5651>

**Describe the bug**
Compiler internal error
```
*** Red/System Compiler Internal Error: Script Error : emit-push expected value argument of type: char logic integer word block string tag path get-word object decimal issue 
*** Where: emit-argument
*** Near:  [forall list [
expr: list/1
if block? unbox/deep expr [comp-expression expr yes]
if object? expr [cast expr]
if type <> 'inline [
either all [types not tag? expr block? types/1 'value = last types/1] [
emitter/push-struct expr resolve-aliased types/1
] [
emitter/target/emit-argument expr fspec
]
]
if types [types: skip types -2]
]]
```

**To reproduce**
```Red
Red/System []

receive: func [arr [int-ptr!]] []
receive [1]
```

**Expected behavior**
Compile or graceful compilation error

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.6 ahead: 0 date: 19-Mar-2025/13:09:25 commit: #6942c7a021253150c3e3cf90428305892340db03 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19045 ]
--------------------------------------------
```



## JiaChen-Zeng on 2025-10-05T12:40:30Z
Another case where `[typed]` function causing the same error. Also some other kinds of errors related to array passing.

```red
Red/System []

; Compiler internal error
; Where: emit-argument Near:  [forall list [
receive: func [arr [int-ptr!]] []
receive [1]

; Compiler internal error
; Where: emit-argument Near:  [forall list [
receive-n: func [[typed] count [integer!] list [typed-value!]] []
receive-n [[1]]

a: [1]
receive-n [a] ; ok

; Compiler internal error
; Where: get-type Near:  [case [
a2: [1 [1]]
receive-n a2

receive-n [:a] ; ok

; Compiler internal error
; Where: Where: store-global Near:  [append spec/4 index? tail data-buf]
b: [:a]
receive-n b
```


## JiaChen-Zeng on 2025-10-11T08:47:18Z
Another similar typeof compiler internal error

```red
Red/System []

d!: alias struct! [i [integer!]]

d: declare d!
d: as d! as pointer! d ; Red/System Compiler Internal Error: Script Error : find-aliased expected type argument of type: word 
```


