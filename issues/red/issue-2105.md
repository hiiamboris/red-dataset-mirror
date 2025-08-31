
#2105: parse loops infinitely 
================================================================================
Issue is closed, was reported by xqlab and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2105>

```
    x: 'a
    parse [a ] [ to x ]
```

gives an infinite loop

and this too

```
parse [a ] [ thru x ]
```



