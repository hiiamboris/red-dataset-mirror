
#5356: [GTK] CRASH on unview
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI.GTK]
<https://github.com/red/red/issues/5356>

**Describe the bug**

Variant 1 (save to file `1.red`):
`Red [needs: view] view [base on-create [unview]]`
Run as `red 1.red`:
```
*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/master/modules/view/backends/gtk3/gui.reds
*** at line: 800
***
***   stack: gui/remove-all-timers 00000000h
***   stack: gui/remove-all-timers 0A3922C0h
***   stack: gui/OS-destroy-view 0A193124h false
***   stack: ctx||469~destroy-view 0A193124h false
***   stack: on-face-deep-change*
***   stack: red/interpreter/call 0A192FE4h F7EFA884h F47AB990h 0
***   stack: red/interpreter/eval-code F4A9A1C8h F47ABA30h F47ABA30h F47AB8E8h false 00000000h 00000000h F4A9A1C8h 0 false
***   stack: red/interpreter/eval-expression F47AB9A0h F47ABA30h F47AB8E8h false false false
***   stack: red/interpreter/eval F47AB8E8h true
***   stack: red/interpreter/eval-function F47A61B8h F47AB8E8h F4A658B4h
***   stack: red/interpreter/call F47A61B8h F469E958h F4A658B4h 16
***   stack: red/object/fire-on-deep F4AEBE60h F4AEBE70h 0A192F64h F4A65404h 081863A8h 0 1
***   stack: red/ownership/check 0A192F64h F4A65404h 00000000h 0 1
***   stack: red/_series/remove 0A192F64h 00000000h 0A192F54h
***   stack: red/actions/remove 0A192F64h 00000000h 0A192F54h
***   stack: red/actions/remove* -1 -1
***   stack: unview
***   stack: red/interpreter/call 0A192EA4h F7EFA884h F47F3818h 0
***   stack: red/interpreter/eval-code F4A9B728h F47F3828h F47F3828h F47F37B0h false 00000000h 00000000h F4A9B728h 0 false
***   stack: red/interpreter/eval-expression F47F3828h F47F3828h F47F37B0h false false false
***   stack: red/interpreter/eval F47F37B0h true
***   stack: red/interpreter/eval-function 0A192E74h F47F37B0h F474AE68h
***   stack: red/interpreter/call 0A192E74h F34B3688h F474AE68h 0
***   stack: red/interpreter/eval-code F47F3478h F474AE98h F474AE98h 0A192E64h false F474AE68h F474AED0h F47ED688h 0 false
***   stack: red/interpreter/eval-path F474AED0h F474AE78h F474AE98h 0A192E64h false false false false
***   stack: red/interpreter/eval-expression F474AE78h F474AE98h 0A192E64h false false false
***   stack: red/interpreter/eval 0A192E64h true
***   stack: red/natives/do* false -1 -1 -1 -1
***   stack: red/interpreter/eval-arguments 0A192E54h F474A748h F474A758h 0A192E14h 00000000h 00000000h 0 false
***   stack: red/interpreter/eval-code F4A96CB8h F474A738h F474A758h 0A192E14h true 00000000h 00000000h F4A96CB8h 0 false
***   stack: red/interpreter/eval-expression F474A738h F474A758h 0A192E14h false true false
***   stack: red/interpreter/eval-arguments 0A192E34h F474A728h F474A758h 0A192E14h F474A708h F474A770h 0 false
***   stack: red/interpreter/eval-code F4A95F08h F474A718h F474A758h 0A192E14h true F474A708h F474A770h F4A95F08h 0 false
***   stack: red/interpreter/eval-path F474A708h F474A718h F474A758h 0A192E14h false false false false
***   stack: red/interpreter/eval-expression F474A718h F474A758h 0A192E14h false false false
***   stack: red/interpreter/eval 0A192E14h true
***   stack: red/natives/catch* true 1
***   stack: do-safe
***   stack: show
***   stack: show
```

Variant 2:
`Red [needs: view] view [base rate 99 on-time [unview]]`

```
(red:950): GLib-GObject-CRITICAL **: 15:29:49.764: g_object_get_qdata: assertion 'G_IS_OBJECT (object)' failed

(red:950): GLib-GObject-CRITICAL **: 15:29:49.764: g_object_get_qdata: assertion 'G_IS_OBJECT (object)' failed

(red:950): GLib-GObject-CRITICAL **: 15:29:49.764: g_object_get_qdata: assertion 'G_IS_OBJECT (object)' failed

(red:950): GLib-GObject-CRITICAL **: 15:29:49.764: g_object_get_qdata: assertion 'G_IS_OBJECT (object)' failed

*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/master/runtime/datatypes/object.reds
*** at line: 81
***
***   stack: red/object/get-values 08194C10h
***   stack: gui/get-face-values 093082C0h
***   stack: gui/set-selected-focus 093082C0h
***   stack: gui/OS-show-window 154174144
***   stack: ctx||469~show-window 09217C44h
***   stack: show
***   stack: view
***   stack: red/interpreter/call 09217A74h F7FA3884h F488F7D8h 0
***   stack: red/interpreter/eval-code F4B42DF8h F488F7F8h F488F7F8h 09217A54h false 00000000h 00000000h F4B42DF8h 0 false
***   stack: red/interpreter/eval-expression F488F7E8h F488F7F8h 09217A54h false false false
***   stack: red/interpreter/eval 09217A54h true
***   stack: red/natives/catch* true 1
***   stack: ctx||572~try-do F474D878h
***   stack: ctx||572~launch F474D878h
***   stack: ctx||591~launch F474D280h
***   stack: ***_start
```

**Expected behavior**

No crashes

**Platform version**
```
-----------RED & PLATFORM VERSION-----------
RED: [ branch: "master" tag: #v0.6.4 ahead: 4805 date: 18-Jul-2023/19:56:01 commit: #af3d35a2f444b3d02058226effd63714eb4bf2bc ]
PLATFORM: [ name: "Ubuntu 20.04.1 LTS" OS: 'Linux arch: 'x86_64 version: 5.15.90 build: "#1 SMP Fri Jan 27 02:56:13 UTC 2023" ]
--------------------------------------------
```


