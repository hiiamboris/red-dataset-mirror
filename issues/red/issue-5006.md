
#5006: CLI Console random CRASH when pasting comments
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/5006>

**Describe the bug**

Pasting this:
```
		; print [a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c]
```
into the CLI console most likely crashes it with:
```
>>         ; print [a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/bCannot allocate memory: init-buffer: 130

*** Runtime Error 1: access violation
*** Cannot determine source file/line info.
***
```
After I repeat it 10-20 times it may stop crashing, but then I can choose another CLI console executable and it will also crash for a time.

**To reproduce**

Just run the CLI console and paste the above line. If it didn't crash try a longer version:
```
		; print [a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c a/b/c]
```

**Platform version**
```
Red 0.6.4 for Windows built 6-Dec-2021/19:27:05+03:00  commit #252d78d
```



