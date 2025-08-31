
#2194: Compilation error for code that works in interpreter (or wrong compilation error message)
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2194>

Consider this code: 

```
function [a] [repeat a/1]
```

This is valid function definition (even if the content of the function is nonsense) and can be run in interpreter. However when compiled, it throws this error:

```
*** Compilation Error: invalid function spec block: [1]
*** in file: %/Users/sony/Code/red-bugs/test.red
*** near: [[a
        /local a 1
    ] [repeat a/1]]
```

IMO it should compile or provide better error message, something like _repeat does not allow path! for its 'word argument_.



