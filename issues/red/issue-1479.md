
#1479: In VID, panel, tab-panel and group-box do not have default size; may lead to Script error
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1479>

This script error occurs when the VID text does not specify a size.

```
red>> layout [panel]
*** Script error: path none is not valid for none type
*** Where: max
```



