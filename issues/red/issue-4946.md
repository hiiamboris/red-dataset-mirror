
#4946: [Lexer] CRASH when loading %"
================================================================================
Issue is closed, was reported by hiiamboris and has 2 comment(s).
[type.bug]
<https://github.com/red/red/issues/4946>

**Describe the bug**

```
>> transcode {%"}

*** Runtime Error 1: access violation
*** at: 00000000h
```
Crashes GUI console's highlighting facility when trying to input a file name.

**Platform version**
```
Red 0.6.4 for Windows built 22-Jul-2021/20:44:06+03:00  commit #3c8d386
```



Comments:
--------------------------------------------------------------------------------

On 2021-08-13T11:45:41Z, qtxie, commented:
<https://github.com/red/red/issues/4946#issuecomment-898400281>

    Duplicated issue: #4834 

