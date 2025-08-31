
#4265: [GTK] on-focus does not work on field
================================================================================
Issue is closed, was reported by loziniak and has 0 comment(s).
[status.built] [GUI] [GUI.GTK]
<https://github.com/red/red/issues/4265>

Nothing is printed when clicking on fields under Linux/GTK with this script:
```
view [field on-focus [print "1"] field on-focus [print "2"]]
```
On Windows the numbers are printed, as expected.

Platform: Red 0.6.4 for Linux built 23-Jan-2020/16:19:08+01:00


