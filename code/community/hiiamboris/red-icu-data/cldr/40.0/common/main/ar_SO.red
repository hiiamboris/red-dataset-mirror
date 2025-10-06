
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "ar"] 
            territory [#type "SO"]
        ] 
        characters [
            exemplarCharacters [#type "numbers" ! "[\u200E \- ‑ , . ٪ ‰ + 0 1 2 3 4 5 6 7 8 9]"]
        ] 
        numbers [
            defaultNumberingSystem [! "arab"] 
            symbols [
                #numberSystem "latn" 
                percentSign [#draft "contributed" ! "٪"]
            ] 
            currencies [
                currency [
                    #type "SOS" 
                    symbol [! "S"]
                ]
            ]
        ]
    ]

