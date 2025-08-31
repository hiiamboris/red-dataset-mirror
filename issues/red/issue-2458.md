
#2458: Picosheet demo broken by more strict word rules
================================================================================
Issue is closed, was reported by greggirwin and has 4 comment(s).
<https://github.com/red/red/issues/2458>

There's a placeholder col header with #" " as the text, which `to word!` doesn't like when combined with a numeric digit to create the cell ref name. If you replace [#" "] with [#"_"]for now, it will work again. 


Comments:
--------------------------------------------------------------------------------

On 2017-03-03T20:03:11Z, geekyi, commented:
<https://github.com/red/red/issues/2458#issuecomment-284056236>

    This bug should be in the red/code repo https://github.com/red/code/blob/0.6.2/Showcase/picosheet.red

--------------------------------------------------------------------------------

On 2017-03-03T20:29:17Z, greggirwin, commented:
<https://github.com/red/red/issues/2458#issuecomment-284062166>

    Ah, yes! Thanks. I need to close and re-create it. No way to move between repos I'm sure.

