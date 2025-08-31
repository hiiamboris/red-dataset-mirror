
#2339: make object! from map always gives error, although allowed in the table
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/2339>

```
red>> make object! #(a: 1 b: 2)
*** Syntax Error: invalid construction spec: #(a: 1 b: 2)
*** Where: make
```
Obviously, objects require set-word keys only, so some maps cannot be converted, but the above example should be allowed.


Comments:
--------------------------------------------------------------------------------

On 2017-02-21T09:24:10Z, dockimbel, commented:
<https://github.com/red/red/issues/2339#issuecomment-281288800>

    For now, we will not allow direct conversion between objects and maps (the conversion table will be updated to remove that entry). See #2338. The reason is the different nature of both data structures, one is a namespace aiming at providing local contexts to code, while the other is a dictionary-like structure which can freely grow/shrink using direct path accesses.
    
    Note that there is always an indirect way to convert between those two types using `body-of` to extract a block representation of the value's content:
    ```
    red>> m: #(a: 1 b: 2)
    == #(
        a: 1
        b: 2
    )
    red>> object body-of m
    == make object! [
        a: 1
        b: 2
    ]
    ```
    Binding issues (especially when building a map from an object) needs to be handled properly by the user, according to his needs.

--------------------------------------------------------------------------------

On 2024-08-23T18:22:22Z, hiiamboris, commented:
<https://github.com/red/red/issues/2339#issuecomment-2307592211>

    Carl was there http://www.rebol.net/r3blogs/0142.html

