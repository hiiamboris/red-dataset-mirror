
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "es"] 
            territory [#type "GT"]
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
                                pattern [! "d/MM/y G"] 
                                datetimeSkeleton [! "GyMMd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "d/MM/yy GGGGG"] 
                                datetimeSkeleton [! "GGGGGyyMMd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
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
                                #id "Md" 
                                greatestDifference [#id "d" #draft "contributed" ! "d/MM – d/MM"] 
                                greatestDifference [#id "M" #draft "contributed" ! "d/MM – d/MM"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "E d/MM – E d/MM"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E d/MM – E d/MM"]
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
                                greatestDifference [#id "M" #draft "contributed" ! "MM/y – MM/y"] 
                                greatestDifference [#id "y" #draft "contributed" ! "MM/y – MM/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" #draft "contributed" ! "d/MM/y – d/MM/y"] 
                                greatestDifference [#id "M" #draft "contributed" ! "d/MM/y – d/MM/y"] 
                                greatestDifference [#id "y" #draft "contributed" ! "d/MM/y – d/MM/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "E d/MM/y – E d/MM/y"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E d/MM/y – E d/MM/y"] 
                                greatestDifference [#id "y" #draft "contributed" ! "E d/MM/y – E d/MM/y"]
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
                        intervalFormats [
                            intervalFormatItem [
                                #id "hm" 
                                greatestDifference [#id "h" #draft "contributed" ! "h:mm–h:mm a"] 
                                greatestDifference [#id "m" #draft "contributed" ! "h:mm–h:mm a"]
                            ] 
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" #draft "contributed" ! "d/MM – d/MM"] 
                                greatestDifference [#id "M" #draft "contributed" ! "d/MM – d/MM"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "E d/MM – E d/MM"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E d/MM – E d/MM"]
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
                                greatestDifference [#id "y" #draft "contributed" ! "y 'al' y"]
                            ] 
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" #draft "contributed" ! "MM/y – MM/y"] 
                                greatestDifference [#id "y" #draft "contributed" ! "MM/y – MM/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" #draft "contributed" ! "d/MM/y – d/MM/y"] 
                                greatestDifference [#id "M" #draft "contributed" ! "d/MM/y – d/MM/y"] 
                                greatestDifference [#id "y" #draft "contributed" ! "d/MM/y – d/MM/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "E d/MM/y – E d/MM/y"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E d/MM/y – E d/MM/y"] 
                                greatestDifference [#id "y" #draft "contributed" ! "E d/MM/y – E d/MM/y"]
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
            currencyFormats [
                #numberSystem "latn" 
                currencyFormatLength [
                    #type "short" 
                    currencyFormat [
                        #type "standard" 
                        pattern [#type "1000" #count "one" #draft "contributed" ! "¤0K"] 
                        pattern [#type "1000" #count "other" #draft "contributed" ! "¤0K"] 
                        pattern [#type "10000" #count "one" #draft "contributed" ! "¤00K"] 
                        pattern [#type "10000" #count "other" #draft "contributed" ! "¤00K"] 
                        pattern [#type "100000" #count "one" #draft "contributed" ! "¤000K"] 
                        pattern [#type "100000" #count "other" #draft "contributed" ! "¤000K"] 
                        pattern [#type "1000000" #count "one" #draft "contributed" ! "¤0M"] 
                        pattern [#type "1000000" #count "other" #draft "contributed" ! "¤0M"] 
                        pattern [#type "10000000" #count "one" #draft "contributed" ! "¤00M"] 
                        pattern [#type "10000000" #count "other" #draft "contributed" ! "¤00M"] 
                        pattern [#type "100000000" #count "one" #draft "contributed" ! "¤000M"] 
                        pattern [#type "100000000" #count "other" #draft "contributed" ! "¤000M"] 
                        pattern [#type "1000000000" #count "one" #draft "contributed" ! "¤0000M"] 
                        pattern [#type "1000000000" #count "other" #draft "contributed" ! "¤0000M"] 
                        pattern [#type "10000000000" #count "one" #draft "contributed" ! "¤00MRD"] 
                        pattern [#type "10000000000" #count "other" #draft "contributed" ! "¤00MRD"] 
                        pattern [#type "100000000000" #count "one" #draft "contributed" ! "¤000MRD"] 
                        pattern [#type "100000000000" #count "other" #draft "contributed" ! "¤000MRD"]
                    ]
                ] 
                unitPattern [#count "one" #draft "contributed" ! "{1} {0}"] 
                unitPattern [#count "other" #draft "contributed" ! "{1} {0}"]
            ] 
            currencies [
                currency [
                    #type "GTQ" 
                    displayName [#draft "contributed" ! "quetzal"] 
                    displayName [#count "one" #draft "contributed" ! "quetzal"] 
                    displayName [#count "other" #draft "contributed" ! "quetzales"] 
                    symbol [! "Q"]
                ]
            ]
        ] 
        units [
            unitLength [
                #type "long" 
                unit [
                    #type "duration-year" 
                    perUnitPattern [#draft "contributed" ! "{0} al año"]
                ] 
                unit [
                    #type "duration-month" 
                    perUnitPattern [#draft "contributed" ! "{0} al mes"]
                ] 
                unit [
                    #type "duration-day" 
                    perUnitPattern [#draft "contributed" ! "{0} al día"]
                ] 
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
                unit [
                    #type "energy-kilojoule" 
                    displayName [#draft "contributed" ! "kilojulios"] 
                    unitPattern [#count "one" #draft "contributed" ! "{0} kilojulio"] 
                    unitPattern [#count "other" #draft "contributed" ! "{0} kilojulios"]
                ] 
                unit [
                    #type "energy-joule" 
                    displayName [#draft "contributed" ! "julios"] 
                    unitPattern [#count "one" #draft "contributed" ! "{0} julio"] 
                    unitPattern [#count "other" #draft "contributed" ! "{0} julios"]
                ] 
                unit [
                    #type "power-horsepower" 
                    unitPattern [#count "one" ! "{0} caballos de fuerza"] 
                    unitPattern [#count "other" ! "{0} caballos de fuerza"]
                ] 
                unit [
                    #type "volume-cubic-centimeter" 
                    perUnitPattern [#draft "contributed" ! "{0} por pie cúbico"]
                ]
            ] 
            unitLength [
                #type "short" 
                unit [
                    #type "electric-volt" 
                    displayName [#draft "contributed" ! "voltios"]
                ] 
                unit [
                    #type "length-foot" 
                    displayName [#draft "contributed" ! "pie"]
                ] 
                unit [
                    #type "power-watt" 
                    displayName [#draft "contributed" ! "vatios"]
                ] 
                unit [
                    #type "volume-acre-foot" 
                    displayName [#draft "contributed" ! "acre pie"]
                ]
            ] 
            unitLength [
                #type "narrow" 
                unit [
                    #type "duration-hour" 
                    displayName [#draft "contributed" ! "hora"]
                ]
            ]
        ]
    ]

