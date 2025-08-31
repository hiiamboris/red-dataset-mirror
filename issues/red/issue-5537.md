
#5537: [R/S] mess up the compiler by defining struct array!
================================================================================
Issue is closed, was reported by qtxie and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5537>

**Describe the bug**
Compile the code below and run it.
```
Red/System []

array!: alias struct! [
	length	[integer!]
]

table1: [1 2 3 4]
probe table1/1
probe table1/2
```
Output:
```
0
620783909
```

**Expected behavior**
Compilation error as `array!` already be used internally by the compiler,
Or compiles the code correctly and print:
```
1
2
```


