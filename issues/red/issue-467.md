
#467: Hex literal 010000h rejected by compiler
================================================================================
Issue is closed, was reported by PeterWAWood and has 4 comment(s).
[status.reviewed] [Red/System]
<https://github.com/red/red/issues/467>

Code:

```

Red/System []

i: 010000h
```

Compiler Output:

```
Script: "Red/System IA-32 code emitter" (none)
*** Loading Error: invalid hex literal: 010000h





*** in file: %test.reds 
*** at line: 3

```



Comments:
--------------------------------------------------------------------------------

On 2013-04-18T08:59:30Z, dockimbel, commented:
<https://github.com/red/red/issues/467#issuecomment-16565181>

    Actually, it is not a bug, the expected number of digits for a valid hex value is 2 or 4 or 8. This was done as a way to restrict as much as possible hex notation so that it generates the least possible number of collisions with legitimate identifiers. But this is maybe too strict, 6 digits should be maybe allowed?

--------------------------------------------------------------------------------

On 2013-04-18T10:44:56Z, PeterWAWood, commented:
<https://github.com/red/red/issues/467#issuecomment-16569548>

    No I think that it's a reasonable restriction. 

