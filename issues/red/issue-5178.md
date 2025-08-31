
#5178: Assertion failed when converting empty vector! to block!
================================================================================
Issue is closed, was reported by loziniak and has 4 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/5178>

In a console compiled from recent *master*:
```
>> to block! make vector! [2]
== [2]
>> 
>> to block! make vector! []

*** Runtime Error 98: assertion failed
*** in file: /mnt/share/downl/red-master/runtime/allocator.reds
*** at line: 903
***
***   stack: red/alloc-series-buffer 0 16 0
***   stack: red/alloc-series 0 16 0
***   stack: red/alloc-cells 0
***   stack: red/block/make-at 08920554h 0
***   stack: red/vector/to-block 08920564h 08920554h
***   stack: red/block/to 08920554h 08920564h 5
***   stack: red/actions/to 08920554h 08920564h
***   stack: red/actions/to*
***   stack: red/interpreter/eval-arguments 08920544h F65B0A00h F65B0A00h 08920524h 00000000h 00000000h F67B0DF8h
***   stack: red/interpreter/eval-code F67B0DF8h F65B09C0h F65B0A00h 08920524h false 00000000h 00000000h F67B0DF8h
***   stack: red/interpreter/eval-expression F65B09C0h F65B0A00h 08920524h false false false
***   stack: red/interpreter/eval 08920524h true
***   stack: red/natives/catch* true 1
***   stack: ctx||495~try-do F7F8B808h
***   stack: ctx||495~do-command F7F8B808h
***   stack: ctx||495~eval-command F7F8B808h
***   stack: ctx||495~run F7F8B808h
***   stack: ctx||495~launch F7F8B808h
***   stack: ctx||514~launch F7F8B214h
***   stack: ***_start
```
.
platform:
Arch Linux, x64


Comments:
--------------------------------------------------------------------------------

On 2022-08-17T15:26:56Z, meijeru, commented:
<https://github.com/red/red/issues/5178#issuecomment-1218163528>

    Interestingly, this did NOT crash on my Windows version `#2b33a6f` which is two commits before the FIX.

--------------------------------------------------------------------------------

On 2022-08-17T15:41:12Z, dockimbel, commented:
<https://github.com/red/red/issues/5178#issuecomment-1218186363>

    Assertions only trigger in debug mode.

