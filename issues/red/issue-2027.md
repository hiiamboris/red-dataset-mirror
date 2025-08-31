
#2027: Interpreter: Should return an error when a string! follow a variable and precede a block of allowed types for that variable in functions spec block!
================================================================================
Issue is closed, was reported by x8x and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2027>

Compiler returns an error on this:

```
a: func [b "b var" [integer!]][b]
```

Interpreter doesn't.
..of curse it should be:

```
a: func [b [integer!] "b var"][b]
```



