
#5385: [Preprocessor] Macros don't work within parens
================================================================================
Issue is open, was reported by hiiamboris and has 6 comment(s).
[type.wish]
<https://github.com/red/red/issues/5385>

**Describe the bug**
```
>> do/expand [(#macro ['x] func [s e][])]
*** Script Error: register-macro does not allow paren! for its spec argument
*** Where: either
*** Near : (register-macro next s remove/part s e)
*** Stack: expand register-macro  
```
This is useful for manual `#include` rewrite so it can both inline the file and still evaluate it into a value.

**Platform version**
```
Red 0.6.4 for Windows built 11-Sep-2023/10:40:41+03:00  commit #def4b65
```


Comments:
--------------------------------------------------------------------------------

On 2023-09-17T14:52:37Z, dockimbel, commented:
<https://github.com/red/red/issues/5385#issuecomment-1722494470>

    > This is useful for manual #include rewrite so it can both inline the file and still evaluate it into a value.
    
    Can you explain more clearly how that relates to the ability to define macros inside parens?

--------------------------------------------------------------------------------

On 2023-09-17T15:48:17Z, hiiamboris, commented:
<https://github.com/red/red/issues/5385#issuecomment-1722505398>

    Consider two use cases for include:
    1. I put some big data array into a separate file, so I can include it and assign a name, e.g.:
       ```
       context [
       	data: #include %big-array.red
       ]
       ```
       Where `%big-array.red` may be smth like: `Red [..] [...data...]`, i.e. it has no names. Or it can be compressed data needing a `decompress` call.
    2. I want to include file but keep it private in a context:
        ```
       context [
       	#include %private.red
       ]
        ```
       Where `%private.red` may be smth like `Red [] x: ... y: ... z: ... and more...`, i.e. it has names that need to be contained.
    
    I cannot fulfill both goals with a single `#include` syntax. If `#include` produces a single expression suitable for (1), it will hide set-words from the outer `context`. If it inlines multiple expressions with set-words for (2), I may want to write `data: (#include %big-array.red)` but that fails if referenced file contains macros.

--------------------------------------------------------------------------------

On 2023-09-17T15:50:52Z, hiiamboris, commented:
<https://github.com/red/red/issues/5385#issuecomment-1722505881>

    There's a worse issue though: if I inline the file, I have to add `change-dir` before and after it so whatever relative `do %file` calls it uses they are relative to the included file directory. And that means last returned expression is always just directory path :/ I haven't found a solution yet.

