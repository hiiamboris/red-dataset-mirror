
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "es"] 
            territory [#type "CL"]
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
                territory [#type "EH" ! "Sahara Occidental"] 
                territory [#type "GB" #alt "short" #draft "contributed" ! "RU"] 
                territory [#type "PS" #draft "unconfirmed" ! "Territorio Palestino"] 
                territory [#type "TA" #draft "contributed" ! "Tristán de Acuña"] 
                territory [#type "UM" #draft "contributed" ! "Islas menores alejadas de EE. UU."]
            ] 
            keys [
                key [#type "currency" #draft "unconfirmed" ! "divisa"]
            ] 
            types [
                type [#key "collation" #type "phonebook" ! "orden de directorio telefónico"]
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
                                pattern [! "dd-MM-y G"] 
                                datetimeSkeleton [! "GyMMdd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "dd-MM-y GGGGG"] 
                                datetimeSkeleton [! "GGGGGyMMdd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "Md" ! "dd-MM"] 
                            dateFormatItem [#id "MEd" ! "E, dd-MM"] 
                            dateFormatItem [#id "yyyyM" ! "MM-y G"] 
                            dateFormatItem [#id "yyyyMd" ! "dd-MM-y G"] 
                            dateFormatItem [#id "yyyyMEd" ! "E dd-MM-y G"]
                        ] 
                        intervalFormats [
                            intervalFormatFallback [#draft "contributed" ! "{0} a el {1}"] 
                            intervalFormatItem [
                                #id "H" 
                                greatestDifference [#id "H" #draft "unconfirmed" ! "H–H"]
                            ] 
                            intervalFormatItem [
                                #id "hm" 
                                greatestDifference [#id "h" #draft "unconfirmed" ! "h:mm–h:mm a"] 
                                greatestDifference [#id "m" #draft "unconfirmed" ! "h:mm–h:mm a"]
                            ] 
                            intervalFormatItem [
                                #id "Hm" 
                                greatestDifference [#id "H" #draft "unconfirmed" ! "H:mm–H:mm"] 
                                greatestDifference [#id "m" #draft "unconfirmed" ! "H:mm–H:mm"]
                            ] 
                            intervalFormatItem [
                                #id "hmv" 
                                greatestDifference [#id "h" #draft "unconfirmed" ! "h:mm–h:mm a v"] 
                                greatestDifference [#id "m" #draft "unconfirmed" ! "h:mm–h:mm a v"]
                            ] 
                            intervalFormatItem [
                                #id "Hmv" 
                                greatestDifference [#id "H" #draft "unconfirmed" ! "H:mm–H:mm v"] 
                                greatestDifference [#id "m" #draft "unconfirmed" ! "H:mm–H:mm v"]
                            ] 
                            intervalFormatItem [
                                #id "Hv" 
                                greatestDifference [#id "H" #draft "unconfirmed" ! "H–H v"]
                            ] 
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" #draft "contributed" ! "dd-MM – dd-MM"] 
                                greatestDifference [#id "M" #draft "contributed" ! "dd-MM – dd-MM"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "E dd-MM – E dd-MM"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E dd-MM – E dd-MM"]
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
                                #id "yM" 
                                greatestDifference [#id "M" #draft "contributed" ! "MM-y – MM-y G"] 
                                greatestDifference [#id "y" #draft "contributed" ! "MM-y – MM-y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" #draft "contributed" ! "dd-MM-y – dd-MM-y G"] 
                                greatestDifference [#id "M" #draft "contributed" ! "dd-MM-y – dd-MM-y G"] 
                                greatestDifference [#id "y" #draft "contributed" ! "dd-MM-y – dd-MM-y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "E dd-MM-y – E dd-MM-y G"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E dd-MM-y – E dd-MM-y G"] 
                                greatestDifference [#id "y" #draft "contributed" ! "E dd-MM-y – E dd-MM-y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMMM" 
                                greatestDifference [#id "y" #draft "contributed" ! "MMM 'de' y 'a' MMM 'de' y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMd" 
                                greatestDifference [#id "M" #draft "contributed" ! "d 'de' MMM 'al' d 'de' MMM 'de' y G"] 
                                greatestDifference [#id "y" #draft "contributed" ! "d 'de' MMM 'de' y 'al' d 'de' MMM 'de' y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "E d 'al' E d 'de' MMM 'de' y G"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E d 'de' MMM 'al' E d 'de' MMM 'de' y G"] 
                                greatestDifference [#id "y" #draft "contributed" ! "E d 'de' MMM 'de' y 'al' E d 'de' MMM 'de' y G"]
                            ]
                        ]
                    ]
                ] 
                calendar [
                    #type "gregorian" 
                    months [
                        monthContext [
                            #type "stand-alone" 
                            monthWidth [
                                #type "abbreviated" 
                                month [#type "1" #draft "contributed" ! "ene."] 
                                month [#type "2" #draft "contributed" ! "feb."] 
                                month [#type "3" #draft "contributed" ! "mar."] 
                                month [#type "4" #draft "contributed" ! "abr."] 
                                month [#type "5" #draft "contributed" ! "may."] 
                                month [#type "6" #draft "contributed" ! "jun."] 
                                month [#type "7" #draft "contributed" ! "jul."] 
                                month [#type "8" #draft "contributed" ! "ago."] 
                                month [#type "9" #draft "contributed" ! "sept."] 
                                month [#type "10" #draft "contributed" ! "oct."] 
                                month [#type "11" #draft "contributed" ! "nov."] 
                                month [#type "12" #draft "contributed" ! "dic."]
                            ]
                        ]
                    ] 
                    days [
                        dayContext [
                            #type "format" 
                            dayWidth [
                                #type "short" 
                                day [#type "sun" #draft "contributed" ! "do"] 
                                day [#type "mon" #draft "contributed" ! "lu"] 
                                day [#type "tue" #draft "contributed" ! "ma"] 
                                day [#type "wed" #draft "contributed" ! "mi"] 
                                day [#type "thu" #draft "contributed" ! "ju"] 
                                day [#type "fri" #draft "contributed" ! "vi"] 
                                day [#type "sat" #draft "contributed" ! "sá"]
                            ]
                        ]
                    ] 
                    quarters [
                        quarterContext [
                            #type "stand-alone" 
                            quarterWidth [
                                #type "wide" 
                                quarter [#type "1" ! "1.° trimestre"] 
                                quarter [#type "2" ! "2.° trimestre"] 
                                quarter [#type "3" ! "3.° trimestre"] 
                                quarter [#type "4" ! "4.º trimestre"]
                            ]
                        ]
                    ] 
                    dateFormats [
                        dateFormatLength [
                            #type "medium" 
                            dateFormat [
                                pattern [! "dd-MM-y"] 
                                datetimeSkeleton [! "yMMdd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "dd-MM-yy"] 
                                datetimeSkeleton [! "yyMMdd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "GyMMMd" #draft "contributed" ! "d MMM y G"] 
                            dateFormatItem [#id "Md" ! "dd-MM"] 
                            dateFormatItem [#id "MEd" ! "E, dd-MM"] 
                            dateFormatItem [#id "yM" ! "MM-y"] 
                            dateFormatItem [#id "yMd" ! "dd-MM-y"] 
                            dateFormatItem [#id "yMEd" ! "E dd-MM-y"]
                        ] 
                        intervalFormats [
                            intervalFormatFallback [#draft "contributed" ! "{0} a el {1}"] 
                            intervalFormatItem [
                                #id "hm" 
                                greatestDifference [#id "h" #draft "contributed" ! "h:mm–h:mm a"] 
                                greatestDifference [#id "m" #draft "contributed" ! "h:mm–h:mm a"]
                            ] 
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" #draft "contributed" ! "dd-MM – dd-MM"] 
                                greatestDifference [#id "M" #draft "contributed" ! "dd-MM – dd-MM"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "E dd-MM – E dd-MM"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E dd-MM – E dd-MM"]
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
                                #id "yM" 
                                greatestDifference [#id "M" #draft "contributed" ! "MM-y – MM-y"] 
                                greatestDifference [#id "y" #draft "contributed" ! "MM-y – MM-y"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" #draft "contributed" ! "dd-MM-y – dd-MM-y"] 
                                greatestDifference [#id "M" #draft "contributed" ! "dd-MM-y – dd-MM-y"] 
                                greatestDifference [#id "y" #draft "contributed" ! "dd-MM-y – dd-MM-y"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "E dd-MM-y – E dd-MM-y"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E dd-MM-y – E dd-MM-y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E dd-MM-y – E dd-MM-y"]
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
            timeZoneNames [
                metazone [
                    #type "Chile" 
                    short [
                        generic [! "CLT"] 
                        standard [! "CLT"] 
                        daylight [! "CLST"]
                    ]
                ]
            ]
        ] 
        numbers [
            symbols [
                #numberSystem "latn" 
                decimal [! ","] 
                group [! "."]
            ] 
            currencyFormats [
                #numberSystem "latn" 
                currencyFormatLength [
                    currencyFormat [
                        #type "standard" 
                        pattern [! "¤#,##0.00;¤-#,##0.00"]
                    ]
                ]
            ] 
            currencies [
                currency [
                    #type "CLP" 
                    displayName [#draft "contributed" ! "Peso chileno"] 
                    symbol [! "$"]
                ] 
                currency [
                    #type "USD" 
                    symbol [! "US$"]
                ]
            ]
        ] 
        units [
            unitLength [
                #type "long" 
                unit [
                    #type "electric-ampere" 
                    displayName [#draft "contributed" ! "amperios"] 
                    unitPattern [#count "one" #draft "contributed" ! "{0} amperio"] 
                    unitPattern [#count "other" #draft "contributed" ! "{0} amperios"]
                ] 
                unit [
                    #type "electric-milliampere" 
                    displayName [#draft "contributed" ! "miliamperios"] 
                    unitPattern [#count "one" #draft "contributed" ! "{0} miliamperio"] 
                    unitPattern [#count "other" #draft "contributed" ! "{0} miliamperios"]
                ] 
                unit [
                    #type "electric-ohm" 
                    unitPattern [#count "one" ! "{0} ohmio"] 
                    unitPattern [#count "other" ! "{0} ohmios"]
                ]
            ] 
            unitLength [
                #type "short" 
                unit [
                    #type "electric-volt" 
                    displayName [#draft "contributed" ! "voltios"]
                ] 
                unit [
                    #type "power-watt" 
                    displayName [#draft "contributed" ! "vatios"]
                ]
            ] 
            durationUnit [
                #type "hms" 
                durationUnitPattern [#draft "contributed" ! "hh:mm:ss"]
            ] 
            durationUnit [
                #type "ms" 
                durationUnitPattern [#draft "contributed" ! "mm:ss"]
            ]
        ]
    ]

