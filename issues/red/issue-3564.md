
#3564: DRAW re-orders BOX coordinates
================================================================================
Issue is closed, was reported by endo64 and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3564>

**Describe the bug**
`DRAW` re-orders of BOX coordinates and modifies its block argument.

**To Reproduce**
```
>> view [base 100x100 draw x: [box 10x0 20x10 box 20x0 10x10]]
>> x
== [box 10x0 20x10 box 10x0 20x10]

>> view [base 100x100 green draw x: [box 20x20 10x10 box 15x5 0x10]]
>> x
== [box 10x10 20x20 box 0x5 15x10]
```

**Expected behavior**
Draw block should not be modified

**Platform version:**
```
RED: [ branch: "master" tag: #v0.6.3 ahead: 1068 date: 7-Oct-2018/2:40:37 commit: #b4e7fff72801c9e7f563c11d6d722685ad8e88d9 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]
```


