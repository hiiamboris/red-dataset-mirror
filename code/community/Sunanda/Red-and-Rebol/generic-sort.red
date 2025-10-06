Red []
;; Rebol []


;;    Author: Sunanda
;;    Version: 0.0.1 June 2025
;;    Tested: R2, Red R3, Atronix

;;    R2 - returns block in REVERSE sequence!
;;    ALL OTHERS - work as expected



generic-sort: func [
    data [block!]
    sort-def [block!]
][
    sort/compare data func [a b /local av bv key ord][
    foreach [key ord] sort-def [
       av: get in a key
       bv: get in b key
       if av < bv [return ord]
       if av > bv [return 0 - ord]
       ]
       return 0
       ]
   return true
]


test-it: [

data: random/secure reduce [
    context [name: "alice" born: 1-jan-2001 health: 88 should-be: 3]
    context [name: "alan" born: 1-jan-2001 health: 200 should-be: 2]
    context [name: "alan" born: 1-jan-2001 health: 45 should-be: 1]
    context [name: "alice" born: 1-jan-1999 health: 100 should-be: 4]
    context [name: "alice" born: 1-jan-1999 health: 500 should-be: 6]
    context [name: "alice" born: 1-jan-1999 health: 299 should-be: 5]

   ]

sort-def: copy [name +1 born -1 health +1]


generic-sort data sort-def
foreach item data [print item/should-be]
 
 ]