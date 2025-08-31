
#5595: GC-related CRASH when adding keys to a map
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5595>

**Describe the bug**

```
loop 1e6 [put #[] random "abcdefghi" 1]							;-- crashes
loop 1e6 [put #[] to word! random "abcdefghi" 1]				;-- doesn't
loop 1e6 [put #[] random #{acadadeefacebeedadfeed2025} 1]		;-- doesn't
loop 1e6 [put #[] random copy #{acadadeefacebeedadfeed2025} 1]	;-- crashes
```
Dump for 1st line:
```
*** Runtime Error 101: no value matched in SWITCH
*** in file: /d/devel/red/red-src/master/runtime/hashtable.reds
*** at line: 364
***
***   --Frame-- --Code--  --Call--
***   010CF7D8h 004339E4h red/hash-string 00000065h true
***   010CF820h 004339EDh red/hash-string 05795BD4h false
***   010CF854h 00434884h red/_hashtable/hash-value 05795BD4h false
***   010CF8D0h 00436BF8h red/_hashtable/put-err 04A33CE8h 05795BD4h 010CF8E4h
***   010CF8F8h 00436A6Fh red/_hashtable/put 04A33CE8h 05795BD4h
***   010CF940h 004688D1h red/map/eval-path 04B18704h 04B18714h 04B18724h 00565618h 00000000h 00000000h -1 false false true false
***   010CF984h 004689B8h red/map/put 04B18704h 04B18714h 04B18724h false
***   010CF9B4h 00481570h red/actions/put 04B18704h 04B18714h 04B18724h false
***   010CF9DCh 0048150Ah red/actions/put* -1
***   010CFAD0h 0049A24Dh red/interpreter/eval-arguments 04B186F4h 057250A4h 057250A4h 04B186E4h 00000000h 00000000h 0 false
***   010CFB28h 0049A3EEh red/interpreter/eval-code 054C00CCh 05725064h 057250A4h 04B186E4h false 00000000h 00000000h 054C00CCh 0 false
***   010CFBACh 0049AE77h red/interpreter/eval-expression 05725064h 057250A4h 04B186E4h false false false
***   010CFBFCh 0049B47Eh red/interpreter/eval 04B186E4h true
***   010CFC38h 00482B63h red/natives/loop* false
***   010CFD2Ch 0049A24Dh red/interpreter/eval-arguments 04B186C4h 0572510Ch 0572510Ch 04B186A4h 00000000h 00000000h 0 false
***   010CFD84h 0049A3EEh red/interpreter/eval-code 054C0BECh 057250ECh 0572510Ch 04B186A4h false 00000000h 00000000h 054C0BECh 0 false
***   010CFE08h 0049AE77h red/interpreter/eval-expression 057250ECh 0572510Ch 04B186A4h false false false
***   010CFE58h 0049B47Eh red/interpreter/eval 04B186A4h true
***   010CFE98h 00487E7Dh red/natives/catch* true 1
***   010CFEE0h 00510755h ctx||629~try-do 04A24340h
***   010CFF34h 00512621h ctx||629~launch 04A24340h
***   010CFF58h 00513FD6h ctx||648~launch 04A2494Ch
***   010CFF70h 00420D08h <external>
***   010CFF80h 7745FCC9h <external>
***   010CFFDCh 77B2809Eh <external>
***   010CFFECh 77B2806Eh <external>
```
Dump for 4th line:
```
*** Runtime Error 1: access violation
*** in file: /d/devel/red/red-src/master/runtime/allocator.reds
*** at line: 346
***
***   --Frame-- --Code--  --Call--
***   010CF500h 0042B1D5h red/alloc-node
***   010CF520h 0042BC10h red/alloc-series 13 1 0
***   010CF544h 0042BE33h red/alloc-bytes 13
***   010CF590h 004421C3h red/_series/copy 032B8734h 032B8744h 032B8724h false 032B8724h
***   010CF5C4h 00480EE2h red/actions/copy 032B8734h 032B8744h 032B8724h false 032B8724h
***   010CF5F4h 00480E79h red/actions/copy* -1 -1 -1
***   010CF6F0h 0049A24Dh red/interpreter/eval-arguments 032B8724h 056B50A4h 056B50B4h 032B86E4h 00000000h 00000000h 0 false
***   010CF748h 0049A3EEh red/interpreter/eval-code 0538FECCh 056B5094h 056B50B4h 032B86E4h true 00000000h 00000000h 0538FECCh 0 false
***   010CF7CCh 0049AE77h red/interpreter/eval-expression 056B5094h 056B50B4h 032B86E4h false true false
***   010CF8E4h 0049921Dh red/interpreter/eval-arguments 032B8714h 056B5084h 056B50B4h 032B86E4h 00000000h 00000000h 0 false
***   010CF93Ch 0049A3EEh red/interpreter/eval-code 053900FCh 056B5084h 056B50B4h 032B86E4h true 00000000h 00000000h 053900FCh 0 false
***   010CF9C0h 0049AE77h red/interpreter/eval-expression 056B5084h 056B50B4h 032B86E4h false true false
***   010CFAD0h 0049921Dh red/interpreter/eval-arguments 032B86F4h 056B5074h 056B50B4h 032B86E4h 00000000h 00000000h 0 false
***   010CFB28h 0049A3EEh red/interpreter/eval-code 053900CCh 056B5064h 056B50B4h 032B86E4h false 00000000h 00000000h 053900CCh 0 false
***   010CFBACh 0049AE77h red/interpreter/eval-expression 056B5064h 056B50B4h 032B86E4h false false false
***   010CFBFCh 0049B47Eh red/interpreter/eval 032B86E4h true
***   010CFC38h 00482B63h red/natives/loop* false
***   010CFD2Ch 0049A24Dh red/interpreter/eval-arguments 032B86C4h 056B511Ch 056B511Ch 032B86A4h 00000000h 00000000h 0 false
***   010CFD84h 0049A3EEh red/interpreter/eval-code 05390BECh 056B50FCh 056B511Ch 032B86A4h false 00000000h 00000000h 05390BECh 0 false
***   010CFE08h 0049AE77h red/interpreter/eval-expression 056B50FCh 056B511Ch 032B86A4h false false false
***   010CFE58h 0049B47Eh red/interpreter/eval 032B86A4h true
***   010CFE98h 00487E7Dh red/natives/catch* true 1
***   010CFEE0h 00510755h ctx||629~try-do 03394340h
***   010CFF34h 00512621h ctx||629~launch 03394340h
***   010CFF58h 00513FD6h ctx||648~launch 0339494Ch
***   010CFF70h 00420D08h <external>
***   010CFF80h 7745FCC9h <external>
***   010CFFDCh 77B2809Eh <external>
***   010CFFECh 77B2806Eh <external>
```
Doesn't crash with `hash!` or with `recycle/off`.

**To reproduce**

Run any of the provided lines of code

**Expected behavior**

No crashes

**Platform version**
`Red 0.6.5 for Windows built 27-Feb-2025/15:41:44+08:00  commit #dc31261`


