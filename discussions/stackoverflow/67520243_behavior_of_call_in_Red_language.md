# behavior of call in Red language

**Link:**
<https://stackoverflow.com/questions/67520243/behavior-of-call-in-red-language>

**Asked:** 2021-05-13 13:39:28 UTC

------------------------------------------------------------------------

On Red console, I tried the following commands:

    >> (print 0 call/shell/wait "sleep 5" print 5)

I think `0` would be printed first. After 5 seconds delay, `5` would
then be printed. In fact, both 0 and 5 were printed after delay of 5s.
Why?

Note: `sleep.exe` is an external command.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by DocKimbel

The Red GUI console is buffering output too aggressively in order to
provide fast output. A
[fix](https://github.com/red/red/commit/a15845a9c621c17b3168c1af4ebd42769c6ec893){rel="nofollow noreferrer"}
was just pushed, so it should now behave as you expect.

BTW, you don\'t need to enclose the whole line in `(..)`, it does not
change anything in the way that code line will be processed.

*Comment by lyl:* How to use the `fix` you mentioned in my case?

*Comment by DocKimbel:* Just download the latest binary version under
section \"Automated builds\" from the official [download
page](https://www.red-lang.org/p/download.html){rel="nofollow noreferrer"},
or pull the changes from [Red
repo](https://github.com/red/red){rel="nofollow noreferrer"} on Github,
then manually rebuild a console.

------------------------------------------------------------------------

## Comments on question
