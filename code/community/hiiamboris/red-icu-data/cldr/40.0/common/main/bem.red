
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "bem"]
        ] 
        localeDisplayNames [
            languages [
                language [#type "ak" ! "Ichi Akan"] 
                language [#type "am" ! "Ichi Amhari"] 
                language [#type "ar" ! "Ichi Arab"] 
                language [#type "be" ! "Ichi Belarus"] 
                language [#type "bem" ! "Ichibemba"] 
                language [#type "bg" ! "Ichi Bulgariani"] 
                language [#type "bn" ! "Ichi Bengali"] 
                language [#type "cs" ! "Ichi Cheki"] 
                language [#type "de" ! "Ichi Jemani"] 
                language [#type "el" ! "Ichi Griki"] 
                language [#type "en" ! "Ichi Sungu"] 
                language [#type "es" ! "Ichi Spanishi"] 
                language [#type "fa" ! "Ichi Pesia"] 
                language [#type "fr" ! "Ichi Frenchi"] 
                language [#type "ha" ! "Ichi Hausa"] 
                language [#type "hi" ! "Ichi Hindu"] 
                language [#type "hu" ! "Ichi Hangarian"] 
                language [#type "id" ! "Ichi Indonesiani"] 
                language [#type "ig" ! "Ichi Ibo"] 
                language [#type "it" ! "Ichi Italiani"] 
                language [#type "ja" ! "Ichi Japanisi"] 
                language [#type "jv" ! "Ichi Javanisi"] 
                language [#type "km" ! "Ichi Khmer"] 
                language [#type "ko" ! "Ichi Koriani"] 
                language [#type "ms" ! "Ichi Maleshani"] 
                language [#type "my" ! "Ichi Burma"] 
                language [#type "ne" ! "Ichi Nepali"] 
                language [#type "nl" ! "Ichi Dachi"] 
                language [#type "pa" ! "Ichi Punjabi"] 
                language [#type "pl" ! "Ichi Polishi"] 
                language [#type "pt" ! "Ichi Potogisi"] 
                language [#type "ro" ! "Ichi Romaniani"] 
                language [#type "ru" ! "Ichi Rusiani"] 
                language [#type "rw" ! "Ichi Rwanda"] 
                language [#type "so" ! "Ichi Somalia"] 
                language [#type "sv" ! "Ichi Swideni"] 
                language [#type "ta" ! "Ichi Tamil"] 
                language [#type "th" ! "Ichi Thai"] 
                language [#type "tr" ! "Ichi Takishi"] 
                language [#type "uk" ! "Ichi Ukraniani"] 
                language [#type "ur" ! "Ichi Urudu"] 
                language [#type "vi" ! "Ichi Vietinamu"] 
                language [#type "yo" ! "Ichi Yoruba"] 
                language [#type "zh" ! "Ichi Chainisi"] 
                language [#type "zu" ! "Ichi Zulu"]
            ] 
            territories [
                territory [#type "ZM" ! "Zambia"]
            ]
        ] 
        characters [
            exemplarCharacters [! "[a b c e f g i j k l m n o p s {sh} t u w y]"] 
            exemplarCharacters [#type "auxiliary" ! "[d h q r v x z]"] 
            exemplarCharacters [#type "index" ! "[A B C E F G I J K L M N O P S {SH} T U W Y]"]
        ] 
        delimiters [
            quotationStart [! "“"] 
            quotationEnd [! "”"] 
            alternateQuotationStart [! "‘"] 
            alternateQuotationEnd [! "’"]
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
                                datetimeSkeleton [! "GyMMMMEEEEd"]
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
                                pattern [! "dd/MM/y GGGGG"] 
                                datetimeSkeleton [! "GGGGGyMMdd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "d" ! "d"] 
                            dateFormatItem [#id "hm" ! "h:mm a"] 
                            dateFormatItem [#id "Hm" ! "HH:mm"] 
                            dateFormatItem [#id "Hms" ! "HH:mm:ss"] 
                            dateFormatItem [#id "M" ! "L"] 
                            dateFormatItem [#id "Md" ! "M/d"] 
                            dateFormatItem [#id "MEd" ! "E, M/d"] 
                            dateFormatItem [#id "MMM" ! "LLL"] 
                            dateFormatItem [#id "MMMd" ! "MMM d"] 
                            dateFormatItem [#id "MMMEd" ! "E, MMM d"] 
                            dateFormatItem [#id "MMMMd" ! "MMMM d"] 
                            dateFormatItem [#id "MMMMEd" ! "E, MMMM d"] 
                            dateFormatItem [#id "ms" ! "mm:ss"] 
                            dateFormatItem [#id "y" ! "y"] 
                            dateFormatItem [#id "yM" ! "M/y"] 
                            dateFormatItem [#id "yMd" ! "d/M/y"] 
                            dateFormatItem [#id "yMEd" ! "E, M/d/y"] 
                            dateFormatItem [#id "yMMM" ! "MMM y"] 
                            dateFormatItem [#id "yMMMd" ! "d MMM y"] 
                            dateFormatItem [#id "yMMMEd" ! "E, MMM d, y"] 
                            dateFormatItem [#id "yMMMM" ! "MMMM y"] 
                            dateFormatItem [#id "yQQQ" ! "QQQ y"] 
                            dateFormatItem [#id "yQQQQ" ! "QQQQ y"]
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
                                month [#type "1" ! "Jan"] 
                                month [#type "2" ! "Feb"] 
                                month [#type "3" ! "Mac"] 
                                month [#type "4" ! "Epr"] 
                                month [#type "5" ! "Mei"] 
                                month [#type "6" ! "Jun"] 
                                month [#type "7" ! "Jul"] 
                                month [#type "8" ! "Oga"] 
                                month [#type "9" ! "Sep"] 
                                month [#type "10" ! "Okt"] 
                                month [#type "11" ! "Nov"] 
                                month [#type "12" ! "Dis"]
                            ] 
                            monthWidth [
                                #type "wide" 
                                month [#type "1" ! "Januari"] 
                                month [#type "2" ! "Februari"] 
                                month [#type "3" ! "Machi"] 
                                month [#type "4" ! "Epreo"] 
                                month [#type "5" ! "Mei"] 
                                month [#type "6" ! "Juni"] 
                                month [#type "7" ! "Julai"] 
                                month [#type "8" ! "Ogasti"] 
                                month [#type "9" ! "Septemba"] 
                                month [#type "10" ! "Oktoba"] 
                                month [#type "11" ! "Novemba"] 
                                month [#type "12" ! "Disemba"]
                            ]
                        ] 
                        monthContext [
                            #type "stand-alone" 
                            monthWidth [
                                #type "narrow" 
                                month [#type "1" ! "J"] 
                                month [#type "2" ! "F"] 
                                month [#type "3" ! "M"] 
                                month [#type "4" ! "E"] 
                                month [#type "5" ! "M"] 
                                month [#type "6" ! "J"] 
                                month [#type "7" ! "J"] 
                                month [#type "8" ! "O"] 
                                month [#type "9" ! "S"] 
                                month [#type "10" ! "O"] 
                                month [#type "11" ! "N"] 
                                month [#type "12" ! "D"]
                            ]
                        ]
                    ] 
                    days [
                        dayContext [
                            #type "format" 
                            dayWidth [
                                #type "wide" 
                                day [#type "sun" ! "Pa Mulungu"] 
                                day [#type "mon" ! "Palichimo"] 
                                day [#type "tue" ! "Palichibuli"] 
                                day [#type "wed" ! "Palichitatu"] 
                                day [#type "thu" ! "Palichine"] 
                                day [#type "fri" ! "Palichisano"] 
                                day [#type "sat" ! "Pachibelushi"]
                            ]
                        ]
                    ] 
                    dayPeriods [
                        dayPeriodContext [
                            #type "format" 
                            dayPeriodWidth [
                                #type "abbreviated" 
                                dayPeriod [#type "am" ! "uluchelo"] 
                                dayPeriod [#type "pm" ! "akasuba"]
                            ] 
                            dayPeriodWidth [
                                #type "wide" 
                                dayPeriod [#type "am" ! "uluchelo"] 
                                dayPeriod [#type "pm" ! "akasuba"]
                            ]
                        ]
                    ] 
                    eras [
                        eraNames [
                            era [#type "0" ! "Before Yesu"] 
                            era [#type "1" ! "After Yesu"]
                        ] 
                        eraAbbr [
                            era [#type "0" ! "BC"] 
                            era [#type "1" ! "AD"]
                        ]
                    ] 
                    dateFormats [
                        dateFormatLength [
                            #type "full" 
                            dateFormat [
                                pattern [! "EEEE, d MMMM y"] 
                                datetimeSkeleton [! "yMMMMEEEEd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "long" 
                            dateFormat [
                                pattern [! "d MMMM y"] 
                                datetimeSkeleton [! "yMMMMd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "medium" 
                            dateFormat [
                                pattern [! "d MMM y"] 
                                datetimeSkeleton [! "yMMMd"]
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
                    timeFormats [
                        timeFormatLength [
                            #type "full" 
                            timeFormat [
                                pattern [! "h:mm:ss a zzzz"] 
                                datetimeSkeleton [! "ahmmsszzzz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "long" 
                            timeFormat [
                                pattern [! "h:mm:ss a z"] 
                                datetimeSkeleton [! "ahmmssz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "medium" 
                            timeFormat [
                                pattern [! "h:mm:ss a"] 
                                datetimeSkeleton [! "ahmmss"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "short" 
                            timeFormat [
                                pattern [! "h:mm a"] 
                                datetimeSkeleton [! "ahmm"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "d" ! "d"] 
                            dateFormatItem [#id "hm" ! "h:mm a"] 
                            dateFormatItem [#id "Hm" ! "HH:mm"] 
                            dateFormatItem [#id "Hms" ! "HH:mm:ss"] 
                            dateFormatItem [#id "M" ! "L"] 
                            dateFormatItem [#id "Md" ! "M/d"] 
                            dateFormatItem [#id "MEd" ! "E, M/d"] 
                            dateFormatItem [#id "MMM" ! "LLL"] 
                            dateFormatItem [#id "MMMd" ! "MMM d"] 
                            dateFormatItem [#id "MMMEd" ! "E, MMM d"] 
                            dateFormatItem [#id "MMMMd" ! "MMMM d"] 
                            dateFormatItem [#id "MMMMEd" ! "E, MMMM d"] 
                            dateFormatItem [#id "ms" ! "mm:ss"] 
                            dateFormatItem [#id "y" ! "y"] 
                            dateFormatItem [#id "yM" ! "M/y"] 
                            dateFormatItem [#id "yMd" ! "d/M/y"] 
                            dateFormatItem [#id "yMEd" ! "E, M/d/y"] 
                            dateFormatItem [#id "yMMM" ! "MMM y"] 
                            dateFormatItem [#id "yMMMd" ! "d MMM y"] 
                            dateFormatItem [#id "yMMMEd" ! "E, MMM d, y"] 
                            dateFormatItem [#id "yMMMM" ! "MMMM y"] 
                            dateFormatItem [#id "yQQQ" ! "QQQ y"] 
                            dateFormatItem [#id "yQQQQ" ! "QQQQ y"]
                        ]
                    ]
                ]
            ] 
            fields [
                field [
                    #type "era" 
                    displayName [! "Inkulo"]
                ] 
                field [
                    #type "year" 
                    displayName [! "Umwaka"]
                ] 
                field [
                    #type "month" 
                    displayName [! "Umweshi"]
                ] 
                field [
                    #type "week" 
                    displayName [! "Umulungu"]
                ] 
                field [
                    #type "day" 
                    displayName [! "Ubushiku"] 
                    relative [#type "-1" ! "yesterday"] 
                    relative [#type "0" ! "Lelo"] 
                    relative [#type "1" ! "tomorrow"]
                ] 
                field [
                    #type "dayperiod" 
                    displayName [! "Akasuba"]
                ] 
                field [
                    #type "hour" 
                    displayName [! "Insa"]
                ] 
                field [
                    #type "minute" 
                    displayName [! "Mineti"]
                ] 
                field [
                    #type "second" 
                    displayName [! "Sekondi"]
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
                    currencyFormat [
                        #type "accounting" 
                        pattern [! "¤#,##0.00;(¤#,##0.00)"]
                    ]
                ] 
                currencyFormatLength [
                    #type "short" 
                    currencyFormat [
                        #type "standard" 
                        pattern [#type "1000" #count "one" #draft "provisional" ! "¤0K"] 
                        pattern [#type "1000" #count "other" #draft "provisional" ! "¤0K"] 
                        pattern [#type "10000" #count "one" #draft "provisional" ! "¤00K"] 
                        pattern [#type "10000" #count "other" #draft "provisional" ! "¤00K"] 
                        pattern [#type "100000" #count "one" #draft "provisional" ! "¤000K"] 
                        pattern [#type "100000" #count "other" #draft "provisional" ! "¤000K"] 
                        pattern [#type "1000000" #count "one" #draft "provisional" ! "¤0M"] 
                        pattern [#type "1000000" #count "other" #draft "provisional" ! "¤0M"] 
                        pattern [#type "10000000" #count "one" #draft "provisional" ! "¤00M"] 
                        pattern [#type "10000000" #count "other" #draft "provisional" ! "¤00M"] 
                        pattern [#type "100000000" #count "one" #draft "provisional" ! "¤000M"] 
                        pattern [#type "100000000" #count "other" #draft "provisional" ! "¤000M"] 
                        pattern [#type "1000000000" #count "one" #draft "provisional" ! "¤0G"] 
                        pattern [#type "1000000000" #count "other" #draft "provisional" ! "¤0G"] 
                        pattern [#type "10000000000" #count "one" #draft "provisional" ! "¤00G"] 
                        pattern [#type "10000000000" #count "other" #draft "provisional" ! "¤00G"] 
                        pattern [#type "100000000000" #count "one" #draft "provisional" ! "¤000G"] 
                        pattern [#type "100000000000" #count "other" #draft "provisional" ! "¤000G"] 
                        pattern [#type "1000000000000" #count "one" #draft "provisional" ! "¤0T"] 
                        pattern [#type "1000000000000" #count "other" #draft "provisional" ! "¤0T"] 
                        pattern [#type "10000000000000" #count "one" #draft "provisional" ! "¤00T"] 
                        pattern [#type "10000000000000" #count "other" #draft "provisional" ! "¤00T"] 
                        pattern [#type "100000000000000" #count "one" #draft "provisional" ! "¤000T"] 
                        pattern [#type "100000000000000" #count "other" #draft "provisional" ! "¤000T"]
                    ]
                ]
            ] 
            currencies [
                currency [
                    #type "ZMW" 
                    symbol [! "K"]
                ]
            ]
        ] 
        posix [
            messages [
                yesstr [! "Ee:E"] 
                nostr [! "Awe:A"]
            ]
        ]
    ]

