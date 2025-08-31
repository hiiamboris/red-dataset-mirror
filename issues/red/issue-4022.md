
#4022: [Reactivity] access violation on evaluation of REPEAT expression bounded to reactor's context
================================================================================
Issue is closed, was reported by 9214 and has 0 comment(s).
[status.built] [status.tested] [type.bug] [test.written]
<https://github.com/red/red/issues/4022>

**Describe the bug**

Prerequisites:
1. Reactive object that contains a word.
1. `repeat` expression that **(a)** iterates more than once over the word with the same spelling as in **(1)**  and **(b)** queries the said word.

Now, bind **(2)** to **(1)** and evaluate it, or simply embed expression **(2)** inside `make reactor! ...` body. In either case this results in access violation.

**To reproduce**
```red
make reactor! [i: repeat i 2 [i]]
```
Stack trace:
```red
*** Runtime Error 1: access violation
*** in file: .../runtime/datatypes/block.reds
*** at line: 50
***
***   stack: red/block/rs-head 026CF794h
***   stack: red/interpreter/eval 026CF794h true
***   stack: red/natives/repeat* false
***   stack: red/interpreter/eval-arguments 027D0394h 029386B0h 029386B0h 00000000h 00000000h
***   stack: red/interpreter/eval-code 027D0394h 02938680h 029386B0h false 00000000h 00000000h 027D0394h
***   stack: red/interpreter/eval-expression 02938680h 029386B0h false false false
***   stack: red/interpreter/eval 026CF734h false
***   stack: red/object/make 026CF724h 026CF734h 32
***   stack: red/actions/make 026CF724h 026CF734h
***   stack: red/actions/make*
***   stack: red/interpreter/eval-arguments 027CFDB4h 02938584h 02938584h 00000000h 00000000h
***   stack: red/interpreter/eval-code 027CFDB4h 02938564h 02938584h false 00000000h 00000000h 027CFDB4h
***   stack: red/interpreter/eval-expression 02938564h 02938584h false false false
***   stack: red/interpreter/eval 026CF6F4h true
***   stack: red/natives/catch* true 1
***   stack: ctx419~try-do 006EA918h
***   stack: ctx419~do-command 006EA918h
***   stack: ctx419~eval-command 006EA918h
***   stack: ctx419~run 006EA918h
***   stack: ctx419~launch 006EA918h
***   stack: ctx437~launch 006EA418h
```

**Expected behavior**
Loop runs as usual, reactions are triggered when necessary.

**Platform version**
```
Red 0.6.4 for Windows built 31-Aug-2019/17:47:43+05:00 commit #b28d8f5
```



