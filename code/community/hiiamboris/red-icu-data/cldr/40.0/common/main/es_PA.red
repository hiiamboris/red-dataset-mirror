
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "es"] 
            territory [#type "PA"]
        ] 
        localeDisplayNames [
            languages [
                language [#type "ace" #draft "contributed" ! "acehnés"] 
                language [#type "arp" #draft "contributed" ! "arapaho"] 
                language [#type "bho" #draft "contributed" ! "bhojpuri"] 
                language [#type "eu" #draft "contributed" ! "euskera"] 
                language [#type "grc" #draft "contributed" ! "griego antiguo"] 
                language [#type "lo" #draft "contributed" ! "lao"] 
                language [#type "nso" #draft "contributed" ! "sotho septentrional"] 
                language [#type "pa" #draft "contributed" ! "punyabí"] 
                language [#type "ss" #draft "contributed" ! "siswati"] 
                language [#type "sw" #draft "contributed" ! "suajili"] 
                language [#type "sw_CD" #draft "contributed" ! "suajili del Congo"] 
                language [#type "tn" #draft "contributed" ! "setswana"] 
                language [#type "wo" #draft "contributed" ! "wolof"] 
                language [#type "zgh" #draft "contributed" ! "tamazight marroquí estándar"]
            ] 
            territories [
                territory [#type "BA" #draft "contributed" ! "Bosnia y Herzegovina"] 
                territory [#type "GB" #alt "short" #draft "contributed" ! "RU"] 
                territory [#type "TA" #draft "contributed" ! "Tristán de Acuña"] 
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
                            dateFormatItem [#id "yM" ! "MM/y"] 
                            dateFormatItem [#id "yMd" ! "MM/dd/y"] 
                            dateFormatItem [#id "yMEd" ! "E MM/dd/y"]
                        ] 
                        intervalFormats [
                            intervalFormatFallback [#draft "contributed" ! "{0} a el {1}"] 
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
                                #id "MMMd" 
                                greatestDifference [#id "M" #draft "contributed" ! "d 'de' MMM 'al' d 'de' MMM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "E d 'al' E d 'de' MMM"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E d 'de' MMM 'al' E d 'de' MMM"]
                            ] 
                            intervalFormatItem [
                                #id "y" 
                                greatestDifference [#id "y" #draft "contributed" ! "y–y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMM" 
                                greatestDifference [#id "M" #draft "contributed" ! "MMM–MMM 'de' y"] 
                                greatestDifference [#id "y" #draft "contributed" ! "MMM 'de' y 'a' MMM 'de' y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMd" 
                                greatestDifference [#id "d" #draft "contributed" ! "d–d 'de' MMM 'de' y"] 
                                greatestDifference [#id "M" #draft "contributed" ! "d 'de' MMM 'al' d 'de' MMM 'de' y"] 
                                greatestDifference [#id "y" #draft "contributed" ! "d 'de' MMM 'de' y 'al' d 'de' MMM 'de' y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "E d 'al' E d 'de' MMM 'de' y"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E d 'de' MMM 'al' E d 'de' MMM 'de' y"] 
                                greatestDifference [#id "y" #draft "contributed" ! "E d 'de' MMM 'de' y 'al' E d 'de' MMM 'de' y"]
                            ]
                        ]
                    ]
                ] 
                calendar [
                    #type "gregorian" 
                    quarters [
                        quarterContext [
                            #type "format" 
                            quarterWidth [
                                #type "wide" 
                                quarter [#type "1" ! "1er. trimestre"] 
                                quarter [#type "2" ! "2do. trimestre"] 
                                quarter [#type "3" ! "3er. trimestre"] 
                                quarter [#type "4" ! "4.º trimestre"]
                            ]
                        ] 
                        quarterContext [
                            #type "stand-alone" 
                            quarterWidth [
                                #type "wide" 
                                quarter [#type "1" ! "1er. trimestre"] 
                                quarter [#type "2" ! "2do. trimestre"] 
                                quarter [#type "3" ! "3er. trimestre"] 
                                quarter [#type "4" ! "4.º trimestre"]
                            ]
                        ]
                    ] 
                    dayPeriods [
                        dayPeriodContext [
                            #type "format" 
                            dayPeriodWidth [
                                #type "abbreviated" 
                                dayPeriod [#type "noon" ! "mediodía"] 
                                dayPeriod [#type "morning1" ! "de la madrugada"] 
                                dayPeriod [#type "morning2" ! "de la mañana"] 
                                dayPeriod [#type "evening1" ! "de la tarde"] 
                                dayPeriod [#type "night1" ! "de la noche"]
                            ] 
                            dayPeriodWidth [
                                #type "wide" 
                                dayPeriod [#type "noon" ! "mediodía"] 
                                dayPeriod [#type "morning1" ! "de la madrugada"] 
                                dayPeriod [#type "morning2" ! "de la mañana"] 
                                dayPeriod [#type "evening1" ! "de la tarde"] 
                                dayPeriod [#type "night1" ! "de la noche"]
                            ]
                        ]
                    ] 
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
                                pattern [#draft "contributed" ! "h:mm:ss a zzzz"] 
                                datetimeSkeleton [#draft "contributed" ! "ahmmsszzzz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "long" 
                            timeFormat [
                                pattern [#draft "contributed" ! "h:mm:ss a z"] 
                                datetimeSkeleton [#draft "contributed" ! "ahmmssz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "medium" 
                            timeFormat [
                                pattern [#draft "contributed" ! "h:mm:ss a"] 
                                datetimeSkeleton [#draft "contributed" ! "ahmmss"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "short" 
                            timeFormat [
                                pattern [#draft "contributed" ! "h:mm a"] 
                                datetimeSkeleton [#draft "contributed" ! "ahmm"]
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
                            intervalFormatItem [
                                #id "MMMd" 
                                greatestDifference [#id "M" #draft "contributed" ! "d 'de' MMM 'al' d 'de' MMM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "E d 'al' E d 'de' MMM"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E d 'de' MMM 'al' E d 'de' MMM"]
                            ] 
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" #draft "contributed" ! "MM/y – MM/y"] 
                                greatestDifference [#id "y" #draft "contributed" ! "MM/y – MM/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMM" 
                                greatestDifference [#id "y" #draft "contributed" ! "MMM 'de' y 'a' MMM 'de' y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMd" 
                                greatestDifference [#id "M" #draft "contributed" ! "d 'de' MMM 'al' d 'de' MMM 'de' y"] 
                                greatestDifference [#id "y" #draft "contributed" ! "d 'de' MMM 'de' y 'al' d 'de' MMM 'de' y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "E d 'al' E d 'de' MMM 'de' y"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E d 'de' MMM 'al' E d 'de' MMM 'de' y"] 
                                greatestDifference [#id "y" #draft "contributed" ! "E d 'de' MMM 'de' y 'al' E d 'de' MMM 'de' y"]
                            ]
                        ]
                    ]
                ]
            ]
        ] 
        numbers [
            currencies [
                currency [
                    #type "PAB" 
                    symbol [! "B/."]
                ]
            ]
        ]
    ]

