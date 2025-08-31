
#244: Can't load multi-line string with REBOL header
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/244>

```
Red/System []

a: "REBOL []"
b: {REBOL []}
c: {
    REBOL
}
d: {
    REBOL []
}
```

running string preprocessor...
**\* Loading Error: syntax error during LOAD phase: make object! [
    code: 200
    type: 'syntax
    id: 'invalid
    arg1: "string"
    arg2: "}"
    arg3: none
    near: "(line 10) }"
    where: none
] 
**\* at line: 11



