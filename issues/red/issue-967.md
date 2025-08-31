
#967: Wrong result on casting a conditional expression to integer!
================================================================================
Issue is closed, was reported by dockimbel and has 2 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/967>

The code below should print 1 for each case.

```
Red/System []

a: 33
b: 55

r1: a <> b
r2: as integer! a <> b
r3: as integer! (a <> b)

print-line as integer! r1   ;; print 1
print-line r2           ;; @@ print 33
print-line r3           ;; @@ print 33
```



Comments:
--------------------------------------------------------------------------------

On 2014-10-28T08:19:52Z, dockimbel, commented:
<https://github.com/red/red/issues/967#issuecomment-60722287>

    Fix pushed into objects branch.

