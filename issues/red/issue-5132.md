
#5132: CRASHES in View when multiple timers add/remove new faces
================================================================================
Issue is closed, was reported by hiiamboris and has 10 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5132>

This may be relevant to https://github.com/red/red/issues/5131, but symptoms are different so I'm not sure it's the same bug. With a single `base` face it's stack trace copies that of #5131.

**Describe the bug**

When multiple timers are used to add & remove a face to the window, with GC on a whole spectrum of various crashes tends to happen. Also observed are frequent stack overflows, and `null window handle` warnings.

<details>
<summary>Windows stack trace variants observed:</summary>

```
on-face-deep-change* do-safe error? on-face-deep-change* do-s
r? on-face-deep-change* do-safe error? on-face-deep-change* d
eep-change* do-safe error? on-face-deep-change* do-safe error
EVENT/WINDOW/PANE is a block! value.  length: 103  [...]

root: 4813/7510, runs: 45, mem: 9695908root: 4813/7510, runs:
028root: 4813/7510, runs: 45, mem: 9696028root: 4813/7510, ru
696028 => 4078804, mark: 2.0ms, sweep: 5.0ms
none

*** Runtime Error 98: assertion failed
*** in file: /D/devel/red/red-src/red/runtime/natives.reds
*** at line: 3349
***
***   stack: red/natives/foreach-next
***   stack: ctx||447~awake 011CAD88h
***   stack: gui/make-event 01028020h 0 33
***   stack: gui/TimerProc 000A1B5Eh 275 00000001h 1889274593
```
---
```
EVENT/WINDOW/PANE is a block! value.  length: 94  [...]

EVENT/WINDOW/PANE is a block! value.  length: 95  [...]


*** Runtime Error 101: no value matched in SWITCH
*** in file: /D/devel/red/red-src/red/runtime/datatypes/string.reds
*** at line: 1113
***
***   stack: red/string/alter 00000065h 00440317h 0 1 false 0
***   stack: red/string/alter 051D5A24h 052C06F8h -1 0 true 0
***   stack: red/string/concatenate 051D5A24h 052C06F8h -1 0 true false
***   stack: red/string/form 052C06F8h 051D5A24h 00000000h -6
***   stack: red/word/form 0561A768h 051D5A24h 00000000h -6
***   stack: red/word/mold 0561A768h 051D5A24h false false true 00000000h -6 0
***   stack: red/actions/mold 0561A768h 051D5A24h false false true 00000000h -6 0
***   stack: red/path/mold 09464DF0h 051D5A24h false false true 00000000h -6 0
***   stack: red/actions/mold 09464DF0h 051D5A24h false false true 00000000h 0 0
***   stack: red/error/reduce 051D5A14h 051D59F4h
***   stack: red/error/form 051D59F4h 051D5A04h 051D59E4h 2147483629
***   stack: red/actions/form 051D59F4h 051D5A04h 051D59E4h 2147483647
***   stack: red/actions/form* -1
***   stack: red/natives/do-print true true
***   stack: red/natives/print* true
***   stack: do-safe
***   stack: ctx||447~awake 052AAD88h
***   stack: gui/make-event 01035450h 0 33
***   stack: gui/TimerProc 00071B40h 275 00000001h 1889248843
```
---
```
*** Internal Error: stack overflow
*** Where: layout
*** Near : [base red rate 99] append event/window/pane
*** Stack: do-events do-safe error? on-face-deep-chang
-change* do-safe error? on-face-deep-change* do-safe e
safe error? on-face-deep-change* do-safe error? on-fac
on-face-deep-change* do-safe error? on-face-deep-chang
-change* do-safe error? on-face-deep-change* do-safe e
safe error? on-face-deep-change* do-safe error? on-fac
on-face-deep-change* do-safe error? on-face-deep-chang
-change* do-safe error? on-face-deep-change* do-safe e
safe error? on-face-deep-change* do-safe error? on-fac
on-face-deep-change* do-safe error? on-face-deep-chang
r? on-face-deep-change* do-safe error? on-face-deep-ch
eep-change* do-safe error? on-face-deep-change* do-saf
ge* do-safe first layout
*** Script Error: invalid id field in spec block
*** Where: body
*** Near : none
*** Stack:
```
---
```
EVENT/WINDOW/PANE is a block! value.  length: 13  [make object! [type: 'base off

EVENT/WINDOW/PANE is a block! value.  length: 14  [make object! [type: 'base off

root: 4813/7510, runs: 9, mem: 3230720 => 2560168, mark: 2.0ms, sweep: 0.0ms
EVENT/WINDOW/PANE is a block! value.  length: 15  [make object! [type: 'base off


*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/modules/view/backends/windows/gui.reds
*** at line: 141
***
***   stack: gui/get-face-values 00021B0Ah
***   stack: gui/BaseWndProc 00021B0Ah 15 0 0
```
---
```
safe error? on-face-deep-change* do-safe error? on-face-deep-change* do-safe error? on-face-deep-change* do-safe er
on-face-deep-change* do-safe error? on-face-deep-change* do-safe error? on-face-deep-change* do-safe error? on-face
-change* do-safe error? on-face-deep-change* do-safe error? on-face-deep-change* do-safe error? on-face-deep-change
safe error? on-face-deep-change* do-safe error? on-face-deep-change* do-safe error? on-face-deep-change* do-safe er
ayout
EVENT/WINDOW/PANE is a block! value.  length: 106  [make object! [type: 'base offset: 10x10 size: 80x80 text: none


*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/runtime/hashtable.reds
*** at line: 1812
***
***   stack: red/_hashtable/get-ctx-symbol 00000000h 109 true 00000000h 00000000h
***   stack: red/_context/find-word 093EA1C8h 109 true
***   stack: red/object/eval-path 0524B6D4h 0567A778h 00000000h 0567A110h false false true
***   stack: red/actions/eval-path 0524B6D4h 0567A778h 00000000h 0567A110h false false true
***   stack: red/interpreter/eval-path 0567A778h 0567A120h 0567A1B0h 0567A048h false false true false
***   stack: red/interpreter/eval-expression 0567A120h 0567A1B0h 0567A048h false true false
***   stack: red/interpreter/eval-arguments 0524B6C4h 0567A110h 0567A1B0h 0567A048h 00000000h 00000000h 0531FEE8h
***   stack: red/interpreter/eval-code 0531FEE8h 0567A110h 0567A1B0h 0567A048h false 00000000h 00000000h 0531FEE8h
***   stack: red/interpreter/eval-expression 0567A110h 0567A1B0h 0567A048h false false false
***   stack: red/interpreter/eval 0567A048h true
***   stack: red/interpreter/eval-function 0524B674h 0567A048h 05602640h
***   stack: red/_function/call 0524B674h 0498ACF0h 05602640h 0
***   stack: red/interpreter/eval-code 0524B574h 05602670h 05602670h 0524B664h false 00000000h 00000000h 0524B574h
***   stack: red/interpreter/eval-expression 05602650h 05602670h 0524B664h false false false
***   stack: red/interpreter/eval 0524B664h true
***   stack: red/natives/do* false -1 -1 -1 -1
***   stack: red/interpreter/eval-arguments 0524B654h 05608668h 05608678h 0524B614h 00000000h 00000000h 05320CA8h
***   stack: red/interpreter/eval-code 05320CA8h 05608658h 05608678h 0524B614h true 00000000h 00000000h 05320CA8h
***   stack: red/interpreter/eval-expression 05608658h 05608678h 0524B614h false true false
***   stack: red/interpreter/eval-arguments 0524B634h 05608648h 05608678h 0524B614h 05608628h 05608690h 0531FF08h
***   stack: red/interpreter/eval-code 0531FF08h 05608638h 05608678h 0524B614h true 05608628h 05608690h 0531FF08h
***   stack: red/interpreter/eval-path 05608628h 05608638h 05608678h 0524B614h false false false false
***   stack: red/interpreter/eval-expression 05608638h 05608678h 0524B614h false false false
***   stack: red/interpreter/eval 0524B614h true
***   stack: red/natives/catch* true 1
***   stack: do-safe
***   stack: ctx||447~awake 0498AD88h
***   stack: gui/make-event 01013920h 0 34
***   stack: gui/BaseWndProc 00031EE6h 15 0 0
```
---
```
root: 4813/7510, runs: 20, mem: 3239232 => 2918268, mark: 3.0ms, sweep: 0.0ms
EVENT/WINDOW/PANE is a block! value.  length: 34  [make object! [type: 'base offset: 10x10 size: 80x80 text: none

root: 4813/7510, runs: 21, mem: 3201528 => 2951128, mark: 2.3ms, sweep: 0.7ms
EVENT/WINDOW/PANE is a block! value.  length: 35  [make object! [type: 'base offset: 10x10 size: 80x80 text: none

root: 4813/7510, runs: 22, mem: 3239552root: 4813/7510, runs: 22, mem: 3239596
*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/runtime/datatypes/word.reds
*** at line: 152
***
***   stack: red/word/get-in 011CDBA8h 2
***   stack: red/error/make 00000000h 0532BF04h 34
***   stack: red/error/create 054884A8h 0548DEE0h 00000000h 00000000h 00000000h
***   stack: red/fire 0 0104FBE4h
***   stack: red/stack/push*
***   stack: red/none/push
***   stack: gui/make-event 0104FCB0h 0 12
***   stack: gui/process 0104FCB0h
***   stack: gui/do-events false
***   stack: ctx||455~do-event-loop false
***   stack: do-events
***   stack: red/_function/call 0531C644h 011D3884h 055B25A8h 0
***   stack: red/interpreter/eval-code 05404918h 055B25B8h 055B25B8h 0531C624h false 00000000h 00000000h 05404918h
***   stack: red/interpreter/eval-expression 055B25B8h 055B25B8h 0531C624h false false false
***   stack: red/interpreter/eval 0531C624h true
***   stack: red/natives/catch* true 1
***   stack: ctx||559~try-do 011F1A60h
***   stack: ctx||559~launch 011F1A60h
***   stack: ctx||578~launch 011F1474h
```
---
```
(many MB GC dump)
mem: 5407044root: 4813/7510, runs: 2, mem: 5407
m: 5407044root: 4813/7510, runs: 2, mem: 540704
 5407044root: 4813/7510, runs: 2, mem: 5407044r
407044root: 4813/7510, runs: 2, mem: 5407044roo
7044root: 4813/7510, runs: 2, mem: 5407044root:
44root: 4813/7510, runs: 2, mem: 5407044root: 4
root: 4813/7510, runs: 2, mem: 5407044root: 481
ot: 4813/7510, runs: 2, mem: 5407044root: 4813/
: 4813/7510, runs: 2, mem: 5407044root: 4813/75
4813/7510, runs: 2, mem: 5407044root: 4813/7510

*** Runtime Error 95: no CATCH for THROW
*** in file: common.reds
*** at line: 282
***
***   stack: ***-uncaught-exception
***   stack: ***-uncaught-exception
***   stack: ***-uncaught-exception
```
---
```
510, runs: 2, mem: 7560856root: 4813/7510, runs: 2, mem: 7560856root: 4813/7510, runs: 2, mem: 7560856root: 4813/75
0, runs: 2, mem: 7560856root: 4813/7510, runs: 2, mem: 7560856root: 4813/7510, runs: 2, mem: 7560856root: 4813/7510
 runs: 2, mem: 7560856root: 4813/7510, runs: 2, mem: 7560856root: 4813/7510, runs: 2, mem: 7560856root: 4813/7510,
uns: 2, mem: 7560856root: 4813/7510, runs: 2, mem: 7560856root: 4813/7510, runs: 2, mem: 7560856root: 4813/7510, ru
s: 2, mem: 7560856root: 4813/7510, runs: 2, mem: 7560856root: 4813/7510, runs: 2, mem: 7560856root: 4813/7510, runs
 2, mem: 7560856root: 4813/7510, runs: 2, mem: 7560856root: 4813/7510, runs: 2, mem: 7560856root: 4813/7510, runs:
, mem: 7560856root: 4813/7510, runs: 2, mem: 7560856root: 4813/7510, runs: 2, mem: 7560856root: 4813/7510, runs: 2,
mem: 7560856root: 4813/7510, runs: 2, mem: 7560856root: 4813/7510, runs: 2, mem: 7560856root: 4813/7510, runs: 2, m
m: 7560856root: 4813/7510, runs: 2, mem: 7560856root: 4813/7510, runs: 2, mem: 7560856root: 4813/7510, runs: 2, mem
 7560856root: 4813/7510, runs: 2, mem: 7560856root: 4813/7510, runs: 2, mem: 7560856root: 4813/7510, runs: 2, mem:
560856root: 4813/7510, runs: 2, mem: 7560856root: 4813/7510, runs: 2, mem: 7560856
*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/runtime/collector.reds
*** at line: 88
***
***   stack: red/collector/keep 011FB455h
***   stack: red/collector/mark-context 011FB455h
***   stack: red/collector/mark-values 04A143B4h 04A1BF14h
***   stack: red/collector/do-mark-sweep
***   stack: red/collector/do-cycle
***   stack: red/alloc-series-buffer 2 16 0
***   stack: red/alloc-series 2 16 0
***   stack: red/alloc-cells 2
***   stack: red/block/make-at 04A1BF04h 2
***   stack: red/block/push-only* 2
***   stack: red/error/create 0548A348h 0548FD80h 00000000h 00000000h 00000000h
***   stack: red/fire 0 0104FB8Ch
***   stack: red/stack/push*
***   stack: red/_function/init-locals 3
***   stack: ctx||447~awake 011DAD88h
***   stack: gui/make-event 0104FCB0h 0 14
***   stack: gui/process 0104FCB0h
***   stack: gui/do-events false
***   stack: ctx||455~do-event-loop false
***   stack: do-events
***   stack: red/_function/call 04A0C644h 011E3884h 05674480h 0
***   stack: red/interpreter/eval-code 053C4918h 05674490h 05674490h 04A0C624h false 00000000h 00000000h 053C4918h
***   stack: red/interpreter/eval-expression 05674490h 05674490h 04A0C624h false false false
***   stack: red/interpreter/eval 04A0C624h true
***   stack: red/natives/catch* true 1
***   stack: ctx||559~try-do 01201A60h
***   stack: ctx||559~launch 01201A60h
***   stack: ctx||578~launch 01201474h
```
---
```
uns: 46, mem: 7463068root: 4813/7510, runs: 46, mem: 7463068root: 4813/7510, ru
, runs: 46, mem: 7463068root: 4813/7510, runs: 46, mem: 7463068root: 4813/7510,
510, runs: 46, mem: 7463068root: 4813/7510, runs: 46, mem: 7463068root: 4813/75
3/7510, runs: 46, mem: 7463068root: 4813/7510, runs: 46, mem: 7463068root: 4813
4813/7510, runs: 46, mem: 7463068root: 4813/7510, runs: 46, mem: 7463068root: 4
t: 4813/7510, runs: 46, mem: 7463068root: 4813/7510, runs: 46, mem: 7463068root
*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/runtime/collector.reds
*** at line: 88
***
***   stack: red/collector/keep 09313138h
***   stack: red/collector/mark-values 049C4A54h 049CBF14h
***   stack: red/collector/do-mark-sweep
***   stack: red/collector/do-cycle
***   stack: red/alloc-series-buffer 2 16 0
***   stack: red/alloc-series 2 16 0
***   stack: red/alloc-cells 2
***   stack: red/block/make-at 049CBF04h 2
***   stack: red/block/push-only* 2
***   stack: red/error/create 053E64B0h 053EBEE8h 00000000h 00000000h 00000000h
***   stack: red/fire 0 0104F8ECh
***   stack: red/stack/push*
***   stack: red/_function/init-locals 3
***   stack: ctx||447~awake 04A9AD88h
***   stack: gui/make-event 0054819Ch 0 18
***   stack: gui/WndProc 00091B36h 6 0 0
```

</details>

With `recycle/off` it usually just shows stack overflows and when I attempt to close the window it shows numerous `null window handle` warnings and then hangs.

On GTK - doesn't crash even with GC on but displays a lot of
```
(console-2022-3-15-51308:2821): Gtk-CRITICAL **: 15:18:58.050: gtk_widget_grab_focus: assertion 'GTK_IS
_WIDGET (widget)' failed
EVENT/WINDOW/PANE is a block! value.  length: 21  [make object! [type: 'base offset: 10x10 size: 80...
```
and refuses to close the window.

You may also observe event corruption coming from https://github.com/red/red/issues/5124

**To reproduce**

Run this script and let it do it's job (I used CLI console):
```
Red [needs: view]

; recycle/off
view/no-wait append/dup [] [base rate 99] 20

insert-event-func function [base event] [
	if all [event/type = 'time base/type = 'base] [
		stack: []
		remove find/same event/window/pane take stack
		append stack face: first layout/only [text red rate 99]
		append event/window/pane face
		? event/window/pane
	]
	none
]

do-events
```
Note that number of timer triggers remains constant: new `text` faces are ignored by the event function.

**Expected behavior**

- no crashes
- no hangs
- no null window handle
- no stack overflows

**Platform version**
```
Red 0.6.4 for Windows built 15-Apr-2022/11:42:52+03:00  commit #502097e
```



Comments:
--------------------------------------------------------------------------------

On 2022-05-13T16:48:54Z, hiiamboris, commented:
<https://github.com/red/red/issues/5132#issuecomment-1126253659>

    It seems `remove` somehow re-enters the event loop again, and re-processes the same event whose handler called `remove`. Thus we see `do-safe` multiple times in the trace.

--------------------------------------------------------------------------------

On 2022-06-10T13:43:50Z, dockimbel, commented:
<https://github.com/red/red/issues/5132#issuecomment-1152378408>

    "Hard GC-related"  in the title implies that the GC is causing corruption and crashes, while I don't see any proof of that in the description. It looks more like some memory corruptions happen on faces addition or removal that is later exposed or expanded by the GC. So I'll remove that part of the title that is speculative.

--------------------------------------------------------------------------------

On 2022-06-10T14:30:36Z, hiiamboris, commented:
<https://github.com/red/red/issues/5132#issuecomment-1152424342>

    Sure. Everything is speculative until the issue is nailed down :)

--------------------------------------------------------------------------------

On 2022-09-09T13:34:43Z, qtxie, commented:
<https://github.com/red/red/issues/5132#issuecomment-1241983346>

    No crash anymore.

--------------------------------------------------------------------------------

On 2022-09-09T14:35:58Z, hiiamboris, commented:
<https://github.com/red/red/issues/5132#issuecomment-1242054675>

    Confirmed. Fixed by https://github.com/red/red/commit/508f4cfa75611a2d0f3ed01cd1adf411c6e91119

