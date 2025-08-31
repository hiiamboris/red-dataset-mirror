
#64: WISH: `to rule rule` idiom replacement for `parse`
================================================================================
Issue is open, was reported by hiiamboris and has 4 comment(s).
<https://github.com/red/REP/issues/64>

I often find myself fighting the design of `to`, since when I'm not using `thru` I wish to ignore the delimiter:
`parse input [.. copy x to [dlm p:] :p ..]` or
`parse input [.. copy x to dlm dlm ..]`
1st way is 3x slower than the 2nd. It gets uglier with bigger delimiters.

I wish there was an idiomatic way to do the same, e.g. `copy x until rule`.
Hardest part of this is naming (any ideas?)


Comments:
--------------------------------------------------------------------------------

On 2020-01-31T02:55:49Z, greggirwin, commented:
<https://github.com/red/REP/issues/64#issuecomment-580559737>

    `Until` is a good word, and sort of addresses the `thru` part. Unless Doc wants it reserved for being a true opposite of `while`. `Before`? Not great. `Up-to` is hyphenated and ambiguous with `to`. It's the duality that makes it hard. Some variant of `delimit`? `Delimited-by` is a bit much. `Delim` isn't a bad abbreviation, but an abbreviation none-the-less.

--------------------------------------------------------------------------------

On 2020-01-31T07:56:07Z, dumblob, commented:
<https://github.com/red/REP/issues/64#issuecomment-580625834>

    `delim` sounds the best to me.

