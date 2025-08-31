
#596: COLLECT INTO corrupts series of any-string! type
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/596>

**collect into** should accept any series! as referenced argument, but in practice any-string! series corrupt the series content.

```
Red []

list: ""
probe parse "a" [collect into list some [keep skip]]
probe head list
```

will output

```
true
"^O^@^@^@^@^@^@^@a^@^@^@^@^@^@^@"
```



