
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "gv"]
        ] 
        localeDisplayNames [
            languages [
                language [#type "gv" ! "Gaelg"]
            ] 
            territories [
                territory [#type "GB" ! "Rywvaneth Unys"] 
                territory [#type "IM" ! "Ellan Vannin"]
            ]
        ] 
        characters [
            exemplarCharacters [! {[a b c ç d e f g h i j k l m n o p q r s t u v w x y z]}] 
            exemplarCharacters [#type "index" ! {[A B C D E F G H I J K L M N O P Q R S T U V W X Y Z]}] 
            exemplarCharacters [#type "punctuation" ! {[\- ‐ ‑ – — , ; \: ! ? . … ' ‘ ’ &quot; “ ” ( ) \[ \] § @ * / \&amp; # † ‡ ′ ″]}]
        ] 
        dates [
            calendars [
                calendar [
                    #type "generic" 
                    dateFormats [
                        dateFormatLength [
                            #type "full" 
                            dateFormat [
                                pattern [#draft "unconfirmed" ! "EEEE dd MMMM y G"] 
                                datetimeSkeleton [#draft "unconfirmed" ! "GyMMMMEEEEdd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "long" 
                            dateFormat [
                                pattern [#draft "unconfirmed" ! "dd MMMM y G"] 
                                datetimeSkeleton [#draft "unconfirmed" ! "GyMMMMdd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "medium" 
                            dateFormat [
                                pattern [#draft "unconfirmed" ! "MMM dd, y G"] 
                                datetimeSkeleton [#draft "unconfirmed" ! "GyMMMdd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [#draft "unconfirmed" ! "dd/MM/yy GGGGG"] 
                                datetimeSkeleton [#draft "unconfirmed" ! "GGGGGyyMMdd"]
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
                                month [#type "1" ! "J-guer"] 
                                month [#type "2" ! "T-arree"] 
                                month [#type "3" ! "Mayrnt"] 
                                month [#type "4" ! "Avrril"] 
                                month [#type "5" ! "Boaldyn"] 
                                month [#type "6" ! "M-souree"] 
                                month [#type "7" ! "J-souree"] 
                                month [#type "8" ! "Luanistyn"] 
                                month [#type "9" ! "M-fouyir"] 
                                month [#type "10" ! "J-fouyir"] 
                                month [#type "11" ! "M-Houney"] 
                                month [#type "12" ! "M-Nollick"]
                            ] 
                            monthWidth [
                                #type "wide" 
                                month [#type "1" ! "Jerrey-geuree"] 
                                month [#type "2" ! "Toshiaght-arree"] 
                                month [#type "3" ! "Mayrnt"] 
                                month [#type "4" ! "Averil"] 
                                month [#type "5" ! "Boaldyn"] 
                                month [#type "6" ! "Mean-souree"] 
                                month [#type "7" ! "Jerrey-souree"] 
                                month [#type "8" ! "Luanistyn"] 
                                month [#type "9" ! "Mean-fouyir"] 
                                month [#type "10" ! "Jerrey-fouyir"] 
                                month [#type "11" ! "Mee Houney"] 
                                month [#type "12" ! "Mee ny Nollick"]
                            ]
                        ]
                    ] 
                    days [
                        dayContext [
                            #type "format" 
                            dayWidth [
                                #type "abbreviated" 
                                day [#type "sun" ! "Jed"] 
                                day [#type "mon" ! "Jel"] 
                                day [#type "tue" ! "Jem"] 
                                day [#type "wed" ! "Jerc"] 
                                day [#type "thu" ! "Jerd"] 
                                day [#type "fri" ! "Jeh"] 
                                day [#type "sat" ! "Jes"]
                            ] 
                            dayWidth [
                                #type "wide" 
                                day [#type "sun" ! "Jedoonee"] 
                                day [#type "mon" ! "Jelhein"] 
                                day [#type "tue" ! "Jemayrt"] 
                                day [#type "wed" ! "Jercean"] 
                                day [#type "thu" ! "Jerdein"] 
                                day [#type "fri" ! "Jeheiney"] 
                                day [#type "sat" ! "Jesarn"]
                            ]
                        ]
                    ] 
                    dayPeriods [
                        dayPeriodContext [
                            #type "format" 
                            dayPeriodWidth [
                                #type "abbreviated" 
                                dayPeriod [#type "am" ! "a.m."] 
                                dayPeriod [#type "pm" ! "p.m."]
                            ] 
                            dayPeriodWidth [
                                #type "wide" 
                                dayPeriod [#type "am" ! "a.m."] 
                                dayPeriod [#type "pm" ! "p.m."]
                            ]
                        ]
                    ] 
                    eras [
                        eraAbbr [
                            era [#type "0" ! "RC"] 
                            era [#type "1" ! "AD"]
                        ]
                    ] 
                    dateFormats [
                        dateFormatLength [
                            #type "full" 
                            dateFormat [
                                pattern [#draft "unconfirmed" ! "EEEE dd MMMM y"] 
                                datetimeSkeleton [#draft "unconfirmed" ! "yMMMMEEEEdd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "long" 
                            dateFormat [
                                pattern [#draft "unconfirmed" ! "dd MMMM y"] 
                                datetimeSkeleton [#draft "unconfirmed" ! "yMMMMdd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "medium" 
                            dateFormat [
                                pattern [#draft "unconfirmed" ! "MMM dd, y"] 
                                datetimeSkeleton [#draft "unconfirmed" ! "yMMMdd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [#draft "unconfirmed" ! "dd/MM/yy"] 
                                datetimeSkeleton [#draft "unconfirmed" ! "yyMMdd"]
                            ]
                        ]
                    ] 
                    timeFormats [
                        timeFormatLength [
                            #type "full" 
                            timeFormat [
                                pattern [#draft "unconfirmed" ! "HH:mm:ss zzzz"] 
                                datetimeSkeleton [#draft "unconfirmed" ! "HHmmsszzzz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "long" 
                            timeFormat [
                                pattern [#draft "unconfirmed" ! "HH:mm:ss z"] 
                                datetimeSkeleton [#draft "unconfirmed" ! "HHmmssz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "medium" 
                            timeFormat [
                                pattern [#draft "unconfirmed" ! "HH:mm:ss"] 
                                datetimeSkeleton [#draft "unconfirmed" ! "HHmmss"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "short" 
                            timeFormat [
                                pattern [#draft "unconfirmed" ! "HH:mm"] 
                                datetimeSkeleton [#draft "unconfirmed" ! "HHmm"]
                            ]
                        ]
                    ]
                ]
            ] 
            timeZoneNames [
                metazone [
                    #type "Europe_Central" 
                    short [
                        generic [#draft "unconfirmed" ! "CET"] 
                        standard [#draft "unconfirmed" ! "CET"] 
                        daylight [#draft "unconfirmed" ! "CEST"]
                    ]
                ] 
                metazone [
                    #type "Europe_Eastern" 
                    short [
                        generic [#draft "unconfirmed" ! "EET"] 
                        standard [#draft "unconfirmed" ! "EET"] 
                        daylight [#draft "unconfirmed" ! "EEST"]
                    ]
                ] 
                metazone [
                    #type "Europe_Western" 
                    short [
                        generic [#draft "unconfirmed" ! "WET"] 
                        standard [#draft "unconfirmed" ! "WET"] 
                        daylight [#draft "unconfirmed" ! "WEST"]
                    ]
                ] 
                metazone [
                    #type "GMT" 
                    short [
                        standard [#draft "unconfirmed" ! "GMT"]
                    ]
                ]
            ]
        ] 
        numbers [
            currencyFormats [
                #numberSystem "latn" 
                currencyFormatLength [
                    currencyFormat [
                        #type "standard" 
                        pattern [! "¤#,##0.00"]
                    ]
                ] 
                currencyFormatLength [
                    #type "short" 
                    currencyFormat [
                        #type "standard" 
                        pattern [#type "1000" #count "one" #draft "provisional" ! "¤0K"] 
                        pattern [#type "1000" #count "two" #draft "provisional" ! "¤0K"] 
                        pattern [#type "1000" #count "few" #draft "provisional" ! "¤0K"] 
                        pattern [#type "1000" #count "many" #draft "provisional" ! "¤0K"] 
                        pattern [#type "1000" #count "other" #draft "provisional" ! "¤0K"] 
                        pattern [#type "10000" #count "one" #draft "provisional" ! "¤00K"] 
                        pattern [#type "10000" #count "two" #draft "provisional" ! "¤00K"] 
                        pattern [#type "10000" #count "few" #draft "provisional" ! "¤00K"] 
                        pattern [#type "10000" #count "many" #draft "provisional" ! "¤00K"] 
                        pattern [#type "10000" #count "other" #draft "provisional" ! "¤00K"] 
                        pattern [#type "100000" #count "one" #draft "provisional" ! "¤000K"] 
                        pattern [#type "100000" #count "two" #draft "provisional" ! "¤000K"] 
                        pattern [#type "100000" #count "few" #draft "provisional" ! "¤000K"] 
                        pattern [#type "100000" #count "many" #draft "provisional" ! "¤000K"] 
                        pattern [#type "100000" #count "other" #draft "provisional" ! "¤000K"] 
                        pattern [#type "1000000" #count "one" #draft "provisional" ! "¤0M"] 
                        pattern [#type "1000000" #count "two" #draft "provisional" ! "¤0M"] 
                        pattern [#type "1000000" #count "few" #draft "provisional" ! "¤0M"] 
                        pattern [#type "1000000" #count "many" #draft "provisional" ! "¤0M"] 
                        pattern [#type "1000000" #count "other" #draft "provisional" ! "¤0M"] 
                        pattern [#type "10000000" #count "one" #draft "provisional" ! "¤00M"] 
                        pattern [#type "10000000" #count "two" #draft "provisional" ! "¤00M"] 
                        pattern [#type "10000000" #count "few" #draft "provisional" ! "¤00M"] 
                        pattern [#type "10000000" #count "many" #draft "provisional" ! "¤00M"] 
                        pattern [#type "10000000" #count "other" #draft "provisional" ! "¤00M"] 
                        pattern [#type "100000000" #count "one" #draft "provisional" ! "¤000M"] 
                        pattern [#type "100000000" #count "two" #draft "provisional" ! "¤000M"] 
                        pattern [#type "100000000" #count "few" #draft "provisional" ! "¤000M"] 
                        pattern [#type "100000000" #count "many" #draft "provisional" ! "¤000M"] 
                        pattern [#type "100000000" #count "other" #draft "provisional" ! "¤000M"] 
                        pattern [#type "1000000000" #count "one" #draft "provisional" ! "¤0G"] 
                        pattern [#type "1000000000" #count "two" #draft "provisional" ! "¤0G"] 
                        pattern [#type "1000000000" #count "few" #draft "provisional" ! "¤0G"] 
                        pattern [#type "1000000000" #count "many" #draft "provisional" ! "¤0G"] 
                        pattern [#type "1000000000" #count "other" #draft "provisional" ! "¤0G"] 
                        pattern [#type "10000000000" #count "one" #draft "provisional" ! "¤00G"] 
                        pattern [#type "10000000000" #count "two" #draft "provisional" ! "¤00G"] 
                        pattern [#type "10000000000" #count "few" #draft "provisional" ! "¤00G"] 
                        pattern [#type "10000000000" #count "many" #draft "provisional" ! "¤00G"] 
                        pattern [#type "10000000000" #count "other" #draft "provisional" ! "¤00G"] 
                        pattern [#type "100000000000" #count "one" #draft "provisional" ! "¤000G"] 
                        pattern [#type "100000000000" #count "two" #draft "provisional" ! "¤000G"] 
                        pattern [#type "100000000000" #count "few" #draft "provisional" ! "¤000G"] 
                        pattern [#type "100000000000" #count "many" #draft "provisional" ! "¤000G"] 
                        pattern [#type "100000000000" #count "other" #draft "provisional" ! "¤000G"] 
                        pattern [#type "1000000000000" #count "one" #draft "provisional" ! "¤0T"] 
                        pattern [#type "1000000000000" #count "two" #draft "provisional" ! "¤0T"] 
                        pattern [#type "1000000000000" #count "few" #draft "provisional" ! "¤0T"] 
                        pattern [#type "1000000000000" #count "many" #draft "provisional" ! "¤0T"] 
                        pattern [#type "1000000000000" #count "other" #draft "provisional" ! "¤0T"] 
                        pattern [#type "10000000000000" #count "one" #draft "provisional" ! "¤00T"] 
                        pattern [#type "10000000000000" #count "two" #draft "provisional" ! "¤00T"] 
                        pattern [#type "10000000000000" #count "few" #draft "provisional" ! "¤00T"] 
                        pattern [#type "10000000000000" #count "many" #draft "provisional" ! "¤00T"] 
                        pattern [#type "10000000000000" #count "other" #draft "provisional" ! "¤00T"] 
                        pattern [#type "100000000000000" #count "one" #draft "provisional" ! "¤000T"] 
                        pattern [#type "100000000000000" #count "two" #draft "provisional" ! "¤000T"] 
                        pattern [#type "100000000000000" #count "few" #draft "provisional" ! "¤000T"] 
                        pattern [#type "100000000000000" #count "many" #draft "provisional" ! "¤000T"] 
                        pattern [#type "100000000000000" #count "other" #draft "provisional" ! "¤000T"]
                    ]
                ]
            ] 
            minimalPairs [
                pluralMinimalPairs [#count "one" ! "{0} thunnag/vuc/ooyl"] 
                pluralMinimalPairs [#count "two" ! "{0} hunnag/vuc/ooyl"] 
                pluralMinimalPairs [#count "few" ! "{0} thunnag/muc/ooyl"] 
                pluralMinimalPairs [#count "many" ! "{0} dy hunnagyn/dy vucyn/dy ooylyn"] 
                pluralMinimalPairs [#count "other" ! "{0} thunnagyn/mucyn/ooylyn"]
            ]
        ]
    ]

