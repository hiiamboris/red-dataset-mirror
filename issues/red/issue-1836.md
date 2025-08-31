
#1836: Crash when parse command used for a specific use case
================================================================================
Issue is closed, was reported by Zamlox and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1836>

Following sequence of code will crash the console:

```
content: [a [b] c]
rule: [any [
    set item word! (print item) | 
    mark: () into [rule] stop: (prin "STOP: " probe stop) ] ]
parse content rule
```

If empty parenthesis after 'mark:' is removed, it doesn't crash. 

Stack trace:

```
--== Red 0.6.0 ==--
Type HELP for starting information.

== [a [b] c]
== [any [set item word! (print item) | mark: () into [rule] stop: ...
a
b
STOP: [c]
c

*** Runtime Error 1: access violation
*** in file: /D/dev/Red/source/red/runtime/datatypes/block.reds
*** at line: 48
***
***   stack: red/block/rs-head 024C3BA0h
***   stack: red/parser/process 024BD150h 024C3BA0h 0 0 024C3B80h
***   stack: red/natives/parse* false -1 0 -1
***   stack: red/interpreter/eval-arguments 0255CEC4h 02581938h 02581938h 00000000h 00000000h
***   stack: red/interpreter/eval-code 0255CEC4h 02581918h 02581938h false 00000000h 00000000h 0255CEC4h
***   stack: red/interpreter/eval-expression 02581918h 02581938h false false
***   stack: red/interpreter/eval 024C3B80h true
***   stack: red/natives/do* false -1
***   stack: red/interpreter/eval-arguments 0255CD34h 025509E4h 025509E4h 00000000h 00000000h
***   stack: red/interpreter/eval-code 0255CD34h 025509D4h 025509E4h true 00000000h 00000000h 0255CD34h
***   stack: red/interpreter/eval-expression 025509D4h 025509E4h false true
***   stack: red/interpreter/eval-arguments 0255C2D4h 025509C4h 025509E4h 025509A4h 025509F8h
***   stack: red/interpreter/eval-code 0255C2D4h 025509B4h 025509E4h true 025509A4h 025509F8h 0255C2D4h
***   stack: red/interpreter/eval-path 025509A4h 025509B4h 025509E4h false false false false
***   stack: red/interpreter/eval-expression 025509B4h 025509E4h false false
***   stack: red/interpreter/eval 024C3B50h true
***   stack: red/natives/catch* true 1
***   stack: ctx255~try-do 0026CCACh
***   stack: red/_function/call 0253A99Ch 0026CCACh
***   stack: red/interpreter/eval-code 0253A99Ch 025510A8h 025510F8h true 00000000h 00000000h 0253A99Ch
***   stack: red/interpreter/eval-expression 02551098h 025510F8h false true
***   stack: red/interpreter/eval-arguments 0255C2D4h 02551088h 025510F8h 02551068h 0255110Ch
***   stack: red/interpreter/eval-code 0255C2D4h 02551078h 025510F8h true 02551068h 0255110Ch 0255C2D4h
***   stack: red/interpreter/eval-path 02551068h 02551078h 025510F8h false false false false
***   stack: red/interpreter/eval-expression 02551078h 025510F8h false false
***   stack: red/interpreter/eval 024C3AD0h true
***   stack: red/natives/unless* false
***   stack: red/interpreter/eval-arguments 0255CBD4h 02550F44h 02550F64h 00000000h 00000000h
***   stack: red/interpreter/eval-code 0255CBD4h 02550F14h 02550F64h false 00000000h 00000000h 0255CBD4h
***   stack: red/interpreter/eval-expression 02550F14h 02550F64h false false
***   stack: red/interpreter/eval 024C3AB0h true
***   stack: red/natives/do* true -1
***   stack: ctx255~eval-command 0026CCACh
***   stack: ctx255~run 0026CCACh
***   stack: ctx255~launch 0026CCACh
```



Comments:
--------------------------------------------------------------------------------

On 2016-04-20T15:50:04Z, dockimbel, commented:
<https://github.com/red/red/issues/1836#issuecomment-212485371>

    Good catch!

