
#5239: CRASH when catching a throw twice
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5239>

**Describe the bug**

Woohoo! No CAT for THROW is back with a new performance:
```
>> probe try [do try/all [throw 'grenade]]

*** Runtime Error 95: no CATCH for THROW
*** in file: common.reds
*** at line: 282
***
***   stack: ***-uncaught-exception
***   stack: ***-uncaught-exception
```

**Expected behavior**

`do` rethrowing the thrown value, printing then smth like:
```
*** Throw Error: no catch for throw: grenade
*** Where: catch
*** Near : Red [] throw 'grenade
*** Stack:
```

**Platform version**

```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4565 date: 7-Nov-2022/8:01:41 commit: #134698f686c200e24d420f28866c8aa03a8557c0 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2022-11-17T19:18:03Z, dockimbel, commented:
<https://github.com/red/red/issues/5239#issuecomment-1319090979>

    It now works as expected when interpreted, but will still produce an uncaught exception when compiled as code in global context due to #5094.

