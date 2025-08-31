
#773: Correctly handle UTF-8 in DEHEX
================================================================================
Issue is closed, was reported by earl and has 4 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/773>

Currently, DEHEX seems to treat some percent-encoded values as Latin1 (or direct Unicode codepoint values < 127, which is the same): one example is 0xB2, which when decoded using Latin1 is "²", U+00B2, "Superscript two". On the other hand, e.g. 0xCE is not decoded by dehex at all (by the same codepoint/Latin1 logic, it would be "Î", U+00CE, "Latin capital letter i with circumflex). Even Ignoring the inconsistency as an implementation artifact, mapping percent-escaped values 1:1 to Unicode codepoints is undesirable.

As percent-encoding is originally and primarily an escaping mechanism used in URIs, I think DEHEX should adhere to the URI percent encoding rules. In modern URI schemes, characters are UTF-8 encoded first, then percent-escaped. So decoding in DEHEX should do the reverse: percent-decode first, and then UTF-8 decode.

```
red>> dehex "a%ce%b2c"
== "a%ce²c"  ;; Expected: "aβc"
```

If that's deemed too complex to be done right away, a stop-gap measure towards full UTF-8 support could make DEHEX simply error out for any non ASCII (>0x7F) percent-encodings.

See also #772 for earlier discussion, and [CureCode issue #1986](http://issue.cc/r3/1986) for the related discussion in Rebol 3.



Comments:
--------------------------------------------------------------------------------

On 2014-04-13T15:53:13Z, dockimbel, commented:
<https://github.com/red/red/issues/773#issuecomment-40310928>

    These are valid concerns, sorry for merging/closing #772 too early, before deciding on how to handle  the decoding in a Unicode context.
    
    I agree about the double decoding you are proposing. 
    
    We need to come up with the best memory-efficient strategy for handling it (like if possible avoiding an intermediary buffer that would need to be discarded later). @qtxie do you have a proposition for how to best implement that?

--------------------------------------------------------------------------------

On 2014-04-13T16:12:12Z, earl, commented:
<https://github.com/red/red/issues/773#issuecomment-40311397>

    No worries, I think merging #772 right away was fine. It's a living code base, we can start with things even before they are perfect, and work out the kinks as we move along.

