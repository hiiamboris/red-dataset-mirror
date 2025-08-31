
#5638: LOAD fails on directory path
================================================================================
Issue is closed, was reported by gurzgri and has 0 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/5638>

Trying to `load` a directory path fails with `*** Script Error: transcode does not allow block! for its src argument` .

With `%dir/` being a dir path, no suffix is available to apply a codec and therefore the path is read binary. `read/binary` applied on a directory path returns a block just like read does. That block is then fed to `transcode` , but `transcode` only accepts a binary or string argument.

**To reproduce**
Steps to reproduce the behavior:

```
>> load %dir/
*** Script Error: transcode does not allow block! for its src argument
*** Where: transcode
*** Near : load %dir/
*** Stack: load
```

**Expected behavior**
No error and same result from `load %dir/` as from `read %dir/`

**Platform version**

```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.6 ahead: 75 date: 13-Jul-2025/13:27:17 commit: #31205e5c6189648cfa852e73c71be1afc18445d0 ]
PLATFORM: [ name: "Windows 11" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 26100 ]
--------------------------------------------
```


