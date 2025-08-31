
#340: Addition on struct pointer gives wrong result sometimes on ARM
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/340>

Adding an integer variable to a struct pointer can result in wrong result. The following use-case shows the issue. Reducing the size of the struct makes the bug disappear.

```
Red/System [ ]

s: declare struct! [
    buffer  [c-string!]
    size    [integer!]
    word    [integer!]
]

i: 5
print-line s
print-line s + i
```

outputs:

```
0000A7E4
00000048
```



