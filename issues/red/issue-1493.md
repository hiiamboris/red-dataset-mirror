
#1493: Regression to crash when opening window
================================================================================
Issue is closed, was reported by WiseGenius and has 10 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1493>

Regression to crash when opening window.

Compiled:

```
*** Runtime Error 1: access violation
*** in file: /H/Work/Red/Tests Red/2015-12-07-12-01-44-red-gui/red-gui/modules/view/backends/windows/events.reds
*** at line: 791
```

Interpreted:

```
*** Runtime Error 1: access violation
*** at: 00465F16h
```



Comments:
--------------------------------------------------------------------------------

On 2015-12-07T08:30:06Z, meijeru, commented:
<https://github.com/red/red/issues/1493#issuecomment-162447382>

    Same here

--------------------------------------------------------------------------------

On 2015-12-07T09:15:55Z, dockimbel, commented:
<https://github.com/red/red/issues/1493#issuecomment-162456102>

    We don't see anything wrong here. How to reproduce the crash?

--------------------------------------------------------------------------------

On 2015-12-07T09:17:55Z, dockimbel, commented:
<https://github.com/red/red/issues/1493#issuecomment-162456555>

    For such kinds of regressions which are related to latest commits, just signaling it on  Gitter is enough. Issues related to development branches shouldn't be reported in this issue tracker unless they are long standing issues (means we can't fix them in the same or next day after reporting on Gitter).

--------------------------------------------------------------------------------

On 2015-12-07T09:18:47Z, dockimbel, commented:
<https://github.com/red/red/issues/1493#issuecomment-162456870>

    We should move this discussion on Gitter rather...

--------------------------------------------------------------------------------

On 2015-12-07T09:34:12Z, dockimbel, commented:
<https://github.com/red/red/issues/1493#issuecomment-162463426>

    Ok, can reproduce it on XP.

