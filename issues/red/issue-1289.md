
#1289: End of text in field unrefreshed to blank on shortening
================================================================================
Issue is closed, was reported by WiseGenius and has 2 comment(s).
[status.resolved]
<https://github.com/red/red/issues/1289>

On Windows XP (with `load-lib?: false`):

Shortening text in a field (eg. using Backspace) doesn't refresh the end of the text to blank.

Example: In `view-test.exe`, select the text `unicode supported` and type `a`. The result is:

![shortening](https://cloud.githubusercontent.com/assets/7657453/8898732/9705c150-346d-11e5-9b79-152650f2d319.png)

Does refresh later, when the mouse enters or exits the field, clicks on the field, clicks on a button, etc.



Comments:
--------------------------------------------------------------------------------

On 2015-11-17T12:13:46Z, WiseGenius, commented:
<https://github.com/red/red/issues/1289#issuecomment-157352249>

    This issue seems to be resolved.

