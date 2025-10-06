
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "af"] 
            territory [#type "NA"]
        ] 
        dates [
            calendars [
                calendar [
                    #type "generic" 
                    dateFormats [
                        dateFormatLength [
                            #type "full" 
                            dateFormat [
                                pattern [#draft "unconfirmed" ! "EEEE d MMMM y G"] 
                                datetimeSkeleton [#draft "unconfirmed" ! "GyMMMMEEEEd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "long" 
                            dateFormat [
                                pattern [#draft "unconfirmed" ! "d MMMM y G"] 
                                datetimeSkeleton [#draft "unconfirmed" ! "GyMMMMd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "medium" 
                            dateFormat [
                                pattern [#draft "unconfirmed" ! "d MMM y G"] 
                                datetimeSkeleton [#draft "unconfirmed" ! "GyMMMd"]
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
                                pattern [#draft "unconfirmed" ! "EEEE d MMMM y"] 
                                datetimeSkeleton [#draft "unconfirmed" ! "yMMMMEEEEd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "long" 
                            dateFormat [
                                pattern [#draft "unconfirmed" ! "d MMMM y"] 
                                datetimeSkeleton [#draft "unconfirmed" ! "yMMMMd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "medium" 
                            dateFormat [
                                pattern [#draft "unconfirmed" ! "d MMM y"] 
                                datetimeSkeleton [#draft "unconfirmed" ! "yMMMd"]
                            ]
                        ]
                    ] 
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
        ] 
        numbers [
            currencies [
                currency [
                    #type "NAD" 
                    symbol [! "$"]
                ]
            ]
        ]
    ]

