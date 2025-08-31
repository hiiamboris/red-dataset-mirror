# red/rebol: Subtracting dates returns days, how can I change that?

**Link:**
<https://stackoverflow.com/questions/39835881/red-rebol-subtracting-dates-returns-days-how-can-i-change-that>

**Asked:** 2016-10-03 16:08:01 UTC

------------------------------------------------------------------------

Playing with the date type, I was wondering, why a subtraction always
returns days, how can I make it return minutes (or seconds, etc.), which
could be possible in the second example

    >> 24-dec-2016 - now
    == 82
    >> 24-dec-2016/0:00 - now
    == 82

is that just arbitrary or can I influence what is returned? I tried
around a bit with refinements, but would appreciate a push in a
direction, the rebol/red way.

Maybe there is a more substantial thing below that question: what\'s the
\"rule\" of what a subtraction returns, common sense, some kinda
discussion and agreement or is it just determined by who implements it?
(e.g. the result of subtracting: `1.1.1.1 - 1`, `200x200 - 100`, \...)

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 4) --- by Geeky I

You can use `difference`:

    difference 24-dec-2016 now
    == 1952:06:01

To get specific parts, use path syntax:

    time-diff: difference 24-dec-2016 now
    time-diff/2

Gives the minutes (the second component)

    == 1951:42:11
    == 42

*Comment by rgchris:* Further, you can do **to integer! time-diff** to
get the number of seconds.

------------------------------------------------------------------------

### Answer (score: 2) --- by Time Series Lord

✓ Check out [Francois Vanzeveren\'s Date-Time Script on
REBOL.org](http://www.rebol.org/download-a-script.r?script-name=date-time.r){rel="nofollow"}

If you load it, i.e.,

    do http://www.rebol.org/download-a-script.r?script-name=date-time.r

then you can do this:

    >> ? date-dif
    USAGE:
      DATE-DIF date1 date2 /y /m /d /ym /md /yd

    DESCRIPTION:

      Returns the difference between two dates.

       DATE-DIF is a function value.

    ARGUMENTS:
       date1 -- (Type: date)
       date2 -- (Type: date)
    REFINEMENTS:
       /y -- Returns the number of complete years between @date1
    and @date2.
       /m -- Returns the number of complete months between @date
    1 and @date2.
       /d -- Returns the number of complete days between @date1
    and @date2.
       /ym -- Returns the number of full months between @date1 a
    nd @date2,
          not including the difference in years.
       /md -- Returns the number of full days between @date1 and
    @date2,
          not including the difference in months.
       /yd -- Returns the number of full days between @date1 and
    @date2,
          not including the difference in years.

✓ `>> ? now` to see the /refinements for dates

    >> ? now
    USAGE:
        NOW /year /month /day /time /zone /date /weekday /yearday
    /precise

    DESCRIPTION:
         Returns the current local date and time.
         NOW is a native value.

    REFINEMENTS:
         /year -- Returns the year only.
         /month -- Returns the month only.
         /day -- Returns the day of the month only.
         /time -- Returns the time only.
         /zone -- Returns the time zone offset from GMT only.
         /date -- Returns date only.
         /weekday -- Returns day of the week as integer (Monday is
     day 1).
         /yearday -- Returns day of the year (Julian)
         /precise -- Use nanosecond precision

Example:

    >> d: 27-7-1973
    == 27-Jul-1973
    >> d/day
    == 27
    >> d/month
    == 7
    >> d/year
    == 1973

------------------------------------------------------------------------

## Comments on question
