
#4519: [Compiler] Different arguments handling for object & reactor
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.compiler]
<https://github.com/red/red/issues/4519>

**Describe the bug**

Compile & run this:
```
f: func [x y] [print [:x :y]]

o: object [g: [func-body]]
f o/g: func [a b] o/g [1 2]

r: reactor [g: [func-body]]
f r/g: func [a b] r/g [1 2]
```
Expected `o` and `r` to behave in a same manner.
Real output:
```
?function? 1 2       
?function? ?function?        ;) reactor is wrong here
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 28-May-2020/17:51:04+03:00 commit #36857eb
```



