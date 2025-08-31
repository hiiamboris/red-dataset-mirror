
#5323: libRedRT always being compiled with '-o' option
================================================================================
Issue is open, was reported by qtxie and has 0 comment(s).
<https://github.com/red/red/issues/5323>

**Describe the bug**

1. create a file: %test.reds with the following content.
```
wrong header []
print 1
```
2. compile the %test.reds with `-o`
```
red.r -o tests.exe test.reds
```

**Expected behavior**
Output error

**Platform version**
commit b3d109b351e9483fb46c0ca96ae46588add64f42



