
#2273: divide and subtract on float members of a struct perform operation in the wrong order
================================================================================
Issue is closed, was reported by Mufferaw and has 0 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/2273>

Here is an example

```
Red/System [
]
vector3!: alias struct! [
    x [float!]
    y [float!]
    z [float!]
]
aa: declare vector3!
aa/x: 10.0
aa/y: 5.5
aa/z: 1.2555
b: 50.0

c: aa/x / b ; the resulting answer is 5.0 not 0.2
c: aa/x - b ; result is 40.0 
```



