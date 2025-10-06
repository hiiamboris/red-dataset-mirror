
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "en"] 
            territory [#type "HK"]
        ] 
        dates [
            calendars [
                calendar [
                    #type "generic" 
                    dateFormats [
                        dateFormatLength [
                            #type "full" 
                            dateFormat [
                                pattern [! "EEEE, d MMMM, y G"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "long" 
                            dateFormat [
                                pattern [! "d MMMM, y G"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "medium" 
                            dateFormat [
                                pattern [! "d MMM, y G"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "d/M/yy GGGGG"] 
                                datetimeSkeleton [! "GGGGGyyMd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "MMMMEd" ! "E, d MMMM"] 
                            dateFormatItem [#id "yyyyMd" ! "d/M/y GGGGG"] 
                            dateFormatItem [#id "yyyyMEd" ! "E, d/M/y GGGGG"] 
                            dateFormatItem [#id "yyyyMMMd" ! "d MMM, y G"] 
                            dateFormatItem [#id "yyyyMMMEd" ! "E, d MMM, y G"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" ! "d/M – d/M"] 
                                greatestDifference [#id "M" ! "d/M – d/M"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" ! "E, d/M – E, d/M"] 
                                greatestDifference [#id "M" ! "E, d/M – E, d/M"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" ! "E, d MMM – E, d MMM"] 
                                greatestDifference [#id "M" ! "E, d MMM – E, d MMM"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" ! "d/M/y – d/M/y G"] 
                                greatestDifference [#id "M" ! "d/M/y – d/M/y G"] 
                                greatestDifference [#id "y" ! "d/M/y – d/M/y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" ! "E, d/M/y – E, d/M/y G"] 
                                greatestDifference [#id "M" ! "E, d/M/y – E, d/M/y G"] 
                                greatestDifference [#id "y" ! "E, d/M/y – E, d/M/y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMd" 
                                greatestDifference [#id "d" ! "d – d MMM, y G"] 
                                greatestDifference [#id "M" ! "d MMM – d MMM, y G"] 
                                greatestDifference [#id "y" ! "d MMM, y – d MMM, y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" ! "E, d MMM – E, d MMM, y G"] 
                                greatestDifference [#id "M" ! "E, d MMM – E, d MMM, y G"] 
                                greatestDifference [#id "y" ! "E, d MMM, y – E, d MMM, y G"]
                            ]
                        ]
                    ]
                ] 
                calendar [
                    #type "gregorian" 
                    dateFormats [
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "d/M/y"] 
                                datetimeSkeleton [! "yMd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "Md" #draft "unconfirmed" ! "d/M"] 
                            dateFormatItem [#id "MEd" #draft "unconfirmed" ! "E, d/M"] 
                            dateFormatItem [#id "MMMMEd" ! "E, d MMMM"] 
                            dateFormatItem [#id "yM" #draft "unconfirmed" ! "M/y"] 
                            dateFormatItem [#id "yMd" ! "d/M/y"] 
                            dateFormatItem [#id "yMEd" #draft "unconfirmed" ! "E, d/M/y"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" ! "d/M – d/M"] 
                                greatestDifference [#id "M" ! "d/M – d/M"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" ! "E, d/M – E, d/M"] 
                                greatestDifference [#id "M" ! "E, d/M – E, d/M"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" ! "E, d MMM – E, d MMM"] 
                                greatestDifference [#id "M" ! "E, d MMM – E, d MMM"]
                            ] 
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "M/y – M/y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "M/y – M/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" ! "d/M/y – d/M/y"] 
                                greatestDifference [#id "M" ! "d/M/y – d/M/y"] 
                                greatestDifference [#id "y" ! "d/M/y – d/M/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" ! "E, d/M/y – E, d/M/y"] 
                                greatestDifference [#id "M" ! "E, d/M/y – E, d/M/y"] 
                                greatestDifference [#id "y" ! "E, d/M/y – E, d/M/y"]
                            ]
                        ]
                    ]
                ]
            ] 
            timeZoneNames [
                metazone [
                    #type "Hong_Kong" 
                    short [
                        generic [! "HKT"] 
                        standard [! "HKT"] 
                        daylight [! "HKST"]
                    ]
                ]
            ]
        ]
    ]

