
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "nl"] 
            territory [#type "BE"]
        ] 
        localeDisplayNames [
            territories [
                territory [#type "013" #draft "provisional" ! "Centraal-Amerika"]
            ]
        ] 
        dates [
            calendars [
                calendar [
                    #type "generic" 
                    dateFormats [
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "d/MM/yy GGGGG"] 
                                datetimeSkeleton [! "GGGGGyyMMd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "Md" #draft "contributed" ! "d/M"] 
                            dateFormatItem [#id "MEd" #draft "contributed" ! "E d/M"] 
                            dateFormatItem [#id "yyyyM" #draft "contributed" ! "M/y GGGGG"] 
                            dateFormatItem [#id "yyyyMd" #draft "contributed" ! "d/M/y GGGGG"] 
                            dateFormatItem [#id "yyyyMEd" #draft "contributed" ! "E d/M/y GGGGG"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" #draft "contributed" ! "d/MM – d/MM"] 
                                greatestDifference [#id "M" #draft "contributed" ! "d/MM – d/MM"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "E d/MM – E d/MM"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E d/MM – E d/MM"]
                            ] 
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" #draft "contributed" ! "MM/y – MM/y G"] 
                                greatestDifference [#id "y" #draft "contributed" ! "MM/y – MM/y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" #draft "contributed" ! "d/MM/y – d/MM/y G"] 
                                greatestDifference [#id "M" #draft "contributed" ! "d/MM/y – d/MM/y G"] 
                                greatestDifference [#id "y" #draft "contributed" ! "d/MM/y – d/MM/y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "E d/MM/y – E d/MM/y G"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E d/MM/y – E d/MM/y G"] 
                                greatestDifference [#id "y" #draft "contributed" ! "E d/MM/y – E d/MM/y G"]
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
                                pattern [! "d/MM/y"] 
                                datetimeSkeleton [! "yMMd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "Md" #draft "contributed" ! "d/M"] 
                            dateFormatItem [#id "MEd" #draft "contributed" ! "E d/M"] 
                            dateFormatItem [#id "yM" #draft "contributed" ! "M/y"] 
                            dateFormatItem [#id "yMd" #draft "contributed" ! "d/M/y"] 
                            dateFormatItem [#id "yMEd" #draft "contributed" ! "E d/M/y"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" #draft "contributed" ! "d/MM – d/MM"] 
                                greatestDifference [#id "M" #draft "contributed" ! "d/MM – d/MM"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "E d/MM – E d/MM"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E d/MM – E d/MM"]
                            ] 
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" #draft "contributed" ! "MM/y – MM/y"] 
                                greatestDifference [#id "y" #draft "contributed" ! "MM/y – MM/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" #draft "contributed" ! "d/MM/y – d/MM/y"] 
                                greatestDifference [#id "M" #draft "contributed" ! "d/MM/y – d/MM/y"] 
                                greatestDifference [#id "y" #draft "contributed" ! "d/MM/y – d/MM/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "E d/MM/y – E d/MM/y"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E d/MM/y – E d/MM/y"] 
                                greatestDifference [#id "y" #draft "contributed" ! "E d/MM/y – E d/MM/y"]
                            ]
                        ]
                    ]
                ]
            ]
        ]
    ]

