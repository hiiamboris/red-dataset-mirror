
#5318: `find` allows `number!` for /part but spits back
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
<https://github.com/red/red/issues/5318>

**Describe the bug**

```
>> ? find
USAGE:
     FIND series value

DESCRIPTION: 
     Returns the series where a value is found, or NONE. 
     FIND is an action! value.

ARGUMENTS:
     series       [series! bitset! typeset! port! map! none!] 
     value        [any-type!] {Typesets and datatypes can be used to search by datatype.}

REFINEMENTS:
     /part        => Limit the length of the search.
        length       [number! series!] 
     ...

>> find/part "abc" "b" 10.0
*** Script Error: invalid /part argument: 10.0
*** Where: find
*** Near : find/part "abc" "b" 10.0
*** Stack:  

>> find/part "abc" "b" 10.0%
*** Script Error: invalid /part argument: 10%
*** Where: find
*** Near : find/part "abc" "b" 10%
*** Stack:  
```
It ignores /part for bit/typesets, map and none, so I can't imagine where percent makes sense. Float should be supported perhaps, but is not.

**Expected behavior**

For consistency with `make` I propose adding float, but removing percent.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4667 date: 9-Apr-2023/3:24:34 commit: #d36108eeffeafbf14839b5a9cadc9a0acd87f34a ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


