
#3249: Cannot break from the loop when you set variable with the value from the ask function
================================================================================
Issue is closed, was reported by nedzadarek and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3249>

# Code: 
```while [true] [var: ask "f" if 42 = 42 [break]]```
```forever [a: ask "? " if true [break]]```
# Expected behavior:
It should break from the loop
# Actual behavior:
```
*** Throw Error: no loop to break
*** Where: break
*** Stack:
```
# Works:
If variable setting is after the `if` (type `end` to end):
```
while [true] [ 
  if "end" = ask "?: " [break]
  print 'hi 
]
```
If we doesn't use the `if`:
```
while [true] [
    a: ask "F"
    break
]
```
If we break form other loop before the `if`:
```
while [true][
    a: ask "?"
    while [true] [print "inner loop" break]
    if a = "end" [break]
]
```
# Red version:
```
about
; Red for Windows version 0.6.3 built 9-Mar-2018/0:05:59+01:00
; Win 8.1 64bit
```


Comments:
--------------------------------------------------------------------------------

On 2018-03-14T12:30:36Z, dockimbel, commented:
<https://github.com/red/red/issues/3249#issuecomment-373004058>

    Fixed in the 0.6.4 branch using the new console.

