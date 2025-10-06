
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "sq"] 
            territory [#type "MK"]
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
        ] 
        numbers [
            currencies [
                currency [
                    #type "MKD" 
                    symbol [! "den"]
                ]
            ]
        ]
    ]

