
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "es"] 
            territory [#type "PR"]
        ] 
        localeDisplayNames [
            languages [
                language [#type "ace" #draft "contributed" ! "acehnés"] 
                language [#type "arp" #draft "contributed" ! "arapaho"] 
                language [#type "bho" #draft "contributed" ! "bhojpuri"] 
                language [#type "grc" #draft "contributed" ! "griego antiguo"] 
                language [#type "nso" #draft "contributed" ! "sotho septentrional"] 
                language [#type "ss" #draft "contributed" ! "siswati"] 
                language [#type "wo" #draft "contributed" ! "wolof"]
            ] 
            territories [
                territory [#type "UM" #draft "contributed" ! "Islas menores alejadas de EE. UU."]
            ]
        ] 
        dates [
            calendars [
                calendar [
                    #type "generic" 
                    dateFormats [
                        dateFormatLength [
                            #type "medium" 
                            dateFormat [
                                pattern [! "MM/dd/y G"] 
                                datetimeSkeleton [! "GyMMdd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "MM/dd/yy GGGGG"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "Md" ! "MM/dd"] 
                            dateFormatItem [#id "MEd" ! "E, MM/dd"] 
                            dateFormatItem [#id "yyyyM" ! "MM/y G"] 
                            dateFormatItem [#id "yyyyMd" ! "MM/dd/y G"] 
                            dateFormatItem [#id "yyyyMEd" ! "E MM/dd/y G"]
                        ] 
                        intervalFormats [
                            intervalFormatFallback [#draft "unconfirmed" ! "{0} a el {1}"] 
                            intervalFormatItem [
                                #id "hm" 
                                greatestDifference [#id "h" #draft "unconfirmed" ! "h:mm–h:mm a"] 
                                greatestDifference [#id "m" #draft "unconfirmed" ! "h:mm–h:mm a"]
                            ] 
                            intervalFormatItem [
                                #id "Hm" 
                                greatestDifference [#id "H" #draft "unconfirmed" ! "HH:mm–HH:mm"] 
                                greatestDifference [#id "m" #draft "unconfirmed" ! "HH:mm–HH:mm"]
                            ] 
                            intervalFormatItem [
                                #id "hmv" 
                                greatestDifference [#id "h" #draft "unconfirmed" ! "h:mm–h:mm a v"] 
                                greatestDifference [#id "m" #draft "unconfirmed" ! "h:mm–h:mm a v"]
                            ] 
                            intervalFormatItem [
                                #id "Hmv" 
                                greatestDifference [#id "H" #draft "unconfirmed" ! "HH:mm–HH:mm v"] 
                                greatestDifference [#id "m" #draft "unconfirmed" ! "HH:mm–HH:mm v"]
                            ] 
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "MM/dd – MM/dd"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "MM/dd – MM/dd"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E MM/dd – E MM/dd"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E MM/dd – E MM/dd"]
                            ] 
                            intervalFormatItem [
                                #id "MMMd" 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "d 'de' MMM 'al' d 'de' MMM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E d 'al' E d 'de' MMM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E d 'de' MMM 'al' E d 'de' MMM"]
                            ] 
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "MM/y – MM/y G"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "MM/y – MM/y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "MM/dd/y – MM/dd/y G"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "MM/dd/y – MM/dd/y G"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "MM/dd/y – MM/dd/y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E MM/dd/y – E MM/dd/y G"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E MM/dd/y – E MM/dd/y G"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E MM/dd/y – E MM/dd/y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMMM" 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "MMM 'de' y 'a' MMM 'de' y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMd" 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "d 'de' MMM 'al' d 'de' MMM 'de' y G"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "d 'de' MMM 'de' y 'al' d 'de' MMM 'de' y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E d 'al' E d 'de' MMM 'de' y G"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E d 'de' MMM 'al' E d 'de' MMM 'de' y G"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E d 'de' MMM 'de' y 'al' E d 'de' MMM 'de' y G"]
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
                                pattern [! "MM/dd/y"] 
                                datetimeSkeleton [! "yMMdd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "MM/dd/yy"] 
                                datetimeSkeleton [! "yyMMdd"]
                            ]
                        ]
                    ] 
                    timeFormats [
                        timeFormatLength [
                            #type "full" 
                            timeFormat [
                                pattern [! "h:mm:ss a zzzz"] 
                                datetimeSkeleton [! "ahmmsszzzz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "long" 
                            timeFormat [
                                pattern [! "h:mm:ss a z"] 
                                datetimeSkeleton [! "ahmmssz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "medium" 
                            timeFormat [
                                pattern [! "h:mm:ss a"] 
                                datetimeSkeleton [! "ahmmss"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "short" 
                            timeFormat [
                                pattern [! "h:mm a"] 
                                datetimeSkeleton [! "ahmm"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "Md" ! "MM/dd"] 
                            dateFormatItem [#id "MEd" ! "E, MM/dd"] 
                            dateFormatItem [#id "yM" ! "MM/y"] 
                            dateFormatItem [#id "yMd" ! "MM/dd/y"] 
                            dateFormatItem [#id "yMEd" ! "E MM/dd/y"]
                        ] 
                        intervalFormats [
                            intervalFormatFallback [#draft "unconfirmed" ! "{0} a el {1}"] 
                            intervalFormatItem [
                                #id "hm" 
                                greatestDifference [#id "h" #draft "unconfirmed" ! "h:mm–h:mm a"] 
                                greatestDifference [#id "m" #draft "unconfirmed" ! "h:mm–h:mm a"]
                            ] 
                            intervalFormatItem [
                                #id "Hm" 
                                greatestDifference [#id "H" #draft "unconfirmed" ! "HH:mm–HH:mm"] 
                                greatestDifference [#id "m" #draft "unconfirmed" ! "HH:mm–HH:mm"]
                            ] 
                            intervalFormatItem [
                                #id "Hmv" 
                                greatestDifference [#id "H" #draft "unconfirmed" ! "HH:mm–HH:mm v"] 
                                greatestDifference [#id "m" #draft "unconfirmed" ! "HH:mm–HH:mm v"]
                            ] 
                            intervalFormatItem [
                                #id "Hv" 
                                greatestDifference [#id "H" #draft "unconfirmed" ! "HH–HH v"]
                            ] 
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "MM/dd – MM/dd"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "MM/dd – MM/dd"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E MM/dd – E MM/dd"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E MM/dd – E MM/dd"]
                            ] 
                            intervalFormatItem [
                                #id "MMMd" 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "d 'de' MMM 'al' d 'de' MMM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E d 'al' E d 'de' MMM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E d 'de' MMM 'al' E d 'de' MMM"]
                            ] 
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "MM/y – MM/y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "MM/y – MM/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "MM/dd/y – MM/dd/y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "MM/dd/y – MM/dd/y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "MM/dd/y – MM/dd/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E MM/dd/y – E MM/dd/y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E MM/dd/y – E MM/dd/y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E MM/dd/y – E MM/dd/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMM" 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "MMM 'de' y 'a' MMM 'de' y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMd" 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "d 'de' MMM 'al' d 'de' MMM 'de' y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "d 'de' MMM 'de' y 'al' d 'de' MMM 'de' y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E d 'al' E d 'de' MMM 'de' y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E d 'de' MMM 'al' E d 'de' MMM 'de' y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E d 'de' MMM 'de' y 'al' E d 'de' MMM 'de' y"]
                            ]
                        ]
                    ]
                ]
            ]
        ] 
        numbers [
            currencies [
                currency [
                    #type "USD" 
                    symbol [! "$"]
                ]
            ]
        ] 
        units [
            unitLength [
                #type "narrow" 
                unit [
                    #type "temperature-fahrenheit" 
                    unitPattern [#count "one" ! "{0}°"] 
                    unitPattern [#count "other" ! "{0}°"]
                ]
            ]
        ]
    ]

