
#5547: `make map! length` carries an unpractical meaning
================================================================================
Issue is closed, was reported by hiiamboris and has 36 comment(s).
[status.built] [status.tested] [type.review] [type.design]
<https://github.com/red/red/issues/5547>

**Describe the bug**

I was always doubting, whether `make map! 3` allocates 3 key/value pairs or 1.5 key/value pairs.
Running tests I'm seeing that `make map! 6` allocates exactly the same amount of RAM as `make map! [a 1 b 2 c 3]` so the second hypothesis is true.
But:
- it is not useful to allocate odd number of slots in a map - the last slot is going to be wasted at best
- it is not consistent with `length?` behavior (`length? #[a 1 b 2 c 3] == 3` not `6`)

**Expected behavior**

I propose `make map! n` to have a meaning of allocating for `n` key/value pairs.

**Platform version**
```
Red 0.6.5 for Windows built 16-Aug-2024/11:34:58+08:00  commit #dbc93da
```


Comments:
--------------------------------------------------------------------------------

On 2024-10-09T07:31:35Z, dockimbel, commented:
<https://github.com/red/red/issues/5547#issuecomment-2401552011>

    No objection against that proposition.

--------------------------------------------------------------------------------

On 2024-10-09T16:02:49Z, greggirwin, commented:
<https://github.com/red/red/issues/5547#issuecomment-2402733527>

    It also aligns with throwing an error if a map spec has an odd number of elements. If `make <size>` doesn't use k-v pairs as the size, odd sizes should throw an error.

--------------------------------------------------------------------------------

On 2024-10-09T20:56:50Z, dockimbel, commented:
<https://github.com/red/red/issues/5547#issuecomment-2403414676>

    After making that change with error raising on odd requested sizes, the tests are not passing anymore. It chokes on dynamic cases like [this one](https://github.com/red/red/blob/master/environment/codecs/CSV.red#L298) in the CSV codec.

--------------------------------------------------------------------------------

On 2024-10-09T22:31:32Z, greggirwin, commented:
<https://github.com/red/red/issues/5547#issuecomment-2403539516>

    It *is* a breaking change, so we need to note that.

--------------------------------------------------------------------------------

On 2024-10-09T22:32:33Z, greggirwin, commented:
<https://github.com/red/red/issues/5547#issuecomment-2403540596>

    Will look at the code, and we can mention it for @rebolek as well, to make sure it's not trickier than it looks.

--------------------------------------------------------------------------------

On 2024-10-10T01:26:03Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5547#issuecomment-2403714882>

    Why can't the LENGHT rapresent K/V pairs, so MAKE MAP! 3 is 3 pairs? I think @hiiamboris was asking for this.

--------------------------------------------------------------------------------

On 2024-10-10T03:36:34Z, greggirwin, commented:
<https://github.com/red/red/issues/5547#issuecomment-2403871402>

    That's the change that is likely coming. @dockimbel just noted code that breaks because of it. And the `length` there isn't necessary by any means, just a nice (possible) optimization. Would have to test to see if it is an actual win.

--------------------------------------------------------------------------------

On 2024-10-10T13:09:00Z, dockimbel, commented:
<https://github.com/red/red/issues/5547#issuecomment-2405049874>

    @greggirwin I'm wondering if raising an error in such case will not make dynamic cases significantly more complicated than needed. You would need to systematically insert an extra line like: `if odd? length [length: length + 1]`

--------------------------------------------------------------------------------

On 2024-10-10T16:57:58Z, greggirwin, commented:
<https://github.com/red/red/issues/5547#issuecomment-2405619729>

    If the new behavior, where N = number of k-v pairs is used, then it doesn't need to raise an error on `odd? N`. If that change isn't made, then we have to decide, because dynamic cases may allocate one too few slots, or an extra depending on how they calc it. Not the end of the world either way, but needs to be explained.

--------------------------------------------------------------------------------

On 2024-10-10T16:59:44Z, greggirwin, commented:
<https://github.com/red/red/issues/5547#issuecomment-2405622962>

    What happens with the N=k-v change is that no code breaks, but twice as many slots as needed are allocated, so code *should* be fixed, not for the waste but because the allocation logic will look wrong.

--------------------------------------------------------------------------------

On 2024-10-10T18:08:42Z, hiiamboris, commented:
<https://github.com/red/red/issues/5547#issuecomment-2405745255>

    > What happens with the N=k-v change is that no code breaks, but twice as many slots as needed are allocated, so code _should_ be fixed, not for the waste but because the allocation logic will look wrong.
    
    *Should* code be fixed, or *will* it be fixed? Because the only case where it matters I find in Red is in CSV codec, where the logic expects the number of k/v pairs: 
    https://github.com/red/red/blob/adf4bdc79bab2c87fa7f9e35485ad2b35226c0eb/environment/codecs/CSV.red#L298-L301
    
    (as well as a few cases in my own code expect that)

--------------------------------------------------------------------------------

On 2024-10-10T18:19:56Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5547#issuecomment-2405764185>

    Please note that other than `MAP!`, `OBJECT!` also has `K/V` pairs, so it should return the same value too when queried:
    
    ```
    >> length? make object! [a: 22]
    *** Script Error: length? does not allow object! for its series argument
    *** Where: length?
    *** Near : length? make object! [a: 22]
    *** Stack:  
    ```

--------------------------------------------------------------------------------

On 2024-10-10T18:42:51Z, greggirwin, commented:
<https://github.com/red/red/issues/5547#issuecomment-2405804722>

    We will certainly fix teh CSV code, but there is other code in the wild, albeit not much in our case. I tend to think in those terms, as I value other people not breaking *my* code. :^)

--------------------------------------------------------------------------------

On 2024-10-10T18:56:54Z, greggirwin, commented:
<https://github.com/red/red/issues/5547#issuecomment-2405828631>

    @GiuseppeChillemi indeed. Adding it as a convenience for maps, because of the implementation leads to this consistency question. However, then we have to ask about `[foreach clear find remove]`. `Length?` is read-only, so should be fine. `Remove` isn't possible with how objects work today, unless we use `/key` with it and make it return a copy of the object. That's enough different that I think we leave that to a mezz for now. `Clear` only works for map heads, so it's all or nothing. Objects can't remove words, so the closest thing it could do there is set all values to `none`. That might be OK, as it's the same as `set <obj> none`, and is clearer, as it won't be confused with setting the object ref to `none`. `Find` only works for keys in maps, so could do the same for words in objects. We added func support to `in`, so this is probably also OK. It would be the equivalent of `in`. Question of whether it should be bound or not.

--------------------------------------------------------------------------------

On 2024-10-11T02:27:25Z, GiuseppeChillemi, commented:
<https://github.com/red/red/issues/5547#issuecomment-2406416616>

    I would not add support for `REMOVE` until we can modify objects and for me it is not ok for `CLEAR` to set to `none` everything as once you fix this working it will be difficult to change when keys could be removed. `Clear` will be useful to keep the reference to the `object!` everywhere it is and change its content. `Set` already does a good job for to reset everything to `none`.
     

--------------------------------------------------------------------------------

On 2024-10-11T20:43:41Z, dockimbel, commented:
<https://github.com/red/red/issues/5547#issuecomment-2408097410>

    I've pushed the change. I've changed my implementation to avoid raising errors, so that all the tests are passing fine. The CSV code (probably also in other places) would still need minor change to adjust to the new rule and avoid allocating double sizes.

--------------------------------------------------------------------------------

On 2024-10-12T06:59:42Z, hiiamboris, commented:
<https://github.com/red/red/issues/5547#issuecomment-2408427123>

    > The CSV code (probably also in other places) would still need minor change to adjust to the new rule and avoid allocating double sizes.
    
    As noted above, it expected double size, so it is now just working and no fix is needed.
    
    @dockimbel it deserves a note in the `map!` docs how `make map! length` works now.

--------------------------------------------------------------------------------

On 2024-10-12T17:55:33Z, greggirwin, commented:
<https://github.com/red/red/issues/5547#issuecomment-2408643270>

    Docs updated. In looking at it, I noticed that block and hash have different sections, so simplified the map change. At some point we should normalize things.

