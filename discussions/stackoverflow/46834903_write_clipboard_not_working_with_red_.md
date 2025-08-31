# write clipboard:// not working with red?

**Link:**
<https://stackoverflow.com/questions/46834903/write-clipboard-not-working-with-red>

**Asked:** 2017-10-19 16:43:26 UTC

------------------------------------------------------------------------

It works with Rebol but not with Red ? Is there a way to make it work ?
I tried source clipboard under Rebol to get source code but doesn\'t
work.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by sqlab

    >> help clip
       read-clipboard  routine!      []
       write-clipboard routine!      [data [string!]]

(As long as full I/O is not implemented) use write-clipboard

------------------------------------------------------------------------

## Comments on question

*Comment by Geeky I:* Need `port!`s support for that style
