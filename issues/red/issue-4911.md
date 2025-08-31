
#4911: FIND type! vs FIND typeset! inconsistency
================================================================================
Issue is closed, was reported by hiiamboris and has 12 comment(s).
[status.built] [status.tested] [type.review] [test.written]
<https://github.com/red/red/issues/4911>

**Describe the bug**

`find/only` disables special treatment of types, but not of typesets:
```
>> find/only reduce [1 integer! 2] number!
== [1 integer! 2]            ;) expected: `== none`
>> find/only reduce [1 integer! 2] integer!
== [integer! 2]
```

**Expected behavior**

R2 returns 1st result in both cases. But I would prefer Red returned `none` in 1st case. Apart from `/only` there is no other way I know of to turn off this special treatment, and obviously there are cases where you wanna just find a value without tons of workarounds. `/only` also should leverage hashtable's fast lookups for this case.

It is also [proposed](https://gitter.im/red/bugs?at=60c1282481b45810b894342f) that docstring for `/only` is changed to "Treat series, datatype, and typeset search values as singular.", and docstring for `value` be provided.

**Platform version**
```
Red 0.6.4 for Windows built 12-May-2021/6:12:03+03:00  commit #cebd5b9
```



Comments:
--------------------------------------------------------------------------------

On 2021-06-11T10:30:22Z, meijeru, commented:
<https://github.com/red/red/issues/4911#issuecomment-859482033>

    The docstring proposed is not clear enough since "singular" does not convey the semantics for type(set)s -- I would propose
    
    "Treat series search values as singular, and type(set) search values as standing for themselves."
    
    BTW This semantics was never publicized, as far as I know.

--------------------------------------------------------------------------------

On 2021-07-02T23:03:07Z, greggirwin, commented:
<https://github.com/red/red/issues/4911#issuecomment-873295145>

    In glancing at the code, it looks like there are a couple ways the check can be safely changed, and I think this is a good request.
    
    @meijeru it always eases my mind when you weigh in. I appreciate you tracking things for correctness, and in detail.
    
    I agree that "singular" isn't great. "themselves" is also tricky, because of `/same`. We need a word that means "not as a set", or more accurately "not as separate elements". Which still isn't right.  "Non-cardinally" is not human friendly. It would be nice if we didn't have separate clauses, as those can grow as new behaviors appear.
    
    1) Treat series and typeset search values as single values.
    2) Treat series and typeset search values as themselves.
    3) Treat series and typeset search values as direct values.
    4) Treat series and typeset search values non-cardinally.
    
    1️⃣ 2️⃣ 3️⃣ 4️⃣  are valid emojis, but it seems github only gives you a few choices for reactions. 
    
    @dander suggested adding a doc string for the `value` arg, which I agree with in general. Funny that we don't have them, probably because R2 didn't. They are clear enough in meaning, given the general doc string, but then do we use them for special notes. e.g. the original doc string for only said "series" search value, but really it's only for series block types, right?

--------------------------------------------------------------------------------

On 2021-07-03T06:34:54Z, hiiamboris, commented:
<https://github.com/red/red/issues/4911#issuecomment-873356224>

    1 looks best, but I would change "search values" to "value argument".

--------------------------------------------------------------------------------

On 2021-07-04T21:56:27Z, greggirwin, commented:
<https://github.com/red/red/issues/4911#issuecomment-873669991>

    "Treat series and typeset value arguments as single values." ?

--------------------------------------------------------------------------------

On 2021-07-04T21:59:36Z, greggirwin, commented:
<https://github.com/red/red/issues/4911#issuecomment-873670435>

    If @meijeru agrees, make this ticket so @hiiamboris. It's a good improvement.

--------------------------------------------------------------------------------

On 2021-07-05T08:55:36Z, meijeru, commented:
<https://github.com/red/red/issues/4911#issuecomment-873933835>

    OK with me.

