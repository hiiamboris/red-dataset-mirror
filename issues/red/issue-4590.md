
#4590: RANDOM -2147483648 hangs
================================================================================
Issue is closed, was reported by 9214 and has 2 comment(s).
[status.built] [status.tested] [type.bug]
<https://github.com/red/red/issues/4590>

**Describe the bug**
`random -2147483648` gets stuck in an infinite loop.

**To reproduce**
1. Get some tea or a cup of damn good Joe;
1. Type `random 1 << 31` in console;
1. Sip the brew, meditate, observe Red trying to spell out [無](https://en.wikipedia.org/wiki/Mu_(negative)).

**Expected behavior**
A random integer in `[-1, -2147483648]` range.

**Platform version**
30652909, W10.


Comments:
--------------------------------------------------------------------------------

On 2020-07-27T20:18:59Z, hiiamboris, commented:
<https://github.com/red/red/issues/4590#issuecomment-664616652>

    I suggest a special case for `random 80000000h` which would just `return not rand`, and smth alike in random/secure

