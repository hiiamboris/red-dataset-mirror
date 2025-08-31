
#2430: write/lines only writes end-of-lines if argument is block
================================================================================
Issue is closed, was reported by meijeru and has 0 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/2430>

Calling write/lines with a single string does not add CRLF, whereas calling it with a block of strings adds a CRLF after every string. In Rebol2, CRLF is also added after a single string is written.


