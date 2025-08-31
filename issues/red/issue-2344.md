
#2344: Progress do not work with floats
================================================================================
Issue is closed, was reported by Rebol2Red and has 0 comment(s).
<https://github.com/red/red/issues/2344>

Reference View engine about progress says:
"If a float value is used for data, it needs to be between 0.0 and 1.0"

This does not work:
view [button "start" [probe p/data p/data: p/data + 0.1] p: progress data 0.0]

Percent does work as expected.



