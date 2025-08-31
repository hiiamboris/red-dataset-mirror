
#2815: math operation with floating numbers return wrong value
================================================================================
Issue is closed, was reported by qtxie and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2815>

Use the Red/System code below to reproduce the error:
```
n: as float32! 0.017
a: 1
b: 2
c: n * as float32! (a + b)
?? c
```
will return
```
c: -1.#IND.0
```


