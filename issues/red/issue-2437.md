
#2437: Parse infinite loop using [TO/THRU :word]
================================================================================
Issue is closed, was reported by pekr and has 2 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/2437>

Posting a ticket for an issue found by HF: 

`s: copy "abcd" parse s [x: "ab" thru :s "bcd"]`  ... causes an infinite loop, whereas:

`s: copy "abcd" parse s [x: "ab" thru :s "abcd"]` ... returns true

-pekr-


Comments:
--------------------------------------------------------------------------------

On 2017-02-15T05:58:33Z, geekyi, commented:
<https://github.com/red/red/issues/2437#issuecomment-279924344>

    .. Maybe caused by including what is being parsed in the rules? 

