
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "ms"] 
            territory [#type "ID"]
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
                            #type "medium" 
                            dateFormat [
                                pattern [! "d MMM y G"] 
                                datetimeSkeleton [! "GyMMMd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "dd/MM/yy GGGGG"] 
                                datetimeSkeleton [! "GGGGGyyMMdd"]
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
                            #type "short" 
                            dateFormat [
                                pattern [! "dd/MM/yy"] 
                                datetimeSkeleton [! "yyMMdd"]
                            ]
                        ]
                    ] 
                    timeFormats [
                        timeFormatLength [
                            #type "full" 
                            timeFormat [
                                pattern [! "HH.mm.ss zzzz"] 
                                datetimeSkeleton [! "HHmmsszzzz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "long" 
                            timeFormat [
                                pattern [! "HH.mm.ss z"] 
                                datetimeSkeleton [! "HHmmssz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "medium" 
                            timeFormat [
                                pattern [! "HH.mm.ss"] 
                                datetimeSkeleton [! "HHmmss"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "short" 
                            timeFormat [
                                pattern [! "HH.mm"] 
                                datetimeSkeleton [! "HHmm"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "Bhm" ! "h.mm B"] 
                            dateFormatItem [#id "Bhms" ! "h.mm.ss B"] 
                            dateFormatItem [#id "EBhm" ! "E h.mm B"] 
                            dateFormatItem [#id "EBhms" ! "E h.mm.ss B"] 
                            dateFormatItem [#id "Ehm" ! "E h.mm a"] 
                            dateFormatItem [#id "EHm" ! "E HH.mm"] 
                            dateFormatItem [#id "Ehms" ! "E h.mm.ss a"] 
                            dateFormatItem [#id "EHms" ! "E HH.mm.ss"] 
                            dateFormatItem [#id "hm" ! "h.mm a"] 
                            dateFormatItem [#id "Hm" ! "HH.mm"] 
                            dateFormatItem [#id "hms" ! "h.mm.ss a"] 
                            dateFormatItem [#id "Hms" ! "HH.mm.ss"] 
                            dateFormatItem [#id "hmsv" ! "h.mm.ss. a v"] 
                            dateFormatItem [#id "Hmsv" ! "HH.mm.ss v"] 
                            dateFormatItem [#id "hmv" ! "h.mm a v"] 
                            dateFormatItem [#id "Hmv" ! "HH.mm v"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "Bhm" 
                                greatestDifference [#id "B" ! "h.mm B – h.mm B"] 
                                greatestDifference [#id "h" ! "h.mm – h.mm B"] 
                                greatestDifference [#id "m" ! "h.mm – h.mm B"]
                            ] 
                            intervalFormatItem [
                                #id "hm" 
                                greatestDifference [#id "a" ! "h.mm a – h.mm a"] 
                                greatestDifference [#id "h" ! "h.mm–h.mm a"] 
                                greatestDifference [#id "m" ! "h.mm–h.mm a"]
                            ] 
                            intervalFormatItem [
                                #id "Hm" 
                                greatestDifference [#id "H" ! "HH.mm–HH.mm"] 
                                greatestDifference [#id "m" ! "HH.mm–HH.mm"]
                            ] 
                            intervalFormatItem [
                                #id "hmv" 
                                greatestDifference [#id "a" ! "h.mm a – h.mm a v"] 
                                greatestDifference [#id "h" ! "h.mm–h.mm a v"] 
                                greatestDifference [#id "m" ! "h.mm–h.mm a v"]
                            ] 
                            intervalFormatItem [
                                #id "Hmv" 
                                greatestDifference [#id "H" ! "HH.mm–HH.mm v"] 
                                greatestDifference [#id "m" ! "HH.mm–HH.mm v"]
                            ]
                        ]
                    ]
                ] 
                calendar [
                    #type "islamic" 
                    dateFormats [
                        dateFormatLength [
                            #type "full" 
                            dateFormat [
                                pattern [! "EEEE, dd MMMM y G"] 
                                datetimeSkeleton [! "GyMMMMEEEEdd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "medium" 
                            dateFormat [
                                pattern [! "d MMM y G"] 
                                datetimeSkeleton [! "GyMMMd"]
                            ]
                        ]
                    ]
                ]
            ] 
            timeZoneNames [
                hourFormat [! "+HH.mm;-HH.mm"]
            ]
        ] 
        numbers [
            symbols [
                #numberSystem "latn" 
                decimal [! ","] 
                group [! "."] 
                timeSeparator [! "."]
            ] 
            currencyFormats [
                #numberSystem "latn" 
                currencyFormatLength [
                    currencyFormat [
                        #type "accounting" 
                        pattern [! "¤#,##0.00"]
                    ]
                ]
            ] 
            currencies [
                currency [
                    #type "IDR" 
                    symbol [! "Rp"]
                ]
            ]
        ]
    ]

