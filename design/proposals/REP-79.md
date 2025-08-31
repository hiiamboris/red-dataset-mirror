
#79: WISH: map to support objects, any-blocks, any-strings as keys
================================================================================
Issue is open, was reported by hiiamboris and has 12 comment(s).
<https://github.com/red/REP/issues/79>

For use with `select/same`. And I suggest path notation will default to `select/same/only` with objects & blocks as well (but not strings). I often forget either `/only` or `/same` then go bug hunting...

I was playing with alternate reactivity implementation ideas, and I wanted to make an "index" of all reactions that would, given a reaction, tell me all the objects it involves: `index/:reaction -> [reactors ...]`. Here's how it would look like with a hash:
```
if relation-does-not-exist-yet [
   register-it
   unless blk: select/same/skip index :reaction 2 [
      reduce/into [:reaction blk: make hash! []] tail index
   ]
   unless find/same blk obj [append blk obj]   ;) I don't want duplicate objects in that list
]
```
So much redundancy!
Here's how it might have looked with maps:
```
if relation-does-not-exist-yet [
   register-it
   unless blk: index/:reaction [blk: index/:reaction: make hash! []]
   blk/:obj: true                              ;) de-duped naturally
]
```
No need to tell that this will be like 3 times faster and less ugly?

Thing is, map keys can be used as a natural *set*. Because they are automatically unique. Taking this scenario as an example, it would be insane (performance-wise) to call `blk: unique blk` every time a relation is added. And `find/same` is while a good enough solution, still much bulkier.

Or maybe we could provide a separate `set!` type for such use cases?
And then also an automatically-sorted block?


Comments:
--------------------------------------------------------------------------------

On 2020-06-12T19:46:25Z, greggirwin, commented:
<https://github.com/red/REP/issues/79#issuecomment-643454234>

    On auto-sorted blocks: https://gist.github.com/greggirwin/cc6bc916c6b85446db9aff25f0a543b3 is about as simple as it can be, I think, but then you run into a few questions on comparisons.

--------------------------------------------------------------------------------

On 2020-06-12T19:50:10Z, hiiamboris, commented:
<https://github.com/red/REP/issues/79#issuecomment-643455599>

    Problem with mezz approach - it loses any sense because of the performance overhead compared to native sort ;)

--------------------------------------------------------------------------------

On 2020-06-12T19:52:30Z, hiiamboris, commented:
<https://github.com/red/REP/issues/79#issuecomment-643456404>

    For a nicer interface, one can spawn an object that would own that block and sort it automatically on deep changes (that'll work until you assign this block to another object though ;)

--------------------------------------------------------------------------------

On 2020-06-12T20:01:47Z, greggirwin, commented:
<https://github.com/red/REP/issues/79#issuecomment-643459991>

    Native sort doesn't seem faster here. .055s for a presorted series, and ~.08s after inserting one item in the middle of a ~1M item block of integers. Inserting 700 new items in the middle, then sorting, time is ~2.5s.
    
    My primary goal was simplicity. How far does that get us?

--------------------------------------------------------------------------------

On 2020-06-12T20:11:11Z, greggirwin, commented:
<https://github.com/red/REP/issues/79#issuecomment-643463449>

    I'm all for simple K-V wrappers to help with blocks, to help with the `/skip 2` problem. I can't be the only one to have done that...more than once. :^\ (both the error and the wrappers :^)

--------------------------------------------------------------------------------

On 2022-04-19T16:30:02Z, hiiamboris, commented:
<https://github.com/red/REP/issues/79#issuecomment-1102853904>

    Just mentioning here, but `datatype!` is not accepted as key either. Workaround currently is to convert it `to word!` and `get` then back.

