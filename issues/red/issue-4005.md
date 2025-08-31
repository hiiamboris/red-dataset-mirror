
#4005: [View] regression in Windows backend
================================================================================
Issue is closed, was reported by 9214 and has 0 comment(s).
[status.built] [type.bug] [GUI]
<https://github.com/red/red/issues/4005>

**Describe the bug**
Access violation in View Windows backend prevents the compiled application from running.

The culprit is https://github.com/red/red/commit/9b0b6d4c1800ba35b8023f36083f68e685f6fae5.

**To reproduce**
Compile with `-r -d` flags:
```red
Red [Needs: View] alert "test"
```
Launch compiled executable:
```red
*** Runtime Error 1: access violation
*** in file: .../modules/view/backends/windows/gui.reds
*** at line: 130
***
***   stack: gui/get-face-values 00000000h
***   stack: gui/get-selected-handle 00000000h
***   stack: gui/OS-make-view 028EFD34h 0
***   stack: ctx419~make-view 028EFD34h 028EFD44h
***   stack: show
***   stack: view
***   stack: alert
```

**Expected behavior**
Dialog window pops up.

**Platform version (please complete the following information)**

```
Red 0.6.4 for Windows built 21-Aug-2019/12:55:41+05:00 commit #ccfff52
```



