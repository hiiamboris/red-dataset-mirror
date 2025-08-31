
#2644: Inconsistency in integer! <-> logic!  conversion with MAKE
================================================================================
Issue is open, was reported by meijeru and has 10 comment(s).
[status.reviewed]
<https://github.com/red/red/issues/2644>

```
>> make integer! true
== 1
>> make float! true
*** Script Error: cannot MAKE/TO float! from: true
*** Where: make
>> make logic! 1
== true
>> make logic! 1.0
== true
```



Comments:
--------------------------------------------------------------------------------

On 2017-04-30T17:35:24Z, greggirwin, commented:
<https://github.com/red/red/issues/2644#issuecomment-298245543>

    `Float!` uses the same internal func (`to`) for both `to` and `make`. I learned that you can make a float from a block, which is really interesting. Making a float from a logic is another "does it make sense?" op, but the results can be clearly defined, and may be useful in certain cases. We can make a float from a char! as well, which makes just as much sense.

--------------------------------------------------------------------------------

On 2017-07-28T11:26:39Z, dockimbel, commented:
<https://github.com/red/red/issues/2644#issuecomment-318628514>

    See my comments and further discussion about that in #2465.

--------------------------------------------------------------------------------

On 2017-07-28T11:29:15Z, 9214, commented:
<https://github.com/red/red/issues/2644#issuecomment-318628914>

    @dockimbel #2645 `<>` #2465 ;-)

--------------------------------------------------------------------------------

On 2020-03-23T14:32:05Z, 9214, commented:
<https://github.com/red/red/issues/2644#issuecomment-602632289>

    Looking at the code, `0.0` and `0%` map to `false`, everything else maps to `true`, even things like `1.#INF` and `1.#NaN`. Fuzzy logic I'd say, and also a strict equivalent of a more sensible `zero? <float>`.

--------------------------------------------------------------------------------

On 2020-03-23T18:05:42Z, greggirwin, commented:
<https://github.com/red/red/issues/2644#issuecomment-602766124>

    Should we think of `1.#INF` and `1.#NaN` as numeric counterparts to `unset!`?

