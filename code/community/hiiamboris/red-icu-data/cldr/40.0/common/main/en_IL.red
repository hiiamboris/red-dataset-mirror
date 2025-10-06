
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "en"] 
            territory [#type "IL"]
        ] 
        dates [
            calendars [
                calendar [
                    #type "generic" 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "EHm" ! "E H:mm"] 
                            dateFormatItem [#id "EHms" ! "E H:mm:ss"] 
                            dateFormatItem [#id "H" ! "H"] 
                            dateFormatItem [#id "Hm" ! "H:mm"] 
                            dateFormatItem [#id "Hms" ! "H:mm:ss"]
                        ]
                    ]
                ] 
                calendar [
                    #type "gregorian" 
                    timeFormats [
                        timeFormatLength [
                            #type "full" 
                            timeFormat [
                                pattern [! "H:mm:ss zzzz"] 
                                datetimeSkeleton [! "Hmmsszzzz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "long" 
                            timeFormat [
                                pattern [! "H:mm:ss z"] 
                                datetimeSkeleton [! "Hmmssz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "medium" 
                            timeFormat [
                                pattern [! "H:mm:ss"] 
                                datetimeSkeleton [! "Hmmss"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "short" 
                            timeFormat [
                                pattern [! "H:mm"] 
                                datetimeSkeleton [! "Hmm"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "EHm" ! "E H:mm"] 
                            dateFormatItem [#id "EHms" ! "E H:mm:ss"] 
                            dateFormatItem [#id "H" ! "H"] 
                            dateFormatItem [#id "Hm" ! "H:mm"] 
                            dateFormatItem [#id "Hms" ! "H:mm:ss"]
                        ]
                    ]
                ]
            ]
        ]
    ]

