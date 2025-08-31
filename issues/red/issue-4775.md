
#4775: [Regression] Turned off 'auto-sync?' prevents debugging output
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/4775>

**Describe the bug**

Test case 1:
```
Red []
system/view/auto-sync?: no
print "should be visible"
ask "something"
```
Test case 2:
```
Red []
system/view/auto-sync?: no
view [button [probe "debug output visible!"]]
```

In both cases debug output is lost when GUI console is run with script as it's argument.

**Expected behavior**

`print` and `probe` show messages at once.

**Platform version**
```
Red 0.6.4 for Windows built 20-Dec-2020/21:04:56+03:00 commit #7a6d9a9
```



