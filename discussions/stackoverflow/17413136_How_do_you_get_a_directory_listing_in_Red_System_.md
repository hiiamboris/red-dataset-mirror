# How do you get a directory listing in Red/System?

**Link:**
<https://stackoverflow.com/questions/17413136/how-do-you-get-a-directory-listing-in-red-system>

**Asked:** 2013-07-01 20:30:47 UTC

------------------------------------------------------------------------

I\'ve tried to include Kaj de Vos\'s excellent C library binding
available in ANSI.reds, but still cannot find a way to read a directory
listing.

I thought that maybe if I could read the . file in binary, I could parse
it, but I just get back a NULL pointer:

    sizedir: 0
    dir: read-file-binary "my-dir/." :sizedir
    print-line dir

If I try reading it as a text file, I get a:

    *** Runtime Error 1: access violation
    *** at: 0040152Eh

Any ideas?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by Kaj de Vos

A piece of additional code and definitions needs to be written to read
the directory structure and interpret it. It\'s tricky, because it\'s
partly system dependent, so it goes beyond the ANSI part of my C library
binding. Also, to achieve a higher abstraction level on the way to the
directory functions in REBOL, you\'d have to think about extra data
structures that are not native to Red/System.

------------------------------------------------------------------------

## Comments on question
