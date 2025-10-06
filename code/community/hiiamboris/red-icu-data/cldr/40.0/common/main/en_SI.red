
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "en"] 
            territory [#type "SI"]
        ] 
        numbers [
            symbols [
                #numberSystem "latn" 
                decimal [! ","] 
                group [! "."] 
                exponential [! "e"]
            ] 
            currencyFormats [
                #numberSystem "latn" 
                currencyFormatLength [
                    currencyFormat [
                        #type "accounting" 
                        pattern [! "#,##0.00 ¤;(#,##0.00 ¤)"]
                    ]
                ]
            ]
        ]
    ]

