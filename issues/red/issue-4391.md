
#4391: [Compiler] Couldn't compile ~1800 words with `-r -d` flags anymore
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/4391>

:point_up: [April 8, 2020 1:57 AM](https://gitter.im/red/bugs?at=5e8d0549cc370f0b07ccc85f)

**Describe the bug**

Related to https://github.com/red/red/issues/4361, but with a much lower limit now.

Scripts that use about 1800 or more words will compile but will not run when compiled with `-r -d` flags, reporting:
```
*** Runtime Error 98: assertion failed
*** in file: /D/devel/red/redtest/words/datatypes/common.reds
*** at line: 47
***
***   stack: red/alloc-at-tail 00000062h
***   stack: red/alloc-at-tail 004CE3E0h
***   stack: red/word/load 004DDE24h
```

@qtxie [thinks](https://gitter.im/red/bugs?at=5e8de7ac16f84f0461653fd4) the culprit is commit https://github.com/red/red/commit/3178f42b714653c4f478a05f37f7f7f60c6b0279

**To reproduce**

1. [`reddo "write %1.red {Red []^/} loop 5000 [write/append/lines %1.red rejoin [random {arqeyrwitypaalksjdzbvn} {: 1}]]"`](https://gitlab.com/hiiamboris/red-cli/-/tree/master/mockups%2Freddo) to create the test file with 5000 unique words
2. `red -r -d 1.red`
3. Run `1.exe`!

**Expected behavior**

Script should run with no problem

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 18-Mar-2020/14:57:39+03:00 commit #101a64f
```



Comments:
--------------------------------------------------------------------------------

On 2020-04-14T19:26:42Z, dockimbel, commented:
<https://github.com/red/red/issues/4391#issuecomment-613636810>

    I have removed the [regression] flag, as this limitation has always existed.

