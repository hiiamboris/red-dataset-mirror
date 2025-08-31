
#900: Incomplete parse rules don't throw errors
================================================================================
Issue is closed, was reported by hostilefork and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/900>

In Red, the following returns false and does not raise an error:

```
red> parse "ooo" [thru]
```

In Rebol, you get:

```
** Script error: PARSE - unexpected end of rule after: thru
** Where: parse
** Near: parse "ooo" [thru]
```

Which seems better.  However, both Rebol and Red just return FALSE on:

```
>> parse "ooo" [some]
```

And I'd think that should be an incomplete rule error, also.



