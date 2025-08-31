
#4720: convert-test.red (ooo-2) is failing in interpreter
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.bug]
<https://github.com/red/red/issues/4720>

**Describe the bug**

Enter `1.red`:
```
Red []

probe type? '<-1>
probe type? <-1>
probe <-1>
```

Compiled (`red -r 1.red` or `red -r -e 1.red` doesn't matter! - that's why CI/CD doesn't catch it):
```
word!
tag!
<-1>
```
Interpreted:
```
word!
*** Script Error: <-1> has no value
*** Where: type?
*** Stack: probe
```

**Expected behavior**

Since test expects it to be a tag, it should be a tag.
But what about `'<-1>` and all other `'<tag>` words? Should lexer allow them?

**Platform version**
```
Red 0.6.4 for Windows built 11-Nov-2020/5:05:03+03:00 commit #738c45d
```



