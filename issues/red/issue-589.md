
#589: Crashing with semicolon placement
================================================================================
Issue is closed, was reported by kealist and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/589>

Given compilation of a red script %test.red:

```
Red []
a: 1;
```

Red crashes to the SDK window.

```
>> red-041.exe test.red

>> red-041.exe -c test.red

-=== Red Compiler 0.4.1 ===-

Compiling /V/rebol/test.red ...
*** Syntax Error: Invalid word! value
*** line: 2
*** at: "1;"
```

Gregg has confirmed this behavior



Comments:
--------------------------------------------------------------------------------

On 2013-12-03T23:11:54Z, dockimbel, commented:
<https://github.com/red/red/issues/589#issuecomment-29761753>

    Good catch!

