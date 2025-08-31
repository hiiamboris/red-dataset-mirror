
#3039: No compiler error with string! exponent argument to power function
================================================================================
Issue is closed, was reported by PeterWAWood and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/3039>

The compiler does not properly perform type checking on arguments to the power function. It returns a value when a `string!` value exponent is provided to the `power` function.

This code
```text
Red[]
print power 2 "a"
```

Produces this:
```text
./test
1.0
```

The interpreter raises a script error:
```text
>> power 2 "a"
*** Script Error: power does not allow string! for its exponent argument
*** Where: power
*** Stack: 
```


