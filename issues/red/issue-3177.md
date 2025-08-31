
#3177: Set the result value of 'foreach' in context function crashes console
================================================================================
Issue is closed, was reported by koba-yu and has 2 comment(s).
<https://github.com/red/red/issues/3177>

Executing the code below on the GUI console.

```red
con: context [
	test-func: func [][foreach x [1] [x]]
]

a: con/test-func
```

### Expected behavior
does not crash the console

### Actual behavior
Console crashed

### Steps to reproduce the problem
Execute the code above on the GUI console.

### Red version and build date, operating system with version.
I use the latest build on Windows 10 x64

Console's system/build/date
> 29-Dec-2017/22:37:45+09:00

### Additional information

This does not crash.

```red
test-func: func [][foreach x [1] [x]]

a: test-func
```

These are neither.

```red
con: context [
	test-func: func [][foreach x [1] [x]]
]

con/test-func
```

```red
con: context [
	test-func: func [][foreach x [1] []]
]

a: con/test-func
```

Therefore, I guess the crash condition is,

* calling a function defined in context
* the function return value is foreach's iterating word
* set the function return value to word


Comments:
--------------------------------------------------------------------------------

On 2017-12-29T15:20:32Z, koba-yu, commented:
<https://github.com/red/red/issues/3177#issuecomment-354458770>

    Sorry, I think this is the same issue to #3156

