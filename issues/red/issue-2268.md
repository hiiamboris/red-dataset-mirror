
#2268: "true = positive? 1" crashes Red/System compiler
================================================================================
Issue is closed, was reported by PeterWAWood and has 0 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/2268>

This simple program crashes the compiler:

``` text
Red/System []
true = positive? 1
```

``` text
-=== Red Compiler 0.6.1 ===- 

Compiling /Users/peter/VMShare/Code/Red-System/test.reds ...

Target: Darwin 

Compiling to native code...
*** Red/System Compiler Internal Error: Script Error : get-function-spec expected name argument of type: word 
*** Where: get-type 
*** Near:  [forall args [
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
```



