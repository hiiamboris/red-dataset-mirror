
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "ar"] 
            territory [#type "IL"]
        ] 
        dates [
            calendars [
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
                ]
            ]
        ] 
        numbers [
            defaultNumberingSystem [! "arab"]
        ]
    ]

