
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "en"] 
            territory [#type "NL"]
        ] 
        numbers [
            symbols [
                #numberSystem "latn" 
                decimal [! ","] 
                group [! "."]
            ] 
            currencyFormats [
                #numberSystem "latn" 
                currencyFormatLength [
                    currencyFormat [
                        #type "standard" 
                        pattern [! "¤ #,##0.00;¤ -#,##0.00"]
                    ] 
                    currencyFormat [
                        #type "accounting" 
                        pattern [! "¤ #,##0.00;(¤ #,##0.00)"]
                    ]
                ]
            ]
        ]
    ]

