
#5117: GC-related CRASH when creating a big hashtable
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [type.bug] [test.written]
<https://github.com/red/red/issues/5117>

**Describe the bug**
```
>> make hash! append/dup [] [1 2 3] 100000
root: 3739/6522, runs: 0, mem: 2865888 => 2327352, mark: 3.8ms, sweep: 1.0ms
root: 3739/6522, runs: 1, mem: 3375952 => 2851640, mark: 3.0ms, sweep: 2.0ms
root: 3739/6522, runs: 2, mem: 4948816 => 3900216, mark: 3.9ms, sweep: 1.0ms
root: 3739/6522, runs: 3, mem: 8094544 => 5997368, mark: 4.0ms, sweep: 1.0ms
root: 3739/6522, runs: 4, mem: 14386000 => 10191672, mark: 4.9ms, sweep: 1.0ms
root: 3739/6522, runs: 5, mem: 14991700 => 14991700, mark: 4.0ms, sweep: 0.0ms
root: 3739/6522, runs: 6, mem: 19922904 => 15122876, mark: 6.0ms, sweep: 1.0ms
root: 3739/6522, runs: 7, mem: 19994036 => 18682300, mark: 7.7ms, sweep: 1.0ms

*** Runtime Error 1: access violation
*** in file: /d/devel/red/red-src/red/runtime/hashtable.reds
*** at line: 81
***
***   stack: red/array/pick-int 010FF33Ch 1
***   stack: red/_hashtable/put 010FF328h 069E0038h
***   stack: red/_hashtable/put-all 010FF328h 0 1
***   stack: red/_hashtable/init 300000 051F897Ch 0 1
***   stack: red/hash/make 051F895Ch 051F896Ch 36
***   stack: red/actions/make 051F895Ch 051F896Ch
***   stack: red/actions/make*
***   stack: red/interpreter/eval-arguments 051F894Ch 0553A078h 0553A078h 051F892Ch 00000000h 00000000h 052E05A8h
***   stack: red/interpreter/eval-code 052E05A8h 0553A028h 0553A078h 051F892Ch false 00000000h 00000000h 052E05A8h
***   stack: red/interpreter/eval-expression 0553A028h 0553A078h 051F892Ch false false false
***   stack: red/interpreter/eval 051F892Ch true
***   stack: red/natives/catch* true 1
***   stack: ctx||495~try-do 010CA7B4h
***   stack: ctx||495~do-command 010CA7B4h
***   stack: ctx||495~eval-command 010CA7B4h
***   stack: ctx||495~run 010CA7B4h
***   stack: ctx||495~launch 010CA7B4h
***   stack: ctx||514~launch 010CA1C8h
```

**Platform version**
```
Red 0.6.4 for Windows built 4-Apr-2022/15:09:55+03:00  commit #28dad01
```



