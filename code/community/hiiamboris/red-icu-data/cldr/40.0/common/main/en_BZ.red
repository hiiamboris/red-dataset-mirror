
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "en"] 
            territory [#type "BZ"]
        ] 
        dates [
            calendars [
                calendar [
                    #type "generic" 
                    dateFormats [
                        dateFormatLength [
                            #type "full" 
                            dateFormat [
                                pattern [#draft "contributed" ! "EEEE, dd MMMM y G"] 
                                datetimeSkeleton [#draft "contributed" ! "GyMMMMEEEEdd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "long" 
                            dateFormat [
                                pattern [#draft "contributed" ! "dd MMMM y G"] 
                                datetimeSkeleton [#draft "contributed" ! "GyMMMMdd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "medium" 
                            dateFormat [
                                pattern [! "dd-MMM-y G"] 
                                datetimeSkeleton [! "GyMMMdd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "MMMd" ! "dd MMM"] 
                            dateFormatItem [#id "MMMEd" ! "E, dd MMM"] 
                            dateFormatItem [#id "yyyyM" #draft "contributed" ! "MM/y G"] 
                            dateFormatItem [#id "yyyyMd" #draft "contributed" ! "dd/MM/y G"] 
                            dateFormatItem [#id "yyyyMEd" #draft "contributed" ! "E, dd/MM/y G"] 
                            dateFormatItem [#id "yyyyMMMd" ! "dd MMM y G"] 
                            dateFormatItem [#id "yyyyMMMEd" ! "E, dd MMM y G"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "M/d – M/d"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "M/d – M/d"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E, M/d – E, M/d"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E, M/d – E, M/d"]
                            ] 
                            intervalFormatItem [
                                #id "MMMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "MMM d – d"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "MMM d – MMM d"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E, MMM d – E, MMM d"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E, MMM d – E, MMM d"]
                            ] 
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "M/y – M/y G"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "M/y – M/y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "M/d/y – M/d/y G"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "M/d/y – M/d/y G"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "M/d/y – M/d/y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E, M/d/y – E, M/d/y G"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E, M/d/y – E, M/d/y G"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E, M/d/y – E, M/d/y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "MMM d – d, y G"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "MMM d – MMM d, y G"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "MMM d, y – MMM d, y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E, MMM d – E, MMM d, y G"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E, MMM d – E, MMM d, y G"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E, MMM d, y – E, MMM d, y G"]
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
                                pattern [#draft "contributed" ! "EEEE, dd MMMM y"] 
                                datetimeSkeleton [#draft "contributed" ! "yMMMMEEEEdd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "long" 
                            dateFormat [
                                pattern [#draft "contributed" ! "dd MMMM y"] 
                                datetimeSkeleton [#draft "contributed" ! "yMMMMdd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "medium" 
                            dateFormat [
                                pattern [! "dd-MMM-y"] 
                                datetimeSkeleton [! "yMMMdd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [#draft "contributed" ! "dd/MM/yy"] 
                                datetimeSkeleton [#draft "contributed" ! "yyMMdd"]
                            ]
                        ]
                    ] 
                    timeFormats [
                        timeFormatLength [
                            #type "full" 
                            timeFormat [
                                pattern [#draft "contributed" ! "HH:mm:ss zzzz"] 
                                datetimeSkeleton [#draft "contributed" ! "HHmmsszzzz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "long" 
                            timeFormat [
                                pattern [#draft "contributed" ! "HH:mm:ss z"] 
                                datetimeSkeleton [#draft "contributed" ! "HHmmssz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "medium" 
                            timeFormat [
                                pattern [#draft "contributed" ! "HH:mm:ss"] 
                                datetimeSkeleton [#draft "contributed" ! "HHmmss"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "short" 
                            timeFormat [
                                pattern [#draft "contributed" ! "HH:mm"] 
                                datetimeSkeleton [#draft "contributed" ! "HHmm"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "MMMd" ! "dd MMM"] 
                            dateFormatItem [#id "MMMEd" ! "E, dd MMM"] 
                            dateFormatItem [#id "yMMMd" ! "dd MMM y"] 
                            dateFormatItem [#id "yMMMEd" ! "E, dd MMM y"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "M/d – M/d"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "M/d – M/d"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E, M/d – E, M/d"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E, M/d – E, M/d"]
                            ] 
                            intervalFormatItem [
                                #id "MMMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "MMM d – d"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "MMM d – MMM d"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E, MMM d – E, MMM d"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E, MMM d – E, MMM d"]
                            ] 
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "M/y – M/y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "M/y – M/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "M/d/y – M/d/y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "M/d/y – M/d/y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "M/d/y – M/d/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E, M/d/y – E, M/d/y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E, M/d/y – E, M/d/y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E, M/d/y – E, M/d/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "MMM d – d, y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "MMM d – MMM d, y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "MMM d, y – MMM d, y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E, MMM d – E, MMM d, y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E, MMM d – E, MMM d, y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E, MMM d, y – E, MMM d, y"]
                            ]
                        ]
                    ]
                ]
            ]
        ] 
        numbers [
            currencies [
                currency [
                    #type "BZD" 
                    symbol [! "$"]
                ]
            ]
        ] 
        units [
            unitLength [
                #type "narrow" 
                unit [
                    #type "temperature-celsius" 
                    unitPattern [#count "one" ! "{0}°C"] 
                    unitPattern [#count "other" ! "{0}°C"]
                ] 
                unit [
                    #type "temperature-fahrenheit" 
                    unitPattern [#count "one" ! "{0}°"] 
                    unitPattern [#count "other" ! "{0}°"]
                ]
            ]
        ]
    ]

