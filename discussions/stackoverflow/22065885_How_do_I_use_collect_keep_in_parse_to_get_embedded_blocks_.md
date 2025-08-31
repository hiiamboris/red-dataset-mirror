# How do I use collect keep in parse, to get embedded blocks?

**Link:**
<https://stackoverflow.com/questions/22065885/how-do-i-use-collect-keep-in-parse-to-get-embedded-blocks>

**Asked:** 2014-02-27 10:35:20 UTC

------------------------------------------------------------------------

Looking at the html example here:
[http://www.red-lang.org/2013/11/041-introducing-parse.html](http://www.red-lang.org/2013/11/041-introducing-parse.html){rel="nofollow"}

I would like to parse the following:

    "val1-12*more text-something"

Where:

-   `"-"` marks values which should be in the same block, and
-   `"*"` should start a new block.

So, I want this:

    [ ["val1" "12"] ["more text" "something"] ]

and at the moment I get this:

    red>> data: "val1-12*more text-something"
    == "val1-12*more text-something"

    red>> c: charset reduce ['not #"-" #"*"]
    == make bitset! [not #{000000000024}]

    red>> parse data [collect [any [keep any c [#"-" | #"*" | end ]]]]
    == ["val1" "12" "more text" "something"]

(I actually tried some other permutations, which didn\'t get me any
farther.)

So, what\'s missing?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by draegtun

You can make it work by nesting COLLECT. For e.g.

    keep-pair: [
        keep some c 
        #"-"
        keep some c 
    ] 

    parse data [
        collect [
            some [
                collect [keep-pair]
                #"*"
                collect [keep-pair]
            ]
        ]
    ]

Using your example input this outputs the result you wanted:

    [["val1" "12"] ["more text" "something"]]

\
However I got funny feeling you maybe wanted the parse rule to be more
flexible than the example input provided?

*Comment by DocKimbel:* Good answer. You improve it by creating an
external rule for the inner COLLECT to avoid repeating it.

*Comment by draegtun:* \@DocKimbel - Agree. My initial update was going
to be with a `collect-pair: []` external rule (with COLLECT in so more
DRY). However I preferred above which keeps COLLECT clearly visible in
the main PARSE rule.

*Comment by rgchris:* \@draegtun do you need to have the reference to
keep-pair in a block? Can you do `collect keep-pair`?

*Comment by draegtun:* \@rgchris Unfortunately it doesn\'t work without
the block (no error just get `[[]]` back, which in itself is odd, ie.
why not `[[][]]`?).

------------------------------------------------------------------------

## Comments on question
