# save to disk in append mode

**Link:**
<https://stackoverflow.com/questions/31210459/save-to-disk-in-append-mode>

**Asked:** 2015-07-03 15:46:57 UTC

------------------------------------------------------------------------

`save` is used to store data in a format more directly usable by REBOL,
as stated
[here](http://learnrebol.com/rebol3_book.html#section-13){rel="nofollow"}
`write` has an append mode but it saves data in a raw mode.

My application needs to save a block of data (as a `map!`) to disk. Each
couple of seconds it will generate a new element, up to tens of thousand
of elements.

So, my question. I can `save` the whole data each couple of seconds. But
I\'d like to know if I can append the new elements to disk using the
`save` command or `save` format. I guess that I could mimic the `save`
format using the `write` command in `/append` mode. Is this the best
solution, or is there another one I don\'t know?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by rebolek

`save` is a mezzanine function, that is basically `write mold`. So it\'s
possible to mimic the `save` function using `write` or it\'s possible to
update `save` function to support `/append` refinement.

------------------------------------------------------------------------

## Comments on question
