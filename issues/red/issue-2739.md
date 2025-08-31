
#2739: [macOS DRAW] LINE-CAP and LINE-JOIN on TRIANGLEs and POLYGONs
================================================================================
Issue is closed, was reported by JenniferLee520 and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2739>

```Red
view [ box white 100x100 draw [ line-width 8 line-cap round fill-pen yellow triangle 10x10 90x10 50x80 ] ]
```
Running the above code in macOS, you will see that the first vertex, 10x10, is round, and the other two vertices are not.

```Red
view [ box white 100x100 draw [ line-width 8 line-join round fill-pen yellow triangle 10x10 90x10 50x80 ] ]
```
Running the above code in macOS, you will see that the second and the third vertices, 10x10 and 90x10, are round, and the first vertex is not.

This bug is only on macOS.


