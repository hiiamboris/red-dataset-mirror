
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "es"] 
            territory [#type "PH"]
        ] 
        dates [
            calendars [
                calendar [
                    #type "gregorian" 
                    timeFormats [
                        timeFormatLength [
                            #type "full" 
                            timeFormat [
                                pattern [#draft "contributed" ! "h:mm:ss a zzzz"] 
                                datetimeSkeleton [#draft "contributed" ! "ahmmsszzzz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "long" 
                            timeFormat [
                                pattern [#draft "contributed" ! "h:mm:ss a z"] 
                                datetimeSkeleton [#draft "contributed" ! "ahmmssz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "medium" 
                            timeFormat [
                                pattern [#draft "contributed" ! "h:mm:ss a"] 
                                datetimeSkeleton [#draft "contributed" ! "ahmmss"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "short" 
                            timeFormat [
                                pattern [#draft "contributed" ! "h:mm a"] 
                                datetimeSkeleton [#draft "contributed" ! "ahmm"]
                            ]
                        ]
                    ]
                ]
            ]
        ] 
        numbers [
            currencies [
                currency [
                    #type "PHP" 
                    symbol [! "₱"]
                ]
            ]
        ]
    ]

