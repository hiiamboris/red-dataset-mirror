
#1930: Setting FACE/SELECTED crashes Red
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1930>

Following code crashes Red (silently in interpreter, with ***** Runtime Error 100: no value matched in CASE** error when compiled):

```
Red[
    Needs: 'View
]

view [
    size 300x500
    i: image 300x500 draw [line 0x0 300x500 line 0x500 300x0]
        on-over [
            face/selected: event/offset/y
        ]
]
```

Bonus:

When compiled in DEBUG mode, it crashes with two error messages:

```
*** Runtime Error 100: no value matched in CASE
*** in file: /C/Tmp/red-master/modules/view/backends/windows/gui.reds
*** at line: 1269

*** Runtime Error 1: access violation
*** in file: /C/Tmp/red-master/system/runtime/debug.reds
*** at line: 70
***
***   stack: __print-debug-stack 0047E9F6h
***   stack: ***-on-quit 100 4712950
***   stack: gui/change-selection 0019030Ah 01D2BD6Ch 01D2BCCCh
***   stack: gui/OS-update-view 01C83FD8h
***   stack: ctx224~update-view 01C83FD8h
***   stack: show
***   stack: red/_function/call 01D12308h 0033388Ch
***   stack: red/interpreter/eval-code 01D12308h 01D2B8D8h 01D2B8D8h false 00000000h 00000000h 01D12308h
***   stack: red/interpreter/eval-expression 01D2B8C8h 01D2B8D8h false false
***   stack: red/interpreter/eval 01C83D98h true
***   stack: red/natives/if* false
***   stack: red/interpreter/eval-arguments 01D116F8h 01D2CAA8h 01D2CAA8h 00000000h 00000000h
***   stack: red/interpreter/eval-code 01D116F8h 01D2CA78h 01D2CAA8h false 00000000h 00000000h 01D116F8h
***   stack: red/interpreter/eval-expression 01D2CA78h 01D2CAA8h false false
***   stack: red/interpreter/eval 01C83D78h true
***   stack: red/natives/if* false
***   stack: red/interpreter/eval-arguments 01D116F8h 01D2AE70h 01D2AE70h 00000000h 00000000h
***   stack: red/interpreter/eval-code 01D116F8h 01D2AE50h 01D2AE70h false 00000000h 00000000h 01D116F8h
***   stack: red/interpreter/eval-expression 01D2AE50h 01D2AE70h false false
***   stack: red/interpreter/eval 01C83D58h true
***   stack: red/natives/if* false
***   stack: red/interpreter/eval-arguments 01D116F8h 01D2BF04h 01D2BF04h 00000000h 00000000h
***   stack: red/interpreter/eval-code 01D116F8h 01D2BEC4h 01D2BF04h false 00000000h 00000000h 01D116F8h
***   stack: red/interpreter/eval-expression 01D2BEC4h 01D2BF04h false false
***   stack: red/interpreter/eval 01D2CCE0h true
***   stack: red/interpreter/eval-function 01D2BE2Ch 01D2CCE0h
***   stack: red/_function/call 01D2BE2Ch 0032AB1Ch
***   stack: red/object/fire-on-set 01C83CB8h 01D2E410h 01C83CE8h 01C83CD8h
***   stack: red/object/eval-path 01C83CB8h 01D2E410h 01C83CD8h 01D2E320h false
***   stack: red/actions/eval-path 01C83CB8h 01D2E410h 01C83CD8h 01D2E320h false
***   stack: red/interpreter/eval-path 01D2E410h 01D2E340h 01D2E340h true false false false
***   stack: red/interpreter/eval-expression 01D2E340h 01D2E340h false false
***   stack: red/interpreter/eval 01D2EECCh true
***   stack: red/interpreter/eval-function 01C83C48h 01D2EECCh
***   stack: red/_function/call 01C83C48h 0032D3DCh
***   stack: red/interpreter/eval-code 01C83C48h 01D058ECh 01D058ECh false 00000000h 00000000h 01C83C48h
***   stack: red/interpreter/eval-expression 01D058CCh 01D058ECh false false
***   stack: red/interpreter/eval 01C83CA8h true
***   stack: red/natives/do* false -1
***   stack: red/interpreter/eval-arguments 01D121C8h 01D058A8h 01D058A8h 00000000h 00000000h
```



