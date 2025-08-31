
#858: Casting literal value 1 to pointer! [integer!] gives incorrect result
================================================================================
Issue is closed, was reported by PeterWAWood and has 0 comment(s).
[status.built] [status.tested] [type.bug] [Red/System]
<https://github.com/red/red/issues/858>

When casting the literal value 1 to pointer! [integer!] the result is 0 not 1.

Code 

```
Red/System []

k: as pointer! [integer!] 1
print ["k: " as integer! k lf]

i: 1
m: as pointer! [integer!] i
print ["m: " as integer! m lf]

k: as pointer! [integer!] 10
print ["k: " as integer! k lf] 

k: as pointer! [integer!] -10
print ["k: " as integer! k lf]

k: as pointer! [integer!] 0
print ["k: " as integer! k lf]
```

Output

```
k: 0
m: 1
k: 10
k: -10
k: 0
```



