
#160: as-integer byte! reads integer instead of byte within expression
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/160>

```
a: as-byte 1
b: as-byte 2
print [as-binary (as-integer a) * 2  lf]
print [as-binary (as-integer a) << 2  lf]
```

00000402
00000804



Comments:
--------------------------------------------------------------------------------

On 2011-08-18T16:02:43Z, dockimbel, commented:
<https://github.com/red/red/issues/160#issuecomment-1840261>

    How is `as-binary` defined?

--------------------------------------------------------------------------------

On 2011-08-18T16:06:30Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/160#issuecomment-1840306>

    Sorry, I should take that out of examples:
    
    #define as-binary               [as pointer! [byte!] ]
    
    I use it here just to get a hex printout.

