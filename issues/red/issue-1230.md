
#1230: setting multiple paths crashes
================================================================================
Issue is closed, was reported by WiseGenius and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/1230>

```
red>> set [a b c] [1 2 3]
== [1 2 3]
red>> c
== 3
```

So far, so good, but:

```
red>> o: make object! [a: 1 b: 7 c: 13]
== make object! [
    a: 1
    b: 7
    c: 13
]
red>> set [o/b o/c] [2 3]

*** Runtime Error 1: access violation
*** at: 0041DE9Bh
```

```
red>> m: #(a 1 b 7)
== #(
    a: 1
    b: 7
)
red>> set [m/b m/c] [2 3]

*** Runtime Error 1: access violation
*** at: 0041DE9Bh
```

Rebol 2 and 3 give something like:

```
** Script error: invalid argument: o/b
```

But I trust that it's obvious that the result I'm hoping for is not that either.



Comments:
--------------------------------------------------------------------------------

On 2016-02-02T09:26:18Z, dockimbel, commented:
<https://github.com/red/red/issues/1230#issuecomment-178472876>

    This issue seems to have been fixed already:
    
    ```
    red>> o: make object! [a: 1 b: 7 c: 13]
    == make object! [
        a: 1
        b: 7
        c: 13
    ]
    red>> set [o/b o/c] [2 3]
    *** Script error: invalid argument: o/b
    *** Where: set
    ```
    
    Though, the compiler crashes on such code instead of providing an adequat error message.

--------------------------------------------------------------------------------

On 2016-02-02T09:36:39Z, WiseGenius, commented:
<https://github.com/red/red/issues/1230#issuecomment-178475524>

    > But I trust that it's obvious that the result I'm hoping for is not that either.
    
    Should I make a wish?

--------------------------------------------------------------------------------

On 2016-02-02T09:55:53Z, dockimbel, commented:
<https://github.com/red/red/issues/1230#issuecomment-178484921>

    Haha, yes, you can make a wish. It shouldn't be a problem to implement it, though it would require significant work (especially on the compiler side).
    
    In case you missed it, you can already achieve the expected result without using paths:
    
    ```
    red>> o: make object! [a: 1 b: 7 c: 13]
    == make object! [
        a: 1
        b: 7
        c: 13
    ]
    red>> set bind [b c] o [2 3]
    == [2 3]
    red>> o
    == make object! [
        a: 1
        b: 2
        c: 3
    ]
    ```
    
    So, the path syntax would be considered just sugar.

