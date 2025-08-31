
#2613: in <object> <issue> gives wrong result
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2613>

```
>> o: object [a: 1]
== make object! [
    a: 1
]
>> type? in o 'a
== word!
>> type? in o #a
== object!
```
I would have thought `#a` (and `/a`) should not be allowed here...



Comments:
--------------------------------------------------------------------------------

On 2017-04-26T15:29:31Z, dockimbel, commented:
<https://github.com/red/red/issues/2613#issuecomment-297448124>

    As several other functions have the same issue, it was solved by splitting word types into two typesets.

