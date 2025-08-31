
#3586: Alert source code is flawed: OK button does not do anything.
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[type.bug]
<https://github.com/red/red/issues/3586>

**Describe the bug**
A call to `alert` brings up a modal window, but the OK button has no action associated with it. The action should preferably be `unview`.

**To Reproduce**
Execute `alert "msg"`.

**Expected behavior**
Clicking the OK button should close the modal window.

**Platform version(please complete the following information):**
```
All
```


Comments:
--------------------------------------------------------------------------------

On 2018-11-13T14:47:34Z, meijeru, commented:
<https://github.com/red/red/issues/3586#issuecomment-438291730>

    Also, a `block!` value is permitted as message. This value is then inserted after `text` in the VID code. THe documentation does not say what the result of this would be.

--------------------------------------------------------------------------------

On 2018-11-13T15:51:26Z, greggirwin, commented:
<https://github.com/red/red/issues/3586#issuecomment-438316332>

    PR submitted. Also added key support for easy dialog dismissal.

