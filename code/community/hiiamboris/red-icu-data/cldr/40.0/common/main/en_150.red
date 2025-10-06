
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "en"] 
            territory [#type "150"]
        ] 
        dates [
            calendars [
                calendar [
                    #type "gregorian" 
                    timeFormats [
                        timeFormatLength [
                            #type "full" 
                            timeFormat [
                                pattern [! "HH:mm:ss zzzz"] 
                                datetimeSkeleton [! "HHmmsszzzz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "long" 
                            timeFormat [
                                pattern [! "HH:mm:ss z"] 
                                datetimeSkeleton [! "HHmmssz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "medium" 
                            timeFormat [
                                pattern [! "HH:mm:ss"] 
                                datetimeSkeleton [! "HHmmss"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "short" 
                            timeFormat [
                                pattern [! "HH:mm"] 
                                datetimeSkeleton [! "HHmm"]
                            ]
                        ]
                    ]
                ]
            ] 
            timeZoneNames [
                metazone [
                    #type "Europe_Central" 
                    short [
                        generic [! "CET"] 
                        standard [! "CET"] 
                        daylight [! "CEST"]
                    ]
                ] 
                metazone [
                    #type "Europe_Eastern" 
                    short [
                        generic [! "EET"] 
                        standard [! "EET"] 
                        daylight [! "EEST"]
                    ]
                ] 
                metazone [
                    #type "Europe_Western" 
                    short [
                        generic [! "WET"] 
                        standard [! "WET"] 
                        daylight [! "WEST"]
                    ]
                ]
            ]
        ] 
        numbers [
            currencyFormats [
                #numberSystem "latn" 
                currencyFormatLength [
                    currencyFormat [
                        #type "standard" 
                        pattern [! "#,##0.00 ¤"]
                    ] 
                    currencyFormat [
                        #type "accounting" 
                        pattern [! "#,##0.00 ¤"]
                    ]
                ]
            ] 
            currencies [
                currency [
                    #type "EUR" 
                    pattern [! "¤#,##0.00"]
                ]
            ]
        ]
    ]

