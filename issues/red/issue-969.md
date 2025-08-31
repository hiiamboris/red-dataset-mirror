
#969: Compiler crash on expression with local path! and routine!
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/969>

Oddly, the crash depends on the length of the routine name:

```
Red []

r2: routine [
    i [integer!]
    j [integer!]
][
]

f: function [
    s
][
    s/x = r2 0  any [0 0]
]
```

Compiling to native code...
**\* Compilation Error: undefined symbol: pos 
**\* in function: exec/f_f
**\* at line: 1 
**\* near: [pos 0 
    stack/mark-native ~r2 
    integer/push 0 
    stack/mark-native ~any
]



Comments:
--------------------------------------------------------------------------------

On 2014-11-01T23:24:30Z, dockimbel, commented:
<https://github.com/red/red/issues/969#issuecomment-61387580>

    I could not see any different behavior by changing the length of the routine name. Also, this crash occured regardless if `r2` is a routine or a function.

--------------------------------------------------------------------------------

On 2014-11-02T00:17:11Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/969#issuecomment-61388954>

    The crash disappeared with a name of length one.

