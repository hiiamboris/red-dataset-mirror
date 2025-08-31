
#5256: CRASH in `size-text` on empty rich-text
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/5256>

**Describe the bug**

This works:
```
view [
	rich-text data [b "abc" /b]
	with [
		probe size-text self
	]
]
```
Output:
```
20x16
```

This crashes:
```
view [
	rich-text with [
		data: [b "abc" /b]
		probe size-text self
	]
]
```
Output:
```
*** Runtime Error 1: access violation
*** in file: /d/devel/red/red-src/master/runtime/datatypes/series.reds
*** at line: 83
***
***   stack: red/_series/get-length 05734DF8h false
***   stack: red/string/rs-length? 05734DF8h
***   stack: parse-text-styles 04ABD2A8h 04ABED80h 05734E38h 05734DF8h false
***   stack: gui/OS-text-box-layout 04A50C8Ch 04ABD2A8h 0 false
***   stack: ctx||459~text-box-metrics 04A50C8Ch 04A50C9Ch 3
***   stack: size-text
***   stack: red/_function/call 04A50C0Ch 049F3884h 05727F00h 0
***   stack: red/interpreter/eval-code 05383E98h 05727F20h 05727F20h 04A50BECh true 00000000h 00000000h 05383E98h
***   stack: red/interpreter/eval-expression 05727F10h 05727F20h 04A50BECh false true false
***   stack: red/interpreter/eval-arguments 05386218h 05727F00h 05727F20h 04A50BECh 00000000h 00000000h 05386218h
***   stack: red/interpreter/eval-code 05386218h 05727F00h 05727F20h 04A50BECh false 00000000h 00000000h 05386218h
***   stack: red/interpreter/eval-expression 05727F00h 05727F20h 04A50BECh false false false
***   stack: red/interpreter/eval 04A50BECh true
***   stack: red/natives/do* true -1 -1 -1 -1
***   stack: ctx||463~fetch-options 049EA45Ch
***   stack: red/_function/call 04A506DCh 049EA45Ch 05684C48h 0
***   stack: red/interpreter/eval-code 056127B8h 05684CD8h 05684DB8h 04A506ACh true 00000000h 00000000h 056127B8h
***   stack: red/interpreter/eval-expression 05684C58h 05684DB8h 04A506ACh false true false
***   stack: red/interpreter/eval-expression 05684C48h 05684DB8h 04A506ACh false false false
***   stack: red/interpreter/eval 04A506ACh true
***   stack: red/natives/switch* false 2
***   stack: red/interpreter/eval-arguments 04A5067Ch 05683DD8h 05683E08h 04A5066Ch 05683D98h 05683F38h 05380C78h
***   stack: red/interpreter/eval-code 05380C78h 05683DA8h 05683E08h 04A5066Ch true 05683D98h 05683F38h 05380C78h
***   stack: red/interpreter/eval-path 05683D98h 05683DA8h 05683E08h 04A5066Ch false false false false
***   stack: red/interpreter/eval-expression 05683DA8h 05683E08h 04A5066Ch false false false
***   stack: red/interpreter/eval 04A5066Ch true
***   stack: red/natives/while* false
***   stack: red/interpreter/eval-arguments 04A5064Ch 056833B8h 056833F8h 04A5062Ch 00000000h 00000000h 0537FE38h
***   stack: red/interpreter/eval-code 0537FE38h 05683398h 056833F8h 04A5062Ch false 00000000h 00000000h 0537FE38h
***   stack: red/interpreter/eval-expression 05683398h 056833F8h 04A5062Ch false false false
***   stack: red/interpreter/eval 04A5062Ch true
***   stack: red/natives/catch* true 1
***   stack: layout 049EA45Ch
***   stack: view
***   stack: red/_function/call 04A5018Ch 049F3884h 05727FA0h 0
***   stack: red/interpreter/eval-code 05383E78h 05727FC0h 05727FC0h 04A5016Ch false 00000000h 00000000h 05383E78h
***   stack: red/interpreter/eval-expression 05727FB0h 05727FC0h 04A5016Ch false false false
***   stack: red/interpreter/eval 04A5016Ch true
***   stack: red/natives/catch* true 1
***   stack: ctx||603~try-do 04B30C10h
```


**Expected behavior**

1. No crash on `text: none`
2. `text` gets filled from `data` on change ? It seems that current `data` VID keyword is not consistent with `data` facet of `rich-text` face, and it all hinges on a [special case](https://github.com/red/red/blob/master/modules/view/VID.red#L424) made in VID, which I find confusing.

**Platform version**

```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4612 date: 9-Dec-2022/7:12:47 commit: #ce6e33c1dc44fc32bdaeb7f804ac93d98b9af863 ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


