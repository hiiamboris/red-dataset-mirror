
#3539: Cannot delete a relation in multi-source relation.
================================================================================
Issue is closed, was reported by nedzadarek and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/3539>

### Expected behavior
Delete a relation with 1 or more sources
### Actual behavior
Freezes the console - ~50% cpu, RAM usage is normal.
### Steps to reproduce the problem
```
source-a: make reactor! [a: 1]
source-b: make reactor! [b: 10]

obj: object [c: 0]
block: [obj/c: source-a/a * source-b/b]
react block
obj/c
; == 10

source-a/a: 2
obj/c
; == 20

; react/unlink block [source-a source-b] ; works fine
react/unlink block source-a ; freezes the console
```
### Red and platform version
```
Red for Windows version 0.6.3 built 26-Mar-2018/1:14:22+02:00
Win 8.1 x64
```
and 
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 857 date: 16-Sep-2018/5:12:03 commit: #09de884db66698de77464e42ffdb91445991fe2d ]
PLATFORM: [ name: "Windows 8" OS: 'Windows arch: 'x86-64 version: 6.2.0 build: 9200 ]
-----------RED & PLATFORM VERSION----------- 
```


Comments:
--------------------------------------------------------------------------------

On 2018-09-21T16:01:47Z, nedzadarek, commented:
<https://github.com/red/red/issues/3539#issuecomment-423585994>

    The same with `react/unlink block [source-a]`.

