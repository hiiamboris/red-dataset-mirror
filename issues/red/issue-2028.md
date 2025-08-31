
#2028: Negative time values: improvements possible
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2028>

Within a `time!` literal (after the first `:` sign) negative numbers should not be allowed (lexical matter).

Currently, `-1:01:01` is lexed to `-1:-59:-59.0` 

Finally, `negate 1:01:01` yields `-2:-2:-1.0`



