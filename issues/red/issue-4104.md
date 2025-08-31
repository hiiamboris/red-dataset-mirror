
#4104: GTK: button does not respond, when compiled with libRedRT development mode (-c)
================================================================================
Issue is closed, was reported by loziniak and has 2 comment(s).
[type.bug] [status.resolved] [GUI]
<https://github.com/red/red/issues/4104>

Following code works only with `-r`, and when compiled with `-c -u` it does not respond to clicking the button:
```
Red [Needs: 'View]
view [
    button "test" [print "test"]
]
```
Compiled and run under Linux Arch using latest `GTK` branch sources (commit 25ebf7d24).


Comments:
--------------------------------------------------------------------------------

On 2019-11-28T13:10:15Z, loziniak, commented:
<https://github.com/red/red/issues/4104#issuecomment-559488802>

    It works now.

