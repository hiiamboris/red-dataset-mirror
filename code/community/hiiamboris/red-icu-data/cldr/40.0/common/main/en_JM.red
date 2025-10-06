
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "en"] 
            territory [#type "JM"]
        ] 
        dates [
            calendars [
                calendar [
                    #type "generic" 
                    dateFormats [
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [#draft "unconfirmed" ! "d/M/y GGGGG"] 
                                datetimeSkeleton [#draft "unconfirmed" ! "GGGGGyMd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "Md" #draft "unconfirmed" ! "d/M"] 
                            dateFormatItem [#id "yyyyMEd" #draft "unconfirmed" ! "E, d/M/y G"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "d/M – d/M"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "d/M – d/M"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E, d/M – E, d/M"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E, d/M – E, d/M"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "d/M/y – d/M/y G"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "d/M/y – d/M/y G"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "d/M/y – d/M/y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E, d/M/y – E, d/M/y G"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E, d/M/y – E, d/M/y G"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E, d/M/y – E, d/M/y G"]
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
                                pattern [#draft "unconfirmed" ! "d/M/yy"] 
                                datetimeSkeleton [#draft "unconfirmed" ! "yyMd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "Md" #draft "unconfirmed" ! "d/M"] 
                            dateFormatItem [#id "MEd" #draft "unconfirmed" ! "E, d/M"] 
                            dateFormatItem [#id "yMEd" #draft "unconfirmed" ! "E, d/M/y"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "d/M – d/M"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "d/M – d/M"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E, d/M – E, d/M"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E, d/M – E, d/M"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "d/M/y – d/M/y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "d/M/y – d/M/y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "d/M/y – d/M/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E, d/M/y – E, d/M/y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E, d/M/y – E, d/M/y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E, d/M/y – E, d/M/y"]
                            ]
                        ]
                    ]
                ]
            ]
        ] 
        numbers [
            currencies [
                currency [
                    #type "JMD" 
                    symbol [! "$"]
                ]
            ]
        ]
    ]

