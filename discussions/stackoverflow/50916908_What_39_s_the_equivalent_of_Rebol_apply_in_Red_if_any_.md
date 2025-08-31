# What&#39;s the equivalent of Rebol apply in Red if any?

**Link:**
<https://stackoverflow.com/questions/50916908/whats-the-equivalent-of-rebol-apply-in-red-if-any>

**Asked:** 2018-06-18 20:20:46 UTC

------------------------------------------------------------------------

Rebol has apply [Creating map function in Red
language](https://stackoverflow.com/questions/46753092/creating-map-function-in-red-language)
what\'s the equivalent of Rebol apply in Red if any ?

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by rebolek

Currently, there\'s no native `apply` in Red. You can write `apply` on
your own:

    apply: func [
        "Apply a function to a block of arguments"
        fn      [any-function!] "Function value to apply"
        args    [block!]        "Block of arguments (to quote refinement use QUOTE keyword)"
        /local refs vals val
    ][
        refs: copy []
        vals: copy []
        set-val: [set val skip (append/only vals val)]
        parse args [
            some [
                'quote set-val
            |   set val refinement! (append refs to word! val)
            |   set-val
            ]
        ]
        do compose [(make path! head insert refs 'fn) (vals)]
    ]

It works bit differently than Rebol\'s `apply` (because I don\'t like
Rebol\'s `apply` syntax). If you define some function:

    f: func [
        foo
        /bar
            baz
    ][
        reduce [foo bar baz]
    ]

then here\'s how to use this `apply`:

    >> apply :f [1 /bar 1]
    == [1 true 1]
    >> apply :f [quote /bar]
    == [/bar false none]
    >> apply :f [quote /bar /bar 1]
    == [/bar true 1]

See
[http://red.qyz.cz/apply-and-ufcs.html](http://red.qyz.cz/apply-and-ufcs.html){rel="nofollow noreferrer"}
for details.

------------------------------------------------------------------------

## Comments on question
