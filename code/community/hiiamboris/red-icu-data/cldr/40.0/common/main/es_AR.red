
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "es"] 
            territory [#type "AR"]
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
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "MEd" #draft "contributed" ! "E d-M"] 
                            dateFormatItem [#id "yyyyM" #draft "contributed" ! "M-y G"]
                        ] 
                        intervalFormats [
                            intervalFormatFallback [#draft "unconfirmed" ! "{0} a el {1}"] 
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
                                greatestDifference [#id "d" #draft "unconfirmed" ! "dd/MM – dd/MM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "dd/MM – dd/MM"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E dd/MM – E dd/MM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E dd/MM – E dd/MM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMd" 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "d 'de' MMM 'al' d 'de' MMM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E d 'al' E d 'de' MMM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E d 'de' MMM 'al' E d 'de' MMM"]
                            ] 
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "MM/y – MM/y G"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "MM/y – MM/y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "dd/MM/y – dd/MM/y G"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "dd/MM/y – dd/MM/y G"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "dd/MM/y – dd/MM/y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E dd/MM/y – E dd/MM/y G"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E dd/MM/y – E dd/MM/y G"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E dd/MM/y – E dd/MM/y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMMM" 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "MMM 'de' y 'a' MMM 'de' y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMd" 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "d 'de' MMM 'al' d 'de' MMM 'de' y G"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "d 'de' MMM 'de' y 'al' d 'de' MMM 'de' y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E d 'al' E d 'de' MMM 'de' y G"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E d 'de' MMM 'de' y 'al' E d 'de' MMM 'de' y G"]
                            ]
                        ]
                    ]
                ] 
                calendar [
                    #type "gregorian" 
                    days [
                        dayContext [
                            #type "format" 
                            dayWidth [
                                #type "narrow" 
                                day [#type "sun" #draft "contributed" ! "D"] 
                                day [#type "mon" #draft "contributed" ! "L"] 
                                day [#type "tue" #draft "contributed" ! "M"] 
                                day [#type "wed" #draft "contributed" ! "M"] 
                                day [#type "thu" #draft "contributed" ! "J"] 
                                day [#type "fri" #draft "contributed" ! "V"] 
                                day [#type "sat" #draft "contributed" ! "S"]
                            ]
                        ]
                    ] 
                    quarters [
                        quarterContext [
                            #type "format" 
                            quarterWidth [
                                #type "wide" 
                                quarter [#type "1" #draft "contributed" ! "1.er trimestre"] 
                                quarter [#type "2" #draft "contributed" ! "2.º trimestre"] 
                                quarter [#type "3" #draft "contributed" ! "3.er trimestre"] 
                                quarter [#type "4" #draft "contributed" ! "4.º trimestre"]
                            ]
                        ] 
                        quarterContext [
                            #type "stand-alone" 
                            quarterWidth [
                                #type "wide" 
                                quarter [#type "1" #draft "contributed" ! "1.er trimestre"] 
                                quarter [#type "2" #draft "contributed" ! "2.º trimestre"] 
                                quarter [#type "3" #draft "contributed" ! "3.er trimestre"] 
                                quarter [#type "4" #draft "contributed" ! "4.º trimestre"]
                            ]
                        ]
                    ] 
                    dayPeriods [
                        dayPeriodContext [
                            #type "format" 
                            dayPeriodWidth [
                                #type "abbreviated" 
                                dayPeriod [#type "noon" #draft "contributed" ! "mediodía"] 
                                dayPeriod [#type "morning1" #draft "contributed" ! "madrugada"] 
                                dayPeriod [#type "morning2" #draft "contributed" ! "mañana"] 
                                dayPeriod [#type "evening1" #draft "contributed" ! "tarde"] 
                                dayPeriod [#type "night1" #draft "contributed" ! "noche"]
                            ] 
                            dayPeriodWidth [
                                #type "wide" 
                                dayPeriod [#type "noon" #draft "contributed" ! "mediodía"] 
                                dayPeriod [#type "morning1" #draft "contributed" ! "madrugada"] 
                                dayPeriod [#type "morning2" #draft "contributed" ! "mañana"] 
                                dayPeriod [#type "evening1" #draft "contributed" ! "tarde"] 
                                dayPeriod [#type "night1" #draft "contributed" ! "noche"]
                            ]
                        ] 
                        dayPeriodContext [
                            #type "stand-alone" 
                            dayPeriodWidth [
                                #type "narrow" 
                                dayPeriod [#type "noon" ! "m."]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "GyMMMd" #draft "contributed" ! "d MMM y G"] 
                            dateFormatItem [#id "GyMMMEd" #draft "contributed" ! "E, d 'de' MMM 'de' y G"] 
                            dateFormatItem [#id "hms" #draft "contributed" ! "hh:mm:ss"] 
                            dateFormatItem [#id "Hmsvvvv" #draft "contributed" ! "HH:mm:ss (vvvv)"] 
                            dateFormatItem [#id "MEd" #draft "contributed" ! "E d-M"] 
                            dateFormatItem [#id "yM" #draft "contributed" ! "M-y"] 
                            dateFormatItem [#id "yMEd" #draft "contributed" ! "E, d/M/y"] 
                            dateFormatItem [#id "yMMMd" #draft "contributed" ! "d 'de' MMM 'de' y"]
                        ] 
                        intervalFormats [
                            intervalFormatFallback [#draft "contributed" ! "{0} a el {1}"] 
                            intervalFormatItem [
                                #id "h" 
                                greatestDifference [#id "a" #draft "contributed" ! "h a – h a"]
                            ] 
                            intervalFormatItem [
                                #id "H" 
                                greatestDifference [#id "H" #draft "contributed" ! "HH–HH"]
                            ] 
                            intervalFormatItem [
                                #id "hm" 
                                greatestDifference [#id "h" #draft "contributed" ! "h:mm–h:mm a"] 
                                greatestDifference [#id "m" #draft "contributed" ! "h:mm–h:mm a"]
                            ] 
                            intervalFormatItem [
                                #id "Hm" 
                                greatestDifference [#id "H" #draft "contributed" ! "HH:mm–HH:mm"] 
                                greatestDifference [#id "m" #draft "contributed" ! "HH:mm–HH:mm"]
                            ] 
                            intervalFormatItem [
                                #id "hmv" 
                                greatestDifference [#id "a" #draft "contributed" ! "h:mm a – h:mm a v"]
                            ] 
                            intervalFormatItem [
                                #id "Hmv" 
                                greatestDifference [#id "H" #draft "contributed" ! "HH:mm–HH:mm v"] 
                                greatestDifference [#id "m" #draft "contributed" ! "HH:mm–HH:mm v"]
                            ] 
                            intervalFormatItem [
                                #id "hv" 
                                greatestDifference [#id "a" #draft "contributed" ! "h a – h a v"]
                            ] 
                            intervalFormatItem [
                                #id "Hv" 
                                greatestDifference [#id "H" #draft "contributed" ! "HH–HH v"]
                            ] 
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" #draft "contributed" ! "dd/MM – dd/MM"] 
                                greatestDifference [#id "M" #draft "contributed" ! "dd/MM – dd/MM"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "E dd/MM – E dd/MM"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E dd/MM – E dd/MM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMd" 
                                greatestDifference [#id "d" #draft "contributed" ! "dd – dd 'de' MM"] 
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
                                greatestDifference [#id "d" #draft "contributed" ! "dd/MM/y – dd/MM/y"] 
                                greatestDifference [#id "M" #draft "contributed" ! "dd/MM/y – dd/MM/y"] 
                                greatestDifference [#id "y" #draft "contributed" ! "dd/MM/y – dd/MM/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "E, dd/MM/y – E, dd/MM/y"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E, dd/MM/y – E, dd/MM/y"] 
                                greatestDifference [#id "y" #draft "contributed" ! "E, dd/MM/y – E, dd/MM/y"]
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
                                greatestDifference [#id "d" #draft "contributed" ! "E, d 'al' E, d 'de' MMM 'de' y"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E, d 'de' MMM 'al' E, d 'de' MMM 'de' y"] 
                                greatestDifference [#id "y" #draft "contributed" ! "E, d 'de' MMM 'de' y 'al' E, d 'de' MMM 'de' y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMM" 
                                greatestDifference [#id "M" #draft "contributed" ! "MMMM 'al' MMMM 'de' y"] 
                                greatestDifference [#id "y" #draft "contributed" ! "MMMM 'de' y 'al' MMMM 'de' y"]
                            ]
                        ]
                    ]
                ]
            ] 
            fields [
                field [
                    #type "day-short" 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "dentro de {0} días"] 
                        relativeTimePattern [#count "other" ! "dentro de {0} días"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "hace {0} días"] 
                        relativeTimePattern [#count "other" ! "hace {0} días"]
                    ]
                ] 
                field [
                    #type "day-narrow" 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "dentro de {0} días"] 
                        relativeTimePattern [#count "other" ! "dentro de {0} días"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "hace {0} días"] 
                        relativeTimePattern [#count "other" ! "hace {0} días"]
                    ]
                ] 
                field [
                    #type "second-short" 
                    displayName [#draft "contributed" ! "seg."] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "dentro de {0} seg."] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "dentro de {0} seg."]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "hace {0} seg."] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "hace {0} seg."]
                    ]
                ] 
                field [
                    #type "second-narrow" 
                    displayName [#draft "contributed" ! "seg."] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "dentro de {0} seg."] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "dentro de {0} seg."]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "hace {0} seg."] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "hace {0} seg."]
                    ]
                ]
            ] 
            timeZoneNames [
                metazone [
                    #type "Argentina" 
                    short [
                        generic [! "ART"] 
                        standard [! "ART"] 
                        daylight [! "ARST"]
                    ]
                ] 
                metazone [
                    #type "Argentina_Western" 
                    short [
                        generic [! "WART"] 
                        standard [! "WART"] 
                        daylight [! "WARST"]
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
                        pattern [#draft "contributed" ! "¤ #,##0.00"]
                    ] 
                    currencyFormat [
                        #type "accounting" 
                        pattern [#draft "contributed" ! "¤ #,##0.00;(¤ #,##0.00)"]
                    ]
                ]
            ] 
            currencies [
                currency [
                    #type "ARS" 
                    symbol [! "$"]
                ] 
                currency [
                    #type "GEL" 
                    symbol [#alt "variant" #draft "contributed" ! "GEL"]
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
                    #type "duration-year" 
                    perUnitPattern [#draft "contributed" ! "{0}/año"]
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
            ] 
            unitLength [
                #type "short" 
                unit [
                    #type "duration-century" 
                    displayName [#draft "contributed" ! "s"] 
                    unitPattern [#count "one" #draft "contributed" ! "{0} s"] 
                    unitPattern [#count "other" #draft "contributed" ! "{0} s"]
                ] 
                unit [
                    #type "duration-year" 
                    displayName [#draft "contributed" ! "años"] 
                    unitPattern [#count "one" #draft "contributed" ! "{0} año"] 
                    unitPattern [#count "other" #draft "contributed" ! "{0} años"] 
                    perUnitPattern [#draft "contributed" ! "{0}/a"]
                ] 
                unit [
                    #type "duration-hour" 
                    displayName [#draft "contributed" ! "hs."]
                ] 
                unit [
                    #type "duration-second" 
                    displayName [#draft "contributed" ! "seg."] 
                    unitPattern [#count "one" #draft "contributed" ! "{0} seg."] 
                    unitPattern [#count "other" #draft "contributed" ! "{0} seg."] 
                    perUnitPattern [#draft "contributed" ! "{0}/seg."]
                ] 
                unit [
                    #type "electric-volt" 
                    displayName [#draft "contributed" ! "voltios"]
                ] 
                unit [
                    #type "power-watt" 
                    displayName [#draft "contributed" ! "vatios"]
                ]
            ] 
            unitLength [
                #type "narrow" 
                unit [
                    #type "duration-year" 
                    unitPattern [#count "one" #draft "contributed" ! "{0}a."] 
                    unitPattern [#count "other" #draft "contributed" ! "{0}a."]
                ] 
                unit [
                    #type "duration-second" 
                    displayName [#draft "contributed" ! "seg."] 
                    unitPattern [#count "one" #draft "contributed" ! "{0}seg."] 
                    unitPattern [#count "other" #draft "contributed" ! "{0}seg."]
                ]
            ]
        ]
    ]

