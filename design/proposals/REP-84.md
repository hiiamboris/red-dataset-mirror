
#84: WISH: remove a limitation for 3-letter currency symbols in MONEY! datatype.
================================================================================
Issue is open, was reported by 9214 and has 0 comment(s).
<https://github.com/red/REP/issues/84>

Initially proposed by @loziniak [here](https://gitter.im/red/blockchain?at=5f2bcc9e93579d2e34616f6a): currency symbols in `money!` datatype should not be limited to 3 characters, but should rather support arbitrary sizes. The restriction to alpha-numeric characters and starting character not being a digit still applies.

A proof-of-concept implementation of this wish lives in a [dedicated branch](https://github.com/9214/red/tree/currencies).


