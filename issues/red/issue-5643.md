# Issue #5643: Remote `read/binary` crashes on Linux
<https://github.com/red/red/issues/5643>

**Describe the bug**

`read URL` on Linux randomly crashes, e.g.:
```
root: 6339/9025, runs: 0, mem: 3073188***
***   --Frame-- --Code--  --Call--
***   FFCFEB88h 0806B5DAh stack-trace
***   FFCFEBC4h 080F8698h red/collector/do-mark-sweep
***   FFCFEBDCh 080F8A36h red/collector/do-cycle
***   FFCFEC08h 08073BEDh red/alloc-series-buffer 379392 1 0
***   FFCFEC40h 08074195h red/expand-series EFA44F98h 379392
***   FFCFEC68h 08075BC8h red/alloc-tail-unit EFA44F98h 16384
***   FFCFEC90h 080B40D6h red/binary/rs-append 09A35E94h 09A74600h 16384
***   FFCFECC8h 080EC5D8h red/simple-io/get-http-response 09A74600h 1 16384 09A35E94h
 => 2860952, mark: 4.8ms, sweep: 0.7ms
root: 6339/9025, runs: 1, mem: 3999176***
***   --Frame-- --Code--  --Call--
***   FFCFEB88h 0806B5DAh stack-trace
***   FFCFEBC4h 080F8698h red/collector/do-mark-sweep
***   FFCFEBDCh 080F8A36h red/collector/do-cycle
***   FFCFEC08h 08073BEDh red/alloc-series-buffer 1517568 1 0
***   FFCFEC40h 08074195h red/expand-series EED5BA30h 1517568
***   FFCFEC68h 08075BC8h red/alloc-tail-unit EED5BA30h 16384
***   FFCFEC90h 080B40D6h red/binary/rs-append 09A35E94h 09A74600h 16384
***   FFCFECC8h 080EC5D8h red/simple-io/get-http-response 09A74600h 1 16384 09A35E94h
 => 3430040, mark: 4.1ms, sweep: 1.8ms

*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/runtime/hashtable.reds
*** at line: 2544
***
***   --Frame-- --Code--  --Call--
***   FFCFF794h 080810BFh red/_hashtable/get-ctx-word EFCC45E4h 0
***   FFCFF890h 080E0DF0h red/interpreter/eval-arguments EFC0C1ACh EFA183E4h EFA183F4h 09A35E04h 00000000h 00000000h 0 false
***   FFCFF8E8h 080E226Ah red/interpreter/eval-code EFC0C1ACh EFA183C4h EFA183F4h 09A35E04h true 00000000h 00000000h EFC0C1ACh 0 false
***   FFCFF96Ch 080E2B29h red/interpreter/eval-expression EFA183C4h EFA183F4h 09A35E04h false true false
***   FFCFFA78h 080E0ECFh red/interpreter/eval-arguments 09A35E24h EFA183B4h EFA183F4h 09A35E04h 00000000h 00000000h 0 false
***   FFCFFAD0h 080E20A0h red/interpreter/eval-code EFC09F0Ch EFA183B4h EFA183F4h 09A35E04h false 00000000h 00000000h EFC09F0Ch 0 false
***   FFCFFB54h 080E2B29h red/interpreter/eval-expression EFA183B4h EFA183F4h 09A35E04h false false false
***   FFCFFBA4h 080E3130h red/interpreter/eval 09A35E04h true
***   FFCFFBE4h 080CF769h red/natives/catch* true 1
***   FFCFFC2Ch 0815B91Bh ctx||646~try-do EF897A94h
***   FFCFFC80h 0815D7E7h ctx||646~launch EF897A94h
***   FFCFFCA4h 0815F19Ch ctx||665~launch EF8980A4h
***   FFCFFCBCh 08069F2Dh ***_start
```

**To reproduce**

Run this code from a debug (`-d`) console under linux:
```
if error? try [bin: read/binary https://static.red-lang.org/dl/auto/win/red-20aug25-5bf660e80.exe] []
```
(`if` is mandatory to crash it it seems)

**Expected behavior**

No crash

**Platform version**
```
-----------RED & PLATFORM VERSION-----------
RED: [ branch: "master" tag: #v0.6.6 ahead: 82 date: 20-Aug-2025/10:51:12 commit: #5bf660e8066824686ca5851ff7475711164ee7ec ]
PLATFORM: [ name: "Ubuntu 24.04.3 LTS" OS: 'Linux arch: 'x86_64 version: 6.8.0 build: {#78-Ubuntu SMP PREEMPT_DYNAMIC Tue Aug 12 11:34:18 UTC 2025} ]
--------------------------------------------
```



## qtxie on 2025-09-01T08:41:42Z
Looks like a GC related issue.


## dockimbel on 2025-09-02T16:14:07Z
I can reproduce the crash on Win11 within an Ubuntu/WSL2 shell, by just compiling the following minimal version in debug mode:

```
Red []

do {if error? try [bin: read/binary https://static.red-lang.org/dl/auto/win/red-20aug25-5bf660e80.exe] []}
```


## dockimbel on 2025-09-02T18:51:29Z
The native stack is not reached beyond the callback call `red/simple-io/get-http-response`, so I suspect that one or more series/node on stack are not marked because of that. The frame chaining with upper Red native frames seems to be not working properly in this case (EDIT: confirmed!).


## dockimbel on 2025-09-05T10:12:07Z
Pushed a fix in branch `issue-5643`. Only for IA-32 for now, will add ARM backend support, then merge it to master.


## hiiamboris on 2025-09-05T13:18:21Z
If it's an emitter bug, strange we didn't notice it on Windows @dockimbel 


## dockimbel on 2025-09-08T10:26:52Z
I'm not sure what is the precise reason for that, but as it's linked to external calls and native stack layout, the issue might just be more rare on Windows.


