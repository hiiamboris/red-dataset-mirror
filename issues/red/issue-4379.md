
#4379: Loss of precision on molding percent values
================================================================================
Issue is open, was reported by hiiamboris and has 6 comment(s).
[type.review]
<https://github.com/red/red/issues/4379>

https://github.com/red/red/issues/3243#issuecomment-608889881

**Describe the bug**

I'm saving blocks with lots of percents for later comparison, but when I load them they don't compare with what was being saved. And a workaround would require recursive comparison operator with blocks and objects traversal support.

```
>> f: 11.651178950846456%
== 11.65117895085%           ;) cut down in the output
>> to float! f
== 0.1165117895084646
>> f = load mold/all f
== false
>> f = load mold/all to float! f
== true
```

This will be hard to fix btw, because:
```
>> f: 0.11651178950846456
>> f / 100 * 100 == f
== false
```
and percents are multiplied by 100 before being formed

A change from `%.13g` to `%.16g` format for percents helps a bit: `=` is satisfied. But `==` is still not.

**Expected behavior**

`f == load mold/all f` to succeed for percents

**Platform version (please complete the following information)**
```
Red 0.6.4 for Windows built 4-Apr-2020/0:17:39+03:00
```



Comments:
--------------------------------------------------------------------------------

On 2020-04-04T11:12:33Z, qtxie, commented:
<https://github.com/red/red/issues/4379#issuecomment-609012857>

    ```
    >> f: 11.651178950846456%
    ```
    Maybe we should store `11.651178950846456` in percent! internally instead of `11.651178950846456 / 100`.

--------------------------------------------------------------------------------

On 2020-04-04T15:44:07Z, hiiamboris, commented:
<https://github.com/red/red/issues/4379#issuecomment-609047385>

    Might work, but will require a *lot* of special cases everywhere where right now percent is accepted together with floats.

--------------------------------------------------------------------------------

On 2020-04-04T17:28:05Z, greggirwin, commented:
<https://github.com/red/red/issues/4379#issuecomment-609062195>

    If this occurs only for decimals at extreme decimal limits, we can just document it for now. It _is_ a problem that needs to be addressed, and if it can't be easily worked around by users, it's more important, but outside testing where is someone likely to hit this? 
    
    `%.16g` adds more range, but doesn't fix anything, so it's an arbitrary shift out. If you produce problematic numbers programmatically, it's not going to help you.
    
    More important is long term. I will still press for an accurate `decimal!` type, even if we have `money!`, and this is an example of why we need it. Harald's Dec32 work might fit here, later expanding to Dec64 when we have that capability. Percents don't need to be huge amounts to be widely useful. The downside is that it will be a _lot_ more work to integrate.
    
    There is also an interesting question here, for which the timing is...not great. @9214 has money pretty much done, and @dockimbel wanted it done as BCD. When I proposed Dec64 for money, I also wanted a straight Dec64/decimal, so `money!` just adds the lexical form and currency aspects.  A key difference is that money's precision is fixed at 5 places, where an arbitrary decimal based on BCD would need it to "float". 
    
    IMO, short term this isn't a showstopper, long term it's another piece in the decimal puzzle.

