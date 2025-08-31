
#4838: [Draw] CRASH in shape dialect corrupting Draw block
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/4838>

**Describe the bug**

---
**Variant 1**
```
Red []

probe crs: [0x0]
draw 100x10 probe compose/deep [shape [curve (crs)]]
print "OK"
```
GUI console silently quits most of the time, but some builds may say:
```
[[0x0 3x3 20x5]]
[shape [curve [0x0 3x3 20x5]]]
*** Script Error: invalid Draw dialect input at: [event event curve [0x0 3x3 20x5]]
*** Where: draw-image
*** Stack: draw 
```
CLI console results vary from build to build, but smth like:
```
[0x0]
[shape [curve 0x0]]
*** Script Error: invalid Draw dialect input at: [event curve 0x0]
*** Where: draw-image
*** Stack: draw
```
`event` can be `true` instead or anything I suppose
```
*** Runtime Error 1: access violation
*** at: FFFFFFFFh
```
```
*** Runtime Error 1: access violation
*** Cannot determine source file/line info.
***
```

---
**Variant 2**
```
Red []

probe crs: collect [keep take [0x0]]
draw 100x10 probe compose/deep [shape [curve (crs)]]
print "OK"
```
Same results as variant 1 plus:
```
*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/runtime/datatypes/string.reds
*** at line: 1091
***
***   stack: red/string/alter 02889314h 02CCBC98h -1 0 true 0
***   stack: red/string/concatenate 02889314h 02CCBC98h -1 0 true false
***   stack: red/string/form 02CCBC98h 02889314h 00000000h -3
***   stack: red/tag/form 02CCBC98h 02889314h 00000000h -2
***   stack: red/tag/mold 02CCBC98h 02889314h false false true 00000000h -1 0
***   stack: red/actions/mold 02CCBC98h 02889314h false false true 00000000h -1 0
***   stack: red/block/mold-each 02CCBD80h 02889314h false false true 00000000h -1 0
***   stack: red/block/mold 02CCBD80h 02889314h false false true 00000000h -1 0
***   stack: red/actions/mold 02CCBD80h 02889314h false false true 00000000h 0 0
***   stack: red/error/reduce 02889304h 028892E4h
***   stack: red/error/form 028892E4h 028892F4h 028892D4h -18
***   stack: red/actions/form 028892E4h 028892F4h 028892D4h 0
***   stack: red/actions/form* -1
***   stack: red/natives/do-print true true
***   stack: red/natives/print* true
***   stack: ctx||568~launch 02801D68h
***   stack: ctx||587~launch 02801804h
```

---
**Variant 3**
```
Red []

p: [0x0 3x3 20x5 40x0 50x5 42x10]
probe crs: collect [keep reduce [take/part p 3]]

draw 100x10 probe compose/deep [shape [curve (crs)]]
print "OK"
```
Same results plus:
```
*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/runtime/datatypes/block.reds
*** at line: 478
***
***   stack: red/block/mold-each 0019FCD4h 02909314h false false true 00000000h -7 0
***   stack: red/block/mold 0019FCD4h 02909314h false false true 00000000h -7 0
***   stack: red/_function/mold 02C9BF58h 02909314h false false true 00000000h -1 0
***   stack: red/actions/mold 02C9BF58h 02909314h false false true 00000000h -1 0
***   stack: red/block/mold-each 02C9C050h 02909314h false false true 00000000h -1 0
***   stack: red/block/mold 02C9C050h 02909314h false false true 00000000h -1 0
***   stack: red/actions/mold 02C9C050h 02909314h false false true 00000000h 0 0
***   stack: red/error/reduce 02909304h 029092E4h
***   stack: red/error/form 029092E4h 029092F4h 029092D4h -18
***   stack: red/actions/form 029092E4h 029092F4h 029092D4h 0
***   stack: red/actions/form* -1
***   stack: red/natives/do-print true true
***   stack: red/natives/print* true
***   stack: ctx||568~launch 026F1D68h
***   stack: ctx||587~launch 026F1804h
```
(I suspect stack traces are misleading and the corruption happens way before that)

**To reproduce**

Save the 3 provided scripts as files and run.

**Expected behavior**

No crashes. Draw block may be malformed - then an error shown.

**Platform version**
```
Red 0.6.4 for Windows built 16-Feb-2021/11:41:34+03:00 commit #0187423
pre-D2D builds as well
```



