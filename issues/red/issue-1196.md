
#1196: In %environment/console/input.red, KEY constants are defined in two ways
================================================================================
Issue is closed, was reported by meijeru and has 4 comment(s).
[status.resolved] [type.review]
<https://github.com/red/red/issues/1196>

The "special keys" are defined in an `#enum` and the other keys are defined with `#define`. The only reason I can see for an `#enum` is to use its name somewhere else, but that is not the case. Am I missing something?



Comments:
--------------------------------------------------------------------------------

On 2015-06-02T09:43:11Z, dockimbel, commented:
<https://github.com/red/red/issues/1196#issuecomment-107897469>

    Maybe just because it was written by two different persons. ;-)

--------------------------------------------------------------------------------

On 2015-06-02T09:48:15Z, Oldes, commented:
<https://github.com/red/red/issues/1196#issuecomment-107899190>

    `special-key!` seems not to be used anywhere in the code... it looks like some leftover.
    https://github.com/red/red/blob/master/environment/console/input.red#L117

