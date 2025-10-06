
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "en"] 
            territory [#type "ZA"]
        ] 
        characters [
            exemplarCharacters [#type "auxiliary" #draft "contributed" ! {[á à ă â å ä ā æ ç ḓ é è ĕ ê ë ē í ì ĭ î ï ī ḽ ṅ ṋ ñ ó ò ŏ ô ö ø ō œ š ṱ ú ù ŭ û ü ū ÿ]}] 
            exemplarCharacters [#type "numbers" ! "[  \- ‑ , % ‰ + 0 1 2 3 4 5 6 7 8 9]"]
        ] 
        dates [
            calendars [
                calendar [
                    #type "generic" 
                    dateFormats [
                        dateFormatLength [
                            #type "full" 
                            dateFormat [
                                pattern [! "EEEE, dd MMMM y G"] 
                                datetimeSkeleton [! "GyMMMMEEEEdd"]
                            ]
                        ] 
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
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "GGGGG y/MM/dd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "Md" ! "MM/dd"] 
                            dateFormatItem [#id "MEd" ! "E, MM/dd"] 
                            dateFormatItem [#id "MMMd" ! "dd MMM"] 
                            dateFormatItem [#id "MMMEd" ! "E, dd MMM"] 
                            dateFormatItem [#id "yyyyMd" ! "G y/MM/dd"] 
                            dateFormatItem [#id "yyyyMEd" ! "E, G y/MM/dd"] 
                            dateFormatItem [#id "yyyyMMMd" ! "dd MMM y G"] 
                            dateFormatItem [#id "yyyyMMMEd" ! "E, dd MMM y G"]
                        ] 
                        intervalFormats [
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
                                greatestDifference [#id "d" #draft "unconfirmed" ! "dd – dd MMM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "dd MMM – dd MMM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E dd – E dd MMM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E dd MMM – E dd MMM"]
                            ] 
                            intervalFormatItem [
                                #id "y" 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "G y – y"]
                            ] 
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "G y/MM – y/MM"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "G y/MM – y/MM"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "G y/MM/dd – y/MM/dd"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "G y/MM/dd – y/MM/dd"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "G y/MM/dd – y/MM/dd"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E y/MM/dd – E y/MM/dd"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E y/MM/dd – E y/MM/dd"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E y/MM/dd – E y/MM/dd"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "dd – dd MMM y G"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "dd MMM – dd MMM y G"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "dd MMM y – dd MMM y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E, dd – E, dd MMM y G"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E, dd MMM – E, dd MMM y G"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E, dd MMM y – E, dd MMM y G"]
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
                                pattern [! "EEEE, dd MMMM y"] 
                                datetimeSkeleton [! "yMMMMEEEEdd"]
                            ]
                        ] 
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
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "y/MM/dd"]
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
                            dateFormatItem [#id "Md" ! "MM/dd"] 
                            dateFormatItem [#id "MEd" ! "E, MM/dd"] 
                            dateFormatItem [#id "MMMd" ! "dd MMM"] 
                            dateFormatItem [#id "MMMEd" ! "E, dd MMM"] 
                            dateFormatItem [#id "yMd" ! "y/MM/dd"] 
                            dateFormatItem [#id "yMEd" ! "E, y/MM/dd"] 
                            dateFormatItem [#id "yMMMd" ! "dd MMM y"] 
                            dateFormatItem [#id "yMMMEd" ! "E, dd MMM y"]
                        ] 
                        intervalFormats [
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
                                greatestDifference [#id "d" #draft "unconfirmed" ! "dd – dd MMM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "dd MMM – dd MMM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E dd – E dd MMM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E dd MMM – E dd MMM"]
                            ] 
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "y/MM – y/MM"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "y/MM – y/MM"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "y/MM/dd – y/MM/dd"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "y/MM/dd – y/MM/dd"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "y/MM/dd – y/MM/dd"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E y/MM/dd – E y/MM/dd"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E y/MM/dd – E y/MM/dd"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E y/MM/dd – E y/MM/dd"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "dd – dd MMM y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "dd MMM – dd MMM y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "dd MMM y – dd MMM y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E, dd – E, dd MMM y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E, dd MMM – E, dd MMM y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E, dd MMM y – E, dd MMM y"]
                            ]
                        ]
                    ]
                ]
            ] 
            timeZoneNames [
                metazone [
                    #type "Africa_Central" 
                    short [
                        standard [! "CAT"]
                    ]
                ] 
                metazone [
                    #type "Africa_Eastern" 
                    short [
                        standard [! "EAT"]
                    ]
                ] 
                metazone [
                    #type "Africa_Southern" 
                    short [
                        standard [! "SAST"]
                    ]
                ] 
                metazone [
                    #type "Africa_Western" 
                    short [
                        generic [! "WAT"] 
                        standard [! "WAT"] 
                        daylight [! "WAST"]
                    ]
                ]
            ]
        ] 
        numbers [
            symbols [
                #numberSystem "latn" 
                decimal [! ","] 
                group [! " "]
            ] 
            currencies [
                currency [
                    #type "ZAR" 
                    symbol [! "R"]
                ]
            ]
        ]
    ]

