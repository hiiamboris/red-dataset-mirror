
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "ne"] 
            territory [#type "IN"]
        ] 
        dates [
            calendars [
                calendar [
                    #type "gregorian" 
                    timeFormats [
                        timeFormatLength [
                            #type "full" 
                            timeFormat [
                                pattern [! "h:mm:ss a zzzz"] 
                                datetimeSkeleton [! "ahmmsszzzz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "long" 
                            timeFormat [
                                pattern [! "h:mm:ss a z"] 
                                datetimeSkeleton [! "ahmmssz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "medium" 
                            timeFormat [
                                pattern [! "h:mm:ss a"] 
                                datetimeSkeleton [! "ahmmss"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "short" 
                            timeFormat [
                                pattern [! "h:mm a"] 
                                datetimeSkeleton [! "ahmm"]
                            ]
                        ]
                    ]
                ]
            ] 
            timeZoneNames [
                metazone [
                    #type "India" 
                    short [
                        standard [! "IST"]
                    ]
                ]
            ]
        ]
    ]

