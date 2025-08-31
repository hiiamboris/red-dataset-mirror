# How to find the first element of a block of strings whose first character matches an input character?

**Link:**
<https://stackoverflow.com/questions/54272942/how-to-find-the-first-element-of-a-block-of-strings-whose-first-character-matche>

**Asked:** 2019-01-20 01:57:30 UTC

------------------------------------------------------------------------

Given `weapons: ["rock" "scissors" "paper"]`

If I did `player-choice: ask "(r)ock, (p)aper, (s)cissors or (q)uit? "`

how could i look for the character entered by the user in the block with
word `weapons` attached to it

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 2) --- by Gregg Irwin

If you only want one match, and to use only the actual item names in
your block, your own solution is fine. But one of the important things
about Red is how you can structure your data to make things easier. For
example, if you want to select items from a list based only on a known
key (e.g. first character), you can make that explicit, rather than
implicit.

    weapons: ["r" "rock" "s" "scissors" "p" "paper"]
    player-choice: ask "(r)ock, (p)aper, (s)cissors or (q)uit? "
    print select weapons player-choice

------------------------------------------------------------------------

### Answer (score: 1) --- by Terrence Brannon

    weapons: ["rock" "scissors" "paper"]
    matching-weapon: func [abbrev][
        foreach weapon weapons [
            if (first weapon) = first abbrev [
                return weapon
            ]
        ]
    ]

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

    >> abr: "p"
    == "p"
    >> parse weapons [some [into [x: abr (print x)] | skip]  ]
    paper

or

    >> parse weapons [collect some [into [x: abr keep (x)] | skip]  ]
    == ["paper"]

------------------------------------------------------------------------

### Answer (score: -1) --- by Time Series Lord

If you want the block starting from what is found, remove `index?`

    switch player-choice [
        "r" [index? find weapons "rock"]
        "s" [index? find weapons "scissors"]
        "p" [index? find weapons "paper"]
        "q" ["quit"]
    ]

------------------------------------------------------------------------

## Comments on question
