
#4308: random: inconsistency between integer and tuple regarding inclusion of 0
================================================================================
Issue is closed, was reported by loziniak and has 16 comment(s).
<https://github.com/red/red/issues/4308>

When randomizing integers, 0 is not included, but with tuple, it is. Compare results:
```
>> loop 100 [prin [random 3 " "]]
3  2  3  3  3  2  1  1  3  3  3  2  1  2  3  1  2  1  3  2  3  3  2  1  3  1  2  3  1  2  2  1  1  1  1  1  2  2  2  1  3  2  2  1  2  3  3  2  2  1  1  1  1  2  1  3  2  3  2  3  2  2  2  1  1  1  2  1  1  3  2  3  3  1  1  1  1  2  2  2  3  2  2  2  3  1  2  3  1  1  2  3  1  2  2  2  3  3  1  3 
```
```
>> loop 100 [prin [random 3.3.3 " "]]
0.2.2  2.0.2  0.2.0  2.0.2  3.3.1  0.0.2  0.1.0  1.2.2  0.3.1  0.1.0  2.1.0  0.3.0  2.0.3  0.1.2  0.2.1  0.3.3  3.2.1  3.1.1  2.2.0  3.1.2  3.3.1  0.0.1  3.2.0  2.3.0  3.0.3  2.1.3  2.0.3  3.3.3  1.0.1  0.3.2  0.2.3  1.0.1  1.0.1  1.1.0  2.0.0  1.2.1  0.1.0  0.1.0  2.0.0  2.3.0  3.1.2  2.0.2  1.1.0  2.1.2  1.0.0  2.1.3  1.3.0  3.1.0  3.0.1  0.2.0  3.1.3  3.1.2  2.0.2  3.2.3  0.1.2  3.2.1  2.3.3  1.3.3  1.1.3  3.1.3  1.2.3  2.0.1  0.3.0  2.1.2  0.2.2  2.3.0  3.3.2  3.1.2  0.1.2  1.2.0  0.2.0  2.3.3  0.0.3  2.2.2  2.1.0  1.3.2  2.0.1  0.1.2  1.3.1  1.2.2  1.3.1  0.2.3  2.1.0  0.3.1  3.3.0  1.3.1  1.1.2  0.0.0  2.2.3  2.2.3  0.2.2  0.1.2  3.1.2  0.2.2  1.0.3  1.2.2  1.2.1  1.1.2  3.0.0  2.0.3 
```
I'd expect either including 0 in `integer!` results, or not including 0 in `tuple!` results.


Comments:
--------------------------------------------------------------------------------

On 2020-02-28T11:32:39Z, hiiamboris, commented:
<https://github.com/red/red/issues/4308#issuecomment-592474545>

    > not including 0 in tuple! results
    
    That would be unacceptable ;)

--------------------------------------------------------------------------------

On 2020-02-28T11:36:09Z, meijeru, commented:
<https://github.com/red/red/issues/4308#issuecomment-592475690>

    An interesting question. It is clearly a design choice. If one interprets `random 3` as "pick one at random from 3 items (labeled 1 2 and 3)" then the current design choice makes sense. If one wants `random 3` to mean "pick a value guaranteed not to be bigger than 3", one is better off with `random 3.0`. The consistency argument seems to be of lesser value to me, since I anyhow agree with the design choice for tuples.

--------------------------------------------------------------------------------

On 2020-02-28T13:06:25Z, meijeru, commented:
<https://github.com/red/red/issues/4308#issuecomment-592504323>

    Further to the above: should the range of values of `random 3.0` include `3.0` itself? Is the current algorithm capable of doing that?

--------------------------------------------------------------------------------

On 2020-02-28T14:15:37Z, loziniak, commented:
<https://github.com/red/red/issues/4308#issuecomment-592531331>

    Yes, it includes 3.0, as well as 0.0. Algorithm takes random integer (max value is 2147483647, and min is 0) and divides it by 2147483647.0, then multiplies by `random`'s argument.

--------------------------------------------------------------------------------

On 2020-02-28T19:22:44Z, greggirwin, commented:
<https://github.com/red/red/issues/4308#issuecomment-592685932>

    @loziniak the current behavior is by design for both. `Random` for tuples is based on single bytes, and and their range is 0-255. Random with integers is handy for use with `pick` and series, where a zero result would be invalid. Negatives int ranges also don't include zero. It's interesting to note that char values don't include zero either, even though the null char is valid. Their range extends beyond bytes, which may be the reason, but that's something to consider, or at least document.

--------------------------------------------------------------------------------

On 2020-02-28T21:43:56Z, meijeru, commented:
<https://github.com/red/red/issues/4308#issuecomment-592742755>

    I have updated the spec document to give the most precise description of random's action.

--------------------------------------------------------------------------------

On 2020-02-29T19:36:29Z, greggirwin, commented:
<https://github.com/red/red/issues/4308#issuecomment-592986368>

    :+1: For those who don't know, @meijeru's spec is here: https://github.com/meijeru/red.specs-public/blob/master/specs.adoc

--------------------------------------------------------------------------------

On 2020-02-29T23:33:04Z, loziniak, commented:
<https://github.com/red/red/issues/4308#issuecomment-593005869>

    Thanks, guys, for explanation. Digging through the code, I noticed that only `tuple!` code is different, and that it's just by move of a parenthesis. Which could be a bug. Perhaps I should ask on Gitter first.

