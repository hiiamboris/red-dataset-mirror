# How do I save a Save/Load a text file in Red

**Link:**
<https://stackoverflow.com/questions/43727269/how-do-i-save-a-save-load-a-text-file-in-red>

**Asked:** 2017-05-01 22:11:52 UTC

------------------------------------------------------------------------

I already know how to do this, but I figured I would go ahead and ask
since the Rebol documentation is offline today and so in the future
others will have an easier time finding out how.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by DocKimbel

In a nutshell, use `read` for reading a text file (a string will be
returned) and `write` for writing a string down to a file. For example:

    write %hello.txt "Hello World!"
    print read %hello.txt

Such text-mode I/O relies on UTF-8 for reading/writing, other encodings
will be supported in the future.

Additionally, you can use `/binary` refinement for both functions to
switch to binary mode. You can also use the higher-level `load` and
`save` counterparts, which will try to encode/decode the data using one
of the available codecs (UTF-8 \<=\> Red values, JPG/PNG/GIF/BMP \<=\>
`image!` value).

Use `help` followed by a function name for more info.

------------------------------------------------------------------------

## Comments on question
