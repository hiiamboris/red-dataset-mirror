
#149: Fixed indexing broken, always uses /1
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/149>

```
a: declare struct! [value [integer!]]
a/value: 0
p: as pointer! [byte!] a
p/1: as-byte 1
p/2: as-byte 2
print-hex a/value
```

yields

1



Comments:
--------------------------------------------------------------------------------

On 2011-08-10T14:33:43Z, dockimbel, commented:
<https://github.com/red/red/issues/149#issuecomment-1773040>

    The issue was caused by the code emitter not taking pointer! [byte!] in account (always emitting as if it was pointer! [integer!]), so `p/2: as-byte 2` was writing 4 bytes after the address pointed by `p` instead of 1 byte, causing a memory corruption.

--------------------------------------------------------------------------------

On 2011-08-10T16:56:59Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/149#issuecomment-1774396>

    Ah, in the code it came from, more pixels would be written in subsequent addresses, so I never saw the real problem.

