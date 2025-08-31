# compose and compose/deep for parse rule in red?

**Link:**
<https://stackoverflow.com/questions/50483395/compose-and-compose-deep-for-parse-rule-in-red>

**Asked:** 2018-05-23 08:26:32 UTC

------------------------------------------------------------------------

How to keep (print text) as it disappears when using compose ?

    s: {hello test1 parse test2}
    t1: "test1"
    t2: "test2"

    rule: compose [ thru (t1) mark: copy text to (t2) (print text)]
    parse s rule

same question for compose/deep if it\'s different answer:

    s: {hello test1 parse test2. hello second test for test1 parse test2.}
    t1: "test1"
    t2: "test2"

    rule: compose/deep [ any [thru (t1) mark: copy text to (t2) (print text)]]
    parse s rule

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 6) --- by HostileFork says dont trust SE

You aren\'t limited to what\'s in the box, so you could make your own
COMPOSE-like construct that does other patterns.

For instance, here\'s a **composeII** which only substitutes for cases
where there are nested parentheses. So it will leave **(x)** alone but
evaluate **((x))**.

    composeII: function [block /only /deep] [
        collect [
            foreach item block [
                case [
                    all [
                        paren? :item
                        1 = length? item
                        paren? first item
                    ][
                        either only [
                            keep/only do first item
                        ][
                            keep do first item
                        ]
                    ]

                    all [
                        deep
                        block? :item
                    ][
                        either only [
                            keep/only composeII/deep/only item
                        ][
                            keep/only composeII/deep item
                        ]
                    ]

                    true [
                        keep/only :item
                    ]
                ]
            ]
        ]
    ]

So for your case:

    >> t1: "test1"
    >> t2: "test2"

    >> composeII/deep [
        any [thru ((t1)) mark: copy text to ((t2)) (print text)]
    ]

    == [
        any [thru "test1" mark: copy text to "test2" (print text)]
    ]

*Comment by rebolek:* Please, change `for-each` to `foreach` otherwise
it won\'t work in Red.

*Comment by HostileFork says dont trust SE:* \@rebolek It can if you say
**for-each: :foreach** to avoid retyping something you wrote in the
console (and then forget you did that, so it works on subsequent runs)

*Comment by user310291:* \@HostileFork thanks for being so helpfull as
usual ;)

*Comment by HostileFork says dont trust SE:* \@user310291 Note that the
above code\--since it is not a \"native\"\--will be significantly slower
than COMPOSE. However, if you were to write it in Red/System, there
would be no reason that it would be that much slower. [Implementation of
compose, if you are
curious.](https://github.com/red/red/blob/9e5803bb48f6cb39eed40b7af22e4c8853dafd2f/runtime/natives.reds#L1018){rel="nofollow noreferrer"}

------------------------------------------------------------------------

### Answer (score: 4) --- by rebolek

You can either convert block to paren, or quote paren:

    >> compose [something here (to paren! [print text])]
    == [something here (print text)]
    >> compose [something here (quote (print text))]
    == [something here (print text)]

It\'s the same for `compose/deep` .

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

As blocks shield their content from evaluation of **compose** you can
also use

    >> rule: compose [ thru (t1) mark: copy text to (t2) (first [(print text)] )]
    == [thru "test1" mark: copy text to "test2" (print text)]

------------------------------------------------------------------------

## Comments on question

*Comment by HostileFork says dont trust SE:* You aren\'t limited to
what\'s in the box, so you could make your own COMPOSE-like construct
that does other patterns. For instance, **composeII \[1 + 2 (1 + 2)
((1 + 2))\]** =\> **\[1 + 2 (1 + 2) 3\]**.

*Comment by user310291:* \@HostileFork I must not be awaken but I can\'t
see clearly how to do and what you mean :)
