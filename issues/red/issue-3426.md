
#3426: Setting a bit in a bitset to a float value should follow the same rules as for integer value
================================================================================
Issue is closed, was reported by meijeru and has 12 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/3426>

### Expected behavior

If one allows to set a single bit in a bitset using a value other than `true` or `false`, its interpretation should be the result of applying `to-logic` to that value.
Correction in light of discussion below: `make logic!` is the preferred interpretation.

### Actual behavior

Values `0` and `none` are interpreted as `false`, all others are `true`. This is not according to `make logic!`, but rather arbitrary.
### Steps to reproduce the problem
```
>> b: charset ""
== make bitset! #{00}
>> b/0: 0.0
== 0.0
>> b/0
== true
>> b/0: 0
== 0
>> b/0
== false
```
Note that `to-logic! 0` and `0.0` both are `true`, and `make logic! 0` and `0.0` both are `false`.
### Red and platform version
```
all
```


Comments:
--------------------------------------------------------------------------------

On 2018-06-22T02:42:22Z, greggirwin, commented:
<https://github.com/red/red/issues/3426#issuecomment-399303558>

    Bits, being technically 0 or 1, seem OK here. Not quite arbitrary. It's an easy rule to understand, even if a bit, er, different from normal logic conversions. The alternative will make setting bits based on 0/1 worse IMO.

--------------------------------------------------------------------------------

On 2018-06-22T08:44:26Z, meijeru, commented:
<https://github.com/red/red/issues/3426#issuecomment-399369253>

    Components of bitsets are of `logic!` type (try `get` and you will see). Permitting `0/1` should be OK and `make logic!` (rather than `to logic!`) will correctly convert these, but permitting any other value (except of course `none`) should NOT be OK, and accepting `0.0` as `true` is misleading, to say the least, given that `make logic! 0.0` is `false` - corresponding to intuition. Why not reject anything other than `0/1`?

--------------------------------------------------------------------------------

On 2018-06-22T15:37:43Z, greggirwin, commented:
<https://github.com/red/red/issues/3426#issuecomment-399484116>

    The current behavior is by design, whether for intent or conciseness of code. In researching that, as if often the case, it leads to a new question. 
    
    Internally, the set-path, whether for integer or char indexes, delegates to `poke` internally. If we want to make the change, *that* is where we should change it, so it's consistent there as well.
    
    R2 doesn't support `poke` on bitsets at all, while R3 only uses `false` and `none` for clearing bits. `0` sets a bit. 
    
    *If we document the current behavior*, what is the risk, aside from offending our sensibilities in terms of consistency with `make logic!`? It's easy to explain that `0` is a special case, because they're bits. OTOH, since it doesn't make much sense to use other values directly, being explicit shouldn't hurt too badly. It will be a small extra performance hit, as more checking needs to be done. Conversely, nothing stops anyone from adding more checks, or casting to logic explicitly when assigning. This puts the power in their hands, and may align better with Red's overall flexibility. That is, people need to know how things work, but the shortest code necessarily makes more assumptions.

--------------------------------------------------------------------------------

On 2018-06-23T12:28:04Z, meijeru, commented:
<https://github.com/red/red/issues/3426#issuecomment-399674046>

    @greggirwin See my personal reply

--------------------------------------------------------------------------------

On 2019-09-10T12:28:31Z, dockimbel, commented:
<https://github.com/red/red/issues/3426#issuecomment-529911620>

    It should follow the rules of `make logic!`.

--------------------------------------------------------------------------------

On 2019-09-10T12:42:26Z, dockimbel, commented:
<https://github.com/red/red/issues/3426#issuecomment-529916479>

    I have changed the title, as you are generalizing from a specific case.

