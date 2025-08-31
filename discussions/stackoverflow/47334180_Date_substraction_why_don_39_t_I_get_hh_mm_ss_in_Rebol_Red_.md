# Date substraction why don&#39;t I get hh:mm:ss in Rebol / Red?

**Link:**
<https://stackoverflow.com/questions/47334180/date-substraction-why-dont-i-get-hhmmss-in-rebol-red>

**Asked:** 2017-11-16 16:05:29 UTC

------------------------------------------------------------------------

1°) I get only the number of days, how to also get the hh:mm:ss ?

    diff: (now - (10-Nov-2017/15:00:00))

> 6

2°) What\'s the most elegant way to get the number of minutes ?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 4) --- by DocKimbel

> 1°) I get only the number of days, how to also get the hh:mm:ss ?

Use `difference` function for that:

    >> difference now 10-Nov-2017/15:00:00
    == 145:19:24

> 2°) What\'s the most elegant way to get the number of minutes ?

The same way as for any other date value:

    >> d: difference now 10-Nov-2017/15:00:00
    >> d/minute
    == 21

Alternatively, you can use `pick` to avoid setting the intermediary date
to a word:

    >> pick (difference now 10-Nov-2017/15:00:00) 2  ; Red and Rebol2/3
    == 21
    >> pick (difference now 10-Nov-2017/15:00:00) 'minute ; Rebol3, not yet implemented in Red
    == 21

------------------------------------------------------------------------

## Comments on question
