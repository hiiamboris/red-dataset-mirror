
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "en"] 
            territory [#type "US"] 
            variant [#type "POSIX"]
        ] 
        characters [
            exemplarCharacters [#type "numbers" ! "[\- ‑ , . / % + 0 1 2 3 4 5 6 7 8 9]"]
        ] 
        numbers [
            symbols [
                #numberSystem "latn" 
                perMille [! "0/00"] 
                infinity [! "INF"]
            ] 
            decimalFormats [
                #numberSystem "latn" 
                decimalFormatLength [
                    decimalFormat [
                        pattern [! "0.######"]
                    ]
                ]
            ] 
            scientificFormats [
                #numberSystem "latn" 
                scientificFormatLength [
                    scientificFormat [
                        pattern [! "0.000000E+000"]
                    ]
                ]
            ] 
            percentFormats [
                #numberSystem "latn" 
                percentFormatLength [
                    percentFormat [
                        pattern [! "0%"]
                    ]
                ]
            ] 
            currencyFormats [
                #numberSystem "latn" 
                currencyFormatLength [
                    currencyFormat [
                        #type "standard" 
                        pattern [! "¤ 0.00"]
                    ]
                ]
            ]
        ]
    ]

