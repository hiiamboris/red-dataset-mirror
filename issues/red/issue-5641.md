
#5641: LOAD-CSV returns error instead of throwing it
================================================================================
Issue is open, was reported by GiuseppeChillemi and has 2 comment(s).
[status.duplicate]
<https://github.com/red/red/issues/5641>

**Describe the bug**

`LOAD-CSV` returns error instead of throwing it when not alignened data is provided

**To reproduce**

```
attempt [load-csv/with {a,b,c^M1,2,3^M4,5,6,7^M} ","]

*** User Error: Data are not aligned
*** Where: ???
*** Near : return make error! non-aligned 
```

Discussion has happened [here](https://matrix.to/#/!mjbZGzLqlsqlDLaQVP:gitter.im/$nGp1Xu2SqC3YNV4ab5AV-2Yd-uNPYn0QFnKfy8QxYVY?via=gitter.im&via=matrix.org&via=tchncs.de)

**Expected behavior**
Using `attempt` it should return `none`


**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.6 ahead: 75 date: 13-Jul-2025/13:27:17 commit: #31205e5c6189648cfa852e73c71be1afc18445d0 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 26100 ]
--------------------------------------------
```




Comments:
--------------------------------------------------------------------------------

On 2025-08-19T12:59:56Z, hiiamboris, commented:
<https://github.com/red/red/issues/5641#issuecomment-3200662417>

    See https://github.com/red/red/issues/5521

