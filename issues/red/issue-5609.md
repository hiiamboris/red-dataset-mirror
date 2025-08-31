
#5609: CRASH in `to-local-file/full` inside paths longer than 16 chars
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5609>

**Describe the bug**

```
>> what-dir
== %/D/
>> make-dir d: %123456789_123
== %123456789_123/
>> change-dir d
== %/D/123456789_123/            ;) full path must be over 16 chars
>> to-local-file/full %1

*** Runtime Error 1: access violation
*** in file: /d/devel/red/red-src/master/runtime/datatypes/string.reds
*** at line: 661
***
***   --Frame-- --Code--  --Call--
***   010CFA90h 00448190h red/string/append-char 057883D8h 49
***   010CFAC8h 00459001h red/file/to-local-path 05378914h 05378924h true
***   010CFAF4h 00488445h red/natives/to-local-file* false 1
***   010CFBECh 0049A504h red/interpreter/eval-arguments 05378904h 0578833Ch 0578833Ch 053788E4h 0578831Ch 0578826Ch 0 false
***   010CFC44h 0049A6A5h red/interpreter/eval-code 054412ECh 0578832Ch 0578833Ch 053788E4h true 0578831Ch 0578826Ch 054412ECh 0 false
***   010CFCC8h 00498F5Fh red/interpreter/eval-path 0578831Ch 0578832Ch 0578833Ch 053788E4h false false false false
***   010CFD44h 0049B1ADh red/interpreter/eval-expression 0578832Ch 0578833Ch 053788E4h false false false
***   010CFD94h 0049B735h red/interpreter/eval 053788E4h true
***   010CFDD4h 00488134h red/natives/catch* true 1
***   010CFE1Ch 0051149Dh ctx||630~try-do 01284454h
***   010CFE78h 0051192Fh ctx||630~do-command 01284454h
***   010CFEA4h 00512725h ctx||630~eval-command 01284454h
***   010CFEE0h 00512D91h ctx||630~run 01284454h
***   010CFF34h 0051368Fh ctx||630~launch 01284454h
***   010CFF58h 00514D1Eh ctx||649~launch 01284A60h
***   010CFF70h 00420E34h <external>
***   010CFF80h 7745FCC9h <external>
***   010CFFDCh 77B2809Eh <external>
***   010CFFECh 77B2806Eh <external>
```

**Expected behavior**

No crash

**Platform version**
```
Red 0.6.6 for Windows built 30-Mar-2025/6:44:37+08:00  commit #2b5aa6f
```


Comments:
--------------------------------------------------------------------------------

On 2025-04-13T07:19:03Z, hiiamboris, commented:
<https://github.com/red/red/issues/5609#issuecomment-2799837313>

    Another issue here IMO is the mess in file functions in Red. 
    The same(?) functionality is achieved by `to-local-file clean-path`, but the code involved is different == bloat.

--------------------------------------------------------------------------------

On 2025-04-16T09:41:11Z, dockimbel, commented:
<https://github.com/red/red/issues/5609#issuecomment-2808997668>

    > The same(?) functionality is achieved by to-local-file clean-path, but the code involved is different == bloat.
    
    As usual, it's not as simple as it seems on first look. I would have to recheck, I can only remember that there was a different behavior in some cases. I remember also considering merging them into one, but I gave up as `to-local-file` is a native function optimized for performance, so extending it to cover `clean-path` behavior would make it very heavy, slow and memory-hungry. However that was a long time ago, so if `clean-path` usage now has evolved to match perfectly `to-local-file`, then I would be glad to drop it immediately.

