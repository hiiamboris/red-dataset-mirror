
#5380: [Regression] `to float!` doesn't work on wide char strings anymore
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5380>

**Describe the bug**
```
>> to-float next "v1.234"
== 1.234
>> to-float next "♥1.234"
*** Script Error: cannot MAKE/TO float! from: "1.234"
*** Where: to
*** Near : to-float next "♥1.234"
*** Stack: to-float  
```

**Expected behavior**

`1.234`

**Platform version**
```
Red 0.6.4 for Windows built 2-Sep-2023/12:39:49+03:00  commit #004d71b
```


Comments:
--------------------------------------------------------------------------------

On 2023-09-09T18:43:55Z, hiiamboris, commented:
<https://github.com/red/red/issues/5380#issuecomment-1712575689>

    Most likely https://github.com/red/red/commit/004d71b71ff3e82c9ad3e199860c61adee158223

