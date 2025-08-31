# How to break out in red console?

**Link:**
<https://stackoverflow.com/questions/47133100/how-to-break-out-in-red-console>

**Asked:** 2017-11-06 08:59:32 UTC

------------------------------------------------------------------------

I have a long loop in a script I debug with

    some code
    ask "..."
    next code

Crtl + C or Esc in Red console doesn\'t break out of it. I have to close
the console and reopen it.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by DocKimbel

Support for ESC in the input handler is [not
implemented](https://github.com/red/red/issues/1844){rel="nofollow noreferrer"}
yet.

------------------------------------------------------------------------

### Answer (score: 2) --- by sqlab

You can help yourself with **break** or with any intended error e.g.

     if "^[" = ask ".." [return]

Then you will fall back to the console

------------------------------------------------------------------------

## Comments on question
