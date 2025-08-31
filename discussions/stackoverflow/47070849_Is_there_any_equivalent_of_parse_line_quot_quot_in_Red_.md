# Is there any equivalent of parse line &quot;,&quot; in Red?

**Link:**
<https://stackoverflow.com/questions/47070849/is-there-any-equivalent-of-parse-line-in-red>

**Asked:** 2017-11-02 08:38:54 UTC

------------------------------------------------------------------------

In Rebol you could parse a line with

    parse line ",.#;"

In Red, is there an equivalent ?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 6) --- by sqlab

The next to that is split, although just a mezzanine wrapper for parse
with a special rule. You can use it with multiple delimiters like that

    split line charset ",.#;"

*Comment by user310291:* It works but I don\'t understand why and I
rather agree with \@rebolek it should have worked without to-bitset ;)

*Comment by HostileFork says dont trust SE:* \@user310291 Why should a
STRING! not indicate a longer splitting sequence? `split "a::b::c" "::"`
returning `[a b c]` seems right to me. If you want SPLIT to model its
argument as a collection of characters, the caller should be the one
figuring out how to supply it as a collection.

------------------------------------------------------------------------

### Answer (score: 2) --- by rebolek

Red moved this functionality to `split`, but I see that it doesn't work
with multiple delimiters as in your case. I will report it as bug.

UPDATE: See
[https://github.com/red/red/issues/3095](https://github.com/red/red/issues/3095){rel="nofollow noreferrer"}

------------------------------------------------------------------------

## Comments on question
