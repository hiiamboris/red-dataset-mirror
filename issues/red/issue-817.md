
#817: How to quote a path
================================================================================
Issue is closed, was reported by meijeru and has 10 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/817>

I tested the new `random` on a path value, which should be OK since a path is a series.

`random a/b/c` fails (of course) since `a/b/c` has no value
`random 'a/b/c` works, but when the elements are shuffled, they can come out like `b/'a/c`
`random quote a/b/c` does not contains lit-words, as intended

Conclusion: a lit-path value is differently treated from a quoted path. In REBOL 2, both are treated equally by `random`, but the result is a block value in both cases!

I would expect Red to treat a quoted path and a lit-path equally as far as possible.  However, currently:

`same? 'a quote a` yields `true`, whereas
`same? 'a/b/c quote a/b/c` yields `false`

Admittedly, this also holds for REBOL 2...



Comments:
--------------------------------------------------------------------------------

On 2014-05-13T10:08:01Z, dockimbel, commented:
<https://github.com/red/red/issues/817#issuecomment-42937762>

    The second case looks like a lexer bug, it seems to parse the first element as a lit-word! instead of a word!.

--------------------------------------------------------------------------------

On 2014-05-13T11:12:04Z, meijeru, commented:
<https://github.com/red/red/issues/817#issuecomment-42942501>

    Indeed! In the interpreter: 
    
    red>> type? first 'a/b/c
    == lit-word!
    red>> type? first quote a/b/c
    == word!

--------------------------------------------------------------------------------

On 2016-09-08T06:55:03Z, rebolek, commented:
<https://github.com/red/red/issues/817#issuecomment-245510119>

    @dockimbel Is `random` expected to work on `path!`?
    I get
    
    ```
    red>> random 'a/b/c
    *** Script Error: random does not allow path! for its value argument
    *** Where: random
    ```
    
    In Rebol, this works.

--------------------------------------------------------------------------------

On 2016-09-08T08:18:42Z, meijeru, commented:
<https://github.com/red/red/issues/817#issuecomment-245526635>

    It makes no sense, since the individual path items are not arbitrary: the first one is a HEAD, the subsequent ones are interpreted in the context of the previous ones. Swapping them around robs them of their significance. See #907.

--------------------------------------------------------------------------------

On 2016-09-12T05:05:49Z, rebolek, commented:
<https://github.com/red/red/issues/817#issuecomment-246250099>

    I agree it makes no sense, I was pointing out it’s possible in Rebol. I have no problem with this being not allowed in Red.

