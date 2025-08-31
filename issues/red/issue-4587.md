
#4587: Using function as `system/console/prompt` crashes
================================================================================
Issue is closed, was reported by Oldes and has 2 comment(s).
<https://github.com/red/red/issues/4587>

**To reproduce**
```red
>> system/console/prompt: does[ join now/time ">> "]
;** crashes **
```
**Expected behavior**
no crash

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 24-Jul-2020/15:16:00
```



Comments:
--------------------------------------------------------------------------------

On 2020-07-24T15:49:38Z, 9214, commented:
<https://github.com/red/red/issues/4587#issuecomment-663605161>

    Duplicate of https://github.com/red/red/issues/4301.

