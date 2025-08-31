
#35: WISH: a flag for unit = pixel in View (ignoring DPI)
================================================================================
Issue is open, was reported by hiiamboris and has 0 comment(s).
<https://github.com/red/REP/issues/35>

It it sometimes desirable to work with real pixels instead of logical (dpi-dependent) units. This was the behavior of 0.6.3 stable release.

I propose a optional flag for either the whole View system:
```
system/view/dpi-aware?: yes(default) or no(settable in runtime)
```
or for each created window widget
```
view/flags [ ... ] [exact]
```
That will make the [`get-dpi`](https://github.com/red/red/blob/master/modules/view/backends/windows/gui.reds#L704) to always return 100, or make measurements in the specific window use 100 instead of the `dpi-factor` value.


