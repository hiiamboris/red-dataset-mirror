
#1519: do read-console args test, but compile error
================================================================================
Issue is closed, was reported by bitbegin and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1519>

```
>> do/args %red.r "%tests/source/library/call-test.red"

-=== Red Compiler 0.5.4 ===-

Compiling /D/work/github/red/tests/source/library/call-test.red ...
...compilation time : 563 ms

Compiling to native code...
*** Compilation Error: variable tmp not declared
*** in file: %/D/work/github/red/system/library/call/call.reds
*** in function: system-call/resize-buffer
*** at line: 85
*** near: [resize buffer newsize
    either tmp = null [
        print-error [{Red/System resize-buffer : Memory allocation failed.}] quit 0
    ]
]
>>
```



