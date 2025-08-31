# What is the best way to save a hash! block in Rebol?

**Link:**
<https://stackoverflow.com/questions/59114599/what-is-the-best-way-to-save-a-hash-block-in-rebol>

**Asked:** 2019-11-30 08:46:31 UTC

------------------------------------------------------------------------

I am using Rebol2 and would like to persist a
[HASH!](http://www.rebol.com/article/0020.html){rel="nofollow noreferrer"}
block.

Currently I am converting it `to-string` then using `save`.

Is there a better way? For example:

    r: make hash! ["one" "two"]

I want to save this to a file, then load it back to `r`.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

you are very near your goal. Just use `save/all` and `load`

    >> r: make hash! ["one" "two"]
    == make hash! ["one" "two"]
    >> save/all  %htest r
    >> r: load %htest
    == make hash! ["one" "two"]

If you want the same result in **Red** you just need one command more

    >> r: do load %htest
    == make hash! ["one" "two"]

*Comment by Atomica:* That\'s it! .. In Rebol2 at least.. doesn\'t work
in Red

*Comment by sqlab:* You did not add the tag **Red**..)

*Comment by Atomica:* One thing Ive manged to do with my code is to keep
it compatbile with both Rebol2 and Red. This is the first roadblock.

*Comment by sqlab:* If you want the same source for **Red** and
**Rebol2** use just `save` and `do load`

------------------------------------------------------------------------

### Answer (score: 0) --- by 9214

You do that just like with any other value - `save`, then `load`.

There are zero benefits in using `hash!` for persistent storage, by the
way. What `load` gives you back is a plain `block!`
(`[make hash! [...]]`). Populating hashtable from this loaded data takes
more time compared to just loading `block!`, but gives you faster
lookups thereafter.

In other words, you can just:

    >> save %database [one two]
    >> make hash! load %database
    == make hash! [one two]

As described in the tutorial that you linked.

*Comment by Atomica:* I\'m working with hash! from the start. I\'m
trying to avoid having to convert to a block or string, then \'saving\'
it, only to load the block back and hash! it in the process. I don\'t
mind doing that IF it\'s the better way (faster, smaller db storage)
which is the question. save/all seems to avoid this hash! / dehash step.

*Comment by 9214:* \@Atomica `save/all` just uses construction syntax to
store values and preserves their datatype (+ extra info in specific
cases), that\'s all. `load` still needs to populate hashtable at runtime
when you feed it `#[hash! [...]]`, or you need to `do` it manually in
case of `[make hash! [...]]`. There are no speed / memory benefits from
doing what you do - it\'s textual data either way (well, storing plain
`block!` takes less characters, so it saves you a few bytes).

*Comment by Atomica:* Well, in that case, save/all is better as it saves
the steps.

------------------------------------------------------------------------

## Comments on question

*Comment by Hima:* Your question is unclear.

*Comment by HostileFork says dont trust SE:* I edited your question a
bit\...but you can edit it further. Perhaps you might provide some
sample data you are interested in, and what you expect when you LOAD it
back.

*Comment by Atomica:* If you use `save` on a hashed block to a file, it
saves it as `make hash! ["one" "two"]` .. ok, but I now want to `load`
that back into my program?
