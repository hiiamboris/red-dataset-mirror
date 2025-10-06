Red [
    Purpose: "15 Puzzle Game"
    Rosettacode: http://www.rosettacode.org/wiki/15_Puzzle_Game
    Author: "Guaracy Monteiro"
    Date: 25/11/2018
    Used-words: [random/seed now func either return rejoin copy/part loop prin print repeat
        case/all index? find break foreverload ask quit wait continue]
]

random/seed now
numbers: random [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 0]
;numbers: [1 2 3 4 5 6 7 8 9 10 11 12 13 14 0 15]

cell: func[n][
    either n = 0
      [return "│  "]
      [rejoin ["│" copy/part rejoin [n " "] 2]]
]

top-board:    "┌──┬──┬──┬──┐"
mid-board:    "├──┼──┼──┼──┤"
botton-board: "└──┴──┴──┴──┘"

line-board: func[l][
    i: l - 1 * 4 + 1
    loop 4 [
        prin [cell numbers/:i]
        i: i + 1
    ]
    print "│"
]

board: does [
    print top-board
    repeat i 3 [
        line-board i
       print  mid-board
    ]
    line-board 4
    print botton-board
]

valid?: func[][
    v: copy []
    case/all [
        pos > 4        [append v numbers/(pos - 4)]
        (pos % 4) <> 1 [append v numbers/(pos - 1)]
        pos < 13       [append v numbers/(pos + 4)]
        (pos % 4) <> 0 [append v numbers/(pos + 1)]
    ]
    v
]

move-tile: func[m][
    p: index? find numbers m
    numbers/:pos: m
    pos: p
    numbers/:pos: 0
]

win?: func[][
    repeat i 15 [
        if numbers/:i <> i [ break]
    ]
    print i
    i = 15
]

pos: index? find numbers 0
moves: 0
forever [
    board
    v: valid?
    print rejoin ["Valid moves: " v]
    m: load ask "Enter number to move into empty tile (0 to quit): "
    if m = 0 [print "Bye" quit]
    if (find v m) = none [
        print "** Invalid move **"
        wait 1
        continue
    ]
    move-tile m
    moves: moves + 1
    if win? [
        board
        print [newline "Congratualtions! Solved in" moves "moves"]
        numbers: "YOU.....WIN!...."
        board
        quit
    ]
]
