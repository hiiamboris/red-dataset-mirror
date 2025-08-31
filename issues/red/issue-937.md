
#937: Vid app terminates when tilted.
================================================================================
Issue is closed, was reported by WiseGenius and has 8 comment(s).
[status.deferred] [type.review]
<https://github.com/red/red/issues/937>

Running %tests/android/vid.red on Android 2.3.4 on a Sony Ericsson Xperia Mini Pro (SK17i).

Changing between portrait or landscape mode (by tilting the screen or snapping the keyboard in or out) while the vid app is open terminates it. However, if I terminate the app this way, I only have to tap it once to open it again (unlike in #936).

%eval.red doesn't have this issue.



Comments:
--------------------------------------------------------------------------------

On 2014-09-18T15:44:07Z, dockimbel, commented:
<https://github.com/red/red/issues/937#issuecomment-56058157>

    Thanks for these two tickets. It's curious that %eval.red does not exhibit the same behavior. I will look at these issues once the object branch will be release.

--------------------------------------------------------------------------------

On 2014-09-25T11:16:58Z, WiseGenius, commented:
<https://github.com/red/red/issues/937#issuecomment-56804687>

    When I tilt the phone (or open or close the keyboard) while running %eval.red, it clears/resets the output (eg. “== 4”) but it doesn't crash, and it doesn't lose the contents of the input EditText.
    I don't know if this has anything to do with this issue, but I thought I'd mention it here in case it was a clue.

--------------------------------------------------------------------------------

On 2014-09-25T12:24:30Z, qtxie, commented:
<https://github.com/red/red/issues/937#issuecomment-56810816>

    @WiseGenius Yes, I got the same issue with `vid.red` when tilt the phone.
    But for issue #936, It works well for me.
    
    My phone is using Android 4.2.2.

--------------------------------------------------------------------------------

On 2019-08-28T14:05:43Z, dockimbel, commented:
<https://github.com/red/red/issues/937#issuecomment-525761052>

    I am closing those Android-related tickets, as the Android support has been deeply changed since then, and the old Android API binding code replaced.

