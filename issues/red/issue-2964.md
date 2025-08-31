
#2964: macOS view: system/view/metrics
================================================================================
Issue is closed, was reported by Blocode and has 2 comment(s).
[status.dismissed]
<https://github.com/red/red/issues/2964>

There are 2 issues:
1. system/view/metrics is always none
2. system/view/metrics is always 144, no matter what resolution setting is. On macOS, We set dpi by setting resolution.


Comments:
--------------------------------------------------------------------------------

On 2017-08-08T06:35:09Z, dockimbel, commented:
<https://github.com/red/red/issues/2964#issuecomment-320863997>

    `system/view/metrics` is always set. Are you meaning `system/view/metrics/dpi`? In that case, we have no support for changing the DPI for now. That should come in 0.6.5.

