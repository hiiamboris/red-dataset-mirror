
#2989: Updating a value from inside a function in `reactor!` and `deep-reactor!` does not trigger reaction
================================================================================
Issue is closed, was reported by toomasv and has 4 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2989>

```
a: make deep-reactor! [
   l: ["a" "b"]
   q: is [ collect [ foreach n l [ keep copy n ] ] ]
   f: func [txt ] [ l: append l txt ]
]
a/f "c"
a/q
== ["a" "b"]
```
But it works with `self`:
```
a: make deep-reactor! [
   l: ["a" "b"]
   q: is [ collect [ foreach n l [ keep copy n ] ] ]
   f: func [txt ] [ self/l: append l txt ]
]
a/f "c"
a/q
== ["a" "b" "c"]
```
Similar problem with `reactor!`


Comments:
--------------------------------------------------------------------------------

On 2018-03-17T09:49:58Z, dockimbel, commented:
<https://github.com/red/red/issues/2989#issuecomment-373907913>

    It seems to be working with latest commit, I get:
    ```
    a: make deep-reactor! [
       l: ["a" "b"]
       q: is [ collect [ foreach n l [ keep copy n ] ] ]
       f: func [txt ] [ l: append l txt ]
    ]
    a/f "c"
    ;== ["a" "b" "c"]
    a/q
    ;== ["a" "b" "c"]
    ```

--------------------------------------------------------------------------------

On 2018-03-17T09:58:58Z, toomasv, commented:
<https://github.com/red/red/issues/2989#issuecomment-373908356>

    @dockimbel Yes, it works now. Thanks!

