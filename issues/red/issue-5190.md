
#5190: Crash when setting self
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5190>

**Describe the bug**
```
>> o: object [self/self/self: 1 probe self]

*** Runtime Error 1: access violation
*** in file: /d/devel/red/red-src/master/runtime/datatypes/object.reds
*** at line: 624
***
***   stack: red/object/serialize 04A4D91Ch 04A4D92Ch false false false 04A4D90Ch 2147483622 true 1 true
***   stack: red/object/mold 04A4D91Ch 04A4D92Ch false false false 04A4D90Ch 2147483647 0
***   stack: red/actions/mold 04A4D91Ch 04A4D92Ch false false false 04A4D90Ch 2147483647 0
***   stack: red/actions/mold* -1 -1 -1 -1
***   stack: probe
***   stack: red/_function/call 04A4D8FCh 03253884h 05766C70h 0
***   stack: red/interpreter/eval-code 053D61B8h 05766C90h 05766C90h 04A4D8DCh false 00000000h 00000000h 053D61B8h
***   stack: red/interpreter/eval-expression 05766C80h 05766C90h 04A4D8DCh false false false
***   stack: red/interpreter/eval 04A4D8DCh false
***   stack: red/object/make 04A4D8CCh 04A4D8DCh 32
***   stack: red/actions/make 04A4D8CCh 04A4D8DCh
***   stack: red/actions/make*
***   stack: context
***   stack: red/_function/call 04A4D8ACh 03253884h 05766CB8h 0
***   stack: red/interpreter/eval-code 053D0EA8h 05766CD8h 05766CD8h 04A4D87Ch true 00000000h 00000000h 053D0EA8h
***   stack: red/interpreter/eval-expression 05766CC8h 05766CD8h 04A4D87Ch false true false
***   stack: red/interpreter/eval-expression 05766CB8h 05766CD8h 04A4D87Ch false false false
***   stack: red/interpreter/eval 04A4D87Ch true
***   stack: red/natives/catch* true 1
***   stack: ctx||600~try-do 04B30DD8h
***   stack: ctx||600~do-command 04B30DD8h
***   stack: ctx||600~eval-command 04B30DD8h
***   stack: ctx||600~run 04B30DD8h
***   stack: ctx||600~launch 04B30DD8h
***   stack: ctx||619~launch 04B307E8h
```

**Expected behavior**

Shouldn't allow setting `self`. An error thrown.

**Platform version**
```
Red 0.6.4 for Windows built 30-Aug-2022/23:10:34+03:00  commit #4264449
```



