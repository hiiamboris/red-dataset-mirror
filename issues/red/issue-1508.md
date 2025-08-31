
#1508: STYLES are global, not bound to right context
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/1508>

STYLES map! should be part of `system/view/VID` object, however it’s part of the global context and `system/view/VID` path doesn’t exists. It looks like problem with `#include` in `%modules/view/VID.red` file.



