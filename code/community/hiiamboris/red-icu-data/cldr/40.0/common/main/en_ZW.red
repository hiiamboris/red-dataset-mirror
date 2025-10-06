
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "en"] 
            territory [#type "ZW"]
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
                                pattern [! "dd MMM,y G"] 
                                datetimeSkeleton [! "GyMMMdd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "d/M/y GGGGG"] 
                                datetimeSkeleton [! "GGGGGyMd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "Md" ! "d/M"] 
                            dateFormatItem [#id "MMMd" ! "dd MMM"] 
                            dateFormatItem [#id "MMMEd" ! "E, dd MMM"] 
                            dateFormatItem [#id "yyyyMd" ! "d/M/y G"] 
                            dateFormatItem [#id "yyyyMEd" ! "E, d/M/y G"] 
                            dateFormatItem [#id "yyyyMMMd" ! "dd MMM, y G"] 
                            dateFormatItem [#id "yyyyMMMEd" ! "E, dd MMM, y G"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "d/M – d/M"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "d/M – d/M"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E d/M – E d/M"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E d/M – E d/M"]
                            ] 
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
                                #id "yM" 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "M/y – M/y G"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "M/y – M/y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "d/M/y – d/M/y G"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "d/M/y – d/M/y G"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "d/M/y – d/M/y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E d/M/y – E d/M/y G"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E d/M/y – E d/M/y G"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E d/M/y – E d/M/y G"]
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
                                pattern [! "dd MMM,y"] 
                                datetimeSkeleton [! "yMMMdd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "d/M/y"] 
                                datetimeSkeleton [! "yMd"]
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
                            dateFormatItem [#id "Md" ! "d/M"] 
                            dateFormatItem [#id "MEd" ! "E, d/M"] 
                            dateFormatItem [#id "MMMd" ! "dd MMM"] 
                            dateFormatItem [#id "MMMEd" ! "E, dd MMM"] 
                            dateFormatItem [#id "yMd" ! "d/M/y"] 
                            dateFormatItem [#id "yMEd" ! "E, d/M/y"] 
                            dateFormatItem [#id "yMMMd" ! "dd MMM, y"] 
                            dateFormatItem [#id "yMMMEd" ! "E, dd MMM, y"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "d/M – d/M"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "d/M – d/M"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E d/M – E d/M"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E d/M – E d/M"]
                            ] 
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
                                #id "yM" 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "M/y – M/y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "M/y – M/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "d/M/y – d/M/y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "d/M/y – d/M/y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "d/M/y – d/M/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E d/M/y – E d/M/y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E d/M/y – E d/M/y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E d/M/y – E d/M/y"]
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
    ]

