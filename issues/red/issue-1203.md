
#1203: Two questions about parent-types and inheritance
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
<https://github.com/red/red/issues/1203>

The first one is already in #1202, but it really belongs here.
- `map!` is implemented using the representation structure `red-hash!` but its parent type is not`hash!` --- is there no inheritance to be gained?
- `function!` has parent type `context!` but there are no actions specified as inherited -- what is the gain?



Comments:
--------------------------------------------------------------------------------

On 2015-06-07T08:49:12Z, dockimbel, commented:
<https://github.com/red/red/issues/1203#issuecomment-109722616>

    `map!`: no there is nothing we can re-use from the `hash!` datatype implementation, `map!` is namespace-oriented, `hash!` is array-oriented.
    
    `function!`: I guess it was just an early assumption that some features could be inheritated, but not so far (though, that may change in the future).

--------------------------------------------------------------------------------

On 2015-06-07T08:54:23Z, dockimbel, commented:
<https://github.com/red/red/issues/1203#issuecomment-109722793>

    You should not open tickets for asking questions about the source code, this issues tracker  is not meant for that. You should rather log in our new chat room: https://gitter.im/red/red using your Github account and ask there. You can also create a new wiki page like a "Source code FAQ", put questions there and ask me on the chat to answer them (so that it can be easily found by newcomers studying the source code).

