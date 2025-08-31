
#337: Documentation: shouldn't all built-in functions have doc-strings at some point?
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[type.review]
<https://github.com/red/red/issues/337>

I hope that `action/make*` and `native/make*` can handle doc-strings. For the user to know what the order and significance of the arguments/refinements of a built-in function are, the quickest is to type `help function-name` and this `help` is easily written in terms of `spec-of` like in REBOL. Is the mechanism there at least?



Comments:
--------------------------------------------------------------------------------

On 2012-12-10T18:28:51Z, dockimbel, commented:
<https://github.com/red/red/issues/337#issuecomment-11210605>

    Red functions (actions, natives, ops, functions, closures, routines,...) can have doc-strings, like REBOL does (even more, as we can specify return types). The Red compiler supports it already. I have not added doc-strings to the already defined ones in boot.red mainly because of licensing issues with REBOL. When R3 will get open-sourced with a BSD compatible license, we should be able to copy the doc-strings from R3 directly. Anyway, we could also add our own, we just need to come-up with a concise but precise nomenclature. I was hoping this could be done by contributors.

--------------------------------------------------------------------------------

On 2012-12-10T18:59:13Z, meijeru, commented:
<https://github.com/red/red/issues/337#issuecomment-11211886>

    Sure this is a burden that others can share. Having access to the run-time code, one can fairly precisely specify what each built-in does. I will shortly attempt to do some examples and put them up in a gist.

--------------------------------------------------------------------------------

On 2014-04-20T22:24:03Z, dockimbel, commented:
<https://github.com/red/red/issues/337#issuecomment-40906491>

    Most predefined functions in %boot.red have now docstrings. We will document them on the path to Red 1.0.

