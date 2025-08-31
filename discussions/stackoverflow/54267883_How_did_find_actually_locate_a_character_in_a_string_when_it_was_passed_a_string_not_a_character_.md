# How did \`find\` actually locate a character in a string, when it was passed a string, not a character?

**Link:**
<https://stackoverflow.com/questions/54267883/how-did-find-actually-locate-a-character-in-a-string-when-it-was-passed-a-str>

**Asked:** 2019-01-19 14:03:34 UTC

------------------------------------------------------------------------

I was surprised to note that `find "rspq" "q"` actually found q in the
series. The reason it surprised me is that the string `"rpsq"` is a
series of characters and I expected to have to specify `"q"` as a
character not as a string.

This leads to 2 questions for me: 1. how do I specify the character `q`
in Red? 1. why did the search succeed even though I passed in a string
not a character?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by 9214

1.  Consult the [official reference
    documentation](https://doc.red-lang.org/en/datatypes/char.html){rel="nofollow noreferrer"}.
2.  Functions in Red are highly polymorphic. `find` can either search
    for a given element or a first occurence of sub-series.

------------------------------------------------------------------------

### Answer (score: 2) --- by Maciej Łoziński

1.  Characters are values of `char!` type, and are specified like this:
    `c: #"q"`.
2.  I\'d say it\'s because Red tries to copy behavior of Rebol. And in
    [Rebol\'s
    documentation](http://rebol.com/docs/words/wfind.html){rel="nofollow noreferrer"}
    you can find this example:

```{=html}
<!-- -->
```
    probe find "here and now" "and"
    "and now"

------------------------------------------------------------------------

## Comments on question

*Comment by Maciej Łoziński:* You probably expected a functionality of
`find`\'s `/same` refinement. In documentation (`? find`) you can read:
`/same => Use "same?" as comparator.` But strangely, even with
`find/same`, result is not what you would expect, despite that
`(same? "q" "q") = false`.

*Comment by Maciej Łoziński:* Anyway, I think you should not ask two
questions at once, and think about keeping your question\'s title
reflect what you ask in the content.
