Red[title: "spatula"]
ara: func[
    kaynak [integer!]
    hedef [integer!]
    kelime [string!]
    return: [string!]
][
    dosya: load %kelimeler.db
    foreach i dosya[
        if find pick i kaynak kelime [print pick i hedef]
    ]
]

kaynak: ask "Kaynak dil kodu?: "
hedef: ask "Hedef dil kodu?: "
while [1 > 0][
    komut: ask ">>"
    if komut = "halt" [halt]
    kelimeler: split komut " "
    kay: do kaynak
    hed: do hedef
    foreach i kelimeler [
        ara kay hed i
    ]
]
