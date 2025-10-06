
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "es"] 
            territory [#type "DO"]
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
                                pattern [#draft "contributed" ! "dd/MM/y G"] 
                                datetimeSkeleton [#draft "contributed" ! "GyMMdd"]
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
                                #type "abbreviated" 
                                quarter [#type "1" #draft "contributed" ! "Q1"] 
                                quarter [#type "2" #draft "contributed" ! "Q2"] 
                                quarter [#type "3" #draft "contributed" ! "Q3"] 
                                quarter [#type "4" #draft "contributed" ! "Q4"]
                            ]
                        ] 
                        quarterContext [
                            #type "stand-alone" 
                            quarterWidth [
                                #type "abbreviated" 
                                quarter [#type "1" #draft "contributed" ! "Q1"] 
                                quarter [#type "2" #draft "contributed" ! "Q2"] 
                                quarter [#type "3" #draft "contributed" ! "Q3"] 
                                quarter [#type "4" #draft "contributed" ! "Q4"]
                            ]
                        ]
                    ] 
                    dayPeriods [
                        dayPeriodContext [
                            #type "format" 
                            dayPeriodWidth [
                                #type "narrow" 
                                dayPeriod [#type "noon" #draft "contributed" ! "mediodía"] 
                                dayPeriod [#type "morning1" #draft "contributed" ! "día"] 
                                dayPeriod [#type "morning2" #draft "contributed" ! "mañana"] 
                                dayPeriod [#type "evening1" #draft "contributed" ! "tarde"] 
                                dayPeriod [#type "night1" #draft "contributed" ! "noche"]
                            ]
                        ] 
                        dayPeriodContext [
                            #type "stand-alone" 
                            dayPeriodWidth [
                                #type "narrow" 
                                dayPeriod [#type "noon" #draft "contributed" ! "m."]
                            ]
                        ]
                    ] 
                    eras [
                        eraNames [
                            era [#type "0" #alt "variant" #draft "contributed" ! "antes de la Era Común"] 
                            era [#type "1" #alt "variant" #draft "contributed" ! "Era Común"]
                        ]
                    ] 
                    timeFormats [
                        timeFormatLength [
                            #type "full" 
                            timeFormat [
                                pattern [#draft "contributed" ! "h:mm:ss a zzzz"] 
                                datetimeSkeleton [#draft "contributed" ! "ahmmsszzzz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "long" 
                            timeFormat [
                                pattern [#draft "contributed" ! "h:mm:ss a z"] 
                                datetimeSkeleton [#draft "contributed" ! "ahmmssz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "medium" 
                            timeFormat [
                                pattern [#draft "contributed" ! "h:mm:ss a"] 
                                datetimeSkeleton [#draft "contributed" ! "ahmmss"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "short" 
                            timeFormat [
                                pattern [#draft "contributed" ! "h:mm a"] 
                                datetimeSkeleton [#draft "contributed" ! "ahmm"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "yMMMd" #draft "contributed" ! "d MMM 'de' y"]
                        ]
                    ]
                ]
            ] 
            fields [
                field [
                    #type "era" 
                    displayName [#draft "contributed" ! "Era"]
                ] 
                field [
                    #type "year" 
                    displayName [#draft "contributed" ! "Año"]
                ] 
                field [
                    #type "quarter" 
                    displayName [#draft "contributed" ! "Trimestre"]
                ] 
                field [
                    #type "month" 
                    displayName [#draft "contributed" ! "Mes"]
                ] 
                field [
                    #type "week" 
                    displayName [#draft "contributed" ! "Semana"]
                ] 
                field [
                    #type "day" 
                    displayName [#draft "contributed" ! "Día"]
                ] 
                field [
                    #type "weekday" 
                    displayName [#draft "contributed" ! "Día de la semana"]
                ] 
                field [
                    #type "minute" 
                    displayName [#draft "contributed" ! "Minuto"]
                ] 
                field [
                    #type "second" 
                    displayName [#draft "contributed" ! "Segundo"]
                ]
            ]
        ] 
        numbers [
            currencyFormats [
                #numberSystem "latn" 
                currencyFormatLength [
                    currencyFormat [
                        #type "accounting" 
                        pattern [#draft "contributed" ! "¤#,##0.00;(¤#,##0.00)"]
                    ]
                ]
            ] 
            currencies [
                currency [
                    #type "DOP" 
                    symbol [! "RD$"]
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
                    #type "duration-day" 
                    displayName [#draft "contributed" ! "d."]
                ] 
                unit [
                    #type "duration-second" 
                    displayName [#draft "contributed" ! "seg."] 
                    unitPattern [#count "one" #draft "contributed" ! "{0} seg."] 
                    unitPattern [#count "other" #draft "contributed" ! "{0} seg."]
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
                    #type "duration-month" 
                    unitPattern [#count "one" #draft "contributed" ! "{0}m."] 
                    unitPattern [#count "other" #draft "contributed" ! "{0}m."]
                ] 
                unit [
                    #type "duration-day" 
                    unitPattern [#count "one" #draft "contributed" ! "{0}d."] 
                    unitPattern [#count "other" #draft "contributed" ! "{0}d."]
                ]
            ]
        ] 
        listPatterns [
            listPattern [
                #type "unit-narrow" 
                listPatternPart [#type "end" #draft "contributed" ! "{0} y {1}"]
            ] 
            listPattern [
                #type "unit-short" 
                listPatternPart [#type "end" #draft "contributed" ! "{0} y {1}"]
            ]
        ]
    ]

