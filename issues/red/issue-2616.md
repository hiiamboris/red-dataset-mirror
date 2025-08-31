
#2616: DOC/HELP: help does not state type of function when description is absent
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
<https://github.com/red/red/issues/2616>

Only when the description (the first string in the spec) is not empty does help print
`<function-name> is of type: native!/action!/function!`


Comments:
--------------------------------------------------------------------------------

On 2017-04-28T04:31:24Z, greggirwin, commented:
<https://github.com/red/red/issues/2616#issuecomment-297904518>

    Rudolph, please test this with the new version of `help` once the `all-word!` change is in place.

--------------------------------------------------------------------------------

On 2017-05-07T11:25:53Z, meijeru, commented:
<https://github.com/red/red/issues/2616#issuecomment-299699604>

    Solved by the new help.

