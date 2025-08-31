
#710: large and not so large number math return unexpected results
================================================================================
Issue is closed, was reported by shishini and has 6 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/710>

red>> 27847278432473892748932789483290483789743824832478237843927849327492 \* 4932948478392784372894783927403290437147389024920147892940729142
== 1328642520
red>> 74789 \* 849032
== -926255192

The above results are obviously wrong,
it would be best of course if red can handle bignumbers
but if not, at least raise an error



Comments:
--------------------------------------------------------------------------------

On 2014-03-04T22:24:14Z, dockimbel, commented:
<https://github.com/red/red/issues/710#issuecomment-36686315>

    Bignumbers support is planned, but will be added after 1.0 version. In the meantime, the lexer should just return a syntax error.

--------------------------------------------------------------------------------

On 2016-09-12T04:41:53Z, rebolek, commented:
<https://github.com/red/red/issues/710#issuecomment-246244625>

    Current 0.6.1 behaviour:
    
    ```
    red>> 27847278432473892748932789483290483789743824832478237843927849327492 * 4932948478392784372894783927403290437147389024920147892940729142
    
    == 1.373691897708523e131
    red>> 74789 * 849032
    *** Math Error: math or number overflow
    *** Where: *
    ```
    
    Not consistent, IMO. It should work or error out for both cases.

--------------------------------------------------------------------------------

On 2018-12-04T16:04:07Z, hiiamboris, commented:
<https://github.com/red/red/issues/710#issuecomment-444154124>

    I disagree.
    27847278432473892748932789483290483789743824832478237843927849327492 and such literals are loaded as a float64. Multiplying them is another float64.
    74789 and 849032 literals are loaded as integers, and multiplying them is expected to be an integer. So an overflow is expected.
    
    Fighting a silent integer to float promotion will be difficult. While manual promotion when one really requires it is as simple as `74789 * to-float 849032`.

