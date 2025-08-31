
#3974: [view] not response at second run `view [button "test"]` on macOS
================================================================================
Issue is closed, was reported by bitbegin and has 4 comment(s).
[status.dismissed] [GUI]
<https://github.com/red/red/issues/3974>

**Describe the bug**

On macOS, run `view [button "test"]` twice, and it will not be responsed.

**To reproduce**
Steps to reproduce the behavior:
1. run `Red compiler` or red-console
2. run `view [button "test"]`, and close
3. run `view [button "test"]`, the app will not be responsed

**Expected behavior**
in the step 3, the app still be responsed


**Platform version (please complete the following information)**
```
Red 0.6.4 for macOS built 8-Aug-2019/1:38:19+08:00 commit #9f01bf9
```



Comments:
--------------------------------------------------------------------------------

On 2019-08-08T01:32:57Z, bitbegin, commented:
<https://github.com/red/red/issues/3974#issuecomment-519327812>

    another issue on macOS:
    
    after `view [button "test"]`, the console shouldn't response key input

--------------------------------------------------------------------------------

On 2019-08-20T06:51:12Z, bitbegin, commented:
<https://github.com/red/red/issues/3974#issuecomment-522879845>

    can't reproduce

