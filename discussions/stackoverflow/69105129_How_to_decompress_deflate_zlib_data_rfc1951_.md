# How to decompress/deflate zlib data \[rfc1951\]?

**Link:**
<https://stackoverflow.com/questions/69105129/how-to-decompress-deflate-zlib-data-rfc1951>

**Asked:** 2021-09-08 14:40:33 UTC

------------------------------------------------------------------------

I am looking for decompressing data according to the deflate compression
mechanism \[rfc1951\].

The linux command for this mechanism is: zlib-flate -uncompress

I try the Red command decompress with refinements deflate , but it
crashes or the result is wrong (it looks like a crash or a memory dump).

Is there a sample to use decompress/deflate ?

    >> type? b1
    == binary!
    >> length? b1
    == 326
    >> decompress/deflate b1 326

    *** Runtime Error 16: invalid virtual address
    *** at: 080AB560h

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 0) --- by 9214

Unfortunately, at the time of writing, Red\'s implementation of DEFLATE
is buggy and likely won\'t be able to decompress data that it itself did
not compress.

If you still experience this crash with the [latest Linux
build](https://static.red-lang.org/dl/auto/linux/red-latest){rel="nofollow noreferrer"},
please file a
[ticket](https://github.com/red/red/issues){rel="nofollow noreferrer"}
for it.

*Comment by user16861490:*
`Red 0.6.4 for Linux built 22-Nov-2018/2:40:38+02:00 commit #755eb94`
does not generate an error to decompress \... but in my test case, it
generates 4 extra bytes compared with the linux command
`zlib-flate -uncompress`. PS `decompress/zlib` and
`decompress/zlib/deflate` output the same result.

------------------------------------------------------------------------

## Comments on question

*Comment by aMike:* I know it\'s not much help, but it works OK on macos
10.14.6 with Red 0.6.4 build 2-July-2021. I was able to `compress/flate`
a string, and then `decompress/deflate` the binary object. Maybe get the
latest distribution from the site? Or see if an older release worked?
