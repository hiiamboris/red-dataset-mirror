# Breaking out of a recursive function

**Link:**
<https://stackoverflow.com/questions/44913817/breaking-out-of-a-recursive-function>

**Asked:** 2017-07-04 20:48:21 UTC

------------------------------------------------------------------------

I\'m walking through a set of nested blocks and want to stop the walk
when I\'ve found the value I\'m looking for.

For reasons that are beyond the scope of this question, I can\'t use
PARSE for this particular problem, nor use FOREACH as the looper:

    walk: func [series [block!] criteria [block!]][
        use [value] compose/deep [
            while [not tail? series][
                value: pick series 1

                either block? value [
                    walk value criteria
                ][
                    (to paren! criteria)
                ]

                series: next series
            ]
        ]
    ]

I\'d like to break out if I find this specific value.

    walk [a [b c [d e] f] g] [if value = 'e [return value]]
    ; returns 'e

However, I\'d also like to do operations that don\'t break out:

    walk [a [b c [d e] f] g] [
        collect [if find [c e] value [keep value]]
    ]
    ; returns [c e]

Would like to try and solve this for any of the Rebol flavours including
Red. Any thoughts as to efficiency (reason I use a block instead of a
function), etc. would be welcome too.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by rgchris

The function combo I was looking for is CATCH/THROW. Once again, using
the given function:

    walk: func [series [block!] criteria [block!]][
        use [value] compose/deep [
            while [not tail? series][
                value: pick series 1

                either block? value [
                    walk value criteria
                ][
                    (to paren! criteria)
                ]

                series: next series
            ]
        ]
    ]

I can simply wrap it as follows:

    catch [walk [a [b c [d e] f] g] [if value = 'e [throw value]]]
    ; returns 'e

## Some Notes

-   I want the function to return NONE if there are no matches

I\'ll just have WALK return NONE (am using ALSO just so as not to leave
an awkward trailing `none`):

     walk: func [series [block!] criteria [block!]][
          also none use [value] compose/deep [
              while [not tail? series][
                  value: pick series 1

                  either block? value [
                      walk value criteria
                  ][
                      (to paren! criteria)
                  ]

                  series: next series
              ]
          ]
      ]

-   [red](/questions/tagged/red "show questions tagged 'red'"){.post-tag
    rel="tag"} does not have a USE function

This introduces a complication as I *only* want to bind the block to the
word VALUE. If I were to rewrite the function as follows:

    walk: func [series [block!] criteria [block!] /local value][
        do bind compose/deep [
            while [not tail? series][
                value: pick series 1

                either block? value [
                    walk value criteria
                ][
                    (to paren! criteria)
                ]

                series: next series
            ]
        ] 'value
    ]

Then it also binds that same block to the words SERIES and CRITERIA
which would override the binding of any such words from the calling
context, e.g.:

    walk [some values][series: none probe value] ; results in error

------------------------------------------------------------------------

### Answer (score: 2) --- by MarkI

This version avoids binding anything except VALUE and works in Red 0.6.3
and Rebol2:

    walk: func [series [block!] criteria [block!]][
        also none do bind compose/deep [
            while [not tail? series] [
                value: pick series 1
                either block? value [
                    walk value criteria
                ] [
                    (to paren! criteria)
                ]
                series: next series
            ]
        ]
        context [value: none]
    ]

(Comments on how this implementation differs from what USE does would be
welcome.)

And yes, this does not work on Rebol3 Alpha. But neither does the one
with the USE. I think it\'s a THROW issue.

------------------------------------------------------------------------

## Comments on question

*Comment by Geeky I:* **`use`** prevents me from running this code
inside *Red*. Would using `/local` in the *func spec* still work with
your code?

*Comment by Geeky I:* FYI, with Rebol2 and Ren-c (the rebol flavours I
tried) it either gives an error or returns empty block. So I assume you
want an empty block when it fails?

*Comment by rgchris:* \@GeekyI Not quite---COMPOSE/DEEP builds a new
block that USE then binds to it\'s generated context. This happens in
every invocation so in addition to adding `/local node` you need to bind
the COMPOSE block to `'node` (see
[here](https://github.com/rgchris/Scripts/blob/master/experimental/altxml.red#L184){rel="nofollow noreferrer"}).
And at that, there\'s a downside in that you are also binding the words
`series` and `criteria` which would override the context of those words
if they were in the calling block. e.g. `walk [some data][series: 'foo]`

*Comment by rgchris:* Used `node` where I\'d meant `value` in the above
comment\...
