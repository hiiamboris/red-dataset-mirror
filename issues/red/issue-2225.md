
#2225: Strange error when compiling a routine
================================================================================
Issue is closed, was reported by rebolek and has 2 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/2225>

If you take routine `r2` from issue #519 and try to compile it under 0.6.1, you get the following error:

```
>> do/args %red.r "../red-bugs/test.red"
Script: "Red command-line front-end" (none)

-=== Red Compiler 0.6.1 ===-

Compiling E:\Code\red-bugs\test.red ...
...compilation time : 641 ms

Target: MSDOS

Compiling to native code...
*** Compilation Error: missing argument
*** in file: %environment/reactivity.red
*** in function: exec/r2
*** at line: 1
*** near: (s)
```

Source for `test.red` is:

```
Red []

r2: routine [
    i           [integer!]
    /local      s
][
    s: "!"
    SET_RETURN ((string/load s 1 + length? s))
]
```



Comments:
--------------------------------------------------------------------------------

On 2017-02-18T06:06:49Z, dockimbel, commented:
<https://github.com/red/red/issues/2225#issuecomment-280824988>

    `string/load` is missing its last argument in the above code. Though, the error report should be mentioning the calling function in order to be more helpful.

