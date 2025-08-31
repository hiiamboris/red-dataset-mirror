
#1583: clipboard locked when pasting `view` code
================================================================================
Issue is closed, was reported by WiseGenius and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1583>

Copy any code which opens a window (such as below), including a new-line at the end, and paste it into the gui-console so that a window is immediately opened without having to press the enter key.

```
view [field "Hello, World!"]

```

While this window is open, **Cut**, **Copy** and **Paste** will not work. This is not just in the `Hello, World!` field, but in every other application. For example, trying to use **Copy** in EditPad Pro, gives:

![cannot open clipboard](https://cloud.githubusercontent.com/assets/7657453/12788006/92284a60-cae3-11e5-9a73-ab8b0cebdbbe.png)

This issue is not present in the CLI console, but it is in the GUI console in both Windows XP and Windows 7.



Comments:
--------------------------------------------------------------------------------

On 2016-02-03T22:38:10Z, qtxie, commented:
<https://github.com/red/red/issues/1583#issuecomment-179507331>

    Good Catch!

