# How to convert a string to Date in red

**Link:**
<https://stackoverflow.com/questions/54142148/how-to-convert-a-string-to-date-in-red>

**Asked:** 2019-01-11 07:34:32 UTC

------------------------------------------------------------------------

If I accept a date from a user using `ask` and then wish to use it as a
Date by using `to-date`, I get an error.

    >> to-date "31-Dec-2019"
    *** Script Error: cannot MAKE/TO date! from: "31-Dec-2019"
    *** Where: to
    *** Stack: to-date

What is the correct way of converting a string to date ?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by sqlab

You have to use **load**

    >> load "31-Dec-2019"
    == 31-Dec-2019

a few examples for **to-date!**

    >> to-date 1547196008
    == 11-Jan-2019/8:40:08
    >> to-date [200 1 1]
    == 1-Jan-0200

*Comment by iArnold:* In Rebol2 the \'to-date function works as expected
by the user. Why does Red have a \'to-date function when it does not do
what it promises to do? Seems to me it should be either fixed or removed
or the help string should point out it is deprecated and \'load should
be used instead.

*Comment by sqlab:* Red is still **alpha**

*Comment by rahul:* Thanks, sqlab. The issue is that people new to red
are referred to the rebol docs, so I am using some rebol articles and
books to learn red. I am unable to find a proper tutorial for red
itself. I keep hitting things (in rebol books) that don\'t work in red
and am trying to find the corresponding function. Thanks again.

*Comment by 9214:* \@rahul official reference documentation has a
[detailed
section](https://doc.red-lang.org/en/datatypes/date.html){rel="nofollow noreferrer"}
for `date!` datatype and its conversion. We also have an extensive list
of [learing
resources](https://github.com/red/red/wiki/%5BLINKS%5D-Learning-resources){rel="nofollow noreferrer"}
and active [community
hub](https://gitter.im/red/help){rel="nofollow noreferrer"}, where you
can ask for help.

*Comment by DocKimbel:* For the record, most of
`to <datatype!> <string!>` converters are not yet implemented. It works
for `to-integer` and `to-float`. `load` provides a good alternative in
the meantime.

------------------------------------------------------------------------

## Comments on question
