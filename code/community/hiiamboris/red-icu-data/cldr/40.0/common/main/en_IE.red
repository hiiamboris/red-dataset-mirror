
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "en"] 
            territory [#type "IE"]
        ] 
        dates [
            calendars [
                calendar [
                    #type "generic" 
                    dateFormats [
                        dateFormatLength [
                            #type "full" 
                            dateFormat [
                                pattern [! "EEEE d MMMM y G"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "Md" #draft "contributed" ! "d/M"] 
                            dateFormatItem [#id "yyyyMd" ! "d/M/y G"] 
                            dateFormatItem [#id "yyyyMEd" #draft "contributed" ! "E, d/M/y G"] 
                            dateFormatItem [#id "yyyyMMMEd" ! "E d MMM y G"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" #draft "contributed" ! "MM/y – MM/y G"] 
                                greatestDifference [#id "y" #draft "contributed" ! "MM/y – MM/y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" #draft "contributed" ! "dd/MM/y – dd/MM/y G"] 
                                greatestDifference [#id "M" #draft "contributed" ! "dd/MM/y – dd/MM/y G"] 
                                greatestDifference [#id "y" #draft "contributed" ! "dd/MM/y – dd/MM/y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "E dd/MM/y – E dd/MM/y G"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E dd/MM/y – E dd/MM/y G"] 
                                greatestDifference [#id "y" #draft "contributed" ! "E dd/MM/y – E dd/MM/y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "E d – E d MMM y G"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E d MMM – E d MMM y G"] 
                                greatestDifference [#id "y" #draft "contributed" ! "E d MMM y – E d MMM y G"]
                            ]
                        ]
                    ]
                ] 
                calendar [
                    #type "gregorian" 
                    dayPeriods [
                        dayPeriodContext [
                            #type "format" 
                            dayPeriodWidth [
                                #type "wide" 
                                dayPeriod [#type "am" ! "a.m."] 
                                dayPeriod [#type "pm" ! "p.m."]
                            ]
                        ]
                    ] 
                    dateFormats [
                        dateFormatLength [
                            #type "full" 
                            dateFormat [
                                pattern [! "EEEE d MMMM y"]
                            ]
                        ]
                    ] 
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
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "Md" #draft "contributed" ! "d/M"] 
                            dateFormatItem [#id "MEd" #draft "contributed" ! "E, d/M"] 
                            dateFormatItem [#id "yMd" ! "d/M/y"] 
                            dateFormatItem [#id "yMEd" #draft "contributed" ! "E, d/M/y"] 
                            dateFormatItem [#id "yMMMEd" ! "E d MMM y"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "E dd/MM/y – E dd/MM/y"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E dd/MM/y – E dd/MM/y"] 
                                greatestDifference [#id "y" #draft "contributed" ! "E dd/MM/y – E dd/MM/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "E d – E d MMM y"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E d MMM – E d MMM y"] 
                                greatestDifference [#id "y" #draft "contributed" ! "E d MMM y – E d MMM y"]
                            ]
                        ]
                    ]
                ]
            ] 
            timeZoneNames [
                zone [
                    #type "Europe/Dublin" 
                    short [
                        daylight [! "IST"]
                    ]
                ]
            ]
        ]
    ]

