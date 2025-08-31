
#5035: Preprocessor halts when invoked from a macro code
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5035>

**Describe the bug**
```
Red []
#macro ['mmm] func [[manual] s e] [expand-directives [] s]
mmm
```
Output:
```
*** Macro Error: [manual] macro not returning a position
*** Where: [func [[manual] s e][expand-directives [] s] s e]
*** Throw Error: no catch for throw: halt-request
*** Where: case
*** Stack: expand-directives expand do-safe
```

**Expected behavior**

Macro should be able to expand things too. For https://github.com/red/REP/issues/111 I wanted to expand the map inside the macro and replace the one in the code with the one expanded.

**Platform version**
```
Red 0.6.4 for Windows built 22-Dec-2021/17:36:36+03:00  commit #328c904
```



Comments:
--------------------------------------------------------------------------------

On 2022-08-24T19:10:37Z, dockimbel, commented:
<https://github.com/red/red/issues/5035#issuecomment-1226131787>

    This commit fixes the reentrancy issue, but your macro, as written, will produce an infinite loop, for which the preprocessor is not guilty for. ;-)
    
    Here's a properly working example for the record:
    ```
    Red []
    #macro ['mmm] func [[manual] s e] [expand-directives [] s/1: 123 e]
    mmm
    ```
    Will ouput:
    ```
    == 123
    ```

