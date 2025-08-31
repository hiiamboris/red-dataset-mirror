
#4514: [CRASH] Stack overflow during `recycle`
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[status.built] [status.tested] [type.bug] [type.GC]
<https://github.com/red/red/issues/4514>

**Describe the bug**

Use this snippet:
```
recycle/off
s: reactor [t: 0 re: [this/t: that/t]]
b: [] loop 3000 [append b make s []]       ;) count should be big enough
prev: s
foreach r b [react/link/later r/re: func [this that] r/re [r prev] prev: r]
s/t: 1
clear-reactions
recycle
```
Output:
```
root: 4644/6701, runs: 0, mem: 24838972
*** Runtime Error 19: stack error or overflow
*** in file: /D/devel/red/red-src/red-master/runtime/collector.reds
*** at line: 252
***
***   stack: red/collector/mark-values 02E3D248h 02E3D278h
***   stack: red/collector/mark-block 02E3D180h
***   stack: red/collector/mark-values 02E3D180h 02E3D230h
***   stack: red/collector/mark-block 02E3D108h
***   stack: red/collector/mark-values 02E3D108h 02E3D158h
***   stack: red/collector/mark-block-node 00BED5D0h
***   stack: red/collector/mark-values 02E3C828h 02E3C858h
***   stack: red/collector/mark-block-node 00BED628h
***   stack: red/collector/mark-context 00BED62Ch
***   stack: red/collector/mark-values 03E9A7A8h 03E9A7B8h
***   stack: red/collector/mark-block 03E9A738h
***   stack: red/collector/mark-values 03E9A738h 03E9A748h
***   stack: red/collector/mark-block 03E9A6C0h
***   stack: red/collector/mark-values 03E9A6C0h 03E9A710h
***   stack: red/collector/mark-block-node 03F5BF20h
***   stack: red/collector/mark-values 02E3DAE8h 02E3DAF8h
***   stack: red/collector/mark-block-node 00BED568h
***   stack: red/collector/mark-context 00BED56Ch
***   stack: red/collector/mark-values 03E9ACC8h 03E9ACD8h
***   stack: red/collector/mark-block 03E9AC58h
***   stack: red/collector/mark-values 03E9AC58h 03E9AC68h
***   stack: red/collector/mark-block 03E9ABE0h
***   stack: red/collector/mark-values 03E9ABE0h 03E9AC30h
***   stack: red/collector/mark-block-node 03F5BEECh
***   stack: red/collector/mark-values 02E3ED88h 02E3ED98h
***   stack: red/collector/mark-block-node 00BED4A8h
***   stack: red/collector/mark-context 00BED4ACh
***   stack: red/collector/mark-values 03E9B1E8h 03E9B1F8h
***   stack: red/collector/mark-block 03E9B178h
***   stack: red/collector/mark-values 03E9B178h 03E9B188h
***   stack: red/collector/mark-block 03E9B100h
***   stack: red/collector/mark-values 03E9B100h 03E9B150h
***   stack: red/collector/mark-block-node 03F5BEB8h
***   stack: red/collector/mark-values 02E40028h 02E40038h
***   stack: red/collector/mark-block-node 00BED3E8h
***   stack: red/collector/mark-context 00BED3ECh
***   stack: red/collector/mark-values 03E9B708h 03E9B718h
***   stack: red/collector/mark-block 03E9B698h
***   stack: red/collector/mark-values 03E9B698h 03E9B6A8h
***   stack: red/collector/mark-block 03E9B620h
```

**Expected behavior**

No crash.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 28-May-2020/17:51:04+03:00 commit #36857eb
```



Comments:
--------------------------------------------------------------------------------

On 2022-09-20T03:19:04Z, qtxie, commented:
<https://github.com/red/red/issues/4514#issuecomment-1251786508>

    No crashes on commit https://github.com/red/red/commit/040d936091c394aa0ab7d8998d03bd5e24758806.

--------------------------------------------------------------------------------

On 2022-09-20T07:40:33Z, hiiamboris, commented:
<https://github.com/red/red/issues/4514#issuecomment-1251963582>

    Stopped crashing between Sep 18/2021 and Sep 30/2021.

