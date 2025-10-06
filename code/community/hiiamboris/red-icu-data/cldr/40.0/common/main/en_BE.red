
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "en"] 
            territory [#type "BE"]
        ] 
        dates [
            calendars [
                calendar [
                    #type "generic" 
                    dateFormats [
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
                            dateFormatItem [#id "Md" ! "d/M"] 
                            dateFormatItem [#id "yyyyMd" ! "d/M/y G"] 
                            dateFormatItem [#id "yyyyMEd" ! "E, d/M/y G"]
                        ] 
                        intervalFormats [
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
                        ]
                    ]
                ] 
                calendar [
                    #type "gregorian" 
                    dateFormats [
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
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "Md" ! "d/M"] 
                            dateFormatItem [#id "MEd" ! "E, d/M"] 
                            dateFormatItem [#id "yMd" ! "d/M/y"] 
                            dateFormatItem [#id "yMEd" ! "E, d/M/y"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E dd/MM/y – E dd/MM/y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E dd/MM/y – E dd/MM/y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E dd/MM/y – E dd/MM/y"]
                            ]
                        ]
                    ]
                ]
            ]
        ] 
        numbers [
            symbols [
                #numberSystem "latn" 
                decimal [! ","] 
                group [! "."]
            ]
        ]
    ]

