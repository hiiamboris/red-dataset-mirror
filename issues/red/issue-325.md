
#325: function constructor: absence of /local refinement is only checked in late stage
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [type.review]
<https://github.com/red/red/issues/325>

Perhaps this is not a problem, but an earlier check seems possible...

```
f: function [/local a][b: 1]
-= Red Compiler =-
Compiling red/tests/mytest.red ...
[some text omitted]
------------| "f: function [/local a /local b] [b: 1]"
...compilation time:     328 ms
Compiling to native code...
*** Compilation Error: duplicate variable definition in function exec/f_f
*** in file: %red/tests/mytest.red
*** at line: 116
*** near: [func [/local ~local ~a ~local ~b] [
```



Comments:
--------------------------------------------------------------------------------

On 2012-12-01T15:37:52Z, dockimbel, commented:
<https://github.com/red/red/issues/325#issuecomment-10918327>

    Agreed.

