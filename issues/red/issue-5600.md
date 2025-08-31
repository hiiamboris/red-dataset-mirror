
#5600: commit 02999cc crashes GUI-engine 'terminal
================================================================================
Issue is closed, was reported by gurzgri and has 6 comment(s).
[status.built] [status.tested] [type.bug] [GUI]
<https://github.com/red/red/issues/5600>

Trying to `view layout [...]` in TUI crashes Red.

To reproduce, just run `view layout [text "Test"]` with a Red/CLI build at [commit #02999cc](https://github.com/red/red/commit/02999ccb068e00bc62bf6ed03326ea41ff517ac5) from 10-mar-2025

**Observed behavior**
```
*** Runtime Error 1: access violation
*** at: 004902B9h
```

**Expected behavior**
No crash and console output
```

 Test
````
instead.

**Platform version**
Red 0.6.5 for Windows built 10-Mar-2025/0:03:45+01:00  commit #02999cc


Comments:
--------------------------------------------------------------------------------

On 2025-03-15T20:19:31Z, dockimbel, commented:
<https://github.com/red/red/issues/5600#issuecomment-2726982861>

    Reproduced.

--------------------------------------------------------------------------------

On 2025-03-15T21:47:19Z, greggirwin, commented:
<https://github.com/red/red/issues/5600#issuecomment-2727014134>

    Quick Fix Doc! :+1:

--------------------------------------------------------------------------------

On 2025-03-15T22:57:50Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5600#issuecomment-2727043786>

    Very fast fix!

