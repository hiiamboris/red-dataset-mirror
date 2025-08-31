
#2526: to binary! encodes U+D800 to U+DFFF in UTF-8 although these are not characters
================================================================================
Issue is closed, was reported by meijeru and has 6 comment(s).
[type.documentation]
<https://github.com/red/red/issues/2526>

I looked it up on Wikipedia:
[quote]
The Unicode standard permanently reserves these code point values for UTF-16 encoding of the high and low surrogates, and they will never be assigned a character, so there should be no reason to encode them. The official Unicode standard says that no UTF forms, including UTF-16, can encode these code points.
However UCS-2, UTF-8, and UTF-32 can encode these code points in trivial and obvious ways, and large amounts of software does so even though the standard states that such arrangements should be treated as encoding errors.
[unquote]
The user should therefore beware that the UTF-8 values for these Unicode code points, as produced by `to binary!`, do not represent valid characters. 


Comments:
--------------------------------------------------------------------------------

On 2017-04-06T04:41:38Z, dockimbel, commented:
<https://github.com/red/red/issues/2526#issuecomment-292067239>

    Why is that an issue ticket? What do you want us to do about it?

--------------------------------------------------------------------------------

On 2017-04-06T08:15:13Z, meijeru, commented:
<https://github.com/red/red/issues/2526#issuecomment-292101919>

    Probably just a warning in the docs...

--------------------------------------------------------------------------------

On 2017-07-28T16:50:11Z, dockimbel, commented:
<https://github.com/red/red/issues/2526#issuecomment-318705300>

    I'm closing the ticket as there is no docs yet where to write any warning.

