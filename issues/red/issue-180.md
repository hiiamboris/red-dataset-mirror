
#180: Lit-word not registered by Red lexer
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/180>

When one supplies a lit-word to the lexer, it gets stored as a normal word. This is probably caused by the formulation of the `push` function: 

```
push: func [value][append/only last stack value]
```

Changing `value` into `:value` will solve the problem. Incidentally, `append/only` is less efficient than `insert/only tail`



