
#3059: It is not possible to unselect value in TEXT-LIST on macOS
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/3059>

This code:
```
view [t: text-list data ["a" "b" "c" "d"] button "unselect" [t/selected: none show t]]
```
will unselect value in `text-list` when pressing `[unselect]` button. At least under Windows, but it does nothing under macOS.


