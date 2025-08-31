
#4170: GUI console history does not preserve the case after modified redo
================================================================================
Issue is closed, was reported by 9214 and has 0 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/4170>

**Describe the bug**
Evaluated expression line can be fetched back with arrow-up key; after that, it can be modified, re-evaluated and re-submitted to GUI console history; this re-submission ignores the case.

**To reproduce**
In GUI console, evaluate any expression that contains lowercase characters, e.g.
```red
>> #foo
== #foo
```
Now press arrow-up key to retrieve that line, try to uppercase any letter and evaluate the modified version again:
```red
>> #foo
== #foo
>> #foO ; press arrow-up, change the last o to O, hit Enter
== #foO
```
After that, fetch the last line with arrow-up again. You'll see that it's still `#foo` instead of `#foO`. CLI console is correct in this regard.

**Expected behavior**
GUI console preserves the case in undo/redo history.

**Platform version**
```
Red 0.6.4 for Windows built 25-Nov-2019/20:56:56+01:00 commit #6b28faf
```



