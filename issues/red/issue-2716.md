
#2716: 2 or 4+ zeros in tuple segment lexes as float
================================================================================
Issue is closed, was reported by greggirwin and has 6 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2716>

Doesn't matter which segment it's in.
```
>> 0.0.0
== 0.0.0
>> 0.0.00
*** Syntax Error: invalid tuple! at "0.0.00"
*** Where: do
>> 0.0.000
== 0.0.0
>> 0.0.0000
*** Syntax Error: invalid tuple! at "0.0.0000"
*** Where: do
>> 0.0.00000
*** Syntax Error: invalid tuple! at "0.0.00000"
*** Where: do
>> 0.0.000000
*** Syntax Error: invalid tuple! at "0.0.000000"
*** Where: do
```


Comments:
--------------------------------------------------------------------------------

On 2017-07-29T08:46:35Z, dockimbel, commented:
<https://github.com/red/red/issues/2716#issuecomment-318814559>

    @greggirwin Do you think that would be helpful to accept an arbitrary number of leading zeros for each tuple's component? I know Rebol does support it, but it might just be an inaccuracy in the lexer which is hard to fix (Rebol's lexer trades flexibility for performance).

--------------------------------------------------------------------------------

On 2017-07-29T19:15:35Z, greggirwin, commented:
<https://github.com/red/red/issues/2716#issuecomment-318852621>

    Assuming tuple segments never extend beyond byte values, the only aberrant case that's an issue is the 2 zeros.  Leading zeros in segments aren't an issue, if it ends in a non-zero. We're good up to 3 digits there. 0.0.0001 is too many digits, even though it represents a valid byte value once lexed. If we can handle `.00` cleanly, I think that's enough. If we can't, at least right now, it's not the end of the world, and we should just doc it. If we put it in the specs, we may still get an occasional complaint, but a clear explanation and sound reasoning for the limitation should be enough to subdue them.

--------------------------------------------------------------------------------

On 2017-07-30T04:36:05Z, dockimbel, commented:
<https://github.com/red/red/issues/2716#issuecomment-318877803>

    `00` are now supported for any of the tuple's components.

