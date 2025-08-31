
#171: as-logic pointer! broken
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 4 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/171>

```
x: as struct! [x [integer!]] 0
if as-logic x [
    print "not null^/"
]
y: as pointer! [byte!] 0
if as-logic y [
    print "not null^/"
]
```

not null
not null



Comments:
--------------------------------------------------------------------------------

On 2011-09-08T14:17:17Z, dockimbel, commented:
<https://github.com/red/red/issues/171#issuecomment-2040102>

    The fix has been done on a sensible part of code, test it with all your Red/System bindings/apps to ensure no regression was introduced.

--------------------------------------------------------------------------------

On 2011-09-08T19:59:14Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/171#issuecomment-2043961>

    Shouldn't there be a unit test for this?

