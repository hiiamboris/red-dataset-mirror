
#3853: charset function not implements binary! type for argument
================================================================================
Issue is closed, was reported by jefurry and has 16 comment(s).
<https://github.com/red/red/issues/3853>

**Describe the bug**
charset function not implements binary! type for argument.

**Expected behavior**
for Rebol:
```
>> charset #{2A}
== make bitset! #{2A}
```

for Red:
```
>> charset #{2A}
*** Script Error: charset does not allow binary! for its spec argument
*** Where: charset
*** Stack: charset
```

**Platform version (please complete the following information)**
```
>> about
Red 0.6.4 for macOS built 22-Nov-2018/8:40:38+08:00 commit #755eb94
```



Comments:
--------------------------------------------------------------------------------

On 2019-04-21T06:59:41Z, 9214, commented:
<https://github.com/red/red/issues/3853#issuecomment-485230010>

    This is a trivial fix, but makes me think that `charset` should be something more than just an alias for `make bitset!`.

--------------------------------------------------------------------------------

On 2019-04-21T09:52:19Z, jefurry, commented:
<https://github.com/red/red/issues/3853#issuecomment-485239350>

    @qtxie Thanks!

--------------------------------------------------------------------------------

On 2019-04-21T18:26:28Z, greggirwin, commented:
<https://github.com/red/red/issues/3853#issuecomment-485272344>

    > This is a trivial fix, but makes me think that `charset` should be something more than just an alias for `make bitset!`.
    
    What do you have in mind @9214? `Charset` adds meaning, as a name, while bitset does the heavy lifting. It would only make sense if we remove the extra work from the datatype (the `process` func, effectively), but then `make bitset!` is much more limited. 

--------------------------------------------------------------------------------

On 2019-04-21T18:35:58Z, 9214, commented:
<https://github.com/red/red/issues/3853#issuecomment-485272950>

    @greggirwin `charset` by its name implies that `bitset!` will be used in string parsing, but datatype by itself is more general.

--------------------------------------------------------------------------------

On 2019-04-21T21:22:42Z, greggirwin, commented:
<https://github.com/red/red/issues/3853#issuecomment-485283271>

    Correct, so what should change? `Charset` provides intent at the definition site.

--------------------------------------------------------------------------------

On 2019-04-24T18:12:17Z, greggirwin, commented:
<https://github.com/red/red/issues/3853#issuecomment-486365594>

    This can be closed, thanks to @9214 and @qtxie's fix, correct?

--------------------------------------------------------------------------------

On 2019-04-24T22:30:12Z, 9214, commented:
<https://github.com/red/red/issues/3853#issuecomment-486452007>

    @greggirwin I think so. My point WRT `charset` was that, on the one hand, it's a shortcut for `make bitset!`, and, on the other, it implies some string-related usage.
    
    But if I use `charset` to create bitset with some other use (like, I dunno, cache hit rate counting or for bitmaps) then it looks kinda off. So, maybe `charset` should ebrace it's nature and do some extra heavy-lifting behind the scenes (some `binary!` UTF-8 checks, for instance, or usage of slightly tuned dialect that comes with set operations [typically used to construct "alphabets" from bitsets] packed in), while leaving something like `bitset` as a conventional shortcut for `make bitset!`.
    
    But, I digress... 😬 as a first approximation, this (purely theoretical matter) can be solved with `bitset: :charset`.

--------------------------------------------------------------------------------

On 2019-04-24T22:59:10Z, greggirwin, commented:
<https://github.com/red/red/issues/3853#issuecomment-486458323>

    :^) I think the point is that if you create a bitset with some other use, don't use `charset`. `Make bitset!` is hardly onerous.

