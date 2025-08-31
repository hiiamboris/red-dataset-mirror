
#487: Compiler doesn't resolve index words
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [status.reviewed]
<https://github.com/red/red/issues/487>

```
Red []

b: []
b/x
```

Compiling to native code... 
**\* Compilation Error: undefined symbol: ~x 
**\* at line: 126 
**\* near: [~x 
    actions/select\* -1 -1 -1 -1 -1 -1
]

red>> b: []
== []
red>> b/x
== none



