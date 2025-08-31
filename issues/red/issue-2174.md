
#2174: Closed
================================================================================
Issue is closed, was reported by SmackMacDougal and has 2 comment(s).
<https://github.com/red/red/issues/2174>

REBOL 2.7.8.3.1 vs RED 0.6.1

REBOL

> > 100 - (90 / 100)
> > == 99.1
> > 100 + (10 / 100)
> > == 100.1
> > RED

red>> 100 - (90 / 100)
== 100
red>> 100 + (10 / 100)
== 100
More glitches in RED

red>> 100 - 90 / 100
== 0
red>> 10 / 100
== 0
red>> divide 10 100
== 0
Works in REBOL

> > 100 - 90 / 100
> > == 0.1
> > 10 / 100
> > == 0.1
> > divide 10 100
> > == 0.1
> > And more inexplicable results in RED:

;; OK
red>> to float! 10
== 10.0

;; BUT
red>> to float! 10 / 100
== 0.0
red>> to float! (10 / 100)
== 0.0
REBOL works!

> > to-decimal 10 /  100
> > == 0.1
> > to decimal! 10 / 100
> > == 0.1 



Comments:
--------------------------------------------------------------------------------

On 2016-08-16T01:20:28Z, PeterWAWood, commented:
<https://github.com/red/red/issues/2174#issuecomment-239976541>

    The implementations of neither `/` or `to` are complete. Their behaviour will be the same as Rebol once they are finalised.

