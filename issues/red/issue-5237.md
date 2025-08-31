
#5237: [Compiler] Devmode accesses `styles.red` from the upper directory
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[type.bug] [status.duplicate] [type.compiler]
<https://github.com/red/red/issues/5237>

**Describe the bug**

Place the following `1.red` script in any directory:
```
Red []
```
Place the following `styles.red` script in the upper (relative to 1.red) directory:
```
Red [] #if compilation-broken [tell us]
```
Try compiling `redc -c 1.red` now:
```
Compiling D:\devel\red\spaces\3\4\1.red ...
Compiling libRedRT...
*** Preprocessor Error in #if
*** Script Error : compilation-broken has no value
*** Where: [#if]
*** Near:  [compilation-broken]
```

**Expected behavior**

Compiler shouldn't stick it's nose into random files.
There's nothing linking `1.red` to `styles.red`.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4559 date: 31-Oct-2022/7:53:59 commit: #4a12602b221e0d636b41614d7f91a25f9996a683 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2022-11-03T18:18:54Z, hiiamboris, commented:
<https://github.com/red/red/issues/5237#issuecomment-1302502230>

    Maybe a dupe of https://github.com/red/red/issues/4249 though

