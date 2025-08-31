
#5036: Lexer doesn't recognize grouping separator in fractional part of the number
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/5036>

**Describe the bug**

Plenty of examples in Gregg's `formatting` repo: https://github.com/greggirwin/red-formatting/blob/3ff508b55cdb8ae6400789295b24045c8eea196b/test-format.red#L359-L366

Now not loadable.
Regression, worked in the old lexer (0.6.4).

**To reproduce**
```
>> load "-0.000'000'123'45"
*** Syntax Error: (line 1) invalid float at -0.000'000'123'45
*** Where: transcode
*** Near : "-0.000'000'123'45"
*** Stack: load  
```

**Expected behavior**

Separators skipped.

**Platform version**
```
Red 0.6.4 for Windows built 14-Jan-2022/17:48:17+03:00  commit #4923e32
```



