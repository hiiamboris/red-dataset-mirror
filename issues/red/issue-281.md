
#281: Contexts may be defined in conditionally executed code-blocks. Other definitions are not allowed there.
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/281>

Although the specification clearly says that context definitions are a compile-time matter, it still is not very nice to see

```
if false [c: context [d: 1]]
```

being allowed, and resulting in context `c` being available subsequently. Aliases, e.g. are not allowed in the code-block of an `if` statement.



Comments:
--------------------------------------------------------------------------------

On 2012-10-30T16:33:01Z, dockimbel, commented:
<https://github.com/red/red/issues/281#issuecomment-9912605>

    Agreed.

--------------------------------------------------------------------------------

On 2012-10-30T22:01:53Z, dockimbel, commented:
<https://github.com/red/red/issues/281#issuecomment-9924659>

    Now a compilation error will be raised in such case.

