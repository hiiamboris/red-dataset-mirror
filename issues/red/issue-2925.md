
#2925: [R/S] convert float to integer in math expression get wrong result
================================================================================
Issue is closed, was reported by qtxie and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/2925>

```
Red/System []

tm: 100.9
probe 100 + as-integer tm
```
Will print
```
-2147483548
```


