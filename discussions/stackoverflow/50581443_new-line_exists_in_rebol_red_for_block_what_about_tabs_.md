# new-line exists in rebol / red for block what about tabs?

**Link:**
<https://stackoverflow.com/questions/50581443/new-line-exists-in-rebol-red-for-block-what-about-tabs>

**Asked:** 2018-05-29 09:57:14 UTC

------------------------------------------------------------------------

I can\'t find new-tab whereas there is new-line so how do you preserver
tabs in blocks ?

        help new-line
        USAGE:
             NEW-LINE position value

        DESCRIPTION: 
             Sets or clears the new-line marker within a block or paren. 
             NEW-LINE is a native! value.

        ARGUMENTS:
             position     [block! paren!] "Position to change marker (modified)".
             value         "Set TRUE for newline".

        REFINEMENTS:
             /all         => Set/clear marker to end of series.
             /skip        => Set/clear marker periodically to the end of the series.
                size         [integer!] 

        RETURNS:
             [block! paren!]

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 3) --- by HostileFork says dont trust SE

There is one newline flag per-cell in arrays (\"any-block!\"s), which
indicates whether or not the molding process should put out a newline
before that value.

*Indentation is driven only from these flags.* Indentation starts at the
first newline flag, and further newlines will each align to that level,
with an outdent at the end of the block if any newlines/indents
occurred.

    >> data: [a b c]

    >> new-line next data true

    >> data
    == [a 
       b c
    ]

Note there are 4 \"candidate positions\" for newlines inside the block
`[a b c]` (e.g. the positions are `[* a * b * c *]`). Yet there are only
three value cells, with a newline marker indicating a desire to output a
newline *before* that cell. Lacking anywhere to put the fourth newline
signal, the decision in Rebol2 and Red is to implicitly put the closing
bracket on its own line if there were any newline markers processed.

[I\'ve previously
mentioned](https://stackoverflow.com/questions/49949469/whats-the-inverse-of-block-load-text-in-rebol-red/49950255#comment86942494_49950255)
that it\'s non-obvious exactly how \"out-of-band\" information like this
gets managed in the face of series modifications. It helps to work
through your expectations. Even worrying about just *one bit* there is a
lot of nuance, such as when you say:

    compose [
        1 + (block1)
        (block2)
    ]

How should newline markers be merged, between what\'s in the COMPOSE and
what\'s in the spliced data itself? That\'s just the logic related to
*one bit*. Putting in some \"indentation count\" would introduce many
more questions. Plus, there\'s not a lot of bits to spare for that
count: one of the \"rules of the game\" is to keep things down to just 4
platform pointers per value cell.

Expanding the formatting features isn\'t too likely. One feature request
that the tail get its own newline marker was [accepted for open source
Rebol3](https://github.com/rebol/rebol-issues/issues/2303){rel="nofollow noreferrer"},
but [rejected by
Red](https://github.com/red/red/issues/3348){rel="nofollow noreferrer"}.
I wouldn\'t expect to see much more done in this area.

------------------------------------------------------------------------

## Comments on question
