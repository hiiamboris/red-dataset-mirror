
#1188: %lexer.r does not accept #[datatype! ...] construct
================================================================================
Issue is closed, was reported by meijeru and has 2 comment(s).
[type.wish]
<https://github.com/red/red/issues/1188>

The `escaped-rule` in the lexer accepts a number of words as first element in the `#[...]` block. Missing is `datatype!`, which is allowed in Rebol, and which is -- interestingly -- used in the Rebol text of the lexer itself

```
    load-number: func [s [string!]][
    switch/default type [
        #[datatype! decimal!][s: load-decimal s]
        #[datatype! issue!  ][
```

I came upon this when I tried to pass all .r files of the compiler suite through the Red lexer. It is a testimony to the close lexical similarity of Red and Rebol that I found very few deviations. The above one is the most important one.



Comments:
--------------------------------------------------------------------------------

On 2015-05-31T13:42:33Z, dockimbel, commented:
<https://github.com/red/red/issues/1188#issuecomment-107183047>

    The current implementaton is partial, just to cover some simple needs. We are planning to make a full implementation very soon, maybe even in the 0.5.4 release. As this ticket asks for a feature already planned, it will be closed.

