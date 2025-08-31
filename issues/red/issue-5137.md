
#5137: `<->` word cannot be set using set-path
================================================================================
Issue is open, was reported by hiiamboris and has 6 comment(s).
[type.bug]
<https://github.com/red/red/issues/5137>

**Describe the bug**
```
Red []

o: object [<->: 1]
?? o/<->
set in o '<-> 2
?? o/<->
o/<->: 3
?? o/<->
```
Output:
```
o/<->: 1
o/<->: 2
*** Script Error: cannot access <->: in path o/<->:
*** Where: catch
*** Near : ?? o/<-> o/<->: 3 ?? o/<->
*** Stack:
```

**Expected behavior**

Should work in set-paths.

**Platform version**
```
Red 0.6.4 for Windows built 15-Apr-2022/11:42:52+03:00  commit #502097e
```



Comments:
--------------------------------------------------------------------------------

On 2022-05-24T17:18:25Z, ALANVF, commented:
<https://github.com/red/red/issues/5137#issuecomment-1136220707>

    This appears to be a lexer issue. `second quote o/<->:` appears to return a `set-word!` rather than a normal `word!`.
    
    After testing a bit, it seems like this only happens when the final `word!` of a `set-path!` begins with a `<`, `+`, or `-` (also `^` causes a lexer error for some reason)

--------------------------------------------------------------------------------

On 2022-06-19T12:07:24Z, hiiamboris, commented:
<https://github.com/red/red/issues/5137#issuecomment-1159706650>

    Compiler adds problems:
    ```
    Red []
    o: object [<->: 1]
    ?? o
    ```
    `red -e -r 1.red`:
    ```
    *** Syntax Error: Missing #"]" character
    *** in file: D:\devel\red\spaces\programs\1.red
    *** line: 3
    *** at: ": 1]^/?? o"
    ```
    
    No idea how to work around this :(

--------------------------------------------------------------------------------

On 2022-12-03T12:08:12Z, hiiamboris, commented:
<https://github.com/red/red/issues/5137#issuecomment-1336146507>

    And another one:
    ```
    Red [] do [probe type? first [<->]]
    ```
    Interpreted says `word!`, compiled says `tag!`.

