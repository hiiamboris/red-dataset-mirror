
#955: Compiled Red/System can't access ENV-VARS items
================================================================================
Issue is closed, was reported by WayneCui and has 4 comment(s).
<https://github.com/red/red/issues/955>

Only tested on Windows 7.
Sample code:

```
Red/System []

env: system/env-vars 
print [ env lf ]
print env/item
```

After compiled, it output:

```
00000000

*** Runtime Error 1: access violation
*** at: 00401061h

```



Comments:
--------------------------------------------------------------------------------

On 2014-10-15T13:09:43Z, qtxie, commented:
<https://github.com/red/red/issues/955#issuecomment-59202128>

    @WayneTsui This feature is not implemented on Windows. More detail: http://static.red-lang.org/red-system-specs.html#section-12.3

--------------------------------------------------------------------------------

On 2014-10-15T13:16:58Z, WayneCui, commented:
<https://github.com/red/red/issues/955#issuecomment-59203066>

    Sorry for ignoring the note. :-(    I will close this ticket.

