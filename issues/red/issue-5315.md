
#5315: `Near:` field is inaccurate inside the file
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5315>

**Describe the bug**

This is correct:
```
Red []
do [
	print "123"
	1 / 0
]
```
Outputs:
```
123
*** Math Error: attempt to divide by zero
*** Where: /
*** Near : 1 / 0
*** Stack:
```

This is not:
```
Red []
print "123"
1 / 0
```
Outputs:
```
123
*** Math Error: attempt to divide by zero
*** Where: /
*** Near : print "123" 1 / 0
*** Stack:
```
It seems to blame the previous finished expression at all times, which is confusing.

**To reproduce**

Save the latter example as a script `1.red` and run from any console as an argument or using `do %1.red`.

**Expected behavior**

Proper expression blamed.

**Platform version**
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4667 date: 9-Apr-2023/3:24:34 commit: #d36108eeffeafbf14839b5a9cadc9a0acd87f34a ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2023-09-11T17:34:59Z, dockimbel, commented:
<https://github.com/red/red/issues/5315#issuecomment-1714310653>

    ```
    >> do %1.red
    123
    *** Math Error: attempt to divide by zero
    *** Where: set
    *** Near : print "123" 1 / 0
    *** Stack: do-file  
    
    >> do load %1.red
    123
    *** Math Error: attempt to divide by zero
    *** Where: /
    *** Near : 1 / 0
    *** Stack:
    ```
    
    That's odd...

