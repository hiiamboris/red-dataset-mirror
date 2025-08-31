# Red language application executable crashing while interpreted one works

**Link:**
<https://stackoverflow.com/questions/46729561/red-language-application-executable-crashing-while-interpreted-one-works>

**Asked:** 2017-10-13 12:06:25 UTC

------------------------------------------------------------------------

I am trying to create a small gui application having about 30 fields
where users can enter data and a button which will save the data. It
works all right when I run it with command:

    red-063 myappl.r

Then I created its executable using following command:

    red-063 -c -r -t windows myappl.r

However, this executable crashes whenever save button is pressed. There
is no error message. On running in Linux using `wine`, I get following
message on crashing:

    *** Runtime Error err:seh:raise_exception Unhandled exception code c0000005 flags 0 addr 0x417374

The application needs `'View` hence cannot be compiled for Linux.

Where is the problem and how can it be solved? Thanks for your help.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

## Comments on question

*Comment by sqlab:* Try to use the **-d** debug option when compiling,
but bear in mind that Red is still alpha

*Comment by sqlab:* If this does not help, generate a minimal program
that shows the crash and submit it on
[gitter.im/red/bugs](https://gitter.im/red/bugs){rel="nofollow noreferrer"}

*Comment by rnso:* It is still crashing without any error message.

*Comment by HostileFork says dont trust SE:* The proper place to raise
bug reports is on [Red\'s issue
tracker](https://github.com/red/red/issues){rel="nofollow noreferrer"}.
But there (as here), you should always provide a [Minimal, Complete,
Verifiable Example](https://stackoverflow.com/help/mcve).

*Comment by rnso:* While trying to make a minimal example I removed many
print and probe commands which I had included for debugging and that
seems to have cured the problem! Thank you all for your help.

*Comment by Geeky I:* Please report it as crash with code tho on bug
tracker. It\'s important for red\'s development
