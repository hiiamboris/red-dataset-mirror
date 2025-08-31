
#83: Cannot cope with pointers initialized by function call
================================================================================
Issue is closed, was reported by meijeru and has 12 comment(s).
[status.built]
<https://github.com/red/red/issues/83>

A possible implementation of the 'now' function (like in REBOL) is offered by Kaj de Vos in his C-library. This contains:

```
#import [
    "msvcrt.dll" cdecl [    ; Windows
        now-time: "time" [  ; Current time.
            result [pointer! [integer!]]
            return: [integer!] 
        ]
    ]
]
```

and

```
now: func [  ; Current time.
    return: [date!] ; date! is a struct! (not relevant for this discussion)
    /local time [pointer! [integer!]]
][
    now-time time
    to-date time
]
```

The trouble is that `time` in the `now` function is reported as not initialized, whereas it is actually an output of the call to `now-time`. The only way to initialize it inside `now` is to say `s: "abcd" time: as [pointer! [integer!]] s` which is awkward. Since `time` has been declared, it seems that the check on initialization can be waived. Sensible conditions are (a) it is a pointer type, (b) it occurs as an argument to another function (restrict this to library functions and system-calls?).



Comments:
--------------------------------------------------------------------------------

On 2011-06-09T09:48:39Z, dockimbel, commented:
<https://github.com/red/red/issues/83#issuecomment-1333127>

    A proper way to initialize it (and to avoid declaring the type) is:
    
    ```
    now: func [  ; Current time.
        return: [date!] ; date! is a struct! (not relevant for this discussion)
        /local time
    ][
        time: null
        now-time time
        to-date time
    ]
    ```

--------------------------------------------------------------------------------

On 2011-06-09T10:01:18Z, meijeru, commented:
<https://github.com/red/red/issues/83#issuecomment-1333179>

    I tried this, but passing the null pointer to `now-time` gives a crash. The trouble is that the null pointer is actually the address zero, not a proper address _containing_ a zero. One should use `calloc` to get a proper address, perhaps.

--------------------------------------------------------------------------------

On 2011-06-09T14:08:35Z, dockimbel, commented:
<https://github.com/red/red/issues/83#issuecomment-1334414>

    Right, my mistake, this is the correct initialization pattern to use in such case:
    
    ```
    now: func [  ; Current time.
        return: [date!] ; date! is a struct! (not relevant for this discussion)
        /local time
    ][
        time: pointer [integer!]
        now-time time
        to-date time
    ]
    ```
    
    But there is a bug in the generated code for the `time: pointer [integer!]` part preventing it from working currently, so a fix is required.

--------------------------------------------------------------------------------

On 2011-06-09T14:23:21Z, dockimbel, commented:
<https://github.com/red/red/issues/83#issuecomment-1334512>

    Testing with following code returns the correct elapsed time:
    
    ```
    now: func [
        return: [pointer! [integer!]]
        /local time
    ][
        time: pointer [integer!]
        now-time time
        time
    ]
    p: now
    print form p/value
    ```

--------------------------------------------------------------------------------

On 2011-06-09T18:03:07Z, meijeru, commented:
<https://github.com/red/red/issues/83#issuecomment-1336026>

    In `common.reds` there is still the definition of `null: pointer! [integer!]]`.
    I suppose this should now be `null: as pointer! [integer!]] 0` in order to re-create the previous effect.

--------------------------------------------------------------------------------

On 2011-06-09T19:49:55Z, meijeru, commented:
<https://github.com/red/red/issues/83#issuecomment-1336722>

    In this connection, the documentation, under type-casting, suggests that `null` is an admissible value for all of the reference types (`c-string!, pointer[...], struct![...]`). It is not, in fact.

