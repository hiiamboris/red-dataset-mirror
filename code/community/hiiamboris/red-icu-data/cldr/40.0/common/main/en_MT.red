
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "en"] 
            territory [#type "MT"]
        ] 
        dates [
            calendars [
                calendar [
                    #type "generic" 
                    dateFormats [
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
                            dateFormatItem [#id "MMMd" ! "dd MMM"] 
                            dateFormatItem [#id "yyyyMMMd" ! "dd MMM y G"] 
                            dateFormatItem [#id "yyyyMMMEd" ! "E, dd MMM y G"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E, dd/MM – E, dd/MM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E, dd/MM – E, dd/MM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "dd – dd MMM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "dd MMM – dd MMM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E, dd – E, dd MMM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E, dd MMM – E, dd MMM"]
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
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E, dd/MM/y – E, dd/MM/y G"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E, dd/MM/y – E, dd/MM/y G"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E, dd/MM/y – E, dd/MM/y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "dd – dd MMM y G"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "dd MMM – dd MMM y G"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "dd MMM y – dd MMM y G"]
                            ]
                        ]
                    ]
                ] 
                calendar [
                    #type "gregorian" 
                    dateFormats [
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
                            dateFormatItem [#id "MMMd" ! "dd MMM"] 
                            dateFormatItem [#id "yMMMd" ! "dd MMM y"] 
                            dateFormatItem [#id "yMMMEd" ! "E, dd MMM y"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E, dd/MM – E, dd/MM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E, dd/MM – E, dd/MM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "dd – dd MMM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "dd MMM – dd MMM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E, dd – E, dd MMM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E, dd MMM – E, dd MMM"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "dd – dd MMM y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "dd MMM – dd MMM y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "dd MMM y – dd MMM y"]
                            ]
                        ]
                    ]
                ]
            ]
        ] 
        numbers [
            currencies [
                currency [
                    #type "GBP" 
                    symbol [! "GB£"]
                ]
            ]
        ]
    ]

