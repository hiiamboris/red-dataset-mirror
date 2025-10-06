Red [
    Purpose: "4-rings or 4-squares puzzle"
    Rosettacode: http://www.rosettacode.org/wiki/4-rings_or_4-squares_puzzle
    Author: "Guaracy Monteiro"
    Date: 28/11/2018
    Used-words: [refinement copy while append foreach if all unique reduce continue print either]
]

four-squares: function[l h /unique? /show?][
    v: copy []
    cnt: 0
    i: l
    while [i <= h][
        append v i
        i: i + 1
    ]
    foreach a v [
        foreach b v [
            if all [unique? (length? unique reduce [a b]) < 2][continue]
            foreach c v [
                if all [unique? (length? unique reduce [a b c]) < 3][continue]
                foreach d v [
                    if all [unique? (length? unique reduce [a b c d]) < 4][ continue]
                    foreach e v [
                        if all [unique? (length? unique reduce [a b c d e]) < 5][ continue]
                        foreach f v[
                            if all [unique? (length? unique reduce [a b c d e f]) < 6][ continue]
                            foreach g v [
                                if all [unique? (length? unique reduce [a b c d e f g]) < 7][ continue]
                                t: unique reduce [a + b b + c + d d + e + f f + g]
                                if (length? t) > 1 [continue]
                                if show? [
                                    print [ reduce [a b c d e f g] ": sum ->" t]
                                ]
                                cnt: cnt + 1
                            ]
                        ]
                    ]
                ]
            ]
        ]
    ]
    if cnt > 0 [
        print [cnt either unique? ["unique"]["non-unique"] "solutions in" l "to" h newline]
    ]
    cnt
]
four-squares/unique?/show? 1 7
four-squares/unique?/show? 3 9
four-squares 0 9
