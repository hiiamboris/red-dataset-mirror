
#3458: HELP doesn't handle direct block value correctly
================================================================================
Issue is closed, was reported by greggirwin and has 0 comment(s).
<https://github.com/red/red/issues/3458>

### Expected behavior

Show help for block.

### Actual behavior
```
>> ? []
*** Script Error: word-is-value-str does not allow block! for its word argument
*** Where: word-is-value-str
*** Stack: ? help-string  
```

### Steps to reproduce the problem

As above.

### Red and platform version

0.6.3
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.0 ahead: 3526 date: 5-Jul-2018/1:10:08 commit: #42881750d94c8cac6efc011f69e1654cedfe6694 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]
--------------------------------------------
```


