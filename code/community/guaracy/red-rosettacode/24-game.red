Red [
    Purpose: "24 Game"
    Rosettacode: http://www.rosettacode.org/wiki/24_game
    Author: "Guaracy Monteiro"
    Date: 25/11/2018
    Used-words: [charset random/seed now does sort collect keep random forever print ask if break continue
        copy trim/all unless parse some append integer! skip sort insert to block! probe math quit]
]

expr:    [primary ["*" | "/" | "+" | "-"] expr | primary]
primary: [digit | "(" expr ")"]
digit:   charset "0123456789"

random/seed now
numbers: [2 3 5 9] ; First numbers for teste 3*9-(5-2)=24

newnumbers: does[
    numbers: sort collect [loop 4 [keep random 9]]
]

forever [
    print [newline "Make 24 with the digits [" numbers "] using + - * / and ()"]
    i: ask "Enter an expression: ([Q]uit [N]ew numbers): "
    if i = "Q" [break]
    if i = "N" [newnumbers continue]
    e: copy trim/all i
    unless parse e expr [
        print [i "is not a valid expression."]
        continue
    ]
    n: copy []
    parse e [some [copy d digit (append n to integer! d) | skip]]
    if (sort n) <> numbers [
        print ["You must use the four numbers provided:" numbers]
        continue
    ]
    parse e [some [digit insert ".0 " | skip insert " "]]
    e: to block! e
    probe e
    r: math e
    either r = 24 [
        print ["Congratulations. " i "= 24"]
        newnumbers
    ][
        print ["Sorry. " i "=" r "not 24"]
    ]
]
print "Bye"
quit
