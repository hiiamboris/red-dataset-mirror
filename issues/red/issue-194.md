
#194: Empty struct definitions
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 6 comment(s).
[type.wish] [status.reviewed] [Red/System]
<https://github.com/red/red/issues/194>

I use this form to define opaque structs, of unknown content, for the purpose of type identifications:

```
gtk-window!: alias struct! [
    dummy                               [variant!]
]
```

This is not correct, so I would like to use an empty struct, but this is currently not allowed:

```
gtk-window!: alias struct! []
```

**\* Compilation Error: invalid struct syntax: []

It would be very useful if this would be allowed, and also if an error would be generated when SIZE? is used on such a struct, because the size is unknown.



Comments:
--------------------------------------------------------------------------------

On 2012-10-25T11:00:14Z, dockimbel, commented:
<https://github.com/red/red/issues/194#issuecomment-9773530>

    Is this request still relevant to you? I fail to see the use cases where you need to manipulate structs of unknown content. Even if the first example is not the cleanest code, it's perfectly acceptable.

--------------------------------------------------------------------------------

On 2012-10-25T20:01:25Z, Kaj-de-Vos, commented:
<https://github.com/red/red/issues/194#issuecomment-9791935>

    I'd still like to have it. I'm using many opaque structs in the bindings, where a type for a struct is required, but it's not required to know the content because it's hidden by the external library. See for example GTK. It's cosmetic, but also semantic if the error check for SIZE? is implemented. No hurry, though.

--------------------------------------------------------------------------------

On 2013-05-05T12:18:55Z, PeterWAWood, commented:
<https://github.com/red/red/issues/194#issuecomment-17450904>

    Wish moved to v2 wish list on wiki.

