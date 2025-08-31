
#2456: Regressions in View engine after fix for #2314
================================================================================
Issue is closed, was reported by dockimbel and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/2456>

Two regressions spotted in tests/view-test.red script:

1. Clicking on "Extra" button exits the event loop (it should not)
2. Clicking on first "Sub-window" button, then on "Close" button closes the main window but not the child window, which then cannot be closed at all.


