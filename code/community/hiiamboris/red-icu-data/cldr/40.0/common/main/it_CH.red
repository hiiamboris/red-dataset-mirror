
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "it"] 
            territory [#type "CH"]
        ] 
        characters [
            exemplarCharacters [#type "numbers" ! "[\- ‑ . ’ % ‰ + 0 1 2 3 4 5 6 7 8 9]"]
        ] 
        delimiters [
            alternateQuotationStart [#draft "unconfirmed" ! "‹"] 
            alternateQuotationEnd [#draft "unconfirmed" ! "›"]
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
                            #type "long" 
                            dateFormat [
                                pattern [! "d MMMM y G"] 
                                datetimeSkeleton [! "GyMMMMd"]
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
                                pattern [! "dd.MM.yy GGGGG"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "hhmm" #draft "unconfirmed" ! "hh:mm a"] 
                            dateFormatItem [#id "HHmm" #draft "unconfirmed" ! "HH:mm"] 
                            dateFormatItem [#id "hhmmss" #draft "unconfirmed" ! "hh:mm:ss a"] 
                            dateFormatItem [#id "HHmmss" #draft "unconfirmed" ! "HH:mm:ss"] 
                            dateFormatItem [#id "MMdd" #draft "unconfirmed" ! "dd.MM"] 
                            dateFormatItem [#id "yMM" #draft "unconfirmed" ! "MM.y GGGGG"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "dd.MM – dd.MM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "dd.MM – dd.MM"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E, dd.MM – E, dd.MM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E, dd.MM – E, dd.MM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "d–d MMM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "d MMM – d MMM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E, d – E, d MMM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E, d MMM – E, d MMM"]
                            ] 
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "MM.y – MM.y G"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "MM.y – MM.y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "dd.MM.y – dd.MM.y G"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "dd.MM.y – dd.MM.y G"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "dd.MM.y – dd.MM.y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E, dd.MM.y – E, dd.MM.y G"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E, dd.MM.y – E, dd.MM.y G"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E, dd.MM.y – E, dd.MM.y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "d–d MMM y G"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "d MMM – d MMM y G"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "d MMM y – d MMM y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E, d – E, d MMM y G"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E, d MMM – E, d MMM y G"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E, d MMM y – E, d MMM y G"]
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
                                pattern [! "EEEE, d MMMM y"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "dd.MM.yy"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "hhmm" #draft "unconfirmed" ! "hh:mm a"] 
                            dateFormatItem [#id "HHmm" #draft "unconfirmed" ! "HH:mm"] 
                            dateFormatItem [#id "hhmmss" #draft "unconfirmed" ! "hh:mm:ss a"] 
                            dateFormatItem [#id "HHmmss" #draft "unconfirmed" ! "HH:mm:ss"] 
                            dateFormatItem [#id "MMdd" #draft "unconfirmed" ! "dd.MM"] 
                            dateFormatItem [#id "yMM" #draft "unconfirmed" ! "MM.y"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "dd.MM – dd.MM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "dd.MM – dd.MM"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E, dd.MM – E, dd.MM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E, dd.MM – E, dd.MM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "d–d MMM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "d MMM – d MMM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E, d – E, d MMM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E, d MMM – E, d MMM"]
                            ] 
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "MM.y – MM.y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "MM.y – MM.y"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "dd.MM.y – dd.MM.y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "dd.MM.y – dd.MM.y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "dd.MM.y – dd.MM.y"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E, dd.MM.y – E, dd.MM.y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E, dd.MM.y – E, dd.MM.y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E, dd.MM.y – E, dd.MM.y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "d–d MMM y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "d MMM – d MMM y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "d MMM y – d MMM y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E, d – E, d MMM y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E, d MMM – E, d MMM y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E, d MMM y – E, d MMM y"]
                            ]
                        ]
                    ]
                ]
            ]
        ] 
        numbers [
            symbols [
                #numberSystem "latn" 
                decimal [! "."] 
                group [! "’"]
            ] 
            currencyFormats [
                #numberSystem "latn" 
                currencyFormatLength [
                    currencyFormat [
                        #type "standard" 
                        pattern [! "¤ #,##0.00;¤-#,##0.00"]
                    ]
                ]
            ]
        ]
    ]

