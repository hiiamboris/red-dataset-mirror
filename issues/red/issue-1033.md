
#1033: Double type casting warning message
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.review] [Red/System]
<https://github.com/red/red/issues/1033>

The following code produces two identical warning messages about unnecessary type casting:

```
Red/System [File: %test.reds]

f: func [a [float!] return: [float!]][return a]
1.0 = as float! f 1.0
```

makes the compiler output:

```
*** Warning: type casting from float! to float! is not necessary
*** in: %test.reds
*** at: [1.0]
*** Warning: type casting from float! to float! is not necessary
*** in: %test.reds
*** at: [1.0]
```



