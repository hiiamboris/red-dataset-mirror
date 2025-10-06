
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "en"] 
            territory [#type "SE"]
        ] 
        characters [
            exemplarCharacters [#type "numbers" ! "[  \- ‑ , % ‰ + 0 1 2 3 4 5 6 7 8 9]"]
        ] 
        dates [
            calendars [
                calendar [
                    #type "generic" 
                    dateFormats [
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "G y-MM-dd"] 
                                datetimeSkeleton [! "GyMMdd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "yyyyM" ! "y-MM G"] 
                            dateFormatItem [#id "yyyyMd" ! "y-MM-dd G"] 
                            dateFormatItem [#id "yyyyMEd" ! "E y-MM-dd G"]
                        ]
                    ]
                ] 
                calendar [
                    #type "gregorian" 
                    dateFormats [
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "y-MM-dd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "yM" ! "y-MM"] 
                            dateFormatItem [#id "yMd" ! "y-MM-dd"] 
                            dateFormatItem [#id "yMEd" ! "E, y-MM-dd"]
                        ]
                    ]
                ]
            ]
        ] 
        numbers [
            symbols [
                #numberSystem "latn" 
                decimal [! ","] 
                group [! " "] 
                exponential [! "×10^^"]
            ] 
            percentFormats [
                #numberSystem "latn" 
                percentFormatLength [
                    percentFormat [
                        pattern [! "#,##0 %"]
                    ]
                ]
            ] 
            currencies [
                currency [
                    #type "SEK" 
                    symbol [! "kr"]
                ]
            ]
        ]
    ]

