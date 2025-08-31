
#4913: CRASH in `change` on strings
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.bug]
<https://github.com/red/red/issues/4913>

**Describe the bug**
```
>> change "" next [1 2]

*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/runtime/datatypes/string.reds
*** at line: 1238
***
***   stack: red/string/concatenate-literal-part 0298C124h 00FCF000h 16459009
***   stack: red/datatype/mold 02D1AB40h 0298C124h false false true 00000000h 0 0
***   stack: red/actions/mold 02D1AB40h 0298C124h false false true 00000000h 0 0
***   stack: red/error/reduce 0298C104h 02AC88A8h
***   stack: red/error/form 02AC88A8h 0298C0F4h 0298C0D4h -18
***   stack: red/actions/form 02AC88A8h 0298C0F4h 0298C0D4h 0
***   stack: red/block/form 0298C0E4h 0298C0F4h 0298C0D4h 0
***   stack: red/actions/form 0298C0E4h 0298C0F4h 0298C0D4h 0
***   stack: red/actions/form* -1
***   stack: red/natives/do-print true true
***   stack: red/natives/print* true
***   stack: ctx||548~do-command 00F51D00h
***   stack: ctx||548~eval-command 00F51D00h
***   stack: ctx||548~run 00F51D00h
***   stack: ctx||548~launch 00F51D00h
***   stack: ctx||566~launch 00F5179Ch
```

**Expected behavior**

No crash.

**Platform version**
```
Red 0.6.4 for Windows built 13-Jun-2021/10:10:47+03:00  commit #79ded2f
```



