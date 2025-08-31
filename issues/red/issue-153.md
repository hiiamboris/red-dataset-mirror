
#153: logic! function result illogical
================================================================================
Issue is closed, was reported by Kaj-de-Vos and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/153>

Since Red/System 0.2.1, this returns the wrong result:

```
sdl-begin: function [  ; Initialise SDL library.
    flags               [integer!]
    return:             [logic!]
][
    0 = _sdl-begin flags
]
```

This returns TRUE:

```
sdl-begin: function [  ; Initialise SDL library.
    flags               [integer!]
    return:             [logic!]
][
    _sdl-begin flags
    1 = 0
]
```

While this returns FALSE:

```
sdl-begin: function [  ; Initialise SDL library.
    flags               [integer!]
    return:             [logic!]
][
    _sdl-begin flags
    0 = 1
]
```



