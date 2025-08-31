
#4209: "build libRed" command does not work now
================================================================================
Issue is closed, was reported by koba-yu and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4209>

**Describe the bug**
`red build libRed` command raises error on recent Red version.
The error is below;

```
PS C:\Users\x\OneDrive\ドキュメント\red> .\red.exe build libRed

-=== Red Compiler 0.6.4 ===-

Compiling C:\Users\x\OneDrive\ドキュメント\red\libRed\libRed.red ...
...compilation time : 1836 ms

Target: MSDOS

Compiling to native code...
*** Compilation Error: argument type mismatch on calling: red/actions/remove*
*** expected: [integer!], found: [struct! [
        header [integer!]
        data1 [integer!]
        data2 [integer!]
        data3 [integer!]
    ]]
*** in file: %/C/Users/x/OneDrive/ドキュメント/red/libRed/libRed.red
*** in function: exec/redRemove
*** at line: 2610
*** near: []
```

**To reproduce**
Do build libRed command

> red.exe build libRed

**Expected behavior**

libRed.dll should make without error.

**Platform version (please complete the following information)**
I am on Windows 10
Red version is`Red 0.6.4 for Windows built 13-Dec-2019/15:37:32+09:00 commit #134a2b0`

**Additional information**
@hiiamboris confirmed to reproduce the error and @hiiamboris guesses the commit below might cause this error, thank you.

https://github.com/red/red/commit/ee12c461e8499d9e9b51dfc6c16a6fc8204c7fd5#diff-6bef59794da7c0a4cc711c1267da435e

gitter chat about this
[December 28, 2019 1:28 AM](https://gitter.im/red/help?at=5e0631398ba16b107cdc3d0d)


Comments:
--------------------------------------------------------------------------------

On 2019-12-29T00:55:54Z, koba-yu, commented:
<https://github.com/red/red/issues/4209#issuecomment-569463856>

    I confirmed libRed can be built on Windows 7 an 10. Thank you!

