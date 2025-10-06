
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "en"] 
            territory [#type "BW"]
        ] 
        dates [
            calendars [
                calendar [
                    #type "generic" 
                    dateFormats [
                        dateFormatLength [
                            #type "full" 
                            dateFormat [
                                pattern [! "EEEE, dd MMMM y G"] 
                                datetimeSkeleton [! "GyMMMMEEEEdd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "long" 
                            dateFormat [
                                pattern [! "dd MMMM y G"] 
                                datetimeSkeleton [! "GyMMMMdd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "medium" 
                            dateFormat [
                                pattern [! "dd MMM y G"] 
                                datetimeSkeleton [! "GyMMMdd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "GyMMMd" ! "dd MMM y G"] 
                            dateFormatItem [#id "GyMMMEd" ! "E, dd MMM y G"] 
                            dateFormatItem [#id "MMdd" #draft "unconfirmed" ! "dd/MM"] 
                            dateFormatItem [#id "MMMd" ! "dd MMM"] 
                            dateFormatItem [#id "MMMEd" ! "E, dd MMM"] 
                            dateFormatItem [#id "yyyyM" ! "MM/y G"] 
                            dateFormatItem [#id "yyyyMd" ! "dd/MM/y G"] 
                            dateFormatItem [#id "yyyyMEd" ! "E, dd/MM/y G"] 
                            dateFormatItem [#id "yyyyMMMd" ! "dd MMM y G"] 
                            dateFormatItem [#id "yyyyMMMEd" ! "E, dd MMM y G"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "MMMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "dd–dd MMM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "dd MMM – dd MMM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E dd – E dd MMM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E dd MMM – E dd MMM"]
                            ] 
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "MM/y – MM/y G"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "MM/y – MM/y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "dd/MM/y – dd/MM/y G"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "dd/MM/y – dd/MM/y G"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "dd/MM/y – dd/MM/y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E dd/MM/y – E dd/MM/y G"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E dd/MM/y – E dd/MM/y G"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E dd/MM/y – E dd/MM/y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "dd – dd MMM y G"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "dd MMM – dd MMM y G"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "dd MMM y – dd MMM y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E, dd – E, dd MMM y G"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E, dd MMM – E, dd MMM y G"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E, dd MMM y – E, dd MMM y G"]
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
                                pattern [! "EEEE, dd MMMM y"] 
                                datetimeSkeleton [! "yMMMMEEEEdd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "long" 
                            dateFormat [
                                pattern [! "dd MMMM y"] 
                                datetimeSkeleton [! "yMMMMdd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "medium" 
                            dateFormat [
                                pattern [! "dd MMM y"] 
                                datetimeSkeleton [! "yMMMdd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "dd/MM/yy"] 
                                datetimeSkeleton [! "yyMMdd"]
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
                            dateFormatItem [#id "GyMMMd" ! "dd MMM y G"] 
                            dateFormatItem [#id "GyMMMEd" ! "E, dd MMM y G"] 
                            dateFormatItem [#id "MMMd" ! "dd MMM"] 
                            dateFormatItem [#id "MMMEd" ! "E, dd MMM"] 
                            dateFormatItem [#id "yMMMd" ! "dd MMM y"] 
                            dateFormatItem [#id "yMMMEd" ! "E, dd MMM y"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "MMMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "dd – dd MMM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "dd MMM – dd MMM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E dd – E dd MMM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E dd MMM – E dd MMM"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E dd/MM/y – E dd/MM/y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E dd/MM/y – E dd/MM/y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E dd/MM/y – E dd/MM/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "dd – dd MMM y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "dd MMM – dd MMM y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "dd MMM y – dd MMM y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E, dd – E, dd MMM y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E, dd MMM – E, dd MMM y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E, dd MMM y – E, dd MMM y"]
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
                    #type "BWP" 
                    symbol [! "P"]
                ]
            ]
        ]
    ]

