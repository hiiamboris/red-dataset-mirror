
#2211: Compilation error with PARSE
================================================================================
Issue is closed, was reported by rebolek and has 2 comment(s).
<https://github.com/red/red/issues/2211>

This code, which runs fine in interpreter:

```
Red []

parse "abcde" ["xyz" | copy str to end]
```

returns compilation error:

```
*** Compilation Error: return type missing in function: red/stack/unwind
*** in file: %/E/Code/red-bugs/test.red
*** in function: exec/f_on-parse-event
*** at line: 1
*** near: [
...
```



Comments:
--------------------------------------------------------------------------------

On 2016-09-05T13:56:35Z, rebolek, commented:
<https://github.com/red/red/issues/2211#issuecomment-244752885>

    This bug is present only when compiler has been run few times in Rebol console, with fresh console it compiles fine.

