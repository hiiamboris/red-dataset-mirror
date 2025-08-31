# Read https://google.com doesn&#39;t work anymore in Red?

**Link:**
<https://stackoverflow.com/questions/47108274/read-https-google-com-doesnt-work-anymore-in-red>

**Asked:** 2017-11-04 06:49:45 UTC

------------------------------------------------------------------------

Weird, Read
[https://google.com](https://google.com){rel="nofollow noreferrer"} had
been working, and today it doesn\'t work anymore:

> > read
> > [https://google.com](https://google.com){rel="nofollow noreferrer"}
> > \*\*\* Access Error: invalid UTF-8 encoding: #{E9206E27}

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

That\'s a long time known issue with pages with invalid / different utf
implementations. This can help

    convert-invalid: function [page] [
        collect/into [foreach c page [keep to-char c]]  clear ""
    ]

    >> convert-invalid read/binary https://google.com
    == {<!doctype html><html itemscope="" itemtype="http://schema.org/Web...

*Comment by user310291:* It DID work so it\'s not such long time issue.
Google must have changed something. On some sites also.

------------------------------------------------------------------------

## Comments on question

*Comment by HostileFork says dont trust SE:* If something is clearly (or
likely) transient, the value over time of putting it on StackOverflow as
\"institutional knowledge\" is low. It is probably a fit [for a bug
tracker](https://github.com/red/red/issues){rel="nofollow noreferrer"}
or just to go ask about it in [Red\'s chat
rooms](https://gitter.im/red/home){rel="nofollow noreferrer"}. Remember
that the \"long tail\" of value of StackOverflow isn\'t for the
questioner: it\'s whether that question is likely to be useful for
future users.
