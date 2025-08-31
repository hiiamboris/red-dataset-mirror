
#2308: WISH: Complemented charset should work in FIND
================================================================================
Issue is closed, was reported by endo64 and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2308>

`FIND` behaves differently on Red than Rebol 2/3

```
>> find #{0000000016180300} complement charset "^@"
== #{0000000016180300}  ;in Red
== #{16180300}          ;in Rebol 2 & 3

red>> find #{0102030405} complement charset "^C"
== #{030405}
```

It looks like `FIND` ignores `complement`.


Comments:
--------------------------------------------------------------------------------

On 2017-02-15T10:00:08Z, dockimbel, commented:
<https://github.com/red/red/issues/2308#issuecomment-279967357>

    Fixed by commit [44d4a54f](https://github.com/red/red/commit/3fa9566cb57623d5838553017e846ea044d4a54f).

