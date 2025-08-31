
#2765: Molding of { and } is different
================================================================================
Issue is closed, was reported by rebolek and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2765>

See this code:
```
>> ["{" "}" "^{" "^}"]
== ["{" {^}} "{" {^}}]
```

I would expect `"{" "}"`, or at least `{^{} {^}}`, current variant is confusing.


