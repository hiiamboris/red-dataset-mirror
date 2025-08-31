
#5215: GUI console wrong caret offset calculation
================================================================================
Issue is closed, was reported by hiiamboris and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5215>

**Describe the bug**

Edit line can be bugged by some edits

**To reproduce**

1. type `123`
2. press Shift+Home to select it
3. press Ctrl+C to copy selection
4. press End to get after selection
5. press Shift+Ins twice to paste and get `123123`
6. from now on pressing Left will have no effect, and Backspace will work only after a few more presses

(the longer the selection was the more off becomes the offset)

**Expected behavior**

Left and BS should work

**Platform version**

```
-----------RED & PLATFORM VERSION----------- 
RED: [ branch: "master" tag: #v0.6.4 ahead: 4506 date: 24-Sep-2022/7:39:31 commit: #487881e2aacbd6037801f75af6a975bfeaf0d90c ]
PLATFORM: [ name: "Windows 10" OS: 'Windows arch: 'x86-64 version: 10.0.0 build: 19044 ]
--------------------------------------------
```


