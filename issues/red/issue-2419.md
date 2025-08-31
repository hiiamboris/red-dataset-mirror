
#2419: Tests fail if the rebol.exe is run from a relative path from cmd.exe or a batch file on windows
================================================================================
Issue is closed, was reported by geekyi and has 12 comment(s).
[type.review]
<https://github.com/red/red/issues/2419>

On windows 10 64 bit, I was doing this on windows command prompt:
```
..\..\rebol\rebview.exe -s tests\run-all.r
```
It gives an output like the following:
```
Quick-Test v 0.12.0
REBOL  2.7.6.3.1
This test started at 19-Jan-2017/20:33:46.367+5:00
Red Test Suite

ok - lexer............................................0 / 0
ok - lexer-auto.......................................0 / 0
** - unicode******************************************0 / 1 **
```

This has an easy workaround:
```
"C:\path\to\rebview.exe" -s tests\run-all.r
```
But wanted to document this here because the tests simply fail without indication of the problem when run.
I wasn't immediately apparent to me what was wrong


Comments:
--------------------------------------------------------------------------------

On 2017-02-17T01:28:58Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2419#issuecomment-280521622>

    The tests run normally when rebol is run from a relative path on Windows 7:
    
    PowerShell console:
    ```text
    PS E:\Red\red> ../../rebol-view -qs run-all.r
    ```
    
    Rebol/View console:
    ```text
    checking to see if interpreter test files need generating
    0 files were generated
    Quick-Test v 0.12.0
    REBOL  2.7.8.3.1
    This test started at 17-Feb-2017/9:21:10.497+8:00
    Complete Red Test Suite
    
    ok - lexer...........................................29 / 29
    ok - lexer-auto......................................18 / 18
    ok - unicode.........................................67 / 67
    ok - preprocessor tests..............................22 / 22
    ok - run-all-comp1.red.............................4530 / 4530
    ok - run-all-comp2.red.............................4568 / 4568
    ok - run-all-interp.red............................8954 / 8954
    ok - tools............................................7 / 7
    ok - Red print........................................9 / 9
    ok - Red run time errors..............................8 / 8
    ok - Red compile errors...............................1 / 1
    ok - alias-compile....................................3 / 3
    ok - cast-compile....................................28 / 28
    ok - comp-err.........................................2 / 2
    ok - exit-err.........................................3 / 3
    ok - int-literals-err.................................1 / 1
    ok - output...........................................3 / 3
    ok - return-err.......................................5 / 5
    ok - conditions-required-err.........................23 / 23
    ok - inference-err....................................1 / 1
    ok - callback-err.....................................2 / 2
    ok - infix-compile....................................3 / 3
    ok - not-compile......................................1 / 1
    ok - print............................................3 / 3
    ok - enumerations compile............................12 / 12
    ok - pointer-compile..................................2 / 2
    ok - namespace compiler tests.........................9 / 9
    ok - compiles-ok......................................1 / 1
    ok - dylib compiler...................................2 / 2
    ok - define...........................................1 / 1
    ok - logic..........................................105 / 105
    ok - byte..........................................3677 / 3677
    ok - c-string........................................20 / 20
    ok - struct.........................................116 / 116
    ok - pointer.........................................69 / 69
    ok - cast...........................................141 / 141
    ok - alias...........................................23 / 23
    ok - length..........................................11 / 11
    ok - null............................................11 / 11
    ok - enum............................................19 / 19
    ok - float.........................................1677 / 1677
    ok - float32.......................................1079 / 1079
    ok - lib.............................................15 / 15
    ok - get-pointer......................................5 / 5
    ok - float-pointer...................................61 / 61
    ok - namespace......................................112 / 112
    ok - not.............................................44 / 44
    ok - size............................................38 / 38
    ok - function.........................................6 / 6
    ok - case............................................64 / 64
    ok - switch..........................................85 / 85
    ok - exit.............................................9 / 9
    ok - return..........................................25 / 25
    ok - exceptions......................................11 / 11
    ok - modulo..........................................38 / 38
    ok - math-mixed....................................1775 / 1775
    ok - infix............................................2 / 2
    ok - conditional.....................................15 / 15
    ok - system..........................................13 / 13
    ** - dylib-auto***************************************0 / 1 **
    
    ** - Complete Red Test Suite**********************27590 / 27591 **
           in 0:02:59.153
    
    The test finished at 17-Feb-2017/9:24:09.65+8:00
    The test output was logged to /E/Red/red/quick-test/quick-test.log
    hit enter to finish
    ```
    
    Note: The dylib-auto failure is because I didn't reset the tests (which I share between macOS, Linux and Windows).
    
    I will try to test on Windows 10 later.

--------------------------------------------------------------------------------

On 2017-02-17T02:25:16Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2419#issuecomment-280530761>

    When I ran run-all.r referencing Rebol/View via a relative path on Windows 10, the tests started running normally and completed the Red tests. Rebol/View stop responding as run-all.r was running the Red/System tests. This happens frequently on Windows 10 but not always. I have never been able to isolate the problem, even after extensive debugging. 
    
    I suspect it could be related to using CALL from Rebol, even with Win-Call.

--------------------------------------------------------------------------------

On 2017-02-17T02:29:33Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2419#issuecomment-280531418>

    There was clearly some other issue that @geekyi encountered as the Unicode test failed. It is impossible to diagnose without seeing the contents of the qt.log file.
    
    If @geekyi could rerun using a relative path and report the contents of red/quick-test/qt.log, I can look into this further.

--------------------------------------------------------------------------------

On 2017-02-17T04:35:28Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2419#issuecomment-280549496>

    I ran tests/run-all.r using Rebol via a relative path on Windows 10. It ran to completion. I then ran run-all.r another 3 times, the third time it ran to completion. The other two times Rebol stop responding.
    
    I don't think there is an issue with accessing Rebol via a relative path so I am closing this issue.

--------------------------------------------------------------------------------

On 2017-02-21T14:58:51Z, geekyi, commented:
<https://github.com/red/red/issues/2419#issuecomment-281368004>

    Sorry I'm late to respond. I didn't put the log because it was just a lot of failures. (Should have mentioned that)
    
    I'll try to see if I can isolate the problem. It may be related to running `.bat` scripts
    
    [quick-test.log](https://github.com/red/red/files/790471/quick-test.log.txt)
    
    Edit: this only happens if you try to run the tests thru `cmd.exe` or using a batch (`.bat`) file
    So I switched to using power-shell and .ps1 files now

--------------------------------------------------------------------------------

On 2017-02-22T02:55:32Z, geekyi, commented:
<https://github.com/red/red/issues/2419#issuecomment-281553598>

    With `..\..\rebol\rebview.exe -qs run-all.r` in cmd.exe, I'm getting an unusual output.
    In all other cases, all the tests simply failed.
    Here, it seems to pass some tests output:
    ```
    lexer auto-test files generated
    checking to see if interpreter test files need generating
    39 files were generated
    Quick-Test v 0.12.0
    REBOL  2.7.6.3.1
    This test started at 22-Feb-2017/7:33:41.083+5:00
    Complete Red Test Suite
    
    ok - lexer............................................0 / 0
    ok - lexer-auto.......................................0 / 0
    ** - unicode******************************************0 / 1 **
    ** - preprocessor tests*******************************0 / 24 **
    ok - run-all-comp1.red.............................4530 / 4530
    ok - run-all-comp2.red.............................4568 / 4568
    ok - run-all-interp.red............................8954 / 8954
    ** - tools********************************************0 / 1 **
    ** - Red print*************************************4531 / 4540 **
    ** - Red run time errors******************************0 / 16 **
    ** - Red compile errors*******************************0 / 1 **
    ** - alias-compile************************************0 / 3 **
    ** - cast-compile*************************************0 / 28 **
    ** - comp-err*****************************************0 / 2 **
    ** - exit-err*****************************************1 / 4 **
    ** - int-literals-err*********************************0 / 1 **
    ** - output*******************************************1 / 5 **
    ** - return-err***************************************0 / 5 **
    ** - conditions-required-err**************************0 / 23 **
    ** - inference-err************************************0 / 1 **
    ** - callback-err*************************************0 / 2 **
    ** - infix-compile************************************0 / 3 **
    ** - not-compile**************************************0 / 2 **
    ** - print********************************************0 / 6 **
    ** - enumerations compile*****************************0 / 12 **
    ** - pointer-compile**********************************0 / 2 **
    ** - namespace compiler tests*************************0 / 13 **
    ** - compiles-ok**************************************0 / 1 **
    ** - dylib compiler***********************************0 / 4 **
    ok - define...........................................1 / 1
    ok - logic..........................................105 / 105
    ok - byte..........................................3677 / 3677
    ok - c-string........................................20 / 20
    ok - struct.........................................116 / 116
    ok - pointer.........................................69 / 69
    ok - cast...........................................141 / 141
    ok - alias...........................................23 / 23
    ok - length..........................................11 / 11
    ok - null............................................11 / 11
    ok - enum............................................19 / 19
    ok - float.........................................1677 / 1677
    ok - float32.......................................1079 / 1079
    ok - lib.............................................15 / 15
    ok - get-pointer......................................5 / 5
    ok - float-pointer...................................61 / 61
    ok - namespace......................................112 / 112
    ok - not.............................................44 / 44
    ok - size............................................38 / 38
    ok - function.........................................6 / 6
    ok - case............................................64 / 64
    ok - switch..........................................85 / 85
    ok - exit.............................................9 / 9
    ok - return..........................................25 / 25
    ok - exceptions......................................11 / 11
    ok - modulo..........................................38 / 38
    ok - math-mixed....................................1775 / 1775
    ok - infix............................................2 / 2
    ok - conditional.....................................15 / 15
    ok - system..........................................13 / 13
    ok - dylib-auto.......................................7 / 7
    
    ** - Complete Red Test Suite**********************31865 / 32076 **
           in 0:02:17.858
    
    The test finished at 22-Feb-2017/7:35:58.941+5:00
    ```
    It still outputs only that tests failed, but attached the file in case it's useful.
    [quick-test.log](https://github.com/red/red/files/792123/quick-test.log.txt)

