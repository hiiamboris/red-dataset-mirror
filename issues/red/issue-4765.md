
#4765: Merged objects and function overwrite
================================================================================
Issue is closed, was reported by zwortex and has 2 comment(s).
[status.built] [status.tested] [type.bug] [status.reviewed] [test.written]
<https://github.com/red/red/issues/4765>

In the following code, the function in the merged object c is the first object a rebound and not the b function (A)
```
a: make object! [ x: 1  show: does [print x] ]
b: make object! [ x: 2 y: 3 show: does [print [x y]] ]
c: make a b
a/show ; >> 1
b/show ; >> 2 3
c/show ; >> 2 - NOK, expecting 2 3 - b/show, not a/show rebound
```

Looks the ordering of set words plays a role (B)
```
a: make object! [ x: 1  show: does [print x] ]
b: make object! [ x: 2 show: does [print [x y]] y: 3]
c: make a b
c/show ; >> 2 3 - OK
```

(A), in R2, triggers an error (stack overflow), works fine in R3.
(B) works fine in R2 and R3


Comments:
--------------------------------------------------------------------------------

On 2020-12-15T11:57:15Z, dockimbel, commented:
<https://github.com/red/red/issues/4765#issuecomment-745242647>

    It works as expected when the code is compiled, but not on interpreted code.

