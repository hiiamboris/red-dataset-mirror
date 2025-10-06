
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "en"] 
            territory [#type "SG"]
        ] 
        dates [
            calendars [
                calendar [
                    #type "generic" 
                    dateFormats [
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
                            dateFormatItem [#id "yyyyMEd" ! "E, d/M/y GGGGG"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "d/M – d/M"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "d/M – d/M"]
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
                                #id "yMMMEd" 
                                greatestDifference [#id "d" ! "E, d MMM – E, d MMM y G"]
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
                                pattern [! "d/M/yy"] 
                                datetimeSkeleton [! "yyMd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        intervalFormats [
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "d/M – d/M"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "d/M – d/M"]
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
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" ! "E, d MMM – E, d MMM y"]
                            ]
                        ]
                    ]
                ]
            ] 
            fields [
                field [
                    #type "quarter-short" 
                    relative [#type "-1" ! "last qtr"] 
                    relative [#type "0" ! "this qtr"] 
                    relative [#type "1" ! "next qtr"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} qtr"] 
                        relativeTimePattern [#count "other" ! "in {0} qtrs"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} qtr ago"] 
                        relativeTimePattern [#count "other" ! "{0} qtrs ago"]
                    ]
                ] 
                field [
                    #type "month-short" 
                    displayName [! "mth"] 
                    relative [#type "-1" ! "last mth"] 
                    relative [#type "0" ! "this mth"] 
                    relative [#type "1" ! "next mth"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} mth"] 
                        relativeTimePattern [#count "other" ! "in {0} mth"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} mth ago"] 
                        relativeTimePattern [#count "other" ! "{0} mth ago"]
                    ]
                ]
            ] 
            timeZoneNames [
                metazone [
                    #type "Malaysia" 
                    short [
                        standard [! "MYT"]
                    ]
                ] 
                metazone [
                    #type "Singapore" 
                    short [
                        standard [! "SGT"]
                    ]
                ]
            ]
        ] 
        numbers [
            currencies [
                currency [
                    #type "SGD" 
                    symbol [! "$"]
                ]
            ]
        ]
    ]

