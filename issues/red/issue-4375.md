
#4375: [CRASH] [View] When using `throw` from within an actor
================================================================================
Issue is open, was reported by hiiamboris and has 2 comment(s).
[type.bug] [GUI]
<https://github.com/red/red/issues/4375>

**Describe the bug**

In (any) debug console (CLICK it!):
```
>> view [button [try [throw 1]]]

*** Runtime Error 98: assertion failed
*** in file: /D/devel/red/red-src/red/runtime/datatypes/symbol.reds
*** at line: 149
***
***   stack: red/symbol/resolve 98
***   stack: red/symbol/resolve 1637368
***   stack: gui/process-custom-draw 0 1636424
***   stack: gui/WndProc 002314E0h 78 0 1636424
```

In release console (CLICK it then CLOSE the window):
```
>> view [button [try [throw 1]]]

*** Runtime Error 95: no CATCH for THROW
*** at: 0041ECA0h
```

**Expected behavior**

Normal error:
```
>> view [button [throw 1]]
*** Throw Error: no catch for throw: 1
*** Where: throw
*** Stack: view do-events do-actor do-safe 
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 18-Mar-2020/14:57:39+03:00 commit #101a64f
```



Comments:
--------------------------------------------------------------------------------

On 2020-04-14T03:38:54Z, qtxie, commented:
<https://github.com/red/red/issues/4375#issuecomment-613208885>

    0.6.4 stable also has this issue. Seems the native stack was mess up after the `throw 1`.

