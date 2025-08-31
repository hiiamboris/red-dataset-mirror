
#2235: Wrong compiler error, when compiling bad REPEAT code
================================================================================
Issue is closed, was reported by rebolek and has 2 comment(s).
[status.duplicate]
<https://github.com/red/red/issues/2235>

This is related to #1831 that is fixed for interpreter. Compiler throws compile error, which is fine, but the error description is confusing.

Code:

```
Red []

function [a] [repeat a/1]
```

Compiler output:

```
Compiling E:\Code\red-bugs\test.red ...
*** Compilation Error: invalid function spec block: [1]
*** in file: %/E/Code/red-bugs/test.red
*** near: [[a
        /local a 1
    ] [repeat a/1]]
```

As you can see, `1` is taken as local argument, which is not true.



Comments:
--------------------------------------------------------------------------------

On 2017-02-17T15:55:13Z, dockimbel, commented:
<https://github.com/red/red/issues/2235#issuecomment-280687730>

    Duplicate of #2194 

