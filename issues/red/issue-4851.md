
#4851: Preprocessor produces wrong error message on errors
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4851>

**Describe the bug**

`1.red`: `Red [] #do [this-is-an-error]`
`red 1.red`:
```
*** Preprocessor Error in #do
*** Script Error: unsupported type in none set-path
*** Where: eval-set-path
*** Stack: expand-directives expand do-code do-safe eval-set-path
```


Same in #macro code

**Expected behavior**

Compiled output is OK:
```
*** Preprocessor Error in #do
*** Script Error : this-is-an-error has no value
*** Where: [#do]
*** Near:  [this-is-an-error]
```

**Platform version**
```
Red 0.6.4 for Windows built 2-Mar-2021/15:01:01+03:00 commit #6de9b93
```



Comments:
--------------------------------------------------------------------------------

On 2022-08-30T15:39:22Z, dockimbel, commented:
<https://github.com/red/red/issues/4851#issuecomment-1231839279>

    Seems to work as expected now:
    ```
    >> write %1.red {Red [] #do [this-is-an-error]}
    >> do %1.red
    *** Preprocessor Error in #do 
    *** Script Error: this-is-an-error has no value
    *** Where: ???
    *** Near : this-is-an-error
    *** Stack: do-file expand-directives also expand do-code do-safe 
    ```

