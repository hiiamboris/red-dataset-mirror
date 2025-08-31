
#1616: view-test continues printing in gui-console after quit
================================================================================
Issue is closed, was reported by WiseGenius and has 10 comment(s).
[status.reviewed] [type.review]
<https://github.com/red/red/issues/1616>

`%tests/view-test.red` continues to print events in the GUI console after it's been closed.
- Whether it's opened from the command line with `gui-console tests/view-test.red` or from within the GUI console with `do %tests/view-test.red`.
- Whether it's closed via the window's close button or by calling `unview/all` (`Quit` button or `File->Exit` menu).
- Whether it's on Windows XP or Windows 7.
- The CLI console doesn't have this problem.

If the last few lines of output are selected and a key is then pressed, the console crashes.
- This crash only happens if the view-test was opened from within the console with `do %tests/view-test.red`, and not from the command line with `gui-console tests/view-test.red`.
- Whether it's on Windows XP or Windows 7.



Comments:
--------------------------------------------------------------------------------

On 2016-02-15T15:05:21Z, dockimbel, commented:
<https://github.com/red/red/issues/1616#issuecomment-184246265>

    The debug logs output will continue until `system/view/debug?` is set to `false`, this is expected as the GUI console is using the same View engine instance as the user code.

--------------------------------------------------------------------------------

On 2016-02-15T15:13:06Z, dockimbel, commented:
<https://github.com/red/red/issues/1616#issuecomment-184248476>

    I cannot reproduce the crash so far.

--------------------------------------------------------------------------------

On 2016-02-15T16:10:07Z, WiseGenius, commented:
<https://github.com/red/red/issues/1616#issuecomment-184275238>

    Only the following keys caused the crash:
    - `a` to `z`
    - `0` to `9`
    - space bar
    - `Tab`
    - punctuation
    
    All other keys, including the `Enter` keys, did not cause a crash.
    
    Also, it only happened if the lines were selected after view-test was closed. So now that `system/view/debug?` was set to `false` in [the above commit](https://github.com/red/red/commit/fa0ebc9e74741e40329ce70882d27c7a9886f94e), there is no longer any opportunity for the crash... at least for view-test.

--------------------------------------------------------------------------------

On 2016-02-20T02:07:30Z, qtxie, commented:
<https://github.com/red/red/issues/1616#issuecomment-186485757>

    No printing and crash now in my test.

--------------------------------------------------------------------------------

On 2016-02-20T16:09:44Z, WiseGenius, commented:
<https://github.com/red/red/issues/1616#issuecomment-186636390>

    @qtxie It no longer crashes because view-test no longer prints. Not sure whether or not you still want to fix the crash in the case that someone doesn't turn the debug off on something.
    
    To reproduce the crash:
    - Comment out the very last line (`system/view/debug?: no`) of `tests/view-test.red`.
    - Open `gui-console.exe`.
    - Enter `do %tests/view-test.red`.
    - Close the view-test's `Red View` window.
    - Select the last line of the output, and drag down below it.
    - Press the space bar.

