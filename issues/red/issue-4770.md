
#4770: [Compiler] argument type mismatch on calling: red/natives/repeat-init*
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [type.compiler]
<https://github.com/red/red/issues/4770>

**Describe the bug**

This doesn't compile in release mode only:
```
Red [file: %1.red]
I: none
```
`red -r 1.red` output:
```
Target: Linux

Compiling to native code...
*** Compilation Error: argument type mismatch on calling: red/natives/repeat-init*
*** expected: [struct! [
        header [integer!]
        data1 [integer!]
        data2 [integer!]
        data3 [integer!]
    ]], found: [struct! [
        header [integer!]
        ctx [pointer! [integer!]]
        symbol [integer!]
        index [integer!]
    ]]
*** in file: %1.red
*** in function: exec/f_ctx||394~value-path?
*** at line: 1
*** near: [
    r3: 0
    stack/reset integer/push 0
    stack/mark-loop ~repeat
    while
]
```

**Platform version**
```
Red 0.6.4 for Windows built 4-Dec-2020/7:41:48+03:00 commit #382dd4e
```

Somewhat similar to https://github.com/red/red/issues/4526 trigger case (specific word).


