
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "en"] 
            territory [#type "NZ"]
        ] 
        dates [
            calendars [
                calendar [
                    #type "generic" 
                    dateFormats [
                        dateFormatLength [
                            #type "medium" 
                            dateFormat [
                                pattern [! "d/MM/y G"] 
                                datetimeSkeleton [! "GyMMd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "d/MM/y GGGGG"] 
                                datetimeSkeleton [! "GGGGGyMMd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "Md" ! "d/M"] 
                            dateFormatItem [#id "yyyyMd" ! "d/MM/y G"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" #draft "contributed" ! "d/MM – d/MM"] 
                                greatestDifference [#id "M" #draft "contributed" ! "d/MM – d/MM"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "E, d/MM – E, d/MM"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E, d/MM – E, d/MM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "E, d – E, d MMM"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E, d MMM – E, d MMM"]
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
                                greatestDifference [#id "d" #draft "contributed" ! "E, d/MM/y – E, d/MM/y G"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E, d/MM/y – E, d/MM/y G"] 
                                greatestDifference [#id "y" #draft "contributed" ! "E, d/MM/y – E, d/MM/y G"]
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
                                pattern [! "d/MM/y"] 
                                datetimeSkeleton [! "yMMd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "d/MM/yy"] 
                                datetimeSkeleton [! "yyMMd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "Md" ! "d/M"] 
                            dateFormatItem [#id "yMd" ! "d/MM/y"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" #draft "contributed" ! "d/MM – d/MM"] 
                                greatestDifference [#id "M" #draft "contributed" ! "d/MM – d/MM"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "E, d/MM – E, d/MM"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E, d/MM – E, d/MM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "E, d – E, d MMM"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E, d MMM – E, d MMM"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" #draft "contributed" ! "d/MM/y – d/MM/y"] 
                                greatestDifference [#id "M" #draft "contributed" ! "d/MM/y – d/MM/y"] 
                                greatestDifference [#id "y" #draft "contributed" ! "d/MM/y – d/MM/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "E, d/MM/y – E, d/MM/y"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E, d/MM/y – E, d/MM/y"] 
                                greatestDifference [#id "y" #draft "contributed" ! "E, d/MM/y – E, d/MM/y"]
                            ]
                        ]
                    ]
                ]
            ] 
            timeZoneNames [
                metazone [
                    #type "Australia_Central" 
                    short [
                        generic [! "ACT"] 
                        standard [! "ACST"] 
                        daylight [! "ACDT"]
                    ]
                ] 
                metazone [
                    #type "Australia_CentralWestern" 
                    short [
                        generic [! "ACWT"] 
                        standard [! "ACWST"] 
                        daylight [! "ACWDT"]
                    ]
                ] 
                metazone [
                    #type "Australia_Eastern" 
                    short [
                        generic [! "AET"] 
                        standard [! "AEST"] 
                        daylight [! "AEDT"]
                    ]
                ] 
                metazone [
                    #type "Australia_Western" 
                    short [
                        generic [! "AWT"] 
                        standard [! "AWST"] 
                        daylight [! "AWDT"]
                    ]
                ] 
                metazone [
                    #type "Chatham" 
                    short [
                        generic [! "CHAT"] 
                        standard [! "CHAST"] 
                        daylight [! "CHADT"]
                    ]
                ] 
                metazone [
                    #type "Lord_Howe" 
                    short [
                        generic [! "LHT"] 
                        standard [! "LHST"] 
                        daylight [! "LHDT"]
                    ]
                ] 
                metazone [
                    #type "New_Zealand" 
                    short [
                        generic [! "NZT"] 
                        standard [! "NZST"] 
                        daylight [! "NZDT"]
                    ]
                ]
            ]
        ] 
        numbers [
            currencies [
                currency [
                    #type "NZD" 
                    symbol [! "$"]
                ]
            ]
        ]
    ]

