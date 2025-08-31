
#2909: `case` provided with empty block breaks compilation
================================================================================
Issue is closed, was reported by 9214 and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2909>

```Red
Red []

case []
```

Results in:
```Red
Compiling to native code...
*** Compilation Error: datatype not allowed
*** in file: %<snip>
*** at line: 332
*** near: [none
    either logic/true? none [stack/reset none/push-last]
    stack/unwind #user-code
]
```


