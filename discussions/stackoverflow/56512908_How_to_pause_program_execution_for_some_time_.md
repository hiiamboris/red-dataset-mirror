# How to pause program execution for some time?

**Link:**
<https://stackoverflow.com/questions/56512908/how-to-pause-program-execution-for-some-time>

**Asked:** 2019-06-09 07:59:00 UTC

------------------------------------------------------------------------

I\'m using \"Red Programming Language\" version \"0.6.4\" on Windows and
making a command line application.

I don\'t know much Red language and I don\'t understand many things. I
did go over \"work in progress\" docs at
([https://doc.red-lang.org/en/](https://doc.red-lang.org/en/){rel="nofollow noreferrer"})
before asking here.

I need to see the \"Something, something\...\" on the screen for a bit
(let\'s say 1 second) before the command prompt window closes.

    Red []

    ; do something
    print "Something, something..."

    ; pause 1 // not working
    ; sleep 1 // not working

    quit

As in the code comments I\'ve tried with `pause` or `sleep` but I get an
error `Script Error: sleep has no value`. How to make it sleep?

Thank you.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by MarkI

The function you are looking for is WAIT. Try `wait 1`.

------------------------------------------------------------------------

### Answer (score: 1) --- by draegtun

Using
[`WAIT`](http://www.rebol.com/r3/docs/functions/wait.html){rel="nofollow noreferrer"}
as prescribed by \@MarkI above is the correct answer.

But I wanted to add below which should really be a comment but it looks
nicer formatted!

The best way to explore Red/Rebol is via the console and making use of
[`HELP`](http://www.rebol.com/r3/docs/functions/help.html){rel="nofollow noreferrer"}

    >> help pause
    No matching values were found in the global context.

This means there is nothing defined for PAUSE (and ditto for
`help sleep`).

So instead quote the word and it will search through all defined
function documentation\...

    >> help "sleep"
    No matching values were found in the global context.

    >> help "pause"
    No matching values were found in the global context.

Still no luck :(

OK lets try something related\...

    >> help "time"
    ... long list found items...

This now returns all functions that have some connection to \"time\" in
their function spec/docs. In this list is `WAIT` function. However
another HELP clearly shows it\...

    >> help "duration"
         wait            native!       Waits for a duration in seconds or specified time.

Now we have it\...

    >> help wait
    USAGE:
         WAIT value

    DESCRIPTION:
         Waits for a duration in seconds or specified time.
         WAIT is a native! value.

    ARGUMENTS:
         value        [number! time! block! none!]

    REFINEMENTS:
         /all         => Returns all events in a block

Hope that helps.

------------------------------------------------------------------------

## Comments on question
