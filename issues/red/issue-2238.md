
#2238: make op! lit-word! causes Internal compiler error
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2238>

This is #1400, but for compiler.

Code:

```
Red []
make op! 'x
```

Output:

```
*** Red Compiler Internal Error: Script Error : Expected one of: word! - not: block!
*** Where: fetch-functions
*** Near:  [name: to word! pos/1
if
]
```



