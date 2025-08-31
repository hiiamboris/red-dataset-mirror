
#2890: WISH: support hexadecimal numbers in chars
================================================================================
Issue is closed, was reported by rebolek and has 4 comment(s).
<https://github.com/red/red/issues/2890>

It is possible to write `char!` with its corresponding numerical ASCII/Unicode value in the form of `#"^(65)" == #"e"`. It would be also nice to use hexadecimal numbers here: `#"^(41h)" == #"e"`. This throws `invalid char!` error currently.


Comments:
--------------------------------------------------------------------------------

On 2017-07-16T08:50:17Z, meijeru, commented:
<https://github.com/red/red/issues/2890#issuecomment-315594919>

    I think there is a misunderstanding: `65` for `#"e" `  is already hexadecimal! And `41` in hex is `#"A"`. Try it for yourself...

--------------------------------------------------------------------------------

On 2017-07-16T09:37:03Z, rebolek, commented:
<https://github.com/red/red/issues/2890#issuecomment-315597442>

    Sorry, you're right and I am moron.

