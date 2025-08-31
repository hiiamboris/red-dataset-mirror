
#1945: Non-existing include file gives rise to strange error message
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1945>

The program is

```
Red []
#system-global [#include %non-existing-file]
```

The error message is

```
*** Loading Error: file access error: make object! [
    code: 500
    type: 'access
    id: 'cannot-open
    arg1: {/non-existing-file}
    arg2: none
    arg3: none
    near: [read/binary input]
    where: 'process
] 
*** in file: in-memory 
*** at line: 1

> Terminated with exit code 1.
```



