
#2253: MODULUS fails with a sufficiently large number
================================================================================
Issue is closed, was reported by dsunanda and has 2 comment(s).
[status.tested] [type.bug] [status.resolved]
<https://github.com/red/red/issues/2253>

red>> 3151391351465.994 // 1.0
== 0.994140625
red>> 3151391351465.995 // 1.0
**\* Script Error: < does not allow logic! for its value1 argument
**\* Where: <
red>> 



Comments:
--------------------------------------------------------------------------------

On 2016-10-03T10:40:32Z, rebolek, commented:
<https://github.com/red/red/issues/2253#issuecomment-251076393>

    Thanks for report! It seems that #1515 is not fully fixed yet.

