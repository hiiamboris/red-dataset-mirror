
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "ms"] 
            territory [#type "BN"]
        ] 
        dates [
            calendars [
                calendar [
                    #type "generic" 
                    dateFormats [
                        dateFormatLength [
                            #type "full" 
                            dateFormat [
                                pattern [! "dd MMMM y G"] 
                                datetimeSkeleton [! "GyMMMMdd"]
                            ]
                        ]
                    ]
                ] 
                calendar [
                    #type "gregorian" 
                    dateFormats [
                        dateFormatLength [
                            #type "full" 
                            dateFormat [
                                pattern [! "dd MMMM y"] 
                                datetimeSkeleton [! "yMMMMdd"]
                            ]
                        ]
                    ]
                ]
            ]
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
                        pattern [! "¤ #,##0.00"]
                    ]
                ]
            ] 
            currencies [
                currency [
                    #type "BND" 
                    symbol [! "$"]
                ]
            ]
        ]
    ]

