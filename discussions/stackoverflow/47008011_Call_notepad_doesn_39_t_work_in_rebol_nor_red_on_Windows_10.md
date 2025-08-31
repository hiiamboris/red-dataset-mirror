# Call notepad doesn&#39;t work in rebol nor red on Windows 10

**Link:**
<https://stackoverflow.com/questions/47008011/call-notepad-doesnt-work-in-rebol-nor-red-on-windows-10>

**Asked:** 2017-10-30 04:07:52 UTC

------------------------------------------------------------------------

I type this in console:

call \"notepad.exe\"

It returns a number but notepad is not launched.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by DocKimbel

By default, `call` will hide the child process window, as it is often a
system shell window. Use the `/show` refinement to force the called
process to display its window:

    call/show "notepad.exe"

------------------------------------------------------------------------

## Comments on question
