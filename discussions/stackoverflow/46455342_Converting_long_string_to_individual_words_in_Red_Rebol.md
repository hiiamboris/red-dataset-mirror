# Converting long string to individual words in Red/Rebol

**Link:**
<https://stackoverflow.com/questions/46455342/converting-long-string-to-individual-words-in-red-rebol>

**Asked:** 2017-09-27 18:58:25 UTC

------------------------------------------------------------------------

How can a string with a sentence be converted to a series of words, e.g.
convert following string to:

    str: "This is a sentence with some words"

to a series of:

    ["This" "is" "a" "sentence" "with" "some" "words"]

There seems to be a split function in
[Rebol3](http://www.rebol.com/r3/docs/functions/split.html){rel="nofollow noreferrer"}
but no such function in
[Rebol2](http://www.rebol.com/docs/dictionary.html3){rel="nofollow noreferrer"}.

I tried following code with parse but it does not work:

    str: "This is a sentence with some words"
    strlist: []
    parse str [
        some got: " " (append strlist got) ]

Error is:

    ** Script Error: Invalid argument: got

How can this be achieved (a method with parse will be preferable)?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by Shultc

It will be

    split str " "

Where split is function. First argument is your string, and second ---
delimiter.

*Comment by rnso:* This does not work in Rebol 2.7.8.
`** Script Error: split has no value`

*Comment by Shultc:* Can\'t find documentation for Rebol 2. In Rebol 3
should work:
[rebol.com/r3/docs/functions/split.html](http://www.rebol.com/r3/docs/functions/split.html){rel="nofollow noreferrer"}

------------------------------------------------------------------------

### Answer (score: 2) --- by kealist

In Rebol 2, this would be:

    str: "This is a sentence with some words"
    parse str none

resulting in:

    ["This" "is" "a" "sentence" "with" "some" "words"]

As mentioned in the comments on your post, [the
documentation](http://www.rebol.com/docs/core23/rebolcore-15.html#section-2){rel="nofollow noreferrer"}.
Parse has two modes, one of which is string splitting.

Rebol 3, `split` will work.

*Comment by rnso:* You can also add how it can be done in Red language.

------------------------------------------------------------------------

## Comments on question

*Comment by rgchris:* In Rebol 2, you split using PARSE:
`parse "foo bar baz" " "`

*Comment by rnso:* How does it work?

*Comment by Geeky I:* convenience feature, not recommended or available
in rebol3 or red

*Comment by rgchris:* Yep, just noted for historical reasons. Use SPLIT
instead.

*Comment by rgchris:* See
[documentation](http://www.rebol.com/docs/core23/rebolcore-15.html#section-2){rel="nofollow noreferrer"}.
