
#5404: Arbitrary JUNK injection into `enbase` results and CRASHES
================================================================================
Issue is closed, was reported by hiiamboris and has 6 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5404>

**Describe the bug**

From time to time enbase fails and spits out junk:
```
>> probe unique loop 1e6 [append [] enbase/base to #{} {lorem ipsum dolor sit amet} 16] ()
[{6C6F72656D20697073756D20646F6C6F722073697420616D6574} {E0AFDCBAE0AFDCBAE0AFDCBAE0AFDCBAE0AFDCBAE0AFDCBAE0AF} {3733373536443230363436463643364637323230373336393734}]

>> probe unique loop 1e6 [append [] enbase/base (checksum {lorem ipsum dolor sit amet} 'sha1) 16] ()
["530EC607B1E73E922F3767AA2CA64F05B5A1DC31" "E0AFDCBAE0AFDCBAE0AFDCBAE0AFDCBAE0AFDCBA"]

>> probe unique loop 1e6 [append [] enbase/base (checksum {lorem ipsum dolor sit amet} 'sha256) 16] ()
[{2F8586076DB2559D3E72A43C4AE8A1F5957ABB23CA4A1F46E380DD640536EEDB} {0000000000000000000000000000000000000000000000000000000000000000} {957ABB23CA4A1F46E380DD640536EEDB43413441CA4A1F46E380DD640536EEDB} {3441453841314635393537414242323343413441314634364533383044443634}]

>> probe unique loop 1e6 [append [] enbase/base (checksum {lorem ipsum dolor sit amet} 'sha512) 16] ()
[{BAFA0732D3B1A1D95431BD6FFF46B35AC6B60C64AC8EA8B11CB05F7C1A706469AA04C181172BD5E303C3A1F19EEF35469500FE9866E6B4C7BBC12759FEE8E735} {000000000000000000000000FF46B35AC6B60C64AC8EA8B11CB05F7C1A706469AA04C181172BD5E303C3A1F19EEF35469500FE9866E6B4C7BBC12759FEE8E735}]
```
There are also crashes:
```
>> probe unique loop 1e6 [append [] enbase/base to #{} {lorem ipsum dolor sit amet} 64] ()
root: 6003/8690, runs: 464, mem: 174121812 => 3233748, mark: 4.0ms, sweep: 629.5ms

*** Runtime Error 1: access violation
*** in file: /d/devel/red/red-src/master/runtime/datatypes/binary.reds
*** at line: 554
***
***   stack: red/binary/encode-64 1110FFD8h 26
***   stack: red/natives/enbase* false 1
***   stack: red/interpreter/eval-arguments 053D1F0Ch 057CFB08h 057CFB08h 053D1EDCh 057CFAB8h 057CFA00h 0 false
***   stack: red/interpreter/eval-code 054B12D8h 057CFAC8h 057CFB08h 053D1EDCh true 057CFAB8h 057CFA00h 054B12D8h 0 false
***   stack: red/interpreter/eval-path 057CFAB8h 057CFAC8h 057CFB08h 053D1EDCh false false true false
***   stack: red/interpreter/eval-expression 057CFAC8h 057CFB08h 053D1EDCh false true false
***   stack: red/interpreter/eval-arguments 053D1EECh 057CFAB8h 057CFB08h 053D1EDCh 00000000h 00000000h 0 false
***   stack: red/interpreter/eval-code 054B0068h 057CFAA8h 057CFB08h 053D1EDCh false 00000000h 00000000h 054B0068h 0 false
***   stack: red/interpreter/eval-expression 057CFAA8h 057CFB08h 053D1EDCh false false false
***   stack: red/interpreter/eval 053D1EDCh true
***   stack: red/natives/loop* false
***   stack: red/interpreter/eval-arguments 053D1EBCh 057CFB98h 057CFBA8h 053D1E7Ch 00000000h 00000000h 0 false
***   stack: red/interpreter/eval-code 054B0BE8h 057CFB78h 057CFBA8h 053D1E7Ch true 00000000h 00000000h 054B0BE8h 0 false
***   stack: red/interpreter/eval-expression 057CFB78h 057CFBA8h 053D1E7Ch false true false
***   stack: red/interpreter/eval-arguments 053D1EACh 057CFB68h 057CFBA8h 053D1E7Ch 00000000h 00000000h 0 false
***   stack: red/interpreter/eval-code 054B0F98h 057CFB68h 057CFBA8h 053D1E7Ch true 00000000h 00000000h 054B0F98h 0 false
***   stack: red/interpreter/eval-expression 057CFB68h 057CFBA8h 053D1E7Ch false true false
***   stack: red/interpreter/eval-arguments 054B6438h 057CFB58h 057CFBA8h 053D1E7Ch 00000000h 00000000h 0 false
***   stack: red/interpreter/eval-code 054B6438h 057CFB58h 057CFBA8h 053D1E7Ch false 00000000h 00000000h 054B6438h 0 false
***   stack: red/interpreter/eval-expression 057CFB58h 057CFBA8h 053D1E7Ch false false false
***   stack: red/interpreter/eval 053D1E7Ch true
***   stack: red/natives/catch* true 1
***   stack: ctx||626~try-do 0140F790h
***   stack: ctx||626~do-command 0140F790h
***   stack: ctx||626~eval-command 0140F790h
***   stack: ctx||626~run 0140F790h
***   stack: ctx||626~launch 0140F790h
***   stack: ctx||645~launch 0140F17Ch

>> probe unique loop 1e6 [append [] enbase/base (checksum {lorem ipsum dolor sit amet} 'sha1) 16] ()
root: 6003/8690, runs: 108, mem: 157299596 => 3011508, mark: 3.4ms, sweep: 614.2ms

*** Runtime Error 1: access violation
*** in file: /d/devel/red/red-src/master/runtime/datatypes/binary.reds
*** at line: 450
***
***   stack: red/binary/encode-16 0EBCFFB8h 20
***   stack: red/natives/enbase* false 1
***   stack: red/interpreter/eval-arguments 04B71F0Ch 057AEE90h 057AEE90h 04B71EDCh 057AEE60h 057AED88h 0 false
***   stack: red/interpreter/eval-code 055512D8h 057AEE70h 057AEE90h 04B71EDCh true 057AEE60h 057AED88h 055512D8h 0 false
***   stack: red/interpreter/eval-path 057AEE60h 057AEE70h 057AEE90h 04B71EDCh false false true false
***   stack: red/interpreter/eval-expression 057AEE70h 057AEE90h 04B71EDCh false true false
***   stack: red/interpreter/eval-arguments 04B71EECh 057AEE60h 057AEE90h 04B71EDCh 00000000h 00000000h 0 false
***   stack: red/interpreter/eval-code 05550068h 057AEE50h 057AEE90h 04B71EDCh false 00000000h 00000000h 05550068h 0 false
***   stack: red/interpreter/eval-expression 057AEE50h 057AEE90h 04B71EDCh false false false
***   stack: red/interpreter/eval 04B71EDCh true
***   stack: red/natives/loop* false
***   stack: red/interpreter/eval-arguments 04B71EBCh 057AEEF8h 057AEEF8h 04B71E7Ch 00000000h 00000000h 0 false
***   stack: red/interpreter/eval-code 05550BE8h 057AEED8h 057AEEF8h 04B71E7Ch true 00000000h 00000000h 05550BE8h 0 false
***   stack: red/interpreter/eval-expression 057AEED8h 057AEEF8h 04B71E7Ch false true false
***   stack: red/interpreter/eval-arguments 04B71EACh 057AEEC8h 057AEEF8h 04B71E7Ch 00000000h 00000000h 0 false
***   stack: red/interpreter/eval-code 05550F98h 057AEEC8h 057AEEF8h 04B71E7Ch true 00000000h 00000000h 05550F98h 0 false
***   stack: red/interpreter/eval-expression 057AEEC8h 057AEEF8h 04B71E7Ch false true false
***   stack: red/interpreter/eval-arguments 05556438h 057AEEB8h 057AEEF8h 04B71E7Ch 00000000h 00000000h 0 false
***   stack: red/interpreter/eval-code 05556438h 057AEEB8h 057AEEF8h 04B71E7Ch false 00000000h 00000000h 05556438h 0 false
***   stack: red/interpreter/eval-expression 057AEEB8h 057AEEF8h 04B71E7Ch false false false
***   stack: red/interpreter/eval 04B71E7Ch true
***   stack: red/natives/catch* true 1
***   stack: ctx||626~try-do 0135F790h
***   stack: ctx||626~do-command 0135F790h
***   stack: ctx||626~eval-command 0135F790h
***   stack: ctx||626~run 0135F790h
***   stack: ctx||626~launch 0135F790h
***   stack: ctx||645~launch 0135F17Ch
```
None of that ever happens with GC off. Checksum doesn't seem to be the culprit, and it works the same on Linux. But without `enbase` I never reproduced it so far, so should be our primary suspect.


**To reproduce**

Any of these may trigger it. Crashes seem to never happen in fresh console, but after one of the junk injections occurred already.
- `probe unique loop 1e6 [append [] enbase/base to #{} {lorem ipsum dolor sit amet} 16] () `
- `probe unique loop 1e6 [append [] enbase/base to #{} {lorem ipsum dolor sit amet} 64] () `
- `probe unique loop 1e6 [append [] enbase/base checksum {lorem ipsum dolor sit amet} 'sha1 16] () `
- `probe unique loop 1e6 [append [] enbase/base checksum {lorem ipsum dolor sit amet} 'sha256 16] () `
- `probe unique loop 1e6 [append [] enbase/base checksum {lorem ipsum dolor sit amet} 'sha512 16] () `

I observe CLI console more readily producing junk. In GUI console subsequent runs are less likely to have errors.

**Expected behavior**

No junk or crashes.

**Platform version**
```
Red 0.6.4 for Windows built 10-Oct-2023/18:48:47+03:00  commit #fe4c40b
```


Comments:
--------------------------------------------------------------------------------

On 2023-10-15T09:46:55Z, qtxie, commented:
<https://github.com/red/red/issues/5404#issuecomment-1763337603>

    It is the `unique` which messes up the block.

--------------------------------------------------------------------------------

On 2023-10-15T09:53:31Z, hiiamboris, commented:
<https://github.com/red/red/issues/5404#issuecomment-1763339198>

    Shouldn't be. This issue initially occurred without `unique`, with `checksum`+`enbase`.

--------------------------------------------------------------------------------

On 2023-10-15T09:55:48Z, qtxie, commented:
<https://github.com/red/red/issues/5404#issuecomment-1763339630>

    If I just probe the block without `unique`, all the values are the same in the block.

