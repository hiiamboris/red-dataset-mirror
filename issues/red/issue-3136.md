
#3136: usage of MOVE/PART with /PART argument greater than or equal to series length crashes the console
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/3136>

### Expected behavior
Hard to tell, I think `[1 2 3]` should be returned without a change.
### Actual behavior
GUI console crashed, CLI REPL in VSCode produced:
```Red
*** Runtime Error 16: invalid virtual address
*** at: F76F7A6Fh
```
### Steps to reproduce the problem
```Red
>> x: [1 2 3]
== [1 2 3]
>> move/part x next x length? x
```
### Red version and build date, operating system with version.
Applies to Linux version too.
```Red
>> about
Red for Windows version 0.6.3 built 9-Dec-2017/18:21:06+05:00
```


Comments:
--------------------------------------------------------------------------------

On 2017-12-09T18:51:15Z, greggirwin, commented:
<https://github.com/red/red/issues/3136#issuecomment-350497656>

    Crash confirmed here.

