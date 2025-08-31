# Why wrong answer for this simple calculation in Red language

**Link:**
<https://stackoverflow.com/questions/46387012/why-wrong-answer-for-this-simple-calculation-in-red-language>

**Asked:** 2017-09-24 05:46:09 UTC

------------------------------------------------------------------------

I am trying to print correct value of simple expression: (100 - 55) /
(100 - 75) but always getting 1.0 instead of 1.8. I have tried:

    >> (100 - 55) / (100 - 75)
    >> ((100 - 55) / (100 - 75))
    >> to-float ((100 - 55) / (100 - 75))
    >> probe ((100 - 55) / (100 - 75))
    >> print ((100 - 55) / (100 - 75))
    >> (divide (subtract 100 55)  (subtract 100 75))

They all give value of 1.0 or simply 1 when the correct values is
obviously 1.8 (I have checked multiple times!). Where is the problem?

Edit: the output:

    >> (100 - 55) / (100 - 75)
    == 1
    >> ((100 - 55) / (100 - 75))
    == 1
    >> to-float ((100 - 55) / (100 - 75))
    == 1.0
    >> probe ((100 - 55) / (100 - 75))
    1
    == 1
    >> print ((100 - 55) / (100 - 75))
    1
    >> (divide (subtract 100 55)  (subtract 100 75))
    == 1
    >> 

Red version 0.6.3 on Debian Stable Linux.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by sqlab

Red does no automatic conversion from integer to float as Rebol does if
all values are integer and the **best** result could be float.

You have to introduce a float value in your computation as in

    >> (100 - 55) / (100 - 75.0)
    == 1.8

but of course the earlier the better.

    >> (to-float 100) - 55 / (100 - 75)
    == 1.8

By the way I like to use

    divide subtract to-float 100 55 subtract 100 75

You have to write a little bit more, but you save the parentheses and
you do not have to think about precedence

*Comment by rnso:* Division of integers (unlike addition, subtraction
and multiplication) is very likely to produce float values. Why this
default behaviour?

*Comment by rnso:* Red is still evolving and my experience with it so
far has been very good. Thank you all for your help. --

*Comment by DocKimbel:* \@rnso The auto-coercion to float values in math
operations has not been implemented yet in Red. There will still be a
way to avoid the auto-coercion though, when not wanted.

*Comment by Geeky I:* You don\'t actually have to think about precedence
unlike the majority of programming languages, except for that special
case of (binary) operators

------------------------------------------------------------------------

## Comments on question

*Comment by Graham Chiu:* Can you paste the output from your console,
and version of Red? The result is fine in Rebol 2.

*Comment by rnso:* Output has been posted above.
