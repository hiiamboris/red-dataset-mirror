
#4020: [Parse] running out of memory with combination of COLLECT, KEEP PICK and BINARY!
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4020>

**Describe the bug**
Parse fails with "not enough memory" internal error in a specific case of `binary!` parsing with usage of `collect` and `keep pick`.

**To reproduce**
```red
>> parse #{ABCD} [collect [keep pick 2 skip]] 
*** Internal Error: not enough memory
*** Where: parse
*** Stack:  
```

**Expected behavior**
```red
>> parse #{ABCD} [collect [keep pick 2 skip]] 
== [171 205]
```

**Platform version**
```
Red 0.6.4 for Windows built 31-Aug-2019/17:47:43+05:00 commit #b28d8f5
```



Comments:
--------------------------------------------------------------------------------

On 2019-09-02T14:48:16Z, dockimbel, commented:
<https://github.com/red/red/issues/4020#issuecomment-527173518>

    Issue was caused by a coding mistake, overwritting the `int` variable instead of preserving it.

