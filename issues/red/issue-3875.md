
#3875: [Compiler] Script file names with spaces result in a wrong exe name
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[type.compiler]
<https://github.com/red/red/issues/3875>

**Describe the bug**

```
>red -c "prog ram.red"
...
...output file      : ...\prog.exe

>rebol -s --do "do/args %red.r {\"prog ram.red\"}"
...
...output file      : ...\prog.exe
```

**Expected behavior**

`prog ram.exe` is expected to be written

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 1-May-2019/21:32:06+03:00 commit #8d712e4
```



Comments:
--------------------------------------------------------------------------------

On 2019-05-13T21:23:46Z, greggirwin, commented:
<https://github.com/red/red/issues/3875#issuecomment-491992357>

    Is this related to https://github.com/red/red/pull/3870 ?

--------------------------------------------------------------------------------

On 2019-05-13T22:15:01Z, hiiamboris, commented:
<https://github.com/red/red/issues/3875#issuecomment-492006732>

    @greggirwin Not in the sense "caused" or "fixed" by it, no.

