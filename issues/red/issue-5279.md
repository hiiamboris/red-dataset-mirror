
#5279: Crash when using option BOUNDS for a LOOSE face
================================================================================
Issue is closed, was reported by luce80 and has 4 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5279>

**Describe the bug**
Crash when using option BOUNDS for a LOOSE face but without an `object!`.

**To reproduce**
```
view [button "test" loose options [bounds: object [min: 0x0 max: 0x0]]]
```
But this works:
```
view compose/deep [button "test" loose options [bounds: (object [min: 0x0 max: 0x0])]]
```

**Expected behavior**
No crush

**Platform version**
```
>> about/debug/cc
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4624 date: 4-Jan-2023/8:46:38 commit: #8290def6eeef4185332d6d7cab3f7ba3544d4582 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 22000 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-02-07T18:47:17Z, hiiamboris, commented:
<https://github.com/red/red/issues/5279#issuecomment-1421279502>

    core issue: lack of language-wide data validation https://github.com/red/REP/issues/132

--------------------------------------------------------------------------------

On 2023-02-10T18:57:25Z, dockimbel, commented:
<https://github.com/red/red/issues/5279#issuecomment-1426212075>

    Added also [some extra docs](https://github.com/red/docs/blob/master/en/view.adoc#options-facet) about `/options` facet syntax.

