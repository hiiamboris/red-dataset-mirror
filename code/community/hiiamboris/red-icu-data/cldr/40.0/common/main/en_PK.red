
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "en"] 
            territory [#type "PK"]
        ] 
        dates [
            calendars [
                calendar [
                    #type "generic" 
                    dateFormats [
                        dateFormatLength [
                            #type "medium" 
                            dateFormat [
                                pattern [! "dd-MMM-y G"] 
                                datetimeSkeleton [! "GyMMMdd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
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
                            #type "medium" 
                            dateFormat [
                                pattern [! "dd-MMM-y"] 
                                datetimeSkeleton [! "yMMMdd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
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
                    #type "PKR" 
                    symbol [! "Rs"]
                ]
            ]
        ]
    ]

