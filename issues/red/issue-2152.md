
#2152: Red doesn't raise a error on function definition with same argument names.
================================================================================
Issue is closed, was reported by ifgem and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2152>

**Red:**
`test: func [/x x] [] => ok`
**Rebol:**

```
test: func [/x x] [] =>
** Script Error: Duplicate function value: x
** Where: throw-on-error
** Near: func [/x x] []
```

Example that shows how it's dangerous.
**Red:**

```
test: func [a a a] [a + a + a]
test 10 20 30 => 30
```



