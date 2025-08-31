
#1143: Interpreter problem with object! and make 
================================================================================
Issue is closed, was reported by x8x and has 10 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1143>

This example:

``` rebol
a: object [
    b: object [
        c: 1
    ]
    d: does [
        make a [b: none]
        probe b/c
    ]
]
a/d
```

returns:

```
*** Script error: probe does not allow none for its value argument
*** Where: probe
```

While this does work:

``` rebol
a: object [
    b: object [
        c: 1
    ]
]
d: does [
    make a [b: none]
    probe a/b/c
]
d
```

returns:

```
== 1
```



Comments:
--------------------------------------------------------------------------------

On 2015-05-03T03:14:53Z, x8x, commented:
<https://github.com/red/red/issues/1143#issuecomment-98431836>

    Maybe it's about `copy/deep` failing to deep copying ?
    
    ``` rebol
    a: object [
        b: object [
            c: 1
        ]
        d: does [
            probe b/c
        ]
    ]
    e: copy/deep a
    f: make e [b: none]
    a/d
    *** Script error: probe does not allow none for its value argument
    *** Where: probe
    
    ```

--------------------------------------------------------------------------------

On 2015-06-03T07:20:49Z, dockimbel, commented:
<https://github.com/red/red/issues/1143#issuecomment-108226387>

    Thanks for finding this bug, it is a nasty one, I am glad it is fixed now. ;-)

--------------------------------------------------------------------------------

On 2015-06-03T10:18:27Z, x8x, commented:
<https://github.com/red/red/issues/1143#issuecomment-108288557>

    not sure it's properly fixed
    
    ``` rebol
    a: object [
        b: object [
            c: 1
        ]
        d: does [
            probe b/c
        ]
    ]
    e: copy/deep a
    f: make e [b: none]
    a/d
    == [b c]
    ```
    
    should be:
    
    ``` rebol
    == 1
    ```

--------------------------------------------------------------------------------

On 2015-06-03T10:34:09Z, dockimbel, commented:
<https://github.com/red/red/issues/1143#issuecomment-108292607>

    Good catch, fixing it now.

--------------------------------------------------------------------------------

On 2016-09-05T09:11:32Z, rebolek, commented:
<https://github.com/red/red/issues/1143#issuecomment-244697826>

    This needs one more fix. When you `do` last code, it returns `object!` instead of `integer!`:
    
    ```
    do [
        a: object [
            b: object [
                c: 1
            ]
            d: does [
                probe b/c
            ]
        ]
        e: copy/deep a
        f: make e [b: none]
        a/d
    ]
    ```
    
    returns 
    
    ```
    make object! [
        b: none
        d: func [][
            probe 
            b/c
        ]
    ]
    ```

