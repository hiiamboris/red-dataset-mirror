
#256: Float literals break #system
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 2 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/256>

```
#system [0.0]
```

**\* Syntax Error: Missing matching ]
**\* line: 3
**\* at: "[0.0]^/"



Comments:
--------------------------------------------------------------------------------

On 2012-09-19T22:11:49Z, dockimbel, commented:
<https://github.com/red/red/issues/256#issuecomment-8710082>

    Red lexer doesn't implement yet decimal! support, so float! literals can't yet be used in a Red script.

