
#615: bitset?, object? missing
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/615>

red>> bitset? charset []
**\* Error: word has no value!
== make bitset! #{00}

red>> object? context []
**\* Error: word has no value!
== make object! [
]
red>> object?
**\* Error: word has no value!



