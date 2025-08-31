# A &#39;compiler&#39; for list comprehension in Rebol

**Link:**
<https://stackoverflow.com/questions/59706298/a-compiler-for-list-comprehension-in-rebol>

**Asked:** 2020-01-12 17:20:51 UTC

------------------------------------------------------------------------

I want to compile this list comprehension:

    >> lc [reduce [x y] | x in [1 2 3] y in [4 5 6]]
    == [[1 4] [1 5] [1 6] [2 4] [2 5] [2 6] [3 4] [3 5] [3 6]]

in:

    collect [
       foreach x [1 2 3] [
           foreach y [4 5 6] [
               keep/only reduce [x y]]]]

or:

    >> lc [reduce [x y] | x in range [1 5] y in range reduce[1 x] if x + y > 4]
    == [[3 2] [3 3] [4 1] [4 2] [4 3] [4 4] [5 1] [5 2] [5 3] [5 4] [5 5]...

in:

    collect [
        foreach x range [1 5] [
            foreach y range reduce [1 x] [
                if x + y > 4 [keep/only reduce [x y]]]]]

or:

    >> lc/flat [reduce [x y] | x in range [1 5] y in range reduce [1 x] if x + y > 4]
    == [3 2 3 3 4 1 4 2 4 3 4 4 5 1 5 2 5 3 5 4 5 5]

in:

    collect [
        foreach x range [1 5] [
            foreach y range reduce [1 x] [
               if x + y > 4 [keep reduce [x y]]]]] 

My ugly implementation in Red is:

    fx: func [code] [func [x] code]
    lc: function [list-comp /flat] [ ; list-comp = [code | generators [opt if test]]
        flat: any [flat false]
        var: none
        part-gen: part-if: rest: code: []
        rule-var: [set var word! 'in]
        list: copy []
        generator+if: [copy part-gen to 'if copy part-if to end]
        generator: [copy part-gen to end]
        emit: fx [append/only list x]
        parse list-comp [
            copy code to '| skip [
                generator+if 
            | 
                generator   ]
            ]
        parse part-gen [
            some [
                rule-var (emit var) copy rest to [rule-var | end ] (emit rest)
                ]
            ]
        option: either flat [copy [keep]] [copy [keep/only]]
        code: append option code
        if part-if <> [] [code: append/only part-if code]
        foreach [l v] reverse list [code: compose [foreach (v) (l) (reduce [code])]]
        collect code
    ]

    ; from hof.r
    range: func [
        {Makes a block containing a range of ord! values.
        Format: .. [1 5]   == [1 2 3 4 5]
                .. [1 3 6] == [1 2 5]
                .. [2 2 6] == [2 2 2 2 2 2]
        }
        xs [block!] {either [start end] or [start next end]}
        /local range x1 x2 delta result [block!]
    ][
        range: reduce xs
        x1: range/1
        either range/3 [
            x2: range/3
            delta: (range/2 - x1)
        ][
            x2: range/2
            delta: 1
        ]

        ;result: make block! (x2 - x1) / delta
        result: copy []
        either delta <> 0 [
            result: reduce [x1]
            loop x2 - x1 [
                append result delta + last result
            ]
        ][
            loop absolute x2 [
                insert tail result x1
            ]
        ]
        result
    ]

The program does not *flow*, it is full of variables, of **if** and
**append** (I had difficulty with **parse**; **compose**, in this case,
is limited).\
Is there a more \"rebolish\" way (in rebol2/rebol3/red/ren-c) to resolve
this problem?

Update: My implementation of the \'compiler\' is only an indication of
what I intend to do. I am not asking for a correction of my program (I
could not even report it) but for a solution that better uses **parse**
and builds the code more clearly.

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 7) --- by 9214

List-comprehension is a great exercise in dialect building: it\'s
moderately small, has a well-defined purpose and, in general, serves as
a code kata for aspiring young Grasshopper --- there is no single
\"right\" way to do it, but many better or worse solutions.

\"Rebolish\" way would be to stay pragmatic, start with use-cases, and
let the problem domain guide you --- perhaps you\'re solving Euler
project and need a set-theoretic library, perhaps what you want are
LINQ-like database queries, maybe it\'s just for the sake of learning
and the pleasure of reinventing the wheel, who knows?

While thinking about it, you might realize that you actually don\'t need
list comprehensions, and that\'s good! The leanest code is the one never
being written, and the cleverest solution is the one that nips the
problem in the bud by redefining it in simpler terms.

Assuming you\'re just dabbling with metaprogramming or learning Red
without any specific problem in mind, and taking my initial
[comment](https://stackoverflow.com/questions/59706298/a-compiler-for-list-comprehension-in-rebol#comment105565879_59706298)
with your subsequent
[edit](https://stackoverflow.com/posts/59706298/revisions) into account,
here are my 2¢:

### Start with a grammar

List comprehension, as a syntactic construct, has a well-defined form.
Consulting respective
[wiki](https://en.wikipedia.org/wiki/List_comprehension){rel="nofollow noreferrer"}
page makes it possible to define a basic grammar right away:

    set-builder: [expression '| some generator predicate]
    expression:  [to '|]
    generator:   [word! 'in to [generator | predicate | end]]
    predicate:   ['if to end]

### Figure out what to emit

You got that covered already: for each generator in set-builder notation
we need an extra layer of `foreach`; the body of inner `foreach` should
have the form `<predicate> [<keep> <expression>]`.

### Define an interface

Instead of `/flat` I\'d use `/only`, as this is a well-known idiom.
Since there are a lot of `set-word!`s in our function\'s body, I\'ll use
`function` constructor:

    list: function [spec [block!] /only][...]

### Connect the dots

Proceed in baby steps and start simple:

1.  Parse the `spec` with `set-builder` and extract the relevant parts
    for further processing.
2.  Compose extracted parts together.

### Step 1

We need to modify our grammar accordingly: add `collect` / `keep` where
needed and counter edge-cases.

There are 3 parts that we need to extract: expression, generators, and
predicate. We can group generators together by adding an extra
`collect`:

    set-builder: [collect [expression '| collect some generator predicate]]

1.  `expression` is straightforward:

        expression: [keep to '|]

2.  So as `predicate`, but we need to `keep` the `if` also:

        predicate: [ahead 'if keep to end]

3.  But `generator` is trickier, for two reasons:

    1.  There\'s such a thing called *partial match*. We cannot just
        write:

            generator: [keep word! 'in keep to [generator | predicate | end]]

        When `generator` or `predicate` matches inside `to`, it will
        recursively `keep` extra data because of the `word!` or `to end`
        match, messing up the extracted block.

    2.  `keep` behaves differently depending on the number of values
        being kept: it keeps single value as-is, but groups many of them
        together.

            [1 2 3]         -> foreach x [1 2 3] ..., not foreach x 1 2 3 ...
            [range [4 5 6]] -> foreach y range [4 5 6] ...

    So, what we need is **(a)** a rule that will check that the thing we
    look at is indeed a generator, without extracting anything
    (`word! 'in` should do) and **(b)** a slight modification to `keep`
    that will always extract a `block!` --- `keep copy dummy-word`. Lo
    and behold:

        generator: [keep word! 'in keep copy range to [word! 'in | 'if | end]]

Now mash all of that together:

    set-builder: [collect [expression '| collect some generator predicate]]
    expression:  [keep to '|]
    generator:   [keep word! 'in keep copy range to [word! 'in | 'if | end]]
    predicate:   [ahead 'if keep to end]

    set [expression ranges: clause:] parse spec set-builder

Note that I use `set-word!`s inside a block to subvert `function` to our
cause. `ranges` contains, well, ranges, each in turn containing a word
to iterate with and a range itself. `clause` is either a `block!` (if it
was present in `spec`) or `none!` (if there wasn\'t any).

### Step 2

First thing first, we compose the body block of inner `foreach`:

    body: [<clause> [<keep> <expression>]]

This leads to:

    body: compose/deep [(any [clause 'do]) [(pick [keep/only keep] only) (expression)]]

Which covers two extra cases: the absence of predicate (unconditional
evaluation) and the presence of `/only` refinement.

Let\'s figure out how each layer of subsequent `foreach` looks like:

    layer: [foreach <word> <range> <body>]

`<word>` can be used as-is; `<range>` might be spliced; `<body>` is
either a `body` or an innermost `layer`. Because of the range splicing
(i.e. peeling off an extra layer of `[...]` from extracted data), we
cannot use `compose/only`, so we need wrap `<body>` in a block and use
`compose/deep`:

    layer: [foreach (word) (range) [(body)]]

One last thing: we extracted data from top to bottom, but we need to
accrue it the other way around, by layering `foreach` one on another,
starting with `body`. So we need to `reverse` the block of ranges:

    foreach [range word] reverse ranges [...]

All set! Now just slap `collect` on top and track `body` to wrap over on
next iteration:

    collect foreach [range word] reverse ranges [body: compose/deep layer]

And the whole thing is:

    list: function [
        "List comprehension"
        spec [block!]
        /only
    ][
        #1
        set-builder: [collect [expression '| collect some generator predicate]]
        expression:  [keep to '|]
        generator:   [keep word! 'in keep copy range to [word! 'in | 'if | end]]
        predicate:   [ahead 'if keep to end]

        set [expression ranges: clause:] parse spec set-builder

        #2
        body:  compose/deep [(any [clause 'do]) [(pick [keep/only keep] only) (expression)]]
        layer: [foreach (word) (range) [(body)]]

        collect foreach [range word] reverse ranges [body: compose/deep layer]
    ]

Examples:

    >> list [as-pair x y | x in [1 2 3] y in [4 5 6]]
    == [1x4 1x5 1x6 2x4 2x5 2x6 3x4 3x5 3x6]
    >> list/only [reduce [x y] | x in range [1 5] y in range reduce [1 x] if x + y > 4]
    == [[3 2] [3 3] [4 1] [4 2] [4 3] [4 4] [5 1] [5 2] [5 3] [5 4] [5 5]]

------------------------------------------------------------------------

Is it good? If it helped you to grok Red, Parse and dialects just a
little bit, then I think it might be. Is it bad? If so, then you can
learn from my mistakes and do better.

In any case, if you find yourself struggling with Parse, there is a
[reference
documentation](https://github.com/red/docs/blob/0be2c29ee3e322d76313488a15e8b8a86f97486b/en/parse.adoc){rel="nofollow noreferrer"}
in the pipeline that you might want to skim through and
[`parse`](https://gitter.im/red/parse){rel="nofollow noreferrer"} Gitter
room where you can ask for help.

Once you refactored your code and is happy with it, share the joy in Red
[community
chat](https://gitter.im/red/red/welcome){rel="nofollow noreferrer"} and
get some feedback. Until then, take care!

------------------------------------------------------------------------

## Comments on question

*Comment by 9214:* What you ask for is largely a matter of opinion. It
might be better if you just shared the detailed spec and asked for code
review/refactoring either [here](https://codereview.stackexchange.com)
or in [Red community
chat](https://gitter.im/red/red/welcome){rel="nofollow noreferrer"}.
