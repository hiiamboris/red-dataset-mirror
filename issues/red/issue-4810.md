
#4810: `make object` vs `copy object` inconsistency in index handling
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
[type.design]
<https://github.com/red/red/issues/4810>

**Describe the bug**

Inner series are copied differently:
- copy copies series from the head and sets index to where it was
- make copies series from the index and sets index to 1
```
>> a: object [s: next "abc"]
>> b: copy a
>> c: make a []
>> head a/s
== "abc"
>> head b/s
== "abc"
>> head c/s
== "bc"
>> c: make a [probe head s]
"bc"         ;-- truncated before user code evaluates
== make object! [
    s: "bc"
]
```
In R2 & R3 the behavior of `make` follows the `copy` scenario above.


**Expected behavior**

I prefer `copy` scenario as it is less surprising and is lossless, while after `make` any logic that relied on changed index becomes broken.

**Platform version**
```
Red 0.6.4 for Windows built 20-Dec-2020/21:04:56+03:00 commit #7a6d9a9
```

Related: https://github.com/red/red/issues/4533 https://github.com/red/red/issues/4523


Comments:
--------------------------------------------------------------------------------

On 2021-02-01T17:16:11Z, dockimbel, commented:
<https://github.com/red/red/issues/4810#issuecomment-771014813>

    The object `copy` does not seem consistent with `copy` on series:
    ```
    >> a: "string"
    == "string"
    >> b: next a
    == "tring"
    >> head copy b
    == "tring"
    ```
    
    So the `make` behavior should be privileged then, as it is more consistent with overall `copy` semantics.

--------------------------------------------------------------------------------

On 2021-02-01T17:38:22Z, hiiamboris, commented:
<https://github.com/red/red/issues/4810#issuecomment-771029123>

    I disagree. `copy` and `copy/deep` are consistent:
    ```
    >> o: object [s: next "1234"]
    >> p: copy o
    >> q: copy/deep o
    >> head p/s
    == "1234"
    >> same? p/s o/s
    == true
    >> head q/s
    == "234"
    
    >> b: reduce [next "1234"]
    == ["234"]
    >> c: copy b
    >> d: copy/deep b
    >> head c/1
    == "1234"
    >> same? b/1 c/1
    == true
    >> head d/1
    == "234"
    ```
    
    `make` behavior seems less useful. This is what I hit in my https://gitlab.com/-/snippets/2066140 experiment.
    I needed a copy of this object:
    ```
    	object [
    		width: either pair? size [size/x][0]
    		part:  none
    		data:  make [] either pair? size [size/y * size/x][size]
    	]
    ```
    But with `width` field changed, and `data` remaining the *same*. `make old [width: new]` looked like obvious solution but it didn't work, so I had to `copy` it. Current `make` seems to work like `copy/deep`, whereas in Rebol it worked like `copy`.
    
    OTOH if we look into the series inside function bodies https://github.com/red/red/issues/4533 https://github.com/red/red/issues/4523 that's quite a design question how to make it all consistent and still useful...

