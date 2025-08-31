
#3588: Red program assumed too eagerly
================================================================================
Issue is closed, was reported by toomasv and has 0 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/3588>

**Describe the bug**

When running a file (in GUI console) containing text before Red program header, interpreter is started at the first occurrence of the word "Red" in text before header, not at the proper header.

**To Reproduce**
Steps to reproduce the behavior:

1. Create file `try.txt`
```
Hello Red probe "try"
Red [] probe "Hoi!"
```

2. `do %try.txt`
Result
```
"try"
"Hoi!"
```

3. Change "Red" in file to e.g. "Reb":
```
Hello Reb probe "try"
Red [] probe "Hoi!"
```

4. Result of `do %try.txt`:
```
"Hoi!"
```

**Expected behavior**

Interpretation of Red program should start on proper Red header.

**Platform version(please complete the following information):**
```
Red 0.6.3 for Windows built 8-Nov-2018/9:26:02+02:00 commit #06ddce9
```


