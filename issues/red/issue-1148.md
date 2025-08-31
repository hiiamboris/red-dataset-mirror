
#1148: `try` inside a function cannot work when compiling
================================================================================
Issue is closed, was reported by qtxie and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1148>

```
Red []

try-func: func [v [block!]][error? try v]
probe try-func [unset-word]
```

Should return `true`, but return `false`. 
It works fine in the console.



