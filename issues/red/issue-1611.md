
#1611: `parse` result changes depending on paren!, etc
================================================================================
Issue is closed, was reported by WiseGenius and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1611>

Code:

```
print parse "12"  [copy a-txt "1" (a-num: to integer! a-txt) copy b-txt "2" (b-num: to integer! b-txt)]
print parse "123" [copy a-txt "1" (a-num: to integer! a-txt) copy b-txt "2" (b-num: to integer! b-txt) "3"]
print parse "123" [copy a-txt "1"                            copy b-txt "2" (b-num: to integer! b-txt) "3"]
print parse "123" [copy a-txt "1" (prin a-txt)               copy b-txt "2" (b-num: to integer! b-txt) "3"]
```

Result:

```
true
false
true
1true
```

Why is the second line `false`?

This behaviour stretches at least as far back as Red 0.5.2, compiled and interpreted.



