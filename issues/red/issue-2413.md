
#2413: Unclear error message when naively using the result of #call
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2413>

This is my program, reduced to essentials:
```
Red []
f: does [1]
p: routine [/local b][
	b: #call [f]
]
```
This is the error message:
```
*** Compilation Error: return type missing in function: red/stack/mark-func 
*** in file: %/C/Projects/Red/programs/test/test.red 
*** in function: exec/p
*** at line: 326 
*** near: [
    f_f 
    stack/unwind 
    stack/reset
]
```
The documentation says that the result of `#call [f]` cannot be directly used. So my program is wrong. But the error message does not help!


Comments:
--------------------------------------------------------------------------------

On 2017-02-13T15:57:29Z, dockimbel, commented:
<https://github.com/red/red/issues/2413#issuecomment-279433822>

    The error message should now be:
    ```
    *** Compilation Error: attempt to change type of variable: b
    *** from: [integer!]
    ***   to: [none]
    *** in file: %/C/dev/Red/tests/bug.red
    *** in function: exec/p
    *** at line: 326
    *** near: [
        b:
        stack/mark-func ~f
        f_f
        stack/unwind
        stack/reset
    ```
    That is the best we can have, as `#call` is pre-processed by Red compiler, which is unaware of the semantic correctness of R/S surrounding expression. So the original error message was correct, as the code replacing `#call` starts with a function call (`red/stack/mark-func`) which returns no value. Though the "near" part was not very helpful in locating the error, nor the expression preceeding that call.

