
#3762: [CRASH] in `layout/parent/only`
================================================================================
Issue is open, was reported by hiiamboris and has 6 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/3762>

**Describe the bug**
```
w: view/no-wait []
layout/only/parent [field] w none
```
should change the w/pane, but results in:
```
*** Runtime Error 1: access violation
*** in file: /D/devel/red/red-src/red/modules/view/backends/windows/gui.reds
*** at line: 2199
***
***   stack: gui/update-z-order 02CB8644h 00000000h
***   stack: gui/OS-update-view 02940F34h
***   stack: ctx371~update-view 02940F34h
***   stack: show
***   stack: red/_function/call 02940CE4h 003A3884h
***   stack: red/interpreter/eval-code 02940CE4h 02CBBD38h 02CBBD38h false 00000000h 00000000h 02A40574h
***   stack: red/interpreter/eval-expression 02CBBD28h 02CBBD38h false false false
***   stack: red/interpreter/eval 02940CD4h true
***   stack: red/natives/if* false
***   stack: red/interpreter/eval-arguments 02A3F8C4h 02CBBB14h 02CBBB14h 00000000h 00000000h
***   stack: red/interpreter/eval-code 02A3F8C4h 02CBBAE4h 02CBBB14h false 00000000h 00000000h 02A3F8C4h
***   stack: red/interpreter/eval-expression 02CBBAE4h 02CBBB14h false false false
***   stack: red/interpreter/eval 02940C94h true
***   stack: red/natives/either* false
***   stack: red/interpreter/eval-arguments 02A402B4h 02CBA7C4h 02CBA7C4h 00000000h 00000000h
***   stack: red/interpreter/eval-code 02A402B4h 02CBA794h 02CBA7C4h false 00000000h 00000000h 02A402B4h
***   stack: red/interpreter/eval-expression 02CBA794h 02CBA7C4h false false false
***   stack: red/interpreter/eval 02940C64h true
***   stack: red/natives/if* false
***   stack: red/interpreter/eval-arguments 02A3F8C4h 02CBA364h 02CBA364h 00000000h 00000000h
***   stack: red/interpreter/eval-code 02A3F8C4h 02CBA334h 02CBA364h false 00000000h 00000000h 02A3F8C4h
***   stack: red/interpreter/eval-expression 02CBA334h 02CBA364h false false false
***   stack: red/interpreter/eval 02CBA280h true
***   stack: red/interpreter/eval-function 02CB86D4h 02CBA280h
***   stack: red/_function/call 02CB86D4h 00791998h
***   stack: red/object/fire-on-set 02940524h 02938704h 02940BB4h 02940BA4h
***   stack: red/object/eval-path 02940524h 02938704h 02940BA4h 00000000h false
***   stack: red/actions/eval-path 02940524h 02938704h 02940BA4h 00000000h false
***   stack: red/set-path* 02940524h 02938704h
***   stack: layout 0039A480h
***   stack: red/_function/call 02940494h 0039A480h
***   stack: red/interpreter/eval-code 02940494h 02CBCE24h 02CBCE24h true 02CBCDE4h 02CBCE98h 02A44274h
***   stack: red/interpreter/eval-path 02CBCDE4h 02CBCDF4h 02CBCE24h false false false false
***   stack: red/interpreter/eval-expression 02CBCDF4h 02CBCE24h false false false
***   stack: red/interpreter/eval 02940474h true
***   stack: red/natives/catch* true 1
***   stack: ctx473~try-do 003C1C88h
***   stack: ctx473~do-command 003C1C88h
***   stack: ctx473~eval-command 003C1C88h
***   stack: ctx473~run 003C1C88h
```
It doesn't matter if `w` is a toplevel window or a panel, it always crashes.
Without `/only` works correctly.

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 25-Jan-2019/6:49:24+03:00 commit #702ec38
```



Comments:
--------------------------------------------------------------------------------

On 2019-02-01T20:19:36Z, endo64, commented:
<https://github.com/red/red/issues/3762#issuecomment-459854857>

    Confirmed on Win10
    
    ```
    -----------RED & PLATFORM VERSION-----------
    RED: [ branch: "master" tag: #v0.6.3 ahead: 1285 date: 25-Jan-2019/3:49:24 commit: #702ec386cc16d1e0783ad6d1a4746f33c28fcfd5 ]
    PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 17134 ]
    --------------------------------------------
    ```

--------------------------------------------------------------------------------

On 2020-05-20T02:35:17Z, qtxie, commented:
<https://github.com/red/red/issues/3762#issuecomment-631198241>

    The crash was fixed. But I don't know why `/only` set parent's pane to `none`. https://github.com/red/red/blob/master/modules/view/VID.red#L757

--------------------------------------------------------------------------------

On 2020-05-20T08:55:22Z, hiiamboris, commented:
<https://github.com/red/red/issues/3762#issuecomment-631339176>

    We should ask @dockimbel about https://github.com/red/red/commit/427ba9ca69a8c69c7f5f2f55b0fcfce0b715c2ee

