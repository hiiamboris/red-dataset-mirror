
#3437: to-char with integer > 10FFFFh crashes
================================================================================
Issue is closed, was reported by meijeru and has 12 comment(s).
<https://github.com/red/red/issues/3437>

### Expected behavior

>> to-char 110000h
== Error of some kind, e.g. Invalid Unicode Code Point
### Actual behavior

>> to-char 110000h
Crash! 
### Steps to reproduce the problem
execute above code
### Red and platform version
```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.3 ahead: 669 date: 27-Apr-2018/10:07:23 commit: #4c36108655f3410124f8539543cbd4bc4525fed1 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]
--------------------------------------------
```


Comments:
--------------------------------------------------------------------------------

On 2018-06-23T01:11:44Z, gltewalt, commented:
<https://github.com/red/red/issues/3437#issuecomment-399619051>

    It gives this on Win7 with red --cli
    ```
    >> to-char 110000h
    == #"��"
    ```
    
    Crashes GUI Console

--------------------------------------------------------------------------------

On 2018-06-23T13:02:57Z, meijeru, commented:
<https://github.com/red/red/issues/3437#issuecomment-399676874>

    Curiously, `to-integer to-char 110000h` does not crash the GUI console, but yields simply `110000h`.

--------------------------------------------------------------------------------

On 2018-06-23T18:00:18Z, endo64, commented:
<https://github.com/red/red/issues/3437#issuecomment-399697398>

    Crashes only on GUI console and only if you try to print:
    Here is more detail:
    
    ```
    >> to-integer c: to-char 110000h
    >> write-clipboard form c
    Error: to-utf16 codepoint overflow== true
    ```

--------------------------------------------------------------------------------

On 2018-06-23T18:57:24Z, endo64, commented:
<https://github.com/red/red/issues/3437#issuecomment-399701107>

    Crash can be prevented by changing line 96 on `runtime/datatypes/char.reds` from `proto/value: spec/data2` to `proto/value: spec/data2 and 1114111 ;==01FFFFh`  
    
    ```
    >> to-integer c: to-char 110000h
    == 1048576
    >> c
    == #"􀀀"
    ```
    
    But not sure if it should return an error.
    
    Edit: Should be 01FFFFh not FFFFh

--------------------------------------------------------------------------------

On 2018-06-25T01:25:02Z, greggirwin, commented:
<https://github.com/red/red/issues/3437#issuecomment-399805892>

    I merged @endo64's fix, but @meijeru would still prefer an error. On review, if it's an invalid code point, I agree. At least now we don't crash, but let's make it an error.

--------------------------------------------------------------------------------

On 2018-06-28T15:43:05Z, meijeru, commented:
<https://github.com/red/red/issues/3437#issuecomment-401079865>

    In view of @greggirwin 's latest comment, I close this and open a new issue, just to keep the subject fresh....

