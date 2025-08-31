
#3631: [CRASH] checksum ... 'adler32
================================================================================
Issue is closed, was reported by hiiamboris and has 4 comment(s).
[type.bug]
<https://github.com/red/red/issues/3631>

**Describe the bug**
```
>> checksum "^@" 'adler32

*** Runtime Error 1: access violation
*** at: 00464625h

>> checksum "X^A" 'adler32

*** Runtime Error 1: access violation
*** at: 00464625h

>> checksum "qwertyo^G" 'adler32

*** Runtime Error 1: access violation
*** at: 00464625h
```
and so on

**Platform version(please complete the following information):**
```
Red 0.6.4 for Windows built 29-Nov-2018/6:09:14+03:00 commit #95481b0
```

:point_up: [December 3, 2018 11:13 PM](https://gitter.im/red/bugs?at=5c058e87e827492525931ab0)


Comments:
--------------------------------------------------------------------------------

On 2019-05-22T14:00:12Z, Oldes, commented:
<https://github.com/red/red/issues/3631#issuecomment-494815263>

    This bug is not fully resolved!
    This is OK now:
    ```
    >> checksum "^@" 'adler32
    == 65537
    ```
    But this crashes:
    ```
    >> checksum "12345678901234567890123456789012345678901234567890123456789012345678901234567890" 'adler32
    
    *** Runtime Error 1: access violation
    *** in file: /X/GIT/Siskin-framework/Public/Red/red/runtime/crypto.reds
    *** at line: 345
    ***
    ***   stack: red/crypto/adler32 0298C248h 80
    ***   stack: red/natives/checksum* false -1
    ***   stack: red/interpreter/eval-arguments 0278FA34h 0298C118h 0298C118h 00000000h 00000000h
    ***   stack: red/interpreter/eval-code 0278FA34h 0298C0F8h 0298C118h false 00000000h 00000000h 0278FA34h
    ***   stack: red/interpreter/eval-expression 0298C0F8h 0298C118h false false false
    ***   stack: red/interpreter/eval 0268E964h true
    ***   stack: red/natives/catch* true 1
    ***   stack: ctx373~try-do 00C9B694h
    ***   stack: ctx373~do-command 00C9B694h
    ***   stack: ctx373~eval-command 00C9B694h
    ***   stack: ctx373~run 00C9B694h
    ***   stack: ctx373~launch 00C9B694h
    ```

--------------------------------------------------------------------------------

On 2019-05-22T17:32:10Z, dockimbel, commented:
<https://github.com/red/red/issues/3631#issuecomment-494897032>

    @bitbegin ^---

