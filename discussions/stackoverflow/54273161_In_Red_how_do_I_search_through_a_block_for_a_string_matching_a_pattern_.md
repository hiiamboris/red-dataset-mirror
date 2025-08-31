# In Red, how do I search through a block for a string matching a pattern?

**Link:**
<https://stackoverflow.com/questions/54273161/in-red-how-do-i-search-through-a-block-for-a-string-matching-a-pattern>

**Asked:** 2019-01-20 02:45:19 UTC

------------------------------------------------------------------------

Given:

    player-wins: [
        "rock breaks scissors"
        "paper covers rock"
        "scissors cut paper"
        ]

I want a function which accepts two strings, each representing any of
rock, paper or scissors and then returns the element that matches,
ignoring the verb.

Example:

`does-player-win "paper" "rock"` should return \"paper covers rock\" by
searching the block.

**UPDATE** I tried to change the structure to make it easy for `find` or
`select` but apparently my structure is illegal:

    player-wins: [
        ["rock" "scissors"] "breaks"
        ["paper" "rock"] "covers"
        ["scissors" "paper"] "cut"
    ]

------------------------------------------------------------------------

## Answers

------------------------------------------------------------------------

### Answer (score: 1) --- by sqlab

I almost forgot the most simple solution

    player-wins: [
        "rock"  "breaks" "scissors"
        "paper" "covers"" rock" 
        "scissors" "cuts"  "paper"
    ]

    game: func [player1 player2]  [
        foreach [subject predicate object] player-wins [
            all [
                player1 = subject
                player2 = object
                return reduce [player1 predicate player2]
            ]
        ]
    ]

    >> print game "rock" "scissors"
    rock breaks scissors
    >> print game "scissors" "paper"
    scissors cut paper

But also your second structure fits

    player-wins: [
        ["rock" "scissors"] "breaks"
        ["paper" "rock"] "covers"
        ["scissors" "paper"] "cut"
    ]

    win: function [player1 player2] [
        game: reduce [player1 player2]
        winning: player-wins/(game)
        print [player1 winning player2]
    ]


    >> win "paper" "rock" 
    paper covers rock

or short

    win: func [player1 player2] [
        print [player1 select/only player-wins reduce [player1 player2] player2]
    ]

And an optimized version independent of the order covering all
variations could be like this

    player-wins: [
        "rock" "breaks" 
        "scissors" "cuts" 
        "paper" "covers" 
        "rock" "is covered by" 
        "paper" "is cut by" 
        "scissors" "will be broken by" "rock" 
    ]

    game: func [player1 player2] [
        parse player-wins [
            collect [some [keep [player1 skip player2] | 2 skip]    ]   
        ]
     ]

     >> print game "scissors" "rock"
     scissors will be broken by rock
     >> print game "rock" "scissors"
     rock breaks scissors

*Comment by Terrence Brannon:* is the `reduce` necessary on
`game: reduce [player1 player2]` - it seems you could just do
`game: [player1 player2]`.

*Comment by sqlab:* Yes it\'s needed. It replaces the words player1 and
player2 with their value. \[player1 player2\] are not in your block. A
block shields against direct evaluation.

------------------------------------------------------------------------

## Comments on question
