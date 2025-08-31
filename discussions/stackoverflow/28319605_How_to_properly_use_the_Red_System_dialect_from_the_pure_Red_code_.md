# How to properly use the Red/System dialect from the pure Red code?

**Link:**
<https://stackoverflow.com/questions/28319605/how-to-properly-use-the-red-system-dialect-from-the-pure-red-code>

**Asked:** 2015-02-04 10:57:17 UTC

------------------------------------------------------------------------

I am writing a simple tutorial application using curses binding to
Red/System. Doing it like it is shown in \"curses-example.reds\" works
great. But how can I use this binding from a pure Red code? Did I get
the whole approach wrong and I really must stay within borders of
Red/System dialect?

The code is as simple as it could be:

    Red/System [
        File:    "%test.reds"
    ]

    #include %curses/curses.reds

    with curses [
        initscr
        getch
        endwin
    ]

How I can properly do a two-way date exchange between Red/System and
Red? I did not get it pretty good from the answer to
[this](https://stackoverflow.com/questions/26848718/how-to-get-values-from-the-red-system-parts-in-a-red-file)
question.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by Peter W A Wood

Currently, to use Red/System Code from a Red program you need to use a
routine! -
[http://www.red-lang.org/search/label/routine](http://www.red-lang.org/search/label/routine){rel="nofollow"}

At the moment, only integer! and logic! values can be passed
transparently between Red and Red/System. Other datatypes have to be
converted, inside the routine, to be usable.

For example, if you have a string! datatype as a parameter of a routine,
Red will pass the data to the routine as a red-string! structure:

    red-string!: alias struct! [
        header  [integer!]          ;-- cell header
        head    [integer!]          ;-- string's head index (zero-based)
        node    [node!]             ;-- series node pointer
        cache   [c-string!]         ;-- (experimental)
    ]

It needs to be converted to a Red/System c-string! before you can use it
in the routine. At the same time, you must cater for the encoding
differences between Red string!s and Red/System c-string!s. A red
string! may be ISO-8559-1, UCS-2 or UTF-32 encoded.

You must cater for the opposite if you wish to return a string! to a Red
program from a routine.

Other datatypes will need to be handled in similar ways.

I\'m sure that passing values between Red and Red/System will be made
much, much easier in future. However, I wouldn\'t personally expect that
until after Red reaches version 1.0.

------------------------------------------------------------------------

### Answer (score: 1) --- by iArnold

First make your code Red code not Red/System. Next try to stay as close
as possible to the examples from the blog on the red-lang.org site. You
need to look for routine.

I want to say a special thank you to the person that has voted my answer
down.

*Comment by Ivan Sukin:* I was asking assuming that simply changing
Red/System to Red in the declaration does not work.

*Comment by iArnold:* Right, that change alone will not cut the deal. I
did a video explaining how this works.

------------------------------------------------------------------------

## Comments on question
