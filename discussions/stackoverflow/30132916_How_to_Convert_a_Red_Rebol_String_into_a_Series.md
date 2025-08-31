# How to Convert a Red/Rebol String into a Series

**Link:**
<https://stackoverflow.com/questions/30132916/how-to-convert-a-red-rebol-string-into-a-series>

**Asked:** 2015-05-08 21:11:20 UTC

------------------------------------------------------------------------

I would like to know if there is a way to convert a string into a
series. I\'m trying to extract data using parse, and I want to break
some of that captured data down into smaller fragments so that I can do
IF, CASE or SWITCH statement.

Below is a bit of code.

    ; A line of text with simple markup
    current-line: {[chapter 1] The Wanderer}

    ; Parse the current line of input
    parse current-line [
      "["
      copy tag to "]"
      skip
      copy rest-of-line to end
    ]

    ; Just some output to see if i captured data properly
    print ["Extracted: " tag]
    print ["Rest of line: " rest-of-line]

    ; The statements below both execute
    ; but the second one definitely shouldn't execute.
    if [find tag  "chapter"] [print "The tag is chapter."]
    if [find tag  "list"]    [print "The tag is list."]

As I understand, \"find\" works on a series, which may be the reason why
those if statements are not giving the result I was expecting. However
the variable \"tag\" is just a string.

Is there a way to convert a string into a series? Or are there any
functions that work on strings to find substrings?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by Izkata

In Rebol, string! is a subtype of series!, so anything that works on a
series! will accept a string!:

    >> X: {Foo}
    == "Foo"
    >> type? X
    == string!
    >> series? X
    == true

    >> find X {o}
    == "oo"

The first argument to \'if is treated as a logic!, but you\'re passing
in a block! - this will always be true:

    >> to-logic []
    == true

What you want to do is evaluate the find before passing it to if. Just
remove the `[` and `]`:

    if find tag  "chapter" [print "The tag is chapter."]
    if find tag  "list"    [print "The tag is list."]

------------------------------------------------------------------------

### Answer (score: 2) --- by HostileFork says dont trust SE

> The statements below both execute, but the second one definitely
> shouldn\'t execute.
>
>     if [find tag  "chapter"] [print "The tag is chapter."]
>     if [find tag  "list"]    [print "The tag is list."]

This is a very common new-user issue, and understandably so.

A key thing to remember about BLOCK! is that a block is \"just data\"
unless you (or a function you call) \"bring that block to life\" by
executing it with DO. Look at the help for IF:

    >> help if

    USAGE:
        if cond then-blk

    DESCRIPTION:
        If condition is true, evaluate block; else return NONE.
        if is of type: native!

    ARGUMENTS:
        cond [any-type!]
        then-blk [block!]

You must pass the THEN-BLOCK in as a value, because whether it will be
\"brought to life\" and run by IF depends on whether the condition is
true or not. IF has to make the decision of whether to DO that block or
not.

But the first argument to IF is the condition. Regardless of whether the
condition winds up being true or false, it has to be run each time the
IF statement is hit. Hence, there is no \"boilerplate\" of a block on
the condition. This lack of boilerplate means that if you pass a
block-as-data to it, then the question comes down to \"is a block of
data, seen as a value, true or false?\" Well\...it is true:

    >> true? [some arbitrary block]
    == true

In fact, all values are considered \"conditionally true\" except for a
NONE! value or a LOGIC! false. Even zero is true:

    >> if 0 [print "Almost absolutely every value is true!"]

    Almost absolutely every value is true! 

Hence, you don\'t want to put your condition in a square-bracket block.
Either leave it off, or you can use a parentheses block \"group\".
Parentheses do evaluate, but isolates the evaluated part, which can help
you isolate subexpressions for purposes like precedence or argument
checking. So:

    if find tag "chapter" [print "The tag is chapter."]
    if (find tag "list") [print "The tag is list."]

Hopefully that makes some sense, but you always have to be thinking
about the evaluation model to understand the motivation to use blocks or
not. For instance, a WHILE loop is different from an IF because it needs
to run the condition multiple times.

    >> x: 0
    >> while x < 2 [ 
        print x 
        x: x + 1 
    ]

    *** Script error: while does not allow logic for its cond argument

When WHILE was defined, it must take a block for the condition. Because
otherwise the WHILE function would get its first parameter evaluated to
TRUE, and then not have the `x < 2` expression to evaluate each time
through the loop. So:

    >> x: 0
    >> while [x < 2] [ 
        print x 
        x: x + 1 
    ]

    0
    1

You\'re likely to make mistakes with it; it\'s especially easy to do so
if you convert a WHILE into an IF. Yet although IF *could* have been
styled to enforce a boilerplate block around its condition *(even if it
isn\'t necessary for something that evaluates the condition one time)*,
fighting back against boilerplate where unnecessary is one of the goals
of the system.

The good news is that there is a logic and rule behind it\...which once
grasped, you can use to make your own loop constructs and more.
\"Madness, but there is a method to it.\" :-)

> I would like to know if there is a way to convert a string into a
> series. I\'m trying to extract data using parse, and I want to break
> some of that captured data down into smaller fragments so that I can
> do if, case or switch statement.

In the terminology as it stands today (which can be a bit confusing in
some other cases), a STRING! is already a member of the SERIES! typeset.
Which is to say that you can perform operations like picking elements
out of it with FIRST or SECOND, or traversing it with NEXT, etc. That\'s
what a SERIES is.

------------------------------------------------------------------------

## Comments on question
