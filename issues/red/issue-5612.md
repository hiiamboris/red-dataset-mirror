
#5612: 30 Apr 2025 View build for Raspberry Pi crashes on launch
================================================================================
Issue is closed, was reported by PeterWAWood and has 6 comment(s).
[status.built] [status.tested] [type.bug] [GUI.GTK]
<https://github.com/red/red/issues/5612>

**Describe the bug**
red-view-30apr25-9fb8f4ccd crashes when launched on Raspberry PI 
```
pi@Pi4B:~/Red/GUI $ ./red-view-066
pi@Pi4B:~/Red/GUI $ ./red-view-30apr25-9fb8f4ccd

(red-view-30apr25-9fb8f4ccd:8736): Gtk-CRITICAL **: 17:05:22.354: gtk_widget_queue_draw: assertion 'GTK_IS_WIDGET (widget)' failed

(red-view-30apr25-9fb8f4ccd:8736): Gtk-CRITICAL **: 17:05:22.354: gtk_widget_queue_draw: assertion 'GTK_IS_WIDGET (widget)' failed

*** Runtime Error 1: access violation
*** at: 000B77E4h
```
The GUI console window opens briefly before the crash.

**To reproduce**
run ./red-view-30apr25-9fb8f4ccd:8736 from a terminal

**Expected behavior**
The program should not crash. red-view-066 does not crash

**Platform version**
Please specify the operating system, Red version, and build date with Git commit.

>> about/debug
-----------RED & PLATFORM VERSION----------- 
PLATFORM: [ name: "Raspbian GNU/Linux 11 (bullseye)" OS: 'Linux arch: 'aarch64 version: 6.1.21 build: "#1642 SMP PREEMPT Mon Apr  3 17:24:16 BST 2023" ]
--------------------------------------------



Comments:
--------------------------------------------------------------------------------

On 2025-05-06T02:55:47Z, PeterWAWood, commented:
<https://github.com/red/red/issues/5612#issuecomment-2853135812>

    I compiled a debug GUI console:
    
    ```
    pi@Pi4B:~/Red/GUI $ ./red-gui-console-debug
    
    (red-gui-console-debug:6682): Gtk-CRITICAL **: 10:52:42.457: gtk_widget_queue_draw: assertion 'GTK_IS_WIDGET (widget)' failed
    
    (red-gui-console-debug:6682): Gtk-CRITICAL **: 10:52:42.458: gtk_widget_queue_draw: assertion 'GTK_IS_WIDGET (widget)' failed
    
    *** Runtime Error 1: access violation
    *** in file: /C/users/peter/red/red-master/runtime/datatypes/object.reds
    *** at line: 81
    ***
    ***   --Frame-- --Code--  --Call--
    ***   FFBF07A8h 000C0A70h red/object/get-values F4E0DCB4h
    ***   FFBF07CCh 0027BA6Ch gui/get-face-values 01E2FD78h
    ***   FFBF07F4h 00282004h gui/set-selected-focus 01E2FD78h
    ***   FFBF0810h 002842D4h gui/OS-refresh-window 31653240
    ***   FFBF082Ch 0028983Ch ctx||476~refresh-window 01DFDE24h
    ***   FFBF08F8h 001DECA0h show
    ***   FFBF0934h 001366C4h red/interpreter/call 01DFDBB4h F7B28038h F4E6B444h 0
    ***   FFBF097Ch 0013A288h red/interpreter/eval-code F4FC6EBCh F4E6B464h F4E6B464h 01DFDBA4h false 00000000h 00000000h F4FC6EBCh 0 false
    ***   FFBF0A00h 0013B294h red/interpreter/eval-expression F4E6B454h F4E6B464h 01DFDBA4h false false false
    ***   FFBF0A50h 0013BE5Ch red/interpreter/eval 01DFDBA4h true
    ***   FFBF0A70h 0010E9D0h red/natives/if* false
    ***   FFBF0B64h 00139C28h red/interpreter/eval-arguments 01DFDB84h F4E6B23Ch F4E6B23Ch 01DFDB64h 00000000h 00000000h 0 false
    ***   FFBF0BBCh 00139F24h red/interpreter/eval-code F4FC5F0Ch F4E6B20Ch F4E6B23Ch 01DFDB64h false 00000000h 00000000h F4FC5F0Ch 0 false
    ***   FFBF0C40h 0013B294h red/interpreter/eval-expression F4E6B20Ch F4E6B23Ch 01DFDB64h false false false
    ***   FFBF0C90h 0013BE5Ch red/interpreter/eval 01DFDB64h true
    ***   FFBF0CB4h 0010EC08h red/natives/either* false
    ***   FFBF0DA8h 00139C28h red/interpreter/eval-arguments 01DFDB44h F4E69A3Ch F4E69A3Ch 01DFDB34h 00000000h 00000000h 0 false
    ***   FFBF0E00h 00139F24h red/interpreter/eval-code F4FC6B8Ch F4E69A0Ch F4E69A3Ch 01DFDB34h false 00000000h 00000000h F4FC6B8Ch 0 false
    ***   FFBF0E84h 0013B294h red/interpreter/eval-expression F4E69A0Ch F4E69A3Ch 01DFDB34h false false false
    ***   FFBF0ED4h 0013BE5Ch red/interpreter/eval 01DFDB34h true
    ***   FFBF0EF4h 0010E9D0h red/natives/if* false
    ***   FFBF0FE8h 00139C28h red/interpreter/eval-arguments 01DFDB14h F4E6939Ch F4E6939Ch F4E692B4h 00000000h 00000000h 0 false
    ***   FFBF1040h 00139F24h red/interpreter/eval-code F4FC5F0Ch F4E6936Ch F4E6939Ch F4E692B4h false 00000000h 00000000h F4FC5F0Ch 0 false
    ***   FFBF10C4h 0013B294h red/interpreter/eval-expression F4E6936Ch F4E6939Ch F4E692B4h false false false
    ***   FFBF1114h 0013BE5Ch red/interpreter/eval F4E692B4h true
    ***   FFBF114Ch 00136A94h red/interpreter/eval-function F4E65CCCh F4E692B4h F4F8E8CCh
    ***   FFBF1194h 001365CCh red/interpreter/call F4E65CCCh F4CFA610h F4F8E8CCh 8
    ***   FFBF11D4h 000C2008h red/object/fire-on-set 01DFDA44h F4FA253Ch 01DFDA74h 01DFDA64h
    ***   FFBF1214h 000C5804h red/object/eval-path 01DFDA44h F4FA253Ch 01DFDA64h F4FA252Ch 00000000h 01DFDA44h 0 false false true false
    ***   FFBF1260h 00109664h red/actions/eval-path 01DFDA44h F4FA253Ch 01DFDA64h F4FA252Ch 00000000h 01DFDA44h 0 false false true false
    ***   FFBF12E4h 0006F4A0h red/eval-path* 1 FFBF1304h
    ***   FFBF1338h 0024A360h ctx||653~launch F4D05FECh
    ***   FFBF1350h 00059400h ***_start
    ```

--------------------------------------------------------------------------------

On 2025-05-07T22:41:37Z, dockimbel, commented:
<https://github.com/red/red/issues/5612#issuecomment-2860612844>

    I can reproduce the crash.
    I also noticed that I get similar crashes when opening or closing a View window with heavy content using the prebuilt 0.6.6 GUI console.

--------------------------------------------------------------------------------

On 2025-05-09T20:25:55Z, dockimbel, commented:
<https://github.com/red/red/issues/5612#issuecomment-2867804380>

    Please confirm that this fix works for you too.

