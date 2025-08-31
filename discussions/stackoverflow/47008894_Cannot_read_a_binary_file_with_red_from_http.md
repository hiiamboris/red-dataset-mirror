# Cannot read a binary file with red from http

**Link:**
<https://stackoverflow.com/questions/47008894/cannot-read-a-binary-file-with-red-from-http>

**Asked:** 2017-10-30 05:57:47 UTC

------------------------------------------------------------------------

    write %test.zip read/binary https://sourceforge.net/projects/agena/files/latest/download?source=directory?SetFreedomCookie

doesn\'t download the file because there is a redirect. Is there a way
to tell to follow redirect before reading ?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

## Comments on question

*Comment by rgchris:* Red\'s READ does follow redirects, but doesn\'t
appear to do so correctly in this instance. You could use CURL via CALL
using the `-L` flag to follow the redirect.

*Comment by user310291:* \@rgchris I tried to do so but something must
be missing in my syntax
[stackoverflow.com/questions/47041154/...](https://stackoverflow.com/questions/47041154/call-curl-from-rebol-or-red-doesnt-work "call curl from rebol or red doesnt work")
