
#4908: Money accessors don't implement write support
================================================================================
Issue is closed, was reported by hiiamboris and has 26 comment(s).
[status.built] [status.tested] [type.review]
<https://github.com/red/red/issues/4908>

**Describe the bug**

No effect, not even an error:
```
>> system/catalog/accessors/money!
== [code amount]
>> m: USD$1

>> m/amount: 2
== $1.00
>> m/amount: $2
== $1.00
>> m
== USD$1.00

>> m/code: 'EUR
== USD
>> m
== USD$1.00
```

**Expected behavior**

Successful change & return of new code and amount.

**Platform version**
```
Red 0.6.4 for Windows built 12-May-2021/6:12:03+03:00  commit #cebd5b9
```



Comments:
--------------------------------------------------------------------------------

On 2021-05-31T17:24:19Z, greggirwin, commented:
<https://github.com/red/red/issues/4908#issuecomment-851607172>

    I don't know if @9214 and @dockimbel used money as an experiment, but it alias's `function!` as `accessor!`, which no other type does. Makes it clean in use, but is read only for property values. To me "access" implies read/write, but maybe better to keep the changes minimal right now, as that shouldn't be hard to support. Just check for `value` in `eval-path` and assign through internal helpers.

--------------------------------------------------------------------------------

On 2021-06-01T10:13:45Z, meijeru, commented:
<https://github.com/red/red/issues/4908#issuecomment-852005886>

    In the spec document this read-only feature is implicitly described since in [section 5.6.2](https://github.com/meijeru/red.specs-public/blob/master/specs.adoc#selection-by-key) there is no explanation for setting a component of a `money!` value. Should this be made explicit or will the read-onliness be changed anyhow? I find @greggirwin 's comment not very enlightening.

--------------------------------------------------------------------------------

On 2021-06-01T15:00:53Z, greggirwin, commented:
<https://github.com/red/red/issues/4908#issuecomment-852197572>

    @meijeru I gave @hiiamboris' ticket a +1 (:+1:) to indicate agreement, but that's not as obvious as "Agreed" in text. :^)
    
    They should be writable, IMO, as in Rebol. Though R3 accessors aren't in my memory right now. R2 used ordinal accessors.
    ```
    >> m: USD$100
    == USD$100.00
    >> m/1: "EUR"
    == "EUR"
    >> m
    == EUR$100.00
    >> m/2: 200
    == 200
    >> m
    == EUR$200.00
    ```
    The question is whether there is any value in making them immutable. For setting the currency code, it does need to vet against `system/local/currencies`. But I can't think of a reason why you _wouldn't_ want them to be mutable.

--------------------------------------------------------------------------------

On 2021-07-02T20:35:24Z, dockimbel, commented:
<https://github.com/red/red/issues/4908#issuecomment-873244361>

    > But I can't think of a reason why you wouldn't want them to be mutable.
    
    We made `money!` values immutable because they are in the same class as other numbers that are immutable like integers and floats (even if `money!` is not part of `number!` typeset, to avoid implicit conversions). It's a number with a unit (we should have a more versatile `unit!` type in the future). The path accessors are just there for convenience, to avoid adding new accessor functions specifically for that. Changing a money's unit directly can be dangerous (as it's proabably related to real-world money), so an explicit conversion to a new value is preferable.

--------------------------------------------------------------------------------

On 2021-07-02T20:46:15Z, hiiamboris, commented:
<https://github.com/red/red/issues/4908#issuecomment-873248475>

    In such case I expect an error message shown instead of silent failure.

--------------------------------------------------------------------------------

On 2021-07-02T21:13:59Z, greggirwin, commented:
<https://github.com/red/red/issues/4908#issuecomment-873259421>

    If not writable, certainly it needs to report an error. I'm OK with `code` being read-only, and we can update the docs and specs accordingly.
    
    @dockimbel, assuming `m: $1`,  how is `m/amount: 2` more dangerous than `m: m + 1` ? You can't have references to money values where someone could change it out from under you.
    
    On a related note, we should disallow adding percents to money values, or decide if they should be "smart" and base it on the amount, rather than treating it as a float.

--------------------------------------------------------------------------------

On 2021-07-03T10:31:24Z, dockimbel, commented:
<https://github.com/red/red/issues/4908#issuecomment-873384498>

    > In such case I expect an error message shown instead of silent failure.
    
    Agreed.
    
    > assuming m: $1, how is m/amount: 2 more dangerous than m: m + 1 ? You can't have references to money values where someone could change it out from under you.
    
    I said "Changing a money's _unit_ directly can be dangerous". ;-) If that is disallowed then setting the amount needs to be disallowed too for sake of consistency with `/unit` and other number-like values that are immutable.

--------------------------------------------------------------------------------

On 2021-07-03T10:38:00Z, hiiamboris, commented:
<https://github.com/red/red/issues/4908#issuecomment-873385295>

    What about pairs and tuples? They are single-cell values yet modifiable using accessors.

--------------------------------------------------------------------------------

On 2021-07-03T10:39:07Z, dockimbel, commented:
<https://github.com/red/red/issues/4908#issuecomment-873385488>

    They are multi-dimensional numbers. Integer, float, money are 1-dimensional scalar values. "single-cell values" is an implementation detail.

--------------------------------------------------------------------------------

On 2021-07-03T10:51:53Z, hiiamboris, commented:
<https://github.com/red/red/issues/4908#issuecomment-873387914>

    I see. Well, from reactivity's standpoint it's even better if money is read only.

--------------------------------------------------------------------------------

On 2021-07-04T22:03:10Z, greggirwin, commented:
<https://github.com/red/red/issues/4908#issuecomment-873670953>

    OK, let's go with the error plan for now. @toomasv has done quite a lot of R&D on a `quantity!` dialect, but of course the literal form for those is the big question.

--------------------------------------------------------------------------------

On 2021-07-04T22:04:21Z, greggirwin, commented:
<https://github.com/red/red/issues/4908#issuecomment-873671148>

    https://github.com/toomasv/units

--------------------------------------------------------------------------------

On 2021-07-04T22:09:22Z, greggirwin, commented:
<https://github.com/red/red/issues/4908#issuecomment-873671926>

    I also noted for Toomas that this starts moving us more into symbolic computing, where Wolfram is the reference standard. Considering their wealth of data, we shouldn't ignore that area.

