
#5100: [Regression] `-u` compiler option doesn't work anymore
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [type.compiler]
<https://github.com/red/red/issues/5100>

**Describe the bug**
```
D:\devel\red\red-src\red>red -c -u 1.red
*** Red command-line error: Incompatible compilation modes: -c -u

D:\devel\red\red-src\red>red -u 1.red
*** Access Error: cannot open: %-u
*** Where: read
*** Near : 'Red
*** Stack:
--== Red 0.6.4 ==--
Type HELP for starting information.

>> q
```
(`1.red` is an empty file: `Red []`)


**Platform version**
```
Red 0.6.4 for Windows built 9-Mar-2022/18:31:29+03:00  commit #e743570
```



