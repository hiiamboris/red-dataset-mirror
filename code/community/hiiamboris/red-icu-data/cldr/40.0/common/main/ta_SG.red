
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "ta"] 
            territory [#type "SG"]
        ] 
        dates [
            timeZoneNames [
                metazone [
                    #type "India" 
                    short [
                        standard [! "∅∅∅"]
                    ]
                ] 
                metazone [
                    #type "Malaysia" 
                    short [
                        standard [! "MYT"]
                    ]
                ] 
                metazone [
                    #type "Singapore" 
                    short [
                        standard [! "SGT"]
                    ]
                ]
            ]
        ] 
        numbers [
            decimalFormats [
                #numberSystem "latn" 
                decimalFormatLength [
                    decimalFormat [
                        pattern [! "#,##0.###"]
                    ]
                ]
            ] 
            percentFormats [
                #numberSystem "latn" 
                percentFormatLength [
                    percentFormat [
                        pattern [! "#,##0%"]
                    ]
                ]
            ] 
            currencyFormats [
                #numberSystem "latn" 
                currencyFormatLength [
                    currencyFormat [
                        #type "standard" 
                        pattern [! "¤ #,##0.00"]
                    ]
                ]
            ] 
            currencies [
                currency [
                    #type "MYR" 
                    symbol [! "RM"]
                ] 
                currency [
                    #type "SGD" 
                    symbol [! "$"]
                ] 
                currency [
                    #type "USD" 
                    symbol [! "US$"]
                ]
            ]
        ]
    ]

