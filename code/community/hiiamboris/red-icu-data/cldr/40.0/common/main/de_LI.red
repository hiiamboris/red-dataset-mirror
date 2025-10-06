
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "de"] 
            territory [#type "LI"]
        ] 
        characters [
            exemplarCharacters [#type "numbers" ! "[\- ‑ . ’ % ‰ + 0 1 2 3 4 5 6 7 8 9]"]
        ] 
        dates [
            calendars [
                calendar [
                    #type "gregorian" 
                    dayPeriods [
                        dayPeriodContext [
                            #type "stand-alone" 
                            dayPeriodWidth [
                                #type "narrow" 
                                dayPeriod [#type "am" #draft "contributed" ! "vm."] 
                                dayPeriod [#type "pm" #draft "contributed" ! "nm."]
                            ]
                        ]
                    ]
                ]
            ]
        ] 
        numbers [
            symbols [
                #numberSystem "latn" 
                decimal [! "."] 
                group [! "’"]
            ] 
            percentFormats [
                #numberSystem "latn" 
                percentFormatLength [
                    percentFormat [
                        pattern [#draft "contributed" ! "#,##0%"]
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
                    #type "EUR" 
                    symbol [#draft "contributed" ! "EUR"]
                ]
            ]
        ]
    ]

