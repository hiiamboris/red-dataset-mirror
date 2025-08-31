
#3584: compile with -r then defenered by Windows Defender
================================================================================
Issue is closed, was reported by yibaifei and has 2 comment(s).
[type.AV]
<https://github.com/red/red/issues/3584>

**Describe the bug**
the binary defenered by windows defener

**To Reproduce**
i used win 10 home edition
```
C:\Users\xxx\Downloads>cat hello.red
Red [Needs: 'View]

view [text "Hello World!"]

C:\Users\xxx\Downloads>red-063.exe -r hello.red

C:\Users\xxx\Downloads>hello.exe     
系统无法执行指定的程序。 (the system can not execute the program ...)
```
then notice remove by system

**Expected behavior**
it can be running correctly.



Comments:
--------------------------------------------------------------------------------

On 2018-11-12T20:47:21Z, 9214, commented:
<https://github.com/red/red/issues/3584#issuecomment-438023120>

    @yibaifei please submit both Red toolchain and `hello.exe` binaries as false positives [here](https://www.microsoft.com/en-us/wdsi/filesubmission).

