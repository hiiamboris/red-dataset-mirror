
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "en"] 
            territory [#type "KE"]
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
                    #type "Africa_Central" 
                    short [
                        standard [! "CAT"]
                    ]
                ] 
                metazone [
                    #type "Africa_Eastern" 
                    short [
                        standard [! "EAT"]
                    ]
                ] 
                metazone [
                    #type "Africa_Southern" 
                    short [
                        standard [! "SAST"]
                    ]
                ] 
                metazone [
                    #type "Africa_Western" 
                    short [
                        generic [! "WAT"] 
                        standard [! "WAT"] 
                        daylight [! "WAST"]
                    ]
                ]
            ]
        ] 
        numbers [
            currencies [
                currency [
                    #type "KES" 
                    symbol [! "Ksh"]
                ]
            ]
        ]
    ]

