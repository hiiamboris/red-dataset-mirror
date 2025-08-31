
#4534: [Compiler] Can't use char! literals inside preprocessor code
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
<https://github.com/red/red/issues/4534>

**Describe the bug**

Test:
```
Red []
#do [probe type? probe #"("]
```
Run interpreted (Red):
```
#"(" 
char!
```
Compile (R2):
```
#'00000028
issue!    
```

**Expected behavior**

`char!`

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 20-Jun-2020/20:24:25+03:00 commit #4d864b1
```



Comments:
--------------------------------------------------------------------------------

On 2020-06-21T16:07:22Z, 9214, commented:
<https://github.com/red/red/issues/4534#issuecomment-647147395>

    Duplicate of #2870.

--------------------------------------------------------------------------------

On 2020-06-21T16:10:50Z, hiiamboris, commented:
<https://github.com/red/red/issues/4534#issuecomment-647147815>

    Thanks.

