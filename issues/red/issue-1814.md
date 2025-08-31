
#1814: Incorrect values for tuple fields using refinements
================================================================================
Issue is closed, was reported by guaracy and has 2 comment(s).
[status.tested] [type.bug] [status.resolved]
<https://github.com/red/red/issues/1814>

**Red 0.6.0
Platform: Linux 64 and wine 1.9.7**

red>> t: 1.4.3  ; == 1.4.3

red>> min min t/1 t/2 t/3 ; == 3 err

red>> max max t/1 t/2 t/3 ; == 3 err

red>> 50 - t/1 ; == 0 err

red>> 20 + t/1 ; == 2 err

red>> t/1 + 20 ; == 21 ok

Enclosing tuple refinement with parentheses works fine in interpreted mode only. In compiled mode always returns wrong values.

red>> t: 1.4.3
== 1.4.3
red>> min min  t/1 t/2 t/3
== 3
red>> min min  (t/1) (t/2) (t/3)
== 1



Comments:
--------------------------------------------------------------------------------

On 2016-04-16T16:48:24Z, mydoghasworms, commented:
<https://github.com/red/red/issues/1814#issuecomment-210854641>

    Just stumbled across the same issue. Using the latest build, it seems to be fixed. Thank you! :+1: 

