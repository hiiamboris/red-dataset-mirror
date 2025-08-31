
#423: Lexer crash on malformed path
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/423>

```
s: {
    x/
}
```

On Linux:

bash-4.0# ./console-pro test.red 

**\* Runtime Error 100: no value matched in CASE
**\* at: 0806EABCh



