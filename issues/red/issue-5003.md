
#5003: [CRASH] FIND/PART doesn't check the input length?
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[type.bug]
<https://github.com/red/red/issues/5003>

**Describe the bug**
```
>> find/part [x y] 'z 2 ()
>> find/part [x y] 'z 3 ()

*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/runtime/datatypes/string.reds
*** at line: 1238
***
***   stack: red/string/concatenate-literal-part 04A0CEECh 0114F000h 18026881
***   stack: red/datatype/mold 057046E0h 04A0CEECh false false true 00000000h 0 0
***   stack: red/actions/mold 057046E0h 04A0CEECh false false true 00000000h 0 0
***   stack: red/error/reduce 04A0CECCh 04C48AC8h
***   stack: red/error/form 04C48AC8h 04A0CEBCh 04A0CE9Ch -18
***   stack: red/actions/form 04C48AC8h 04A0CEBCh 04A0CE9Ch 0
***   stack: red/block/form 04A0CEACh 04A0CEBCh 04A0CE9Ch 0
***   stack: red/actions/form 04A0CEACh 04A0CEBCh 04A0CE9Ch 0
***   stack: red/actions/form* -1
***   stack: red/natives/do-print true true
***   stack: red/natives/print* true
***   stack: ctx||579~do-command 04BA1480h
***   stack: ctx||579~eval-command 04BA1480h
***   stack: ctx||579~run 04BA1480h
***   stack: ctx||579~launch 04BA1480h
***   stack: ctx||598~launch 04BA0E94h
```
One thing I can't understand is why `mold` is called at all?

**Platform version**
```
Red 0.6.4 for Windows built 2-Dec-2021/13:03:38
```



