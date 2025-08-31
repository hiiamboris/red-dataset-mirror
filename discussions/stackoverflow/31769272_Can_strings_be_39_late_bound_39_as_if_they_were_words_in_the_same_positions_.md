# Can strings be &#39;late bound&#39; as if they were words in the same positions?

**Link:**
<https://stackoverflow.com/questions/31769272/can-strings-be-late-bound-as-if-they-were-words-in-the-same-positions>

**Asked:** 2015-08-02 06:45:05 UTC

------------------------------------------------------------------------

When you LOAD a string, it biases to the user context by default:

    >> f: 3

    >> outside: object [
        f: 4
        getter: does [
            print reduce compose [(load "f")]
        ]
    ]

    >> outside/getter
    3

This turns out to be an artifact of [LOAD\'s
implementation](https://github.com/rebol/rebol/blob/25033f897b2bd466068d7663563cd3ff64740b94/src/mezz/base-files.r#L211){rel="nofollow noreferrer"},
which uses
[`intern`](https://github.com/rebol/rebol/blob/25033f897b2bd466068d7663563cd3ff64740b94/src/mezz/base-files.r#L175){rel="nofollow noreferrer"}
to *\"Import (internalize) words and their values from the lib into the
user context.\"*

To get around this, I can save myself the inefficiency of creating a
potentially-useless binding via LOAD, use TO-WORD instead, then use the
object\'s `self` to rebind it:

    >> m: 10

    >> inside: object [
        m: 20
        getter: does [
            print reduce [(bind to-word "m" self)]
        ]
    ]

    >> inside/getter
    20

**Now my question:** Given the way that [definitional
\"scoping\"](https://stackoverflow.com/questions/21964110/i) works, is
there simply no way\--present or future\--for this pattern\'s
`getter-code` and `getter-text` to both output `4 20`:

    >> f: 0

    >> m: 0

    >> ctx: context [
        f: 4

        m: 10

        both: object [
            m: 20
            getter-code: does [print [f m]]
            getter-text: does [impossible-print ["f" "m"]]
        ]
    ]

E.g. there is something fundamentally missing to where
`impossible-print` can\'t be written?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by MarkI

As you quite rightly point out, LOAD biases to the user context. Without
access to the contexts you want to bind the words (that will be loaded
from \"f\" and \"m\") to, your function would indeed be impossible.
Fortunately, contexts are first-class objects in Rebol, so an answer
might look like this:

    f: m: 0 ctx: context [
        f: 4
        m: 10
        both: object [
            m: 20
            getter-code: does [print [f m]]
            getter-text: does [impossible-print reduce ["f" ctx "m" self]]
        ]
    ]
    impossible-print: func [vars /local r][
        r: copy []
        foreach [v c] vars [append r bind to-word v c]
        print r
    ]

------------------------------------------------------------------------

## Comments on question
