# Parse string to find first duplicate character - functional vs. prodecural coding style

**Link:**
<https://stackoverflow.com/questions/42114410/parse-string-to-find-first-duplicate-character-functional-vs-prodecural-codin>

**Asked:** 2017-02-08 13:25:53 UTC

------------------------------------------------------------------------

I want to parse a string to find the first N duplicate characters found
in a `(character, n)` set.

For example, for `"ozzllluu"` and sets (\"u\" =\> 2), (\"d\" =\> 2),
(\"l\" =\> 3), and (\"r\" =\> 3)\... I would want to find \"lll\",
because it is 3 characters and happens before the two \"u\"s.

procedural style solution:

    Rebol []

    seq-set: [#"u" 2 #"d" 2 #"l" 3 #"r" 3]
    str: "ozzllluu"

    lastchar: ""
    cnt: 1
    seq-char: ""

    foreach char str [
        either char = lastchar [ 
            cnt: cnt + 1
            if (select seq-set char) = cnt [
                seq-char: char
                break
             ]
       ][
            cnt: 1
       ]
       lastchar: char   
    ]

    either seq-char = "" [
        print "no seq-char"
    ][
        print join "seq-char " seq-char
    ]

How would I do this same thing using a `parse` rule?

In short:

-   `parse` string for first n duplicate character found in (character
    ,n) set
-   \"function\" the existing procedural code
-   dogfood into Rebol / Red!

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 8) --- by DocKimbel

Here is a solution using Red\'s Parse (works in R3 too):

    seq-set: [2 #"u" | 2 #"d" | 3 #"l" | 3 #"r"]
    rule: [any [set char seq-set break | skip]]

    red>> parse "ozzllluu" rule
    red>> char
    == #"l"

------------------------------------------------------------------------

### Answer (score: 3) --- by sqlab

Just a simple rule as a starting point

    keys:  ["uu" | "dd" | "lll" | "rrr"]
    rule: [(k: none)  any [[copy k keys to end ] | skip] ]

    >> parse "olllddsslll rr rrr" rule  k
    == "lll"

*Comment by rgchris:* Easy enough to build that rule too:
**`remove collect [foreach [ch rp]["u" 2 "d" 2 "l" 3 "r" 3][keep '| keep head insert/dup copy ch ch rp - 1]]`**

------------------------------------------------------------------------

### Answer (score: 1) --- by endo64

Below `parse` rule finds all duplicates and skips the others.

    ;Rebol 2 version
    char: charset [#"a" - #"z"]
    parse/all "wqooossssccfgg" [some [
        copy x char [copy y some x (print [s: join x y length? s])]
        | skip 
      ]
    ]
    ;output
    ooo 3
    ssss 4
    cc 2
    gg 2

    ;Red version
    parse "wqooossssccfgg" [some [
        copy x char [copy y some x (print [s: append x y length? s])]
    | skip ]]

------------------------------------------------------------------------

## Comments on question

*Comment by GhostCat:* Hint: be really careful about \"humor\" in
questions or answers. Your approach simply confused me. You want that
other people spend their time to help you. There is no need to be funny
for that; neither when asking; nor when answering. Yes, sometimes that
is just nice, but especially in \"written only\" conversations, \"good
humor\" is **hard**.

*Comment by OneArb:* \@GhostCat
[en.wikipedia.org/wiki/Eating_your_own_dog_food](https://en.wikipedia.org/wiki/Eating_your_own_dog_food){rel="nofollow noreferrer"} -
search \"Microsoft\"
