
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "en"] 
            territory [#type "001"]
        ] 
        localeDisplayNames [
            languages [
                language [#type "mus" #draft "contributed" ! "Creek"] 
                language [#type "nds_NL" ! "West Low German"] 
                language [#type "sah" ! "Yakut"]
            ] 
            territories [
                territory [#type "UM" ! "US Outlying Islands"] 
                territory [#type "VI" ! "US Virgin Islands"]
            ] 
            keys [
                key [#type "colCaseLevel" #draft "contributed" ! "Case-Sensitive Sorting"] 
                key [#type "colNormalization" ! "Normalised Sorting"]
            ] 
            types [
                type [#key "colNormalization" #type "no" ! "Sort Without Normalisation"] 
                type [#key "colNormalization" #type "yes" ! "Sort Unicode Normalised"] 
                type [#key "hc" #type "h11" ! "12-Hour System (0–11)"] 
                type [#key "hc" #type "h12" ! "12-Hour System (1–12)"] 
                type [#key "hc" #type "h23" ! "24-Hour System (0–23)"] 
                type [#key "hc" #type "h24" ! "24-Hour System (1–24)"]
            ]
        ] 
        dates [
            calendars [
                calendar [
                    #type "chinese" 
                    dateFormats [
                        dateFormatLength [
                            #type "full" 
                            dateFormat [
                                pattern [! "EEEE, d MMMM r(U)"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "long" 
                            dateFormat [
                                pattern [! "d MMMM r(U)"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "medium" 
                            dateFormat [
                                pattern [! "d MMM r"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "dd/MM/r"] 
                                datetimeSkeleton [! "rMMdd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "Ed" ! "E d"] 
                            dateFormatItem [#id "GyMMMd" ! "d MMM r"] 
                            dateFormatItem [#id "GyMMMEd" ! "E, d MMM r"] 
                            dateFormatItem [#id "GyMMMMd" ! "d MMMM r(U)"] 
                            dateFormatItem [#id "GyMMMMEd" ! "E, d MMMM r(U)"] 
                            dateFormatItem [#id "M" ! "LL"] 
                            dateFormatItem [#id "Md" ! "dd/MM"] 
                            dateFormatItem [#id "MEd" ! "E, dd/MM"] 
                            dateFormatItem [#id "MMMd" ! "d MMM"] 
                            dateFormatItem [#id "MMMEd" ! "E, d MMM"] 
                            dateFormatItem [#id "MMMMd" ! "d MMMM"] 
                            dateFormatItem [#id "UMd" ! "dd/MM/U"] 
                            dateFormatItem [#id "UMMMd" ! "d MMM U"] 
                            dateFormatItem [#id "yyyyM" ! "MM/r"] 
                            dateFormatItem [#id "yyyyMd" ! "dd/MM/r"] 
                            dateFormatItem [#id "yyyyMEd" ! "E, dd/MM/r"] 
                            dateFormatItem [#id "yyyyMMMd" ! "d MMM r"] 
                            dateFormatItem [#id "yyyyMMMEd" ! "E, d MMM r"] 
                            dateFormatItem [#id "yyyyMMMMd" ! "d MMMM r(U)"] 
                            dateFormatItem [#id "yyyyMMMMEd" ! "E, d MMMM r(U)"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" ! "dd/MM – dd/MM"] 
                                greatestDifference [#id "M" ! "dd/MM – dd/MM"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" ! "E dd/MM – E dd/MM"] 
                                greatestDifference [#id "M" ! "E dd/MM – E dd/MM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMd" 
                                greatestDifference [#id "d" ! "d – d MMM"] 
                                greatestDifference [#id "M" ! "d MMM – d MMM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" ! "E d – E d MMM"] 
                                greatestDifference [#id "M" ! "E d MMM – E d MMM"]
                            ] 
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" ! "MM/y – MM/y"] 
                                greatestDifference [#id "y" ! "MM/y – MM/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" ! "dd/MM/y – dd/MM/y"] 
                                greatestDifference [#id "M" ! "dd/MM/y – dd/MM/y"] 
                                greatestDifference [#id "y" ! "dd/MM/y – dd/MM/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" ! "E, dd/MM/y – E, dd/MM/y"] 
                                greatestDifference [#id "M" ! "E, dd/MM/y – E, dd/MM/y"] 
                                greatestDifference [#id "y" ! "E, dd/MM/y – E, dd/MM/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMd" 
                                greatestDifference [#id "d" ! "d – d MMM U"] 
                                greatestDifference [#id "M" ! "d MMM – d MMM U"] 
                                greatestDifference [#id "y" ! "d MMM U – d MMM U"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" ! "E, d – E, d MMM U"] 
                                greatestDifference [#id "M" ! "E, d MMM – E, d MMM U"] 
                                greatestDifference [#id "y" ! "E, d MMM U – E, d MMM U"]
                            ]
                        ]
                    ]
                ] 
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
                            #type "long" 
                            dateFormat [
                                pattern [! "d MMMM y G"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "medium" 
                            dateFormat [
                                pattern [! "d MMM y G"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "dd/MM/y GGGGG"] 
                                datetimeSkeleton [! "GGGGGyMMdd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "EBhm" ! "E, h:mm B"] 
                            dateFormatItem [#id "EBhms" ! "E, h:mm:ss B"] 
                            dateFormatItem [#id "Ed" ! "E d"] 
                            dateFormatItem [#id "Ehm" ! "E, h:mm a"] 
                            dateFormatItem [#id "EHm" ! "E, HH:mm"] 
                            dateFormatItem [#id "Ehms" ! "E, h:mm:ss a"] 
                            dateFormatItem [#id "EHms" ! "E, HH:mm:ss"] 
                            dateFormatItem [#id "GyMd" ! "dd/MM/y GGGGG"] 
                            dateFormatItem [#id "GyMMMd" ! "d MMM y G"] 
                            dateFormatItem [#id "GyMMMEd" ! "E, d MMM y G"] 
                            dateFormatItem [#id "M" ! "LL"] 
                            dateFormatItem [#id "Md" ! "dd/MM"] 
                            dateFormatItem [#id "MEd" ! "E, dd/MM"] 
                            dateFormatItem [#id "MMMd" ! "d MMM"] 
                            dateFormatItem [#id "MMMEd" ! "E, d MMM"] 
                            dateFormatItem [#id "MMMMd" ! "d MMMM"] 
                            dateFormatItem [#id "yyyyM" ! "MM/y GGGGG"] 
                            dateFormatItem [#id "yyyyMd" ! "dd/MM/y GGGGG"] 
                            dateFormatItem [#id "yyyyMEd" ! "E, dd/MM/y GGGGG"] 
                            dateFormatItem [#id "yyyyMMMd" ! "d MMM y G"] 
                            dateFormatItem [#id "yyyyMMMEd" ! "E, d MMM y G"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "d" 
                                greatestDifference [#id "d" ! "d–d"]
                            ] 
                            intervalFormatItem [
                                #id "Gy" 
                                greatestDifference [#id "y" ! "y–y G"]
                            ] 
                            intervalFormatItem [
                                #id "GyMd" 
                                greatestDifference [#id "d" ! "dd/MM/y – dd/MM/y GGGGG"] 
                                greatestDifference [#id "G" ! "dd/MM/y GGGGG – dd/MM/y GGGGG"] 
                                greatestDifference [#id "M" ! "dd/MM/y – dd/MM/y GGGGG"] 
                                greatestDifference [#id "y" ! "dd/MM/y – dd/MM/y GGGGG"]
                            ] 
                            intervalFormatItem [
                                #id "GyMEd" 
                                greatestDifference [#id "d" ! "E, dd/MM/y – E, dd/MM/y GGGGG"] 
                                greatestDifference [#id "G" ! "E, dd/MM/y GGGGG – E, dd/MM/y GGGGG"] 
                                greatestDifference [#id "M" ! "E, dd/MM/y – E, dd/MM/y GGGGG"] 
                                greatestDifference [#id "y" ! "E, dd/MM/y – E, dd/MM/y GGGGG"]
                            ] 
                            intervalFormatItem [
                                #id "GyMMMd" 
                                greatestDifference [#id "d" ! "d–d MMM y G"] 
                                greatestDifference [#id "G" ! "d MMM y G – d MMM y G"] 
                                greatestDifference [#id "M" ! "d MMM – d MMM y G"] 
                                greatestDifference [#id "y" ! "d MMM y – d MMM y G"]
                            ] 
                            intervalFormatItem [
                                #id "GyMMMEd" 
                                greatestDifference [#id "d" ! "E, d MMM – E, d MMM y G"] 
                                greatestDifference [#id "G" ! "E, d MMM y G – E, d MMM y G"] 
                                greatestDifference [#id "M" ! "E, d MMM – E, d MMM y G"] 
                                greatestDifference [#id "y" ! "E, d MMM y – E, d MMM y G"]
                            ] 
                            intervalFormatItem [
                                #id "M" 
                                greatestDifference [#id "M" ! "M–M"]
                            ] 
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" ! "dd/MM – dd/MM"] 
                                greatestDifference [#id "M" ! "dd/MM – dd/MM"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" ! "E dd/MM – E dd/MM"] 
                                greatestDifference [#id "M" ! "E dd/MM – E dd/MM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMd" 
                                greatestDifference [#id "d" ! "d–d MMM"] 
                                greatestDifference [#id "M" ! "d MMM – d MMM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" ! "E d – E d MMM"] 
                                greatestDifference [#id "M" ! "E d MMM – E d MMM"]
                            ] 
                            intervalFormatItem [
                                #id "y" 
                                greatestDifference [#id "y" ! "y–y G"]
                            ] 
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" ! "MM/y – MM/y GGGGG"] 
                                greatestDifference [#id "y" ! "MM/y – MM/y GGGGG"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" ! "dd/MM/y – dd/MM/y GGGGG"] 
                                greatestDifference [#id "M" ! "dd/MM/y – dd/MM/y GGGGG"] 
                                greatestDifference [#id "y" ! "dd/MM/y – dd/MM/y GGGGG"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" ! "E, dd/MM/y – E, dd/MM/y GGGGG"] 
                                greatestDifference [#id "M" ! "E, dd/MM/y – E, dd/MM/y GGGGG"] 
                                greatestDifference [#id "y" ! "E, dd/MM/y – E, dd/MM/y GGGGG"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMd" 
                                greatestDifference [#id "d" ! "d–d MMM y G"] 
                                greatestDifference [#id "M" ! "d MMM – d MMM y G"] 
                                greatestDifference [#id "y" ! "d MMM y – d MMM y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" ! "E, d – E, d MMM y G"] 
                                greatestDifference [#id "M" ! "E, d MMM – E, d MMM y G"] 
                                greatestDifference [#id "y" ! "E, d MMM y – E, d MMM y G"]
                            ]
                        ]
                    ]
                ] 
                calendar [
                    #type "gregorian" 
                    months [
                        monthContext [
                            #type "format" 
                            monthWidth [
                                #type "abbreviated" 
                                month [#type "9" ! "Sept"]
                            ]
                        ] 
                        monthContext [
                            #type "stand-alone" 
                            monthWidth [
                                #type "abbreviated" 
                                month [#type "9" ! "Sept"]
                            ]
                        ]
                    ] 
                    dayPeriods [
                        dayPeriodContext [
                            #type "format" 
                            dayPeriodWidth [
                                #type "abbreviated" 
                                dayPeriod [#type "am" ! "am"] 
                                dayPeriod [#type "pm" ! "pm"]
                            ] 
                            dayPeriodWidth [
                                #type "wide" 
                                dayPeriod [#type "am" ! "am"] 
                                dayPeriod [#type "pm" ! "pm"]
                            ]
                        ] 
                        dayPeriodContext [
                            #type "stand-alone" 
                            dayPeriodWidth [
                                #type "abbreviated" 
                                dayPeriod [#type "am" ! "am"] 
                                dayPeriod [#type "pm" ! "pm"]
                            ] 
                            dayPeriodWidth [
                                #type "narrow" 
                                dayPeriod [#type "pm" ! "pm"]
                            ] 
                            dayPeriodWidth [
                                #type "wide" 
                                dayPeriod [#type "am" ! "am"] 
                                dayPeriod [#type "pm" ! "pm"]
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
                            #type "long" 
                            dateFormat [
                                pattern [! "d MMMM y"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "medium" 
                            dateFormat [
                                pattern [! "d MMM y"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "dd/MM/y"] 
                                datetimeSkeleton [! "yMMdd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "EBhm" ! "E, h:mm B"] 
                            dateFormatItem [#id "EBhms" ! "E, h:mm:ss B"] 
                            dateFormatItem [#id "Ed" ! "E d"] 
                            dateFormatItem [#id "GyMd" ! "d/M/y GGGGG"] 
                            dateFormatItem [#id "GyMMMd" ! "d MMM y G"] 
                            dateFormatItem [#id "GyMMMEd" ! "E, d MMM y G"] 
                            dateFormatItem [#id "Md" ! "dd/MM"] 
                            dateFormatItem [#id "MEd" ! "E, dd/MM"] 
                            dateFormatItem [#id "MMdd" ! "dd/MM"] 
                            dateFormatItem [#id "MMMd" ! "d MMM"] 
                            dateFormatItem [#id "MMMEd" ! "E, d MMM"] 
                            dateFormatItem [#id "MMMMd" ! "d MMMM"] 
                            dateFormatItem [#id "yM" ! "MM/y"] 
                            dateFormatItem [#id "yMd" ! "dd/MM/y"] 
                            dateFormatItem [#id "yMEd" ! "E, dd/MM/y"] 
                            dateFormatItem [#id "yMMMd" ! "d MMM y"] 
                            dateFormatItem [#id "yMMMEd" ! "E, d MMM y"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "d" 
                                greatestDifference [#id "d" ! "d–d"]
                            ] 
                            intervalFormatItem [
                                #id "GyMd" 
                                greatestDifference [#id "d" ! "dd/MM/y – dd/MM/y GGGGG"] 
                                greatestDifference [#id "G" ! "dd/MM/y GGGGG – dd/MM/y GGGGG"] 
                                greatestDifference [#id "M" ! "dd/MM/y – dd/MM/y GGGGG"] 
                                greatestDifference [#id "y" ! "dd/MM/y – dd/MM/y GGGGG"]
                            ] 
                            intervalFormatItem [
                                #id "GyMEd" 
                                greatestDifference [#id "d" ! "E, dd/MM/y – E, dd/MM/y GGGGG"] 
                                greatestDifference [#id "G" ! "E, dd/MM/y GGGGG – E, dd/MM/y GGGGG"] 
                                greatestDifference [#id "M" ! "E, dd/MM/y – E, dd/MM/y GGGGG"] 
                                greatestDifference [#id "y" ! "E, dd/MM/y – E, dd/MM/y GGGGG"]
                            ] 
                            intervalFormatItem [
                                #id "GyMMMd" 
                                greatestDifference [#id "d" ! "d – d MMM y G"] 
                                greatestDifference [#id "G" ! "d MMM y G – d MMM y G"] 
                                greatestDifference [#id "M" ! "d MMM – d MMM y G"] 
                                greatestDifference [#id "y" ! "d MMM y – d MMM y G"]
                            ] 
                            intervalFormatItem [
                                #id "GyMMMEd" 
                                greatestDifference [#id "d" ! "E, d MMM – E, d MMM y G"] 
                                greatestDifference [#id "G" ! "E, d MMM y G – E, d MMM y G"] 
                                greatestDifference [#id "M" ! "E, d MMM – E, d MMM y G"] 
                                greatestDifference [#id "y" ! "E, d MMM y – E, d MMM y G"]
                            ] 
                            intervalFormatItem [
                                #id "h" 
                                greatestDifference [#id "h" ! "h–h a"]
                            ] 
                            intervalFormatItem [
                                #id "H" 
                                greatestDifference [#id "H" ! "HH–HH"]
                            ] 
                            intervalFormatItem [
                                #id "Hm" 
                                greatestDifference [#id "H" ! "HH:mm–HH:mm"] 
                                greatestDifference [#id "m" ! "HH:mm–HH:mm"]
                            ] 
                            intervalFormatItem [
                                #id "Hmv" 
                                greatestDifference [#id "H" ! "HH:mm–HH:mm v"] 
                                greatestDifference [#id "m" ! "HH:mm–HH:mm v"]
                            ] 
                            intervalFormatItem [
                                #id "hv" 
                                greatestDifference [#id "h" ! "h–h a v"]
                            ] 
                            intervalFormatItem [
                                #id "Hv" 
                                greatestDifference [#id "H" ! "HH–HH v"]
                            ] 
                            intervalFormatItem [
                                #id "M" 
                                greatestDifference [#id "M" ! "M–M"]
                            ] 
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" ! "dd/MM – dd/MM"] 
                                greatestDifference [#id "M" ! "dd/MM – dd/MM"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" ! "E dd/MM – E dd/MM"] 
                                greatestDifference [#id "M" ! "E dd/MM – E dd/MM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMd" 
                                greatestDifference [#id "d" ! "d–d MMM"] 
                                greatestDifference [#id "M" ! "d MMM – d MMM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" ! "E d – E d MMM"] 
                                greatestDifference [#id "M" ! "E d MMM – E d MMM"]
                            ] 
                            intervalFormatItem [
                                #id "y" 
                                greatestDifference [#id "y" ! "y–y"]
                            ] 
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" ! "MM/y – MM/y"] 
                                greatestDifference [#id "y" ! "MM/y – MM/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" ! "dd/MM/y – dd/MM/y"] 
                                greatestDifference [#id "M" ! "dd/MM/y – dd/MM/y"] 
                                greatestDifference [#id "y" ! "dd/MM/y – dd/MM/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" ! "E, dd/MM/y – E, dd/MM/y"] 
                                greatestDifference [#id "M" ! "E, dd/MM/y – E, dd/MM/y"] 
                                greatestDifference [#id "y" ! "E, dd/MM/y – E, dd/MM/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMd" 
                                greatestDifference [#id "d" ! "d–d MMM y"] 
                                greatestDifference [#id "M" ! "d MMM – d MMM y"] 
                                greatestDifference [#id "y" ! "d MMM y – d MMM y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" ! "E, d – E, d MMM y"] 
                                greatestDifference [#id "M" ! "E, d MMM – E, d MMM y"] 
                                greatestDifference [#id "y" ! "E, d MMM y – E, d MMM y"]
                            ]
                        ]
                    ]
                ] 
                calendar [
                    #type "islamic" 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "MEd" ! "E dd/MM"] 
                            dateFormatItem [#id "MMMEd" ! "E d MMM"]
                        ]
                    ]
                ]
            ] 
            fields [
                field [
                    #type "year-short" 
                    displayName [! "yr"] 
                    relative [#type "-1" ! "last yr"] 
                    relative [#type "0" ! "this yr"] 
                    relative [#type "1" ! "next yr"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} yr"] 
                        relativeTimePattern [#count "other" ! "in {0} yr"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} yr ago"] 
                        relativeTimePattern [#count "other" ! "{0} yr ago"]
                    ]
                ] 
                field [
                    #type "year-narrow" 
                    relative [#type "-1" ! "last yr"] 
                    relative [#type "0" ! "this yr"] 
                    relative [#type "1" ! "next yr"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} yr"] 
                        relativeTimePattern [#count "other" ! "in {0} yr"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} yr ago"] 
                        relativeTimePattern [#count "other" ! "{0} yr ago"]
                    ]
                ] 
                field [
                    #type "quarter-short" 
                    displayName [! "qtr"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} qtr"] 
                        relativeTimePattern [#count "other" ! "in {0} qtr"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} qtr ago"] 
                        relativeTimePattern [#count "other" ! "{0} qtr ago"]
                    ]
                ] 
                field [
                    #type "quarter-narrow" 
                    displayName [! "qtr"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} qtr"] 
                        relativeTimePattern [#count "other" ! "in {0} qtr"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} qtr ago"] 
                        relativeTimePattern [#count "other" ! "{0} qtr ago"]
                    ]
                ] 
                field [
                    #type "month-short" 
                    displayName [! "mo"] 
                    relative [#type "-1" ! "last mo"] 
                    relative [#type "0" ! "this mo"] 
                    relative [#type "1" ! "next mo"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} mo"] 
                        relativeTimePattern [#count "other" ! "in {0} mo"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} mo ago"] 
                        relativeTimePattern [#count "other" ! "{0} mo ago"]
                    ]
                ] 
                field [
                    #type "month-narrow" 
                    displayName [! "mo"] 
                    relative [#type "-1" ! "last mo"] 
                    relative [#type "0" ! "this mo"] 
                    relative [#type "1" ! "next mo"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} mo"] 
                        relativeTimePattern [#count "other" ! "in {0} mo"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} mo ago"] 
                        relativeTimePattern [#count "other" ! "{0} mo ago"]
                    ]
                ] 
                field [
                    #type "week-short" 
                    displayName [! "wk"] 
                    relative [#type "-1" ! "last wk"] 
                    relative [#type "0" ! "this wk"] 
                    relative [#type "1" ! "next wk"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} wk"] 
                        relativeTimePattern [#count "other" ! "in {0} wk"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} wk ago"] 
                        relativeTimePattern [#count "other" ! "{0} wk ago"]
                    ]
                ] 
                field [
                    #type "week-narrow" 
                    displayName [! "wk"] 
                    relative [#type "-1" ! "last wk"] 
                    relative [#type "0" ! "this wk"] 
                    relative [#type "1" ! "next wk"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} wk"] 
                        relativeTimePattern [#count "other" ! "in {0} wk"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} wk ago"] 
                        relativeTimePattern [#count "other" ! "{0} wk ago"]
                    ]
                ] 
                field [
                    #type "weekOfMonth-short" 
                    displayName [! "wk of mo"]
                ] 
                field [
                    #type "weekOfMonth-narrow" 
                    displayName [! "wk of mo"]
                ] 
                field [
                    #type "dayOfYear-short" 
                    displayName [! "day of yr"]
                ] 
                field [
                    #type "dayOfYear-narrow" 
                    displayName [! "day of yr"]
                ] 
                field [
                    #type "weekday-short" 
                    displayName [! "day of wk"]
                ] 
                field [
                    #type "weekday-narrow" 
                    displayName [! "day of wk"]
                ] 
                field [
                    #type "weekdayOfMonth-short" 
                    displayName [! "wkday of mo"]
                ] 
                field [
                    #type "weekdayOfMonth-narrow" 
                    displayName [! "wkday of mo"]
                ] 
                field [
                    #type "sun-short" 
                    relative [#type "-1" ! "last Sun"] 
                    relative [#type "0" ! "this Sun"] 
                    relative [#type "1" ! "next Sun"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} Sun"] 
                        relativeTimePattern [#count "other" ! "in {0} Sun"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} Sun ago"] 
                        relativeTimePattern [#count "other" ! "{0} Sun ago"]
                    ]
                ] 
                field [
                    #type "mon-short" 
                    relative [#type "-1" ! "last Mon"] 
                    relative [#type "0" ! "this Mon"] 
                    relative [#type "1" ! "next Mon"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} Mon"] 
                        relativeTimePattern [#count "other" ! "in {0} Mon"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} Mon ago"] 
                        relativeTimePattern [#count "other" ! "{0} Mon ago"]
                    ]
                ] 
                field [
                    #type "tue-short" 
                    relative [#type "-1" ! "last Tue"] 
                    relative [#type "0" ! "this Tue"] 
                    relative [#type "1" ! "next Tue"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} Tue"] 
                        relativeTimePattern [#count "other" ! "in {0} Tue"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} Tue ago"] 
                        relativeTimePattern [#count "other" ! "{0} Tue ago"]
                    ]
                ] 
                field [
                    #type "wed-short" 
                    relative [#type "-1" ! "last Wed"] 
                    relative [#type "0" ! "this Wed"] 
                    relative [#type "1" ! "next Wed"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} Wed"] 
                        relativeTimePattern [#count "other" ! "in {0} Wed"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} Wed ago"] 
                        relativeTimePattern [#count "other" ! "{0} Wed ago"]
                    ]
                ] 
                field [
                    #type "thu-short" 
                    relative [#type "-1" ! "last Thu"] 
                    relative [#type "0" ! "this Thu"] 
                    relative [#type "1" ! "next Thu"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} Thu"] 
                        relativeTimePattern [#count "other" ! "in {0} Thu"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} Thu ago"] 
                        relativeTimePattern [#count "other" ! "{0} Thu ago"]
                    ]
                ] 
                field [
                    #type "fri-short" 
                    relative [#type "-1" ! "last Fri"] 
                    relative [#type "0" ! "this Fri"] 
                    relative [#type "1" ! "next Fri"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} Fri"] 
                        relativeTimePattern [#count "other" ! "in {0} Fri"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} Fri ago"] 
                        relativeTimePattern [#count "other" ! "{0} Fri ago"]
                    ]
                ] 
                field [
                    #type "sat-short" 
                    relative [#type "-1" ! "last Sat"] 
                    relative [#type "0" ! "this Sat"] 
                    relative [#type "1" ! "next Sat"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} Sat"] 
                        relativeTimePattern [#count "other" ! "in {0} Sat"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} Sat ago"] 
                        relativeTimePattern [#count "other" ! "{0} Sat ago"]
                    ]
                ] 
                field [
                    #type "dayperiod-short" 
                    displayName [! "am/pm"]
                ] 
                field [
                    #type "dayperiod" 
                    displayName [! "am/pm"]
                ] 
                field [
                    #type "dayperiod-narrow" 
                    displayName [! "am/pm"]
                ] 
                field [
                    #type "hour-short" 
                    displayName [! "hr"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} hr"] 
                        relativeTimePattern [#count "other" ! "in {0} hr"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} hr ago"] 
                        relativeTimePattern [#count "other" ! "{0} hr ago"]
                    ]
                ] 
                field [
                    #type "hour-narrow" 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} hr"] 
                        relativeTimePattern [#count "other" ! "in {0} hr"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} hr ago"] 
                        relativeTimePattern [#count "other" ! "{0} hr ago"]
                    ]
                ] 
                field [
                    #type "minute-short" 
                    displayName [! "min"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} min"] 
                        relativeTimePattern [#count "other" ! "in {0} min"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} min ago"] 
                        relativeTimePattern [#count "other" ! "{0} min ago"]
                    ]
                ] 
                field [
                    #type "minute-narrow" 
                    displayName [! "min"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} min"] 
                        relativeTimePattern [#count "other" ! "in {0} min"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} min ago"] 
                        relativeTimePattern [#count "other" ! "{0} min ago"]
                    ]
                ] 
                field [
                    #type "second-short" 
                    displayName [! "sec"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} sec"] 
                        relativeTimePattern [#count "other" ! "in {0} sec"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} sec ago"] 
                        relativeTimePattern [#count "other" ! "{0} sec ago"]
                    ]
                ] 
                field [
                    #type "second-narrow" 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} sec"] 
                        relativeTimePattern [#count "other" ! "in {0} sec"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} sec ago"] 
                        relativeTimePattern [#count "other" ! "{0} sec ago"]
                    ]
                ]
            ] 
            timeZoneNames [
                zone [
                    #type "America/St_Barthelemy" 
                    exemplarCity [! "St Barthélemy"]
                ] 
                zone [
                    #type "America/St_Johns" 
                    exemplarCity [! "St John’s"]
                ] 
                zone [
                    #type "America/St_Kitts" 
                    exemplarCity [! "St Kitts"]
                ] 
                zone [
                    #type "Asia/Aqtau" 
                    exemplarCity [! "Aktau"]
                ] 
                zone [
                    #type "America/St_Lucia" 
                    exemplarCity [! "St Lucia"]
                ] 
                zone [
                    #type "Atlantic/St_Helena" 
                    exemplarCity [! "St Helena"]
                ] 
                zone [
                    #type "Pacific/Honolulu" 
                    short [
                        generic [! "∅∅∅"] 
                        standard [! "∅∅∅"] 
                        daylight [! "∅∅∅"]
                    ]
                ] 
                zone [
                    #type "America/St_Vincent" 
                    exemplarCity [! "St Vincent"]
                ] 
                zone [
                    #type "America/St_Thomas" 
                    exemplarCity [! "St Thomas"]
                ] 
                metazone [
                    #type "Alaska" 
                    short [
                        generic [! "∅∅∅"] 
                        standard [! "∅∅∅"] 
                        daylight [! "∅∅∅"]
                    ]
                ] 
                metazone [
                    #type "America_Central" 
                    short [
                        generic [! "∅∅∅"] 
                        standard [! "∅∅∅"] 
                        daylight [! "∅∅∅"]
                    ]
                ] 
                metazone [
                    #type "America_Eastern" 
                    short [
                        generic [! "∅∅∅"] 
                        standard [! "∅∅∅"] 
                        daylight [! "∅∅∅"]
                    ]
                ] 
                metazone [
                    #type "America_Mountain" 
                    short [
                        generic [! "∅∅∅"] 
                        standard [! "∅∅∅"] 
                        daylight [! "∅∅∅"]
                    ]
                ] 
                metazone [
                    #type "America_Pacific" 
                    short [
                        generic [! "∅∅∅"] 
                        standard [! "∅∅∅"] 
                        daylight [! "∅∅∅"]
                    ]
                ] 
                metazone [
                    #type "Atlantic" 
                    short [
                        generic [! "∅∅∅"] 
                        standard [! "∅∅∅"] 
                        daylight [! "∅∅∅"]
                    ]
                ] 
                metazone [
                    #type "Hawaii_Aleutian" 
                    short [
                        generic [! "∅∅∅"] 
                        standard [! "∅∅∅"] 
                        daylight [! "∅∅∅"]
                    ]
                ] 
                metazone [
                    #type "Pierre_Miquelon" 
                    long [
                        generic [! "St Pierre &amp; Miquelon Time"] 
                        standard [! "St Pierre &amp; Miquelon Standard Time"] 
                        daylight [! "St Pierre &amp; Miquelon Daylight Time"]
                    ]
                ]
            ]
        ] 
        numbers [
            currencies [
                currency [
                    #type "AFN" 
                    displayName [#count "one" ! "Afghan afghani"] 
                    displayName [#count "other" ! "Afghan afghanis"]
                ] 
                currency [
                    #type "BMD" 
                    displayName [! "Bermudian Dollar"] 
                    displayName [#count "one" ! "Bermudian dollar"] 
                    displayName [#count "other" ! "Bermudian dollars"]
                ] 
                currency [
                    #type "BYB" 
                    displayName [! "Belarusian New Rouble (1994–1999)"] 
                    displayName [#count "one" ! "Belarusian new rouble (1994–1999)"] 
                    displayName [#count "other" ! "Belarusian new roubles (1994–1999)"]
                ] 
                currency [
                    #type "BYN" 
                    displayName [! "Belarusian Rouble"] 
                    displayName [#count "one" ! "Belarusian rouble"] 
                    displayName [#count "other" ! "Belarusian roubles"]
                ] 
                currency [
                    #type "BYR" 
                    displayName [! "Belarusian Rouble (2000–2016)"] 
                    displayName [#count "one" ! "Belarusian rouble (2000–2016)"] 
                    displayName [#count "other" ! "Belarusian roubles (2000–2016)"]
                ] 
                currency [
                    #type "ETB" 
                    displayName [#count "other" ! "Ethiopian birr"]
                ] 
                currency [
                    #type "JPY" 
                    symbol [! "JP¥"]
                ] 
                currency [
                    #type "LSL" 
                    displayName [#count "other" ! "Lesotho maloti"]
                ] 
                currency [
                    #type "LVR" 
                    displayName [! "Latvian Rouble"] 
                    displayName [#count "one" ! "Latvian rouble"] 
                    displayName [#count "other" ! "Latvian roubles"]
                ] 
                currency [
                    #type "MGA" 
                    displayName [#count "other" ! "Malagasy ariary"]
                ] 
                currency [
                    #type "MVR" 
                    displayName [#count "other" ! "Maldivian rufiyaa"]
                ] 
                currency [
                    #type "PHP" 
                    displayName [! "Philippine Peso"] 
                    displayName [#count "one" ! "Philippine peso"] 
                    displayName [#count "other" ! "Philippine pesos"]
                ] 
                currency [
                    #type "RUB" 
                    displayName [! "Russian Rouble"] 
                    displayName [#count "one" ! "Russian rouble"] 
                    displayName [#count "other" ! "Russian roubles"]
                ] 
                currency [
                    #type "RUR" 
                    displayName [! "Russian Rouble (1991–1998)"] 
                    displayName [#count "one" ! "Russian rouble (1991–1998)"] 
                    displayName [#count "other" ! "Russian roubles (1991–1998)"]
                ] 
                currency [
                    #type "SHP" 
                    displayName [! "St Helena Pound"] 
                    displayName [#count "one" ! "St Helena pound"] 
                    displayName [#count "other" ! "St Helena pounds"]
                ] 
                currency [
                    #type "TJR" 
                    displayName [! "Tajikistani Rouble"] 
                    displayName [#count "one" ! "Tajikistani rouble"] 
                    displayName [#count "other" ! "Tajikistani roubles"]
                ] 
                currency [
                    #type "USD" 
                    symbol [! "US$"]
                ] 
                currency [
                    #type "VUV" 
                    displayName [#count "other" ! "Vanuatu vatu"]
                ]
            ]
        ] 
        units [
            unitLength [
                #type "long" 
                compoundUnit [
                    #type "10p1" 
                    unitPrefixPattern [! "deca{0}"]
                ] 
                unit [
                    #type "acceleration-meter-per-square-second" 
                    displayName [! "metres per second squared"] 
                    unitPattern [#count "one" ! "{0} metre per second squared"] 
                    unitPattern [#count "other" ! "{0} metres per second squared"]
                ] 
                unit [
                    #type "area-square-kilometer" 
                    displayName [! "square kilometres"] 
                    unitPattern [#count "one" ! "{0} square kilometre"] 
                    unitPattern [#count "other" ! "{0} square kilometres"] 
                    perUnitPattern [! "{0} per square kilometre"]
                ] 
                unit [
                    #type "area-square-meter" 
                    displayName [! "square metres"] 
                    unitPattern [#count "one" ! "{0} square metre"] 
                    unitPattern [#count "other" ! "{0} square metres"] 
                    perUnitPattern [! "{0} per square metre"]
                ] 
                unit [
                    #type "area-square-centimeter" 
                    displayName [! "square centimetres"] 
                    unitPattern [#count "one" ! "{0} square centimetre"] 
                    unitPattern [#count "other" ! "{0} square centimetres"] 
                    perUnitPattern [! "{0} per square centimetre"]
                ] 
                unit [
                    #type "concentr-karat" 
                    displayName [! "carat"] 
                    unitPattern [#count "one" ! "{0} carat"] 
                    unitPattern [#count "other" ! "{0} carats"]
                ] 
                unit [
                    #type "concentr-milligram-ofglucose-per-deciliter" 
                    displayName [! "milligrams per decilitre"] 
                    unitPattern [#count "one" ! "{0} milligram per decilitre"] 
                    unitPattern [#count "other" ! "{0} milligrams per decilitre"]
                ] 
                unit [
                    #type "concentr-millimole-per-liter" 
                    displayName [! "millimoles per litre"] 
                    unitPattern [#count "one" ! "{0} millimole per litre"] 
                    unitPattern [#count "other" ! "{0} millimoles per litre"]
                ] 
                unit [
                    #type "concentr-percent" 
                    displayName [#draft "contributed" ! "per cent"] 
                    unitPattern [#count "one" #draft "contributed" ! "{0} per cent"] 
                    unitPattern [#count "other" #draft "contributed" ! "{0} per cent"]
                ] 
                unit [
                    #type "concentr-permille" 
                    displayName [#draft "contributed" ! "per mille"] 
                    unitPattern [#count "one" #draft "contributed" ! "{0} per mille"] 
                    unitPattern [#count "other" #draft "contributed" ! "{0} per mille"]
                ] 
                unit [
                    #type "consumption-liter-per-kilometer" 
                    displayName [! "litres per kilometre"] 
                    unitPattern [#count "one" ! "{0} litre per kilometre"] 
                    unitPattern [#count "other" ! "{0} litres per kilometre"]
                ] 
                unit [
                    #type "consumption-liter-per-100-kilometer" 
                    displayName [! "litres per 100 kilometres"] 
                    unitPattern [#count "one" ! "{0} litre per 100 kilometres"] 
                    unitPattern [#count "other" ! "{0} litres per 100 kilometres"]
                ] 
                unit [
                    #type "consumption-mile-per-gallon" 
                    displayName [! "miles per US gallon"] 
                    unitPattern [#count "one" ! "{0} mile per US gallon"] 
                    unitPattern [#count "other" ! "{0} miles per US gallon"]
                ] 
                unit [
                    #type "consumption-mile-per-gallon-imperial" 
                    displayName [! "miles per gallon"] 
                    unitPattern [#count "one" ! "{0} mile per gallon"] 
                    unitPattern [#count "other" ! "{0} miles per gallon"]
                ] 
                unit [
                    #type "energy-kilowatt-hour" 
                    unitPattern [#count "one" ! "{0} kilowatt-hour"]
                ] 
                unit [
                    #type "force-kilowatt-hour-per-100-kilometer" 
                    displayName [! "kilowatt-hour per 100 kilometres"] 
                    unitPattern [#count "one" ! "{0} kilowatt-hour per 100 kilometres"] 
                    unitPattern [#count "other" ! "{0} kilowatt-hours per 100 kilometres"]
                ] 
                unit [
                    #type "graphics-pixel-per-centimeter" 
                    displayName [! "pixels per centimetre"] 
                    unitPattern [#count "one" ! "{0} pixel per centimetre"] 
                    unitPattern [#count "other" ! "{0} pixels per centimetre"]
                ] 
                unit [
                    #type "graphics-dot-per-centimeter" 
                    displayName [! "dots per centimetre"] 
                    unitPattern [#count "one" ! "{0} dot per centimetre"] 
                    unitPattern [#count "other" ! "{0} dots per centimetre"]
                ] 
                unit [
                    #type "length-earth-radius" 
                    unitPattern [#count "other" ! "{0} earth radii"]
                ] 
                unit [
                    #type "length-kilometer" 
                    displayName [! "kilometres"] 
                    unitPattern [#count "one" ! "{0} kilometre"] 
                    unitPattern [#count "other" ! "{0} kilometres"] 
                    perUnitPattern [! "{0} per kilometre"]
                ] 
                unit [
                    #type "length-meter" 
                    displayName [! "metres"] 
                    unitPattern [#count "one" ! "{0} metre"] 
                    unitPattern [#count "other" ! "{0} metres"] 
                    perUnitPattern [! "{0} per metre"]
                ] 
                unit [
                    #type "length-decimeter" 
                    displayName [! "decimetre"] 
                    unitPattern [#count "one" ! "{0} decimetre"] 
                    unitPattern [#count "other" ! "{0} decimetres"]
                ] 
                unit [
                    #type "length-centimeter" 
                    displayName [! "centimetres"] 
                    unitPattern [#count "one" ! "{0} centimetre"] 
                    unitPattern [#count "other" ! "{0} centimetres"] 
                    perUnitPattern [! "{0} per centimetre"]
                ] 
                unit [
                    #type "length-millimeter" 
                    displayName [! "millimetres"] 
                    unitPattern [#count "one" ! "{0} millimetre"] 
                    unitPattern [#count "other" ! "{0} millimetres"]
                ] 
                unit [
                    #type "length-micrometer" 
                    displayName [! "micrometre"] 
                    unitPattern [#count "one" ! "{0} micrometre"] 
                    unitPattern [#count "other" ! "{0} micrometres"]
                ] 
                unit [
                    #type "length-nanometer" 
                    displayName [! "nanometres"] 
                    unitPattern [#count "one" ! "{0} nanometre"] 
                    unitPattern [#count "other" ! "{0} nanometres"]
                ] 
                unit [
                    #type "length-picometer" 
                    displayName [! "picometres"] 
                    unitPattern [#count "one" ! "{0} picometre"] 
                    unitPattern [#count "other" ! "{0} picometres"]
                ] 
                unit [
                    #type "length-mile-scandinavian" 
                    displayName [! "Scandinavian mile"] 
                    unitPattern [#count "one" ! "{0} Scandinavian mile"] 
                    unitPattern [#count "other" ! "{0} Scandinavian miles"]
                ] 
                unit [
                    #type "light-candela" 
                    unitPattern [#count "other" ! "{0} candelas"]
                ] 
                unit [
                    #type "light-lumen" 
                    unitPattern [#count "other" ! "{0} lumens"]
                ] 
                unit [
                    #type "mass-metric-ton" 
                    displayName [! "tonnes"] 
                    unitPattern [#count "one" ! "{0} tonne"] 
                    unitPattern [#count "other" ! "{0} tonnes"]
                ] 
                unit [
                    #type "mass-stone" 
                    displayName [! "stone"] 
                    unitPattern [#count "one" ! "{0} stone"] 
                    unitPattern [#count "other" ! "{0} stone"]
                ] 
                unit [
                    #type "pressure-millimeter-ofhg" 
                    displayName [! "millimetres of mercury"] 
                    unitPattern [#count "one" ! "{0} millimetre of mercury"] 
                    unitPattern [#count "other" ! "{0} millimetres of mercury"]
                ] 
                unit [
                    #type "speed-kilometer-per-hour" 
                    displayName [! "kilometres per hour"] 
                    unitPattern [#count "one" ! "{0} kilometre per hour"] 
                    unitPattern [#count "other" ! "{0} kilometres per hour"]
                ] 
                unit [
                    #type "speed-meter-per-second" 
                    displayName [! "metres per second"] 
                    unitPattern [#count "one" ! "{0} metre per second"] 
                    unitPattern [#count "other" ! "{0} metres per second"]
                ] 
                unit [
                    #type "temperature-generic" 
                    displayName [! "degree"]
                ] 
                unit [
                    #type "temperature-kelvin" 
                    displayName [! "kelvin"] 
                    unitPattern [#count "one" ! "{0} kelvin"] 
                    unitPattern [#count "other" ! "{0} kelvin"]
                ] 
                unit [
                    #type "torque-newton-meter" 
                    displayName [! "newton metres"] 
                    unitPattern [#count "one" ! "{0} newton metre"] 
                    unitPattern [#count "other" ! "{0} newton metres"]
                ] 
                unit [
                    #type "volume-cubic-kilometer" 
                    displayName [! "cubic kilometres"] 
                    unitPattern [#count "one" ! "{0} cubic kilometre"] 
                    unitPattern [#count "other" ! "{0} cubic kilometres"]
                ] 
                unit [
                    #type "volume-cubic-meter" 
                    displayName [! "cubic metres"] 
                    unitPattern [#count "one" ! "{0} cubic metre"] 
                    unitPattern [#count "other" ! "{0} cubic metres"] 
                    perUnitPattern [! "{0} per cubic metre"]
                ] 
                unit [
                    #type "volume-cubic-centimeter" 
                    displayName [! "cubic centimetres"] 
                    unitPattern [#count "one" ! "{0} cubic centimetre"] 
                    unitPattern [#count "other" ! "{0} cubic centimetres"] 
                    perUnitPattern [! "{0} per cubic centimetre"]
                ] 
                unit [
                    #type "volume-megaliter" 
                    displayName [! "megalitres"] 
                    unitPattern [#count "one" ! "{0} megalitre"] 
                    unitPattern [#count "other" ! "{0} megalitres"]
                ] 
                unit [
                    #type "volume-hectoliter" 
                    displayName [! "hectolitres"] 
                    unitPattern [#count "one" ! "{0} hectolitre"] 
                    unitPattern [#count "other" ! "{0} hectolitres"]
                ] 
                unit [
                    #type "volume-liter" 
                    displayName [! "litres"] 
                    unitPattern [#count "one" ! "{0} litre"] 
                    unitPattern [#count "other" ! "{0} litres"] 
                    perUnitPattern [! "{0} per litre"]
                ] 
                unit [
                    #type "volume-deciliter" 
                    displayName [! "decilitres"] 
                    unitPattern [#count "one" ! "{0} decilitre"] 
                    unitPattern [#count "other" ! "{0} decilitres"]
                ] 
                unit [
                    #type "volume-centiliter" 
                    displayName [! "centilitres"] 
                    unitPattern [#count "one" ! "{0} centilitre"] 
                    unitPattern [#count "other" ! "{0} centilitres"]
                ] 
                unit [
                    #type "volume-milliliter" 
                    displayName [! "millilitres"] 
                    unitPattern [#count "one" ! "{0} millilitre"] 
                    unitPattern [#count "other" ! "{0} millilitres"]
                ] 
                unit [
                    #type "volume-gallon" 
                    displayName [! "US gallons"] 
                    unitPattern [#count "one" ! "{0} US gallon"] 
                    unitPattern [#count "other" ! "{0} US gallons"] 
                    perUnitPattern [! "{0} per US gallon"]
                ] 
                unit [
                    #type "volume-gallon-imperial" 
                    displayName [! "gallons"] 
                    unitPattern [#count "one" ! "{0} gallon"] 
                    unitPattern [#count "other" ! "{0} gallons"] 
                    perUnitPattern [! "{0} per gallon"]
                ] 
                unit [
                    #type "volume-quart" 
                    displayName [! "US quarts"] 
                    unitPattern [#count "one" ! "{0} US quart"] 
                    unitPattern [#count "other" ! "{0} US quarts"]
                ] 
                unit [
                    #type "volume-fluid-ounce" 
                    displayName [! "US fluid ounces"] 
                    unitPattern [#count "one" ! "{0} US fluid ounce"] 
                    unitPattern [#count "other" ! "{0} US fluid ounces"]
                ] 
                unit [
                    #type "volume-dessert-spoon" 
                    displayName [! "US dessertspoon"] 
                    unitPattern [#count "one" ! "{0} US dessertspoon"] 
                    unitPattern [#count "other" ! "{0} US dessertspoons"]
                ] 
                unit [
                    #type "volume-dessert-spoon-imperial" 
                    displayName [! "dessertspoon"] 
                    unitPattern [#count "one" ! "{0} dessertspoon"] 
                    unitPattern [#count "other" ! "{0} dessertspoons"]
                ] 
                unit [
                    #type "volume-quart-imperial" 
                    displayName [! "quart"] 
                    unitPattern [#count "one" ! "{0} quart"] 
                    unitPattern [#count "other" ! "{0} quarts"]
                ]
            ] 
            unitLength [
                #type "short" 
                unit [
                    #type "acceleration-meter-per-square-second" 
                    displayName [! "metres/sec²"]
                ] 
                unit [
                    #type "angle-revolution" 
                    unitPattern [#count "other" ! "{0} revs"]
                ] 
                unit [
                    #type "area-square-meter" 
                    displayName [! "metres²"]
                ] 
                unit [
                    #type "concentr-karat" 
                    displayName [! "carats"] 
                    unitPattern [#count "one" ! "{0} ct"] 
                    unitPattern [#count "other" ! "{0} ct"]
                ] 
                unit [
                    #type "concentr-milligram-ofglucose-per-deciliter" 
                    displayName [! "mg/dl"] 
                    unitPattern [#count "one" ! "{0} mg/dl"] 
                    unitPattern [#count "other" ! "{0} mg/dl"]
                ] 
                unit [
                    #type "concentr-millimole-per-liter" 
                    displayName [! "millimole/litre"] 
                    unitPattern [#count "one" ! "{0} mmol/l"] 
                    unitPattern [#count "other" ! "{0} mmol/l"]
                ] 
                unit [
                    #type "concentr-percent" 
                    displayName [#draft "contributed" ! "per cent"]
                ] 
                unit [
                    #type "concentr-permille" 
                    displayName [#draft "contributed" ! "per mille"]
                ] 
                unit [
                    #type "consumption-liter-per-kilometer" 
                    displayName [! "litres/km"] 
                    unitPattern [#count "one" ! "{0} l/km"] 
                    unitPattern [#count "other" ! "{0} l/km"]
                ] 
                unit [
                    #type "consumption-liter-per-100-kilometer" 
                    displayName [! "l/100 km"] 
                    unitPattern [#count "one" ! "{0} l/100 km"] 
                    unitPattern [#count "other" ! "{0} l/100 km"]
                ] 
                unit [
                    #type "consumption-mile-per-gallon" 
                    displayName [! "miles/US gal"] 
                    unitPattern [#count "one" ! "{0} mpg US"] 
                    unitPattern [#count "other" ! "{0} mpg US"]
                ] 
                unit [
                    #type "consumption-mile-per-gallon-imperial" 
                    displayName [! "miles/gal"] 
                    unitPattern [#count "one" ! "{0} mpg"] 
                    unitPattern [#count "other" ! "{0} mpg"]
                ] 
                unit [
                    #type "duration-hour" 
                    unitPattern [#count "one" ! "{0} hr"] 
                    unitPattern [#count "other" ! "{0} hrs"]
                ] 
                unit [
                    #type "duration-minute" 
                    unitPattern [#count "one" ! "{0} min"] 
                    unitPattern [#count "other" ! "{0} mins"]
                ] 
                unit [
                    #type "duration-second" 
                    unitPattern [#count "one" ! "{0} sec"] 
                    unitPattern [#count "other" ! "{0} secs"]
                ] 
                unit [
                    #type "graphics-dot" 
                    unitPattern [#count "one" ! "{0} dot"] 
                    unitPattern [#count "other" ! "{0} dots"]
                ] 
                unit [
                    #type "length-meter" 
                    displayName [! "metres"]
                ] 
                unit [
                    #type "length-micrometer" 
                    displayName [! "μmetres"]
                ] 
                unit [
                    #type "mass-stone" 
                    displayName [! "stone"]
                ] 
                unit [
                    #type "mass-carat" 
                    unitPattern [#count "one" ! "{0} ct"] 
                    unitPattern [#count "other" ! "{0} ct"]
                ] 
                unit [
                    #type "mass-grain" 
                    unitPattern [#count "one" ! "{0} grains"] 
                    unitPattern [#count "other" ! "{0} grains"]
                ] 
                unit [
                    #type "speed-meter-per-second" 
                    displayName [! "metres/sec"]
                ] 
                unit [
                    #type "volume-megaliter" 
                    displayName [! "Ml"] 
                    unitPattern [#count "one" ! "{0} Ml"] 
                    unitPattern [#count "other" ! "{0} Ml"]
                ] 
                unit [
                    #type "volume-hectoliter" 
                    displayName [! "hl"] 
                    unitPattern [#count "one" ! "{0} hl"] 
                    unitPattern [#count "other" ! "{0} hl"]
                ] 
                unit [
                    #type "volume-liter" 
                    displayName [! "litres"] 
                    unitPattern [#count "one" ! "{0} l"] 
                    unitPattern [#count "other" ! "{0} l"] 
                    perUnitPattern [! "{0}/l"]
                ] 
                unit [
                    #type "volume-deciliter" 
                    displayName [! "dl"] 
                    unitPattern [#count "one" ! "{0} dl"] 
                    unitPattern [#count "other" ! "{0} dl"]
                ] 
                unit [
                    #type "volume-centiliter" 
                    displayName [! "cl"] 
                    unitPattern [#count "one" ! "{0} cl"] 
                    unitPattern [#count "other" ! "{0} cl"]
                ] 
                unit [
                    #type "volume-milliliter" 
                    displayName [! "ml"] 
                    unitPattern [#count "one" ! "{0} ml"] 
                    unitPattern [#count "other" ! "{0} ml"]
                ] 
                unit [
                    #type "volume-gallon" 
                    displayName [! "US gal"] 
                    unitPattern [#count "one" ! "{0} US gal"] 
                    unitPattern [#count "other" ! "{0} US gal"] 
                    perUnitPattern [! "{0}/US gal"]
                ] 
                unit [
                    #type "volume-gallon-imperial" 
                    displayName [! "gal"] 
                    unitPattern [#count "one" ! "{0} gal"] 
                    unitPattern [#count "other" ! "{0} gal"] 
                    perUnitPattern [! "{0}/gal"]
                ] 
                unit [
                    #type "volume-quart" 
                    displayName [! "US qts"] 
                    unitPattern [#count "one" ! "{0} US qt"] 
                    unitPattern [#count "other" ! "{0} US qt"]
                ] 
                unit [
                    #type "volume-fluid-ounce" 
                    displayName [! "US fl oz"] 
                    unitPattern [#count "one" ! "{0} US fl oz"] 
                    unitPattern [#count "other" ! "{0} US fl oz"]
                ] 
                unit [
                    #type "volume-dessert-spoon" 
                    displayName [! "US dstspn"] 
                    unitPattern [#count "one" ! "{0} US dstspn"] 
                    unitPattern [#count "other" ! "{0} US dstspn"]
                ] 
                unit [
                    #type "volume-dessert-spoon-imperial" 
                    displayName [! "dstspn"] 
                    unitPattern [#count "one" ! "{0} dstspn"] 
                    unitPattern [#count "other" ! "{0} dstspn"]
                ] 
                unit [
                    #type "volume-drop" 
                    unitPattern [#count "one" ! "{0} drops"] 
                    unitPattern [#count "other" ! "{0} drops"]
                ] 
                unit [
                    #type "volume-dram" 
                    displayName [! "dram"] 
                    unitPattern [#count "one" ! "{0} dram"] 
                    unitPattern [#count "other" ! "{0} drams"]
                ] 
                unit [
                    #type "volume-jigger" 
                    unitPattern [#count "other" ! "{0} jiggers"]
                ] 
                unit [
                    #type "volume-pinch" 
                    unitPattern [#count "one" ! "{0} pinches"] 
                    unitPattern [#count "other" ! "{0} pinches"]
                ] 
                unit [
                    #type "volume-quart-imperial" 
                    displayName [! "qt"] 
                    unitPattern [#count "one" ! "{0} qt"] 
                    unitPattern [#count "other" ! "{0} qt"]
                ]
            ] 
            unitLength [
                #type "narrow" 
                unit [
                    #type "area-square-meter" 
                    displayName [#draft "contributed" ! "metres²"]
                ] 
                unit [
                    #type "concentr-karat" 
                    displayName [! "carat"] 
                    unitPattern [#count "one" ! "{0}ct"] 
                    unitPattern [#count "other" ! "{0}ct"]
                ] 
                unit [
                    #type "concentr-milligram-ofglucose-per-deciliter" 
                    displayName [! "mg/dl"] 
                    unitPattern [#count "one" ! "{0}mg/dl"] 
                    unitPattern [#count "other" ! "{0}mg/dl"]
                ] 
                unit [
                    #type "concentr-millimole-per-liter" 
                    displayName [! "mmol/l"] 
                    unitPattern [#count "one" ! "{0}mmol/l"] 
                    unitPattern [#count "other" ! "{0}mmol/l"]
                ] 
                unit [
                    #type "consumption-liter-per-kilometer" 
                    displayName [! "l/km"] 
                    unitPattern [#count "one" ! "{0}l/km"] 
                    unitPattern [#count "other" ! "{0}l/km"]
                ] 
                unit [
                    #type "consumption-liter-per-100-kilometer" 
                    displayName [! "l/100km"] 
                    unitPattern [#count "one" ! "{0}l/100km"] 
                    unitPattern [#count "other" ! "{0}l/100km"]
                ] 
                unit [
                    #type "consumption-mile-per-gallon" 
                    displayName [! "mpg US"] 
                    unitPattern [#count "one" ! "{0}mpgUS"] 
                    unitPattern [#count "other" ! "{0}mpgUS"]
                ] 
                unit [
                    #type "consumption-mile-per-gallon-imperial" 
                    displayName [! "mpg"] 
                    unitPattern [#count "one" ! "{0}mpg"] 
                    unitPattern [#count "other" ! "{0}mpg"]
                ] 
                unit [
                    #type "length-meter" 
                    displayName [! "metre"]
                ] 
                unit [
                    #type "mass-pound" 
                    unitPattern [#count "one" ! "{0}lb"] 
                    unitPattern [#count "other" ! "{0}lb"]
                ] 
                unit [
                    #type "speed-kilometer-per-hour" 
                    displayName [! "km/h"]
                ] 
                unit [
                    #type "speed-mile-per-hour" 
                    displayName [! "mph"]
                ] 
                unit [
                    #type "temperature-celsius" 
                    unitPattern [#count "one" ! "{0}°"] 
                    unitPattern [#count "other" ! "{0}°"]
                ] 
                unit [
                    #type "temperature-fahrenheit" 
                    unitPattern [#count "one" ! "{0}°F"] 
                    unitPattern [#count "other" ! "{0}°F"]
                ] 
                unit [
                    #type "volume-megaliter" 
                    displayName [! "Ml"] 
                    unitPattern [#count "one" ! "{0}Ml"] 
                    unitPattern [#count "other" ! "{0}Ml"]
                ] 
                unit [
                    #type "volume-hectoliter" 
                    displayName [! "hl"] 
                    unitPattern [#count "one" ! "{0}hl"] 
                    unitPattern [#count "other" ! "{0}hl"]
                ] 
                unit [
                    #type "volume-liter" 
                    displayName [! "litre"] 
                    unitPattern [#count "one" ! "{0}l"] 
                    unitPattern [#count "other" ! "{0}l"] 
                    perUnitPattern [! "{0}/l"]
                ] 
                unit [
                    #type "volume-deciliter" 
                    displayName [! "dl"] 
                    unitPattern [#count "one" ! "{0}dl"] 
                    unitPattern [#count "other" ! "{0}dl"]
                ] 
                unit [
                    #type "volume-centiliter" 
                    displayName [! "cl"] 
                    unitPattern [#count "one" ! "{0}cl"] 
                    unitPattern [#count "other" ! "{0}cl"]
                ] 
                unit [
                    #type "volume-milliliter" 
                    displayName [! "ml"] 
                    unitPattern [#count "one" ! "{0}ml"] 
                    unitPattern [#count "other" ! "{0}ml"]
                ] 
                unit [
                    #type "volume-gallon" 
                    displayName [! "US gal"] 
                    unitPattern [#count "one" ! "{0}galUS"] 
                    unitPattern [#count "other" ! "{0}galUS"] 
                    perUnitPattern [! "{0}/galUS"]
                ] 
                unit [
                    #type "volume-gallon-imperial" 
                    displayName [! "gal"] 
                    unitPattern [#count "one" ! "{0}gal"] 
                    unitPattern [#count "other" ! "{0}gal"] 
                    perUnitPattern [! "{0}/gal"]
                ] 
                unit [
                    #type "volume-fluid-ounce-imperial" 
                    displayName [! "fl oz"] 
                    unitPattern [#count "one" ! "{0}fl oz"] 
                    unitPattern [#count "other" ! "{0}fl oz"]
                ] 
                unit [
                    #type "volume-dessert-spoon" 
                    displayName [! "US dsp"] 
                    unitPattern [#count "one" ! "{0}US dsp"] 
                    unitPattern [#count "other" ! "{0}US dsp"]
                ] 
                unit [
                    #type "volume-dessert-spoon-imperial" 
                    displayName [! "dsp"] 
                    unitPattern [#count "one" ! "{0}dsp"] 
                    unitPattern [#count "other" ! "{0}dsp"]
                ] 
                unit [
                    #type "volume-jigger" 
                    unitPattern [#count "other" ! "{0}jiggers"]
                ] 
                unit [
                    #type "volume-quart-imperial" 
                    displayName [! "qt"] 
                    unitPattern [#count "one" ! "{0}qt"] 
                    unitPattern [#count "other" ! "{0}qt"]
                ]
            ]
        ] 
        listPatterns [
            listPattern [
                listPatternPart [#type "end" ! "{0} and {1}"]
            ] 
            listPattern [
                #type "or" 
                listPatternPart [#type "end" ! "{0} or {1}"]
            ] 
            listPattern [
                #type "or-narrow" 
                listPatternPart [#type "end" #draft "contributed" ! "{0} or {1}"]
            ] 
            listPattern [
                #type "or-short" 
                listPatternPart [#type "end" #draft "contributed" ! "{0} or {1}"]
            ] 
            listPattern [
                #type "standard-short" 
                listPatternPart [#type "end" ! "{0} and {1}"] 
                listPatternPart [#type "2" ! "{0} and {1}"]
            ]
        ] 
        characterLabels [
            characterLabelPattern [#type "all" ! "{0} – all"] 
            characterLabelPattern [#type "compatibility" ! "{0} – compatibility"] 
            characterLabelPattern [#type "enclosed" ! "{0} – enclosed"] 
            characterLabelPattern [#type "extended" ! "{0} – extended"] 
            characterLabelPattern [#type "historic" ! "{0} – historic"] 
            characterLabelPattern [#type "miscellaneous" ! "{0} – miscellaneous"] 
            characterLabelPattern [#type "other" ! "{0} – other"] 
            characterLabelPattern [#type "scripts" ! "scripts – {0}"] 
            characterLabel [#type "math_symbols" ! "maths symbol"]
        ]
    ]

