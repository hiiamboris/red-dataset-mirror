
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "en"] 
            territory [#type "IN"]
        ] 
        localeDisplayNames [
            languages [
                language [#type "bn" ! "Bengali"] 
                language [#type "ro_MD" ! "Moldavian"]
            ] 
            scripts [
                script [#type "Beng" ! "Bengali"] 
                script [#type "Orya" ! "Oriya"]
            ] 
            types [
                type [#key "numbers" #type "beng" ! "Bengali Digits"] 
                type [#key "numbers" #type "orya" ! "Oriya Digits"]
            ]
        ] 
        dates [
            calendars [
                calendar [
                    #type "generic" 
                    dateFormats [
                        dateFormatLength [
                            #type "full" 
                            dateFormat [
                                pattern [! "EEEE, d MMMM, y G"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "long" 
                            dateFormat [
                                pattern [! "d MMMM, y G"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "medium" 
                            dateFormat [
                                pattern [! "d MMM, y G"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "d/M/y/ GGGGG"] 
                                datetimeSkeleton [! "GGGGGyMd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        dateTimeFormatLength [
                            #type "full" 
                            dateTimeFormat [
                                pattern [! "{1} 'at' {0}"]
                            ]
                        ] 
                        dateTimeFormatLength [
                            #type "long" 
                            dateTimeFormat [
                                pattern [! "{1} 'at' {0}"]
                            ]
                        ] 
                        dateTimeFormatLength [
                            #type "medium" 
                            dateTimeFormat [
                                pattern [! "{1}, {0}"]
                            ]
                        ] 
                        dateTimeFormatLength [
                            #type "short" 
                            dateTimeFormat [
                                pattern [! "{1}, {0}"]
                            ]
                        ] 
                        availableFormats [
                            dateFormatItem [#id "GyMMM" ! "MMM, y G"] 
                            dateFormatItem [#id "GyMMMd" ! "d MMM, y G"] 
                            dateFormatItem [#id "GyMMMEd" ! "E, d MMM, y G"] 
                            dateFormatItem [#id "Md" ! "d/M"] 
                            dateFormatItem [#id "MEd" ! "E, d/M"] 
                            dateFormatItem [#id "yyyyM" ! "M/y GGGGG"] 
                            dateFormatItem [#id "yyyyMd" ! "d/M/y G"] 
                            dateFormatItem [#id "yyyyMEd" ! "E, d/M/y GGGGG"] 
                            dateFormatItem [#id "yyyyMMM" ! "MMM, y G"] 
                            dateFormatItem [#id "yyyyMMMd" ! "d MMM, y G"] 
                            dateFormatItem [#id "yyyyMMMEd" ! "E, d MMM, y G"] 
                            dateFormatItem [#id "yyyyMMMM" ! "MMMM, y G"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "GyMd" 
                                greatestDifference [#id "d" ! "d/M/y – d/M/y GGGGG"] 
                                greatestDifference [#id "G" ! "d/M/y GGGGG – d/M/y GGGGG"] 
                                greatestDifference [#id "M" ! "d/M/y – d/M/y GGGGG"] 
                                greatestDifference [#id "y" ! "d/M/y – d/M/y GGGGG"]
                            ] 
                            intervalFormatItem [
                                #id "GyMEd" 
                                greatestDifference [#id "d" ! "E, d/M/y – E, d/M/y GGGGG"] 
                                greatestDifference [#id "G" ! "E, d/M/y GGGGG – E, d/M/y GGGGG"] 
                                greatestDifference [#id "M" ! "E, d/M/y – E, d/M/y GGGGG"] 
                                greatestDifference [#id "y" ! "E, d/M/y – E, d/M/y GGGGG"]
                            ] 
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" ! "d/M – d/M"] 
                                greatestDifference [#id "M" ! "d/M – d/M"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" ! "E, dd/MM – E, dd/MM"] 
                                greatestDifference [#id "M" ! "E, dd/MM – E, dd/MM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" ! "E, d – E, d MMM"] 
                                greatestDifference [#id "M" ! "E, d MMM – E, d MMM"]
                            ] 
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" ! "MM/y – MM/y G"] 
                                greatestDifference [#id "y" ! "MM/y – MM/y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" ! "dd/MM/y – dd/MM/y G"] 
                                greatestDifference [#id "M" ! "dd/MM/y – dd/MM/y G"] 
                                greatestDifference [#id "y" ! "dd/MM/y – dd/MM/y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" ! "E, dd/MM/y – E, dd/MM/y G"] 
                                greatestDifference [#id "M" ! "E, dd/MM/y – E, dd/MM/y G"] 
                                greatestDifference [#id "y" ! "E, dd/MM/y – E, dd/MM/y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" ! "E d – E d MMM y G"] 
                                greatestDifference [#id "M" ! "E d MMM – E d MMM y G"] 
                                greatestDifference [#id "y" ! "E d MMM y – E d MMM y G"]
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
                                pattern [! "EEEE, d MMMM, y"]
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
                                pattern [! "dd-MMM-y"] 
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
                    timeFormats [
                        timeFormatLength [
                            #type "full" 
                            timeFormat [
                                pattern [! "h:mm:ss a zzzz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "long" 
                            timeFormat [
                                pattern [! "h:mm:ss a z"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "medium" 
                            timeFormat [
                                pattern [! "h:mm:ss a"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "short" 
                            timeFormat [
                                pattern [! "h:mm a"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        dateTimeFormatLength [
                            #type "full" 
                            dateTimeFormat [
                                pattern [! "{1} 'at' {0}"]
                            ]
                        ] 
                        dateTimeFormatLength [
                            #type "long" 
                            dateTimeFormat [
                                pattern [! "{1} 'at' {0}"]
                            ]
                        ] 
                        dateTimeFormatLength [
                            #type "medium" 
                            dateTimeFormat [
                                pattern [! "{1}, {0}"]
                            ]
                        ] 
                        dateTimeFormatLength [
                            #type "short" 
                            dateTimeFormat [
                                pattern [! "{1}, {0}"]
                            ]
                        ] 
                        availableFormats [
                            dateFormatItem [#id "Ehm" ! "E, h:mm a"] 
                            dateFormatItem [#id "EHm" ! "E, HH:mm"] 
                            dateFormatItem [#id "Ehms" ! "E, h:mm:ss a"] 
                            dateFormatItem [#id "EHms" ! "E, HH:mm:ss"] 
                            dateFormatItem [#id "yMd" ! "d/M/y"] 
                            dateFormatItem [#id "yMEd" ! "E, d/M/y"] 
                            dateFormatItem [#id "yMMMEd" ! "E, d MMM, y"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" ! "E, dd/MM – E, dd/MM"] 
                                greatestDifference [#id "M" ! "E, dd/MM – E, dd/MM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" ! "E, d – E, d MMM"] 
                                greatestDifference [#id "M" ! "E, d MMM – E, d MMM"]
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
                                pattern [! "EEEE d MMMM y G"] 
                                datetimeSkeleton [! "GyMMMMEEEEd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "long" 
                            dateFormat [
                                pattern [! "d MMMM, y G"] 
                                datetimeSkeleton [! "GyMMMMd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "medium" 
                            dateFormat [
                                pattern [! "dd-MMM-y G"] 
                                datetimeSkeleton [! "GyMMMdd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "d/M/y/ GGGGG"] 
                                datetimeSkeleton [! "GGGGGyMd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "GyMMM" ! "MMM, y G"] 
                            dateFormatItem [#id "GyMMMd" ! "d MMM, y G"] 
                            dateFormatItem [#id "GyMMMEd" ! "E, d MMM, y G"] 
                            dateFormatItem [#id "Md" ! "d/M"] 
                            dateFormatItem [#id "MEd" ! "E, d/M"] 
                            dateFormatItem [#id "yyyyM" ! "M/y GGGGG"] 
                            dateFormatItem [#id "yyyyMd" ! "d/M/y G"] 
                            dateFormatItem [#id "yyyyMEd" ! "E d/M/y G"] 
                            dateFormatItem [#id "yyyyMMM" ! "MMM, y G"] 
                            dateFormatItem [#id "yyyyMMMd" ! "d MMM, y G"] 
                            dateFormatItem [#id "yyyyMMMEd" ! "E, d MMM, y G"] 
                            dateFormatItem [#id "yyyyMMMM" ! "MMMM, y G"]
                        ]
                    ]
                ]
            ] 
            fields [
                field [
                    #type "dayperiod" 
                    displayName [! "AM/PM"]
                ]
            ] 
            timeZoneNames [
                zone [
                    #type "Asia/Rangoon" 
                    exemplarCity [! "Rangoon"]
                ] 
                metazone [
                    #type "India" 
                    short [
                        standard [! "IST"]
                    ]
                ]
            ]
        ] 
        numbers [
            decimalFormats [
                #numberSystem "latn" 
                decimalFormatLength [
                    decimalFormat [
                        pattern [! "#,##,##0.###"]
                    ]
                ] 
                decimalFormatLength [
                    #type "short" 
                    decimalFormat [
                        pattern [#type "1000" #count "one" ! "0T"] 
                        pattern [#type "1000" #count "other" ! "0T"] 
                        pattern [#type "10000" #count "one" ! "00T"] 
                        pattern [#type "10000" #count "other" ! "00T"] 
                        pattern [#type "100000" #count "one" ! "0L"] 
                        pattern [#type "100000" #count "other" ! "0L"] 
                        pattern [#type "1000000" #count "one" ! "00L"] 
                        pattern [#type "1000000" #count "other" ! "00L"] 
                        pattern [#type "10000000" #count "one" ! "0Cr"] 
                        pattern [#type "10000000" #count "other" ! "0Cr"] 
                        pattern [#type "100000000" #count "one" ! "00Cr"] 
                        pattern [#type "100000000" #count "other" ! "00Cr"] 
                        pattern [#type "1000000000" #count "one" ! "000Cr"] 
                        pattern [#type "1000000000" #count "other" ! "000Cr"] 
                        pattern [#type "10000000000" #count "one" ! "0TCr"] 
                        pattern [#type "10000000000" #count "other" ! "0TCr"] 
                        pattern [#type "100000000000" #count "one" ! "00TCr"] 
                        pattern [#type "100000000000" #count "other" ! "00TCr"] 
                        pattern [#type "1000000000000" #count "one" ! "0LCr"] 
                        pattern [#type "1000000000000" #count "other" ! "0LCr"] 
                        pattern [#type "10000000000000" #count "one" ! "00LCr"] 
                        pattern [#type "10000000000000" #count "other" ! "00LCr"] 
                        pattern [#type "100000000000000" #count "one" ! "000LCr"] 
                        pattern [#type "100000000000000" #count "other" ! "000LCr"]
                    ]
                ]
            ] 
            percentFormats [
                #numberSystem "latn" 
                percentFormatLength [
                    percentFormat [
                        pattern [! "#,##,##0%"]
                    ]
                ]
            ] 
            currencyFormats [
                #numberSystem "latn" 
                currencyFormatLength [
                    currencyFormat [
                        #type "standard" 
                        pattern [! "¤#,##,##0.00"]
                    ]
                ] 
                currencyFormatLength [
                    #type "short" 
                    currencyFormat [
                        #type "standard" 
                        pattern [#type "1000" #count "one" ! "¤0T"] 
                        pattern [#type "1000" #count "other" ! "¤0T"] 
                        pattern [#type "10000" #count "one" ! "¤00T"] 
                        pattern [#type "10000" #count "other" ! "¤00T"] 
                        pattern [#type "100000" #count "one" ! "¤0L"] 
                        pattern [#type "100000" #count "other" ! "¤0L"] 
                        pattern [#type "1000000" #count "one" ! "¤00L"] 
                        pattern [#type "1000000" #count "other" ! "¤00L"] 
                        pattern [#type "10000000" #count "one" ! "¤0Cr"] 
                        pattern [#type "10000000" #count "other" ! "¤0Cr"] 
                        pattern [#type "100000000" #count "one" ! "¤00Cr"] 
                        pattern [#type "100000000" #count "other" ! "¤00Cr"] 
                        pattern [#type "1000000000" #count "one" ! "¤000Cr"] 
                        pattern [#type "1000000000" #count "other" ! "¤000Cr"] 
                        pattern [#type "10000000000" #count "one" ! "¤0TCr"] 
                        pattern [#type "10000000000" #count "other" ! "¤0TCr"] 
                        pattern [#type "100000000000" #count "one" ! "¤00TCr"] 
                        pattern [#type "100000000000" #count "other" ! "¤00TCr"] 
                        pattern [#type "1000000000000" #count "one" ! "¤0LCr"] 
                        pattern [#type "1000000000000" #count "other" ! "¤0LCr"] 
                        pattern [#type "10000000000000" #count "one" ! "¤00LCr"] 
                        pattern [#type "10000000000000" #count "other" ! "¤00LCr"] 
                        pattern [#type "100000000000000" #count "one" ! "¤000LCr"] 
                        pattern [#type "100000000000000" #count "other" ! "¤000LCr"]
                    ]
                ]
            ] 
            currencies [
                currency [
                    #type "USD" 
                    symbol [! "$"]
                ] 
                currency [
                    #type "VEF" 
                    displayName [! "Venezuelan Bolívar"] 
                    displayName [#count "one" ! "Venezuelan bolívar"] 
                    displayName [#count "other" ! "Venezuelan bolívars"]
                ] 
                currency [
                    #type "VES" 
                    displayName [! "VES"] 
                    displayName [#count "one" ! "VES"] 
                    displayName [#count "other" ! "VES"]
                ]
            ] 
            miscPatterns [
                #numberSystem "latn" 
                pattern [#type "range" ! "{0}–{1}"]
            ]
        ] 
        units [
            unitLength [
                #type "long" 
                unit [
                    #type "temperature-generic" 
                    displayName [! "°"] 
                    unitPattern [#count "one" ! "{0}°"] 
                    unitPattern [#count "other" ! "{0}°"]
                ]
            ] 
            unitLength [
                #type "short" 
                unit [
                    #type "speed-kilometer-per-hour" 
                    unitPattern [#count "one" ! "{0} kph"] 
                    unitPattern [#count "other" ! "{0} kph"]
                ] 
                unit [
                    #type "temperature-generic" 
                    displayName [! "°"] 
                    unitPattern [#count "one" ! "{0}°"] 
                    unitPattern [#count "other" ! "{0}°"]
                ] 
                unit [
                    #type "volume-cubic-centimeter" 
                    perUnitPattern [! "{0}/cm³"]
                ]
            ] 
            unitLength [
                #type "narrow" 
                unit [
                    #type "speed-kilometer-per-hour" 
                    unitPattern [#count "one" ! "{0}kph"] 
                    unitPattern [#count "other" ! "{0}kph"]
                ]
            ]
        ] 
        listPatterns [
            listPattern [
                #type "standard-narrow" 
                listPatternPart [#type "end" ! "{0}, and {1}"]
            ]
        ]
    ]

