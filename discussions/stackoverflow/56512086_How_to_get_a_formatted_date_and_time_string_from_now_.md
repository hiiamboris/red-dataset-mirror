# How to get a formatted date and time string from \`now\`?

**Link:**
<https://stackoverflow.com/questions/56512086/how-to-get-a-formatted-date-and-time-string-from-now>

**Asked:** 2019-06-09 04:54:36 UTC

------------------------------------------------------------------------

I\'m using \"Red Programming Language\" version \"0.6.4\" on Windows and
making a command line application.

I don\'t know much Red language and I don\'t understand many things. I
did go over \"work in progress\" docs at
([https://doc.red-lang.org/en/](https://doc.red-lang.org/en/){rel="nofollow noreferrer"})
before asking here.

I need to get a date and time string formatted as `yyyymmdd_hhmm`.

I\'ve started with code like this:

    Red []
    dt: to string! now/year
    print dt

which gives me `2019` but I need the other things month, day and time to
obtain something like `20190608_2146`

I tried also:

    Red []
    dt: to string! now/precise
    print dt

which gives me `8-Jun-2019/21:47:51.299-07:00` but again what I needed
was `20190608_2147`

***Question:***\
How to modify the code above to obtain something like `20190608_2147`
from `now`?

Thank you.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by rgchris

I have written a script for Rebol and Red called \'Form Date\' that will
format dates/times in a similar fashion to STRFTIME. The Red version is
[here](https://github.com/rgchris/Scripts/blob/master/red/form-date.red){rel="nofollow noreferrer"}.

    do %form-date.red
    probe form-date now "%Y%m%d_%H%M"

    print first spec-of :form-date

Within the script are individual snippets of code used for formatting
the various components of a date! value.

You don\'t need the script for your specific example though, you can
extract and join the various components thus:

    date: now
    rejoin [ ; reduce-join
        form date/year
        pad/left/with date/month 2 #"0"
        pad/left/with date/day 2 #"0"
        "_"
        pad/left/with date/hour 2 #"0"
        pad/left/with date/minute 2 #"0"
    ]

------------------------------------------------------------------------

### Answer (score: 2) --- by sqlab

As the above solution has some problems under Rebol2 here a variation
that works with Rebol and Red the same way

    date: now
    rejoin [ 
        date/year
        next form 100 + date/month
        next form 100 + date/day 
        "_"
        next form 100 + date/time/hour
        next form 100 + date/time/minute 
    ]

------------------------------------------------------------------------

### Answer (score: -3) --- by Time Series Lord

Here is another way:

    rejoin [
        now/year 
        either 10 > x: (now/month) [join "0" x][x]
        either 10 > x: (now/day) [join "0" x][x]
        "_" 
        either 10 > x: first (now/time) [join "0" x][x]
        either 10 > x: second (now/time) [join "0" x][x]
    ] 

Red has `pad`, so rgchris\' answer up there is good. Yet, there is no
need for `date: now` as rgchris has done:

    rejoin [
        now/year 
        pad/left/with now/month 2 #"0" 
        pad/left/with now/day 2 #"0" 
        "_" 
        pad/left/with first (now/time) 2 #"0" 
        pad/left/with second (now/time) 2 #"0" 
    ] 

*Comment by MarkI:* There is very definitely a need for the `date: now`.
If your multiple NOW calls straddle a midnight boundary you will get
incorrect results at best.

------------------------------------------------------------------------

## Comments on question
