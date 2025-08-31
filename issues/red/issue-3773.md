
#3773: [CRASH] when using `context?` inside a macro and macro self-reference
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
<https://github.com/red/red/issues/3773>

**Describe the bug**

I know I'm misusing the macros, but there should be a proper error display.

#### Scenario 1:
```
Red []
#macro ctx: func [x] [context? x]
ctx ""
```

```
*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/runtime/datatypes/object.reds
*** at line: 97
***
***   stack: red/object/rs-select 02950304h 02CAB11Ch
***   stack: red/error/reduce 02950324h 02950304h
***   stack: red/error/form 02950304h 02950314h 029502F4h -18
***   stack: red/actions/form 02950304h 02950314h 029502F4h 0
***   stack: red/actions/form* -1
***   stack: red/natives/prin* false
***   stack: red/natives/print* false
***   stack: red/stack/throw-error 02950684h
***   stack: red/fire 1 0018F73Ch
***   stack: red/interpreter/eval-arguments 02A50A04h 02CAA450h 02CAA450h 00000000h 00000000h
***   stack: red/interpreter/eval-code 02A50A04h 02CAA440h 02CAA450h false 00000000h 00000000h 02A50A04h
***   stack: red/interpreter/eval-expression 02CAA440h 02CAA450h false false false
***   stack: red/interpreter/eval 02CAA3CCh true
***   stack: red/interpreter/eval-function 02950624h 02CAA3CCh
***   stack: red/_function/call 02950624h 007C2A68h
***   stack: red/interpreter/eval-code 02950624h 02CAAD2Ch 02CAAD2Ch false 00000000h 00000000h 02CAA254h
***   stack: red/interpreter/eval-expression 02CAAD1Ch 02CAAD2Ch false false false
***   stack: red/interpreter/eval 02950614h true
***   stack: red/natives/do* true -1 -1 -1
***   stack: ctx302~do-macro 0038BC70h
***   stack: red/_function/call 02950504h 0038BC70h
***   stack: red/interpreter/eval-code 02950504h 02CAA070h 02CAA080h true 00000000h 00000000h 02AFF988h
***   stack: red/interpreter/eval-expression 02CAA040h 02CAA080h false true false
***   stack: red/interpreter/eval-arguments 02A4F904h 02CAA030h 02CAA080h 02CAA010h 02C08920h
***   stack: red/interpreter/eval-code 02A4F904h 02CAA020h 02CAA080h true 02CAA010h 02C08920h 02A4F904h
***   stack: red/interpreter/eval-path 02CAA010h 02CAA020h 02CAA080h false false false false
***   stack: red/interpreter/eval-expression 02CAA020h 02CAA080h false false false
***   stack: red/interpreter/eval 02CAA12Ch false
***   stack: red/parser/eval 02CAA12Ch true false
***   stack: red/parser/process 02A70C90h 029504C4h 0 0 029504A4h
***   stack: red/natives/parse* true -1 0 -1
***   stack: ctx302~expand 0038BC70h
***   stack: expand-directives 0038BC70h
***   stack: ctx473~launch 00791C88h
```

#### Scenario 2 (lit-word):
```
Red []
#macro mc: func [x] [x]
probe quote (mc 'mc)
```

```
*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/runtime/datatypes/object.reds
*** at line: 97
***
***   stack: red/object/rs-select 02880304h 02BEAE8Ch
***   stack: red/error/reduce 02880324h 02880304h
***   stack: red/error/form 02880304h 02880314h 028802F4h -18
***   stack: red/actions/form 02880304h 02880314h 028802F4h 0
***   stack: red/actions/form* -1
***   stack: red/natives/prin* false
***   stack: red/natives/print* false
***   stack: red/stack/throw-error 02880794h
***   stack: red/fire 0 0018F420h
***   stack: red/interpreter/eval-arguments 02BEA0E0h 02BEAB74h 02BEAB74h 00000000h 00000000h
***   stack: red/interpreter/eval-code 02BEA0E0h 02BEAB74h 02BEAB74h false 00000000h 00000000h 02BEA0E0h
***   stack: red/interpreter/eval-expression 02BEAB74h 02BEAB74h false false false
***   stack: red/interpreter/eval 02880764h true
***   stack: red/natives/do* true -1 -1 -1
***   stack: ctx302~do-macro 0033BC70h
***   stack: red/_function/call 02880654h 0033BC70h
***   stack: red/interpreter/eval-code 02880654h 02BE9EFCh 02BE9F0Ch true 00000000h 00000000h 02A2F988h
***   stack: red/interpreter/eval-expression 02BE9ECCh 02BE9F0Ch false true false
***   stack: red/interpreter/eval-arguments 0297F904h 02BE9EBCh 02BE9F0Ch 02BE9E9Ch 02B48920h
***   stack: red/interpreter/eval-code 0297F904h 02BE9EACh 02BE9F0Ch true 02BE9E9Ch 02B48920h 0297F904h
***   stack: red/interpreter/eval-path 02BE9E9Ch 02BE9EACh 02BE9F0Ch false false false false
***   stack: red/interpreter/eval-expression 02BE9EACh 02BE9F0Ch false false false
***   stack: red/interpreter/eval 02BE9FB8h false
***   stack: red/parser/eval 02BE9FB8h true true
***   stack: red/parser/process 029A0CB0h 02880614h 0 0 028805F4h
***   stack: red/natives/parse* true -1 0 -1
***   stack: ctx302~do-macro 0033BC70h
***   stack: red/_function/call 02880504h 0033BC70h
***   stack: red/interpreter/eval-code 02880504h 02BE9EFCh 02BE9F0Ch true 00000000h 00000000h 02A2F988h
***   stack: red/interpreter/eval-expression 02BE9ECCh 02BE9F0Ch false true false
***   stack: red/interpreter/eval-arguments 0297F904h 02BE9EBCh 02BE9F0Ch 02BE9E9Ch 02B48920h
***   stack: red/interpreter/eval-code 0297F904h 02BE9EACh 02BE9F0Ch true 02BE9E9Ch 02B48920h 0297F904h
***   stack: red/interpreter/eval-path 02BE9E9Ch 02BE9EACh 02BE9F0Ch false false false false
***   stack: red/interpreter/eval-expression 02BE9EACh 02BE9F0Ch false false false
***   stack: red/interpreter/eval 02BE9FB8h false
***   stack: red/parser/eval 02BE9FB8h true false
***   stack: red/parser/process 029A0CA0h 028804C4h 0 0 028804A4h
***   stack: red/natives/parse* true -1 0 -1
***   stack: ctx302~expand 0033BC70h
***   stack: expand-directives 0033BC70h
```

#### Scenario 3 (get-word):
```
Red []
#macro mc: func [x] [x]
probe quote (mc :mc)
```

```
*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/runtime/datatypes/object.reds
*** at line: 97
***
***   stack: red/object/rs-select 029C0304h 02C8AEC0h
***   stack: red/error/reduce 029C0324h 029C0304h
***   stack: red/error/form 029C0304h 029C0314h 029C02F4h -18
***   stack: red/actions/form 029C0304h 029C0314h 029C02F4h 0
***   stack: red/actions/form* -1
***   stack: red/natives/prin* false
***   stack: red/natives/print* false
***   stack: red/stack/throw-error 029C0664h
***   stack: red/fire 0 0018F740h
***   stack: red/interpreter/eval-arguments 029C0634h 02C8A2CCh 02C8A2CCh 00000000h 00000000h
***   stack: red/interpreter/eval-code 029C0634h 02C8A2CCh 02C8A2CCh false 00000000h 00000000h 029C0634h
***   stack: red/interpreter/eval-expression 02C8A2CCh 02C8A2CCh false false false
***   stack: red/interpreter/eval 02C8A258h true
***   stack: red/interpreter/eval-function 029C0624h 02C8A258h
***   stack: red/_function/call 029C0624h 00B42A6Ch
***   stack: red/interpreter/eval-code 029C0624h 02C8ABA8h 02C8ABA8h false 00000000h 00000000h 02C8A0E0h
***   stack: red/interpreter/eval-expression 02C8AB98h 02C8ABA8h false false false
***   stack: red/interpreter/eval 029C0614h true
***   stack: red/natives/do* true -1 -1 -1
***   stack: ctx302~do-macro 003ABC70h
***   stack: red/_function/call 029C0504h 003ABC70h
***   stack: red/interpreter/eval-code 029C0504h 02C89EFCh 02C89F0Ch true 00000000h 00000000h 02B6F988h
***   stack: red/interpreter/eval-expression 02C89ECCh 02C89F0Ch false true false
***   stack: red/interpreter/eval-arguments 02ABF904h 02C89EBCh 02C89F0Ch 02C89E9Ch 02BE8920h
***   stack: red/interpreter/eval-code 02ABF904h 02C89EACh 02C89F0Ch true 02C89E9Ch 02BE8920h 02ABF904h
***   stack: red/interpreter/eval-path 02C89E9Ch 02C89EACh 02C89F0Ch false false false false
***   stack: red/interpreter/eval-expression 02C89EACh 02C89F0Ch false false false
***   stack: red/interpreter/eval 02C89FB8h false
***   stack: red/parser/eval 02C89FB8h true false
***   stack: red/parser/process 02AE0CA0h 029C04C4h 0 0 029C04A4h
***   stack: red/natives/parse* true -1 0 -1
***   stack: ctx302~expand 003ABC70h
***   stack: expand-directives 003ABC70h
***   stack: ctx473~launch 003D1C88h
```

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 26-Jan-2019/20:52:31+03:00
```



