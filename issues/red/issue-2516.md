
#2516: Preprocessor-test.red causes access violation in interpreter
================================================================================
Issue is closed, was reported by PeterWAWood and has 10 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2516>

When running preprocessor-test.red in the console I get an access violation. (I get the same error running the test in libRed.)

```test
>> do %quick-test/quick-test.red
>> do %tests/source/units/preprocessor-test.red

*** Runtime Error 1: access violation
*** at: 000446C9h
mbp:red peter$ ./test-console
```


Comments:
--------------------------------------------------------------------------------

On 2017-03-30T04:24:38Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2516#issuecomment-290298825>

    The error also occurs un Windows 7:
    ```
    E:\Red\red\tests\libRed>libRedTest.exe ../source/units/preprocessor-test.red
    
    *** Runtime Error 1: access violation
    *** at: 6EE29455h
    ```

--------------------------------------------------------------------------------

On 2017-03-30T11:14:54Z, dockimbel, commented:
<https://github.com/red/red/issues/2516#issuecomment-290380463>

    The crash was fixed, though, you should avoid loading the `quick-test.red` lib as it is already loaded from within the test script. ;-)

--------------------------------------------------------------------------------

On 2017-03-30T21:41:54Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2516#issuecomment-290553396>

    I thought that #includes were ignored by the interpreter. 

--------------------------------------------------------------------------------

On 2017-03-31T04:09:06Z, dockimbel, commented:
<https://github.com/red/red/issues/2516#issuecomment-290610838>

    They are ignored by the interpreter, but the preprocessor converts them to `do` when run from the interpreter.

--------------------------------------------------------------------------------

On 2017-03-31T04:14:23Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2516#issuecomment-290611446>

    Thanks.

