
#5121: DO-FILE invokes preprocessor and evaluation from different directories
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
[type.bug]
<https://github.com/red/red/issues/5121>

**Describe the bug**

Running this:
```
Red []
make-dir %1
write %1/2.red "Red [] #do [pwd] print [] pwd"
do %1/2.red
```
I'm getting:
```
%/D/devel/red/spaces/tests/
%/D/devel/red/spaces/tests/1/
```
Which is just another one of the numberless file inclusion issues, and probably the cause of some of the other reports.

**Expected behavior**
```
%/D/devel/red/spaces/tests/1/
%/D/devel/red/spaces/tests/1/
```

**Platform version**
```
Red 0.6.4 for Windows built 4-Apr-2022/15:09:55+03:00  commit #28dad01
```



