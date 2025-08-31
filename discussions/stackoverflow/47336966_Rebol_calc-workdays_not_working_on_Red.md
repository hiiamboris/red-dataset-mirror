# Rebol calc-workdays not working on Red

**Link:**
<https://stackoverflow.com/questions/47336966/rebol-calc-workdays-not-working-on-red>

**Asked:** 2017-11-16 18:42:36 UTC

------------------------------------------------------------------------

I trying to execute this script
[https://www.mail-archive.com/rebol-bounce@rebol.com/msg01222.html](https://www.mail-archive.com/rebol-bounce@rebol.com/msg01222.html){rel="nofollow noreferrer"}
in Red but I can\'t see why I got

> calc-workdays now/date 3-feb-2007 \[1-feb-2007\]
>
> \*\*\* Script Error: \> operator is missing an argument
>
> \*\*\* Where: do
>
> \*\*\* Stack: print calc-workdays

        found?: func [
            "Returns TRUE if value is not NONE."
            value
        ][
            not none? :value
        ]

        calc-workdays: func [
            "Return number of workdays between two dates, excluding holidays"
            date1 [date!] "Start date"
            date2 [date!] "End date"
            holidays [block!] "Block of dates to exclude (holidays, etc.)"
            /non "Return number of non-work days (weekend + holidays) between 2 dates"
            /local days day1 day2 diff param
        ][
            days: copy []
            set [day1 day2] sort reduce [date1 date2]
            diff: day2 - day1
            param: pick [[> 5 union][< 6 exclude]] either found? non [1][2]
            loop diff [
                day1: day1 + 1
                if do param/1 day1/weekday param/2 [append days day1]
            ]
            return length? do param/3 days holidays
        ]

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by HostileFork says dont trust SE

Rebol2 seems to allow you to pass a WORD! to DO, and evaluate it. If the
word happens to be a variable holding an ANY-FUNCTION!, it will be
run\...and if it\'s an infix \"OP!\" then it will be run as if it were
*not* infix.

    >> do quote > 1 2
    == false

    >> do quote < 1 2
    == true

Red sort of does this also, but DO is not variadic. It can run 0 arity
functions only:

    >> foo: does [print "hi"]

    >> do quote foo
    hi    

    >> bar: func [x] [print x]

    >> do quote bar "hi"
    *** Script Error: bar is missing its x argument

The script in question was attempting to use this feature. But it could
be done with ordinary COMPOSE or REDUCE. So change:

    if do param/1 day1/weekday param/2 [append days day1]

To:

    if do reduce [day1/weekday param/1 param/2] [append days day1]

That will build a block of code where the `>` or `<` operator is in the
middle, and execute it normally without relying on this WORD!-dispatch
or infix-dropping behavior of DO.

Similarly, change:

    return length? do param/3 days holidays

To:

    return length? do reduce [param/3 days holidays]

With those changes, and removing the `found?` (it\'s not necessary) then
it appears to work.

*Comment by HostileFork says dont trust SE:* Note: There is a [construct
called
EVAL](https://forum.rebol.info/t/meet-the-eval-native/311){rel="nofollow noreferrer"}
in Rebol3/Ren-C which lets you accomplish what DO was doing\...except
you would need to use GET-WORD! to extract the function from the word,
e.g. `eval :param/1 day1/weekday param/2`. The DO primitive, like
Red\'s, only accepts 0-arity functions.

------------------------------------------------------------------------

## Comments on question
