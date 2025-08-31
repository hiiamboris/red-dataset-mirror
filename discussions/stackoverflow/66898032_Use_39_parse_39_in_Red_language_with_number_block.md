# Use &#39;parse&#39; in Red language with number block

**Link:**
<https://stackoverflow.com/questions/66898032/use-parse-in-red-language-with-number-block>

**Asked:** 2021-04-01 03:25:57 UTC

------------------------------------------------------------------------

I imitate the follow code that comes from Helpin\'Red

    a: "big black cat"
    parse a [ to "black" insert "FAT "]
    print a
    big FAT black cat

with mine:

    b: [1 2 3]
    parse b [to 2 insert 4]
    print b
    4 4 1 2 3 ;; but what I mean is "1 4 2 3".

What\'s wrong with my code? And how to get the result I want?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by 9214

1.  `to` matches the input up to a specified rule until it succeeds or
    the end is reached.
2.  `2` matches a specified number of times.
3.  `insert 4` inserts a value at the current position, and always
    succeeds.
    1.  Which means that `2 insert 4` inserts two `4`\'s and succeeds.
    2.  `to` \"advances\" the input up to a matched `2 insert 4`: I say
        \"advances\" because it really doesn\'t, insertion happens at
        the head.

To achieve what you want you need to escape `2` using `quote`:

    >> also block: [1 2 3] parse block [to quote 2 insert 4]
    == [1 4 2 3]

FYI, Parse has official [reference
documentation](https://github.com/red/docs/blob/master/en/parse.adoc){rel="nofollow noreferrer"}.

*Comment by lyl:* Many thanks for your solution and the reference to
`parse`!

------------------------------------------------------------------------

## Comments on question
