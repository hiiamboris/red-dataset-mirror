
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "fr"] 
            territory [#type "LU"]
        ] 
        characters [
            exemplarCharacters [#type "numbers" ! "[\- ‑ , . % ‰ + 0 1 2 3 4 5 6 7 8 9]"]
        ] 
        numbers [
            symbols [
                #numberSystem "latn" 
                group [! "."]
            ] 
            currencies [
                currency [
                    #type "FRF" 
                    symbol [! "FRF"]
                ] 
                currency [
                    #type "LUF" 
                    symbol [! "F"]
                ]
            ]
        ]
    ]

