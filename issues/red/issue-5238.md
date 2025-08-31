
#5238: GC CRASH in hash/copy
================================================================================
Issue is closed, was reported by hiiamboris and has 8 comment(s).
[status.built] [type.bug] [test.written]
<https://github.com/red/red/issues/5238>

**To reproduce**

Run this:
```
Red []
h: make hash! [1 2 3 4 5 6 7 8 9 10 11 12 13]
forever [copy h]
```
Output (in less than 1 second):
```
root: 5035/7726, runs: 0, mem: 3263784
*** Runtime Error 1: access violation
*** in file: /d/devel/red/red-src/master/runtime/collector.reds
*** at line: 87
***
***   stack: red/collector/keep 00000000h
***   stack: red/_hashtable/mark 00000000h
***   stack: red/collector/mark-values 04A1D42Ch 04A1D43Ch
***   stack: red/collector/do-mark-sweep
***   stack: red/collector/do-cycle
***   stack: red/alloc-series-buffer 52 1 0
***   stack: red/alloc-series 52 1 0
***   stack: red/alloc-bytes 52
***   stack: red/_hashtable/_alloc-bytes-filled 52 #"^(FF)"
***   stack: red/_hashtable/init 13 04A1D42Ch 0 1
***   stack: red/hash/copy 04A1D41Ch 04A1D42Ch 04A1D40Ch false 04A1D40Ch
***   stack: red/actions/copy 04A1D41Ch 04A1D42Ch 04A1D40Ch false 04A1D40Ch
***   stack: red/actions/copy* -1 -1 -1
***   stack: red/interpreter/eval-arguments 04A1D40Ch 056DCC80h 056DCC80h 04A1D3FCh 00000000h 00000000h 0533FEA8h
***   stack: red/interpreter/eval-code 0533FEA8h 056DCC70h 056DCC80h 04A1D3FCh false 00000000h 00000000h 0533FEA8h
***   stack: red/interpreter/eval-expression 056DCC70h 056DCC80h 04A1D3FCh false false false
***   stack: red/interpreter/eval 04A1D3FCh false
***   stack: red/natives/forever* false
***   stack: red/interpreter/eval-arguments 04A1D3ECh 056DCD18h 056DCD18h 04A1D3CCh 00000000h 00000000h 05340BD8h
***   stack: red/interpreter/eval-code 05340BD8h 056DCD08h 056DCD18h 04A1D3CCh false 00000000h 00000000h 05340BD8h
***   stack: red/interpreter/eval-expression 056DCD08h 056DCD18h 04A1D3CCh false false false
***   stack: red/interpreter/eval 04A1D3CCh true
***   stack: red/natives/catch* true 1
***   stack: ctx||602~try-do 057C0C94h
***   stack: ctx||602~launch 057C0C94h
***   stack: ctx||621~launch 057C06A4h
```
In real code it manifests as a rare random heisencrash that often deadlocks the GC run:
```
 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, run
s: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 503
6/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 383005
28root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10,
mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726,
 runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root:
 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38
300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs:
10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7
726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528r
oot: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem
: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, ru
ns: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 50
36/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300
528root: 5036/7726, runs: 10, mem: 38300528root: 5036/7726, runs: 10, mem: 38300528
*** Runtime Error 1: access violation
*** in file: /d/devel/red/red-src/master/runtime/collector.reds
*** at line: 87
***
***   stack: red/collector/keep 00000000h
***   stack: red/_hashtable/mark 00000000h
***   stack: red/collector/mark-values 04ABD94Ch 04ACCCBCh
***   stack: red/collector/do-mark-sweep
***   stack: red/collector/do-cycle
***   stack: red/alloc-series-buffer 2 16 0
***   stack: red/alloc-series 2 16 0
***   stack: red/alloc-cells 2
***   stack: red/block/make-at 04ACCCACh 2
***   stack: red/block/push-only* 2
***   stack: red/error/create 05537B78h 0553D578h 00000000h 00000000h 00000000h
***   stack: red/fire 0 0106F6FCh
***   stack: red/stack/push*
***   stack: red/logic/push false
***   stack: red/_function/init-locals 3
***   stack: ctx||450~awake 0123AA88h
***   stack: gui/make-event 0055001Ch 0 18
***   stack: gui/WndProc 00551396h 6 0 0
```

**Expected behavior**

No crash

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4559 date: 31-Oct-2022/7:53:59 commit: #4a12602b221e0d636b41614d7f91a25f9996a683 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2022-11-06T18:22:57Z, greggirwin, commented:
<https://github.com/red/red/issues/5238#issuecomment-1304863015>

    Confirmed.

--------------------------------------------------------------------------------

On 2022-11-06T18:32:34Z, greggirwin, commented:
<https://github.com/red/red/issues/5238#issuecomment-1304864697>

    I can get it to happen sometimes at a loop count of 2'000, but not always the first time. Running the loop a few times, with breaks in between, ends up triggering it. Same with more iterations of a lower loop count. 

--------------------------------------------------------------------------------

On 2022-11-07T09:37:21Z, hiiamboris, commented:
<https://github.com/red/red/issues/5238#issuecomment-1305338962>

    Thanks for prompt fix, @qtxie :+1:

--------------------------------------------------------------------------------

On 2022-11-07T18:21:43Z, greggirwin, commented:
<https://github.com/red/red/issues/5238#issuecomment-1306012560>

    Agreed. :+1:

