
#89: WISH: new window flag
================================================================================
Issue is open, was reported by nwtgthb and has 4 comment(s).
<https://github.com/red/REP/issues/89>

QML has a window flag that takes the app out of the application list. The window flag is `flags: Qt.SplashScreen` . All the current Red flags still keep the app on the list. Thanks.


Comments:
--------------------------------------------------------------------------------

On 2020-12-06T18:10:17Z, greggirwin, commented:
<https://github.com/red/REP/issues/89#issuecomment-739540663>

    Is there an equivalent on Windows, Mac, GTX, or Android?

--------------------------------------------------------------------------------

On 2020-12-07T09:17:50Z, loziniak, commented:
<https://github.com/red/REP/issues/89#issuecomment-739787600>

    In GTK it could probably be [gtk-window-set-skip-taskbar-hint()](https://developer.gnome.org/gtk3/stable/GtkWindow.html#gtk-window-set-skip-taskbar-hint) or [gtk-window-set-skip-pager-hint()](https://developer.gnome.org/gtk3/stable/GtkWindow.html#gtk-window-set-skip-pager-hint) ?

