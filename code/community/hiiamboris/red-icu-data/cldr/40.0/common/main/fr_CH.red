
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "fr"] 
            territory [#type "CH"]
        ] 
        localeDisplayNames [
            languages [
                language [#type "gu" #draft "contributed" ! "goudjrati"] 
                language [#type "pdc" #draft "contributed" ! "allemand de Pennsylvanie"] 
                language [#type "sdh" #draft "contributed" ! "kurde méridional"]
            ]
        ] 
        delimiters [
            alternateQuotationStart [! "‹"] 
            alternateQuotationEnd [! "›"]
        ] 
        dates [
            calendars [
                calendar [
                    #type "generic" 
                    dateFormats [
                        dateFormatLength [
                            #type "full" 
                            dateFormat [
                                pattern [! "EEEE, d MMMM y G"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "dd.MM.y GGGGG"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "Md" ! "dd.MM."] 
                            dateFormatItem [#id "MEd" ! "E, dd.MM."] 
                            dateFormatItem [#id "MMdd" #draft "contributed" ! "dd.MM"] 
                            dateFormatItem [#id "yM" ! "MM.y GGGGG"] 
                            dateFormatItem [#id "yMd" ! "dd.MM.y GGGGG"] 
                            dateFormatItem [#id "yMEd" ! "E, dd.MM.y GGGGG"]
                        ] 
                        intervalFormats [
                            intervalFormatFallback [#draft "contributed" ! "du {0} au {1}"] 
                            intervalFormatItem [
                                #id "h" 
                                greatestDifference [#id "h" #draft "unconfirmed" ! "h–h a"]
                            ] 
                            intervalFormatItem [
                                #id "H" 
                                greatestDifference [#id "H" #draft "unconfirmed" ! "HH–HH"]
                            ] 
                            intervalFormatItem [
                                #id "hm" 
                                greatestDifference [#id "m" #draft "unconfirmed" ! "h:mm–h:mm a"]
                            ] 
                            intervalFormatItem [
                                #id "Hm" 
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
                                #id "hv" 
                                greatestDifference [#id "h" #draft "unconfirmed" ! "h–h a v"]
                            ] 
                            intervalFormatItem [
                                #id "Hv" 
                                greatestDifference [#id "H" #draft "unconfirmed" ! "HH–HH v"]
                            ] 
                            intervalFormatItem [
                                #id "M" 
                                greatestDifference [#id "M" #draft "contributed" ! "M–M"]
                            ] 
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" #draft "contributed" ! "dd.MM – dd.MM"] 
                                greatestDifference [#id "M" #draft "contributed" ! "dd.MM – dd.MM"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "E, dd.MM – E, dd.MM"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E, dd.MM – E, dd.MM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMd" 
                                greatestDifference [#id "M" #draft "contributed" ! "d MMM 'au' d MMM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "E, d 'au' E, d MMM"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E, d MMM 'au' E, d MMM"]
                            ] 
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" #draft "contributed" ! "MM.y – MM.y GGGGG"] 
                                greatestDifference [#id "y" #draft "contributed" ! "MM.y – MM.y GGGGG"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" #draft "contributed" ! "dd.MM.y – dd.MM.y GGGGG"] 
                                greatestDifference [#id "M" #draft "contributed" ! "dd.MM.y – dd.MM.y GGGGG"] 
                                greatestDifference [#id "y" #draft "contributed" ! "dd.MM.y – dd.MM.y GGGGG"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "E, dd.MM.y – E, dd.MM.y GGGGG"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E, dd.MM.y – E, dd.MM.y GGGGG"] 
                                greatestDifference [#id "y" #draft "contributed" ! "E, dd.MM.y – E, dd.MM.y GGGGG"]
                            ] 
                            intervalFormatItem [
                                #id "yMMM" 
                                greatestDifference [#id "y" #draft "contributed" ! "MMM y 'a'` MMM y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMd" 
                                greatestDifference [#id "M" #draft "contributed" ! "d MMM 'au' d MMM y G"] 
                                greatestDifference [#id "y" #draft "contributed" ! "d MMM y 'au' d MMM y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "E, d 'au' E, d MMM y G"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E, d MMM 'au' E, d MMM y G"] 
                                greatestDifference [#id "y" #draft "contributed" ! "E, d MMM y 'au' E, d MMM y G"]
                            ]
                        ]
                    ]
                ] 
                calendar [
                    #type "gregorian" 
                    dayPeriods [
                        dayPeriodContext [
                            #type "format" 
                            dayPeriodWidth [
                                #type "abbreviated" 
                                dayPeriod [#type "midnight" #draft "contributed" ! "min."] 
                                dayPeriod [#type "noon" #draft "contributed" ! "midi"] 
                                dayPeriod [#type "morning1" #draft "contributed" ! "du mat."] 
                                dayPeriod [#type "afternoon1" #draft "contributed" ! "de l’ap.m."] 
                                dayPeriod [#type "evening1" #draft "contributed" ! "du soir"] 
                                dayPeriod [#type "night1" #draft "contributed" ! "du mat."]
                            ] 
                            dayPeriodWidth [
                                #type "narrow" 
                                dayPeriod [#type "midnight" #draft "contributed" ! "min."] 
                                dayPeriod [#type "noon" #draft "contributed" ! "midi"] 
                                dayPeriod [#type "morning1" #draft "contributed" ! "du mat."] 
                                dayPeriod [#type "afternoon1" #draft "contributed" ! "de l’ap.m."] 
                                dayPeriod [#type "evening1" #draft "contributed" ! "du soir"] 
                                dayPeriod [#type "night1" #draft "contributed" ! "du mat."]
                            ]
                        ] 
                        dayPeriodContext [
                            #type "stand-alone" 
                            dayPeriodWidth [
                                #type "abbreviated" 
                                dayPeriod [#type "midnight" #draft "contributed" ! "min."]
                            ] 
                            dayPeriodWidth [
                                #type "narrow" 
                                dayPeriod [#type "midnight" #draft "contributed" ! "min."]
                            ]
                        ]
                    ] 
                    dateFormats [
                        dateFormatLength [
                            #type "full" 
                            dateFormat [
                                pattern [! "EEEE, d MMMM y"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "dd.MM.yy"] 
                                datetimeSkeleton [! "yyMMdd"]
                            ]
                        ]
                    ] 
                    timeFormats [
                        timeFormatLength [
                            #type "full" 
                            timeFormat [
                                pattern [! "HH.mm:ss 'h' zzzz"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "Md" ! "dd.MM."] 
                            dateFormatItem [#id "MEd" ! "E, dd.MM."] 
                            dateFormatItem [#id "MMdd" #draft "contributed" ! "dd.MM"] 
                            dateFormatItem [#id "yM" ! "MM.y"] 
                            dateFormatItem [#id "yMd" ! "dd.MM.y"] 
                            dateFormatItem [#id "yMEd" ! "E, dd.MM.y"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" ! "dd.MM – dd.MM"] 
                                greatestDifference [#id "M" ! "dd.MM – dd.MM"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" ! "E, dd.MM – E, dd.MM"] 
                                greatestDifference [#id "M" ! "E, dd.MM – E, dd.MM"]
                            ] 
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" ! "MM.y – MM.y"] 
                                greatestDifference [#id "y" ! "MM.y – MM.y"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" ! "dd.MM.y – dd.MM.y"] 
                                greatestDifference [#id "M" ! "dd.MM.y – dd.MM.y"] 
                                greatestDifference [#id "y" ! "dd.MM.y – dd.MM.y"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" ! "E, dd.MM.y – E, dd.MM.y"] 
                                greatestDifference [#id "M" ! "E, dd.MM.y – E, dd.MM.y"] 
                                greatestDifference [#id "y" ! "E, dd.MM.y – E, dd.MM.y"]
                            ]
                        ]
                    ]
                ]
            ]
        ] 
        numbers [
            symbols [
                #numberSystem "latn" 
                currencyDecimal [! "."]
            ] 
            percentFormats [
                #numberSystem "latn" 
                percentFormatLength [
                    percentFormat [
                        pattern [#draft "contributed" ! "#,##0%"]
                    ]
                ]
            ]
        ]
    ]

