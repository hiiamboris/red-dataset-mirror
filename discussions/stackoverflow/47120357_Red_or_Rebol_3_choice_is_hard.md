# Red or Rebol 3: choice is hard

**Link:**
<https://stackoverflow.com/questions/47120357/red-or-rebol-3-choice-is-hard>

**Asked:** 2017-11-05 10:10:57 UTC

------------------------------------------------------------------------

I have tested Red, as for the language It\'s easy enough as it doesn\'t
differ much from Rebol. But I really miss some console features, the
most annoying for me is

red \--do and autoloading script

which are missing. Are they planned ?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 4) --- by DocKimbel

A `--do` command-line feature is planned for 0.6.4. Autoloading script
is not planned for now, as it represents a potentially big security
hole. Moreover, in Red, you can easily compile your own Red console for
running your scripts, and include there whatever Red code you want
integrated. You would need to download Red
[sources](https://github.com/red/red){rel="nofollow noreferrer"} for
that, then from the repo\'s root folder:

    red -r %environment/console/console.red

You can edit the `%console.red` script to include whatever you want.

------------------------------------------------------------------------

## Comments on question

*Comment by HostileFork says dont trust SE:* Seriously, please consider
taking these kinds of discussion oriented questions [to Red\'s
chat](https://gitter.im/red/home){rel="nofollow noreferrer"} or [here on
the Rebol chat](https://chat.stackoverflow.com/rooms/291/rebol).
StackOverflow is not the appropriate venue, and your reputation is high
enough I would think you must have a sense of this by now.
