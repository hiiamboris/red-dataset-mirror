
#563: PARSE ANY IF FUNCTION broken
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/563>

```
Red []

r: [#"+" if (probe f "-")]
f: func [
    t [string!]
][
    parse t [any r]
]
print f "-"
print f "+"
```

false
true
true

Should be:

false
false
false

Adding an END to the rule makes it work.



