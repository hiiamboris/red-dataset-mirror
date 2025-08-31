
#2869: Compiler crash while using `context?`
================================================================================
Issue is closed, was reported by 9214 and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2869>

Code:
```Red
context? 'abracadabra!
```
Compiler crash:
```Red
*** Compilation Error: undefined symbol: red/natives/context?*
*** in file: %<snip>
*** at line: 332
*** near: [
    natives/context?* true
    stack/unwind #user-code
]
```


