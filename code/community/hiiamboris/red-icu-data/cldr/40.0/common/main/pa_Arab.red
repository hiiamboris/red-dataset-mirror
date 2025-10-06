
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "pa"] 
            script [#type "Arab"]
        ] 
        localeDisplayNames [
            languages [
                language [#type "pa" ! "پنجابی"]
            ] 
            scripts [
                script [#type "Arab" ! "عربی"] 
                script [#type "Aran" #draft "contributed" ! "نستعلیق"] 
                script [#type "Guru" ! "گُرمُکھی"]
            ] 
            territories [
                territory [#type "PK" ! "پاکستان"]
            ]
        ] 
        layout [
            orientation [
                characterOrder [! "right-to-left"]
            ]
        ] 
        characters [
            exemplarCharacters [! {[\u064F ء آ ؤ ئ ا ب پ ت ث ٹ ج چ ح خ د ذ ڈ ر ز ڑ ژ س ش ص ض ط ظ ع غ ف ق ک گ ل م ن ں ه ھ ہ و ی ے]}] 
            exemplarCharacters [#type "auxiliary" ! "[\u200E\u200F أ ٻ ة ٺ ټ ٽ]"] 
            exemplarCharacters [#type "index" #draft "unconfirmed" ! {[ء آ ؤ ئ ا ب پ ت ث ٹ ج چ ح خ د ذ ڈ ر ز ڑ ژ س ش ص ض ط ظ ع غ ف ق ک گ ل م ن ں ه ھ ہ و ی ے]}] 
            exemplarCharacters [#type "numbers" ! "[\u200E \- ‑ , . % ‰ + 0 1 2 3 4 5 6 7 8 9]"]
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
                            dateFormatItem [#id "HHmmss" ! "HH:mm:ss"] 
                            dateFormatItem [#id "Md" ! "d/M"] 
                            dateFormatItem [#id "ms" ! "mm:ss"] 
                            dateFormatItem [#id "yMMM" ! "MMM y"] 
                            dateFormatItem [#id "yQQQ" ! "QQQ y"]
                        ]
                    ]
                ] 
                calendar [
                    #type "gregorian" 
                    months [
                        monthContext [
                            #type "format" 
                            monthWidth [
                                #type "wide" 
                                month [#type "1" ! "جنوری"] 
                                month [#type "2" ! "فروری"] 
                                month [#type "3" ! "مارچ"] 
                                month [#type "4" ! "اپریل"] 
                                month [#type "5" ! "مئ"] 
                                month [#type "6" ! "جون"] 
                                month [#type "7" ! "جولائی"] 
                                month [#type "8" ! "اگست"] 
                                month [#type "9" ! "ستمبر"] 
                                month [#type "10" ! "اکتوبر"] 
                                month [#type "11" ! "نومبر"] 
                                month [#type "12" ! "دسمبر"]
                            ]
                        ]
                    ] 
                    days [
                        dayContext [
                            #type "format" 
                            dayWidth [
                                #type "wide" 
                                day [#type "sun" ! "اتوار"] 
                                day [#type "mon" ! "پیر"] 
                                day [#type "tue" ! "منگل"] 
                                day [#type "wed" ! "بُدھ"] 
                                day [#type "thu" ! "جمعرات"] 
                                day [#type "fri" ! "جمعہ"] 
                                day [#type "sat" ! "ہفتہ"]
                            ]
                        ]
                    ] 
                    quarters [
                        quarterContext [
                            #type "format" 
                            quarterWidth [
                                #type "wide" 
                                quarter [#type "1" ! "چوتھاي پہلاں"] 
                                quarter [#type "2" ! "چوتھاي دوجا"] 
                                quarter [#type "3" ! "چوتھاي تيجا"] 
                                quarter [#type "4" ! "چوتھاي چوتھا"]
                            ]
                        ]
                    ] 
                    eras [
                        eraNames [
                            era [#type "0" ! "ايساپورو"] 
                            era [#type "1" ! "سں"]
                        ] 
                        eraAbbr [
                            era [#type "0" ! "ايساپورو"] 
                            era [#type "1" ! "سں"]
                        ]
                    ] 
                    dateFormats [
                        dateFormatLength [
                            #type "full" 
                            dateFormat [
                                pattern [! "EEEE, dd MMMM y"] 
                                datetimeSkeleton [! "yMMMMEEEEdd"]
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
                            dateFormatItem [#id "HHmmss" ! "HH:mm:ss"] 
                            dateFormatItem [#id "Md" ! "d/M"] 
                            dateFormatItem [#id "mmss" ! "mm:ss"] 
                            dateFormatItem [#id "yMMM" ! "MMM y"] 
                            dateFormatItem [#id "yQQQ" ! "QQQ y"]
                        ]
                    ]
                ]
            ] 
            fields [
                field [
                    #type "year" 
                    displayName [! "ورھا"]
                ] 
                field [
                    #type "month" 
                    displayName [! "مہينا"]
                ] 
                field [
                    #type "week" 
                    displayName [! "ہفتہ"]
                ] 
                field [
                    #type "day" 
                    displayName [! "دئن"]
                ] 
                field [
                    #type "weekday" 
                    displayName [! "ہفتے دا دن"]
                ] 
                field [
                    #type "hour" 
                    displayName [! "گھنٹا"]
                ] 
                field [
                    #type "minute" 
                    displayName [! "منٹ"]
                ] 
                field [
                    #type "zone" 
                    displayName [! "ٹپہ"]
                ]
            ]
        ] 
        numbers [
            defaultNumberingSystem [! "arabext"] 
            otherNumberingSystems [
                native [! "arabext"]
            ] 
            symbols [
                #numberSystem "arabext" 
                timeSeparator [! ":"]
            ] 
            symbols [
                #numberSystem "latn" 
                plusSign [! "‎+"] 
                minusSign [! "‎-"]
            ] 
            currencyFormats [
                #numberSystem "latn" 
                currencyFormatLength [
                    #type "short" 
                    currencyFormat [
                        #type "standard" 
                        pattern [#type "1000" #count "one" #draft "provisional" ! "¤ 0K"] 
                        pattern [#type "1000" #count "other" #draft "provisional" ! "¤ 0K"] 
                        pattern [#type "10000" #count "one" #draft "provisional" ! "¤ 00K"] 
                        pattern [#type "10000" #count "other" #draft "provisional" ! "¤ 00K"] 
                        pattern [#type "100000" #count "one" #draft "provisional" ! "¤ 000K"] 
                        pattern [#type "100000" #count "other" #draft "provisional" ! "¤ 000K"] 
                        pattern [#type "1000000" #count "one" #draft "provisional" ! "¤ 0M"] 
                        pattern [#type "1000000" #count "other" #draft "provisional" ! "¤ 0M"] 
                        pattern [#type "10000000" #count "one" #draft "provisional" ! "¤ 00M"] 
                        pattern [#type "10000000" #count "other" #draft "provisional" ! "¤ 00M"] 
                        pattern [#type "100000000" #count "one" #draft "provisional" ! "¤ 000M"] 
                        pattern [#type "100000000" #count "other" #draft "provisional" ! "¤ 000M"] 
                        pattern [#type "1000000000" #count "one" #draft "provisional" ! "¤ 0G"] 
                        pattern [#type "1000000000" #count "other" #draft "provisional" ! "¤ 0G"] 
                        pattern [#type "10000000000" #count "one" #draft "provisional" ! "¤ 00G"] 
                        pattern [#type "10000000000" #count "other" #draft "provisional" ! "¤ 00G"] 
                        pattern [#type "100000000000" #count "one" #draft "provisional" ! "¤ 000G"] 
                        pattern [#type "100000000000" #count "other" #draft "provisional" ! "¤ 000G"] 
                        pattern [#type "1000000000000" #count "one" #draft "provisional" ! "¤ 0T"] 
                        pattern [#type "1000000000000" #count "other" #draft "provisional" ! "¤ 0T"] 
                        pattern [#type "10000000000000" #count "one" #draft "provisional" ! "¤ 00T"] 
                        pattern [#type "10000000000000" #count "other" #draft "provisional" ! "¤ 00T"] 
                        pattern [#type "100000000000000" #count "one" #draft "provisional" ! "¤ 000T"] 
                        pattern [#type "100000000000000" #count "other" #draft "provisional" ! "¤ 000T"]
                    ]
                ]
            ] 
            currencies [
                currency [
                    #type "EUR" 
                    displayName [! "يورو"]
                ] 
                currency [
                    #type "INR" 
                    displayName [! "روپئیہ [INR]"]
                ] 
                currency [
                    #type "PKR" 
                    displayName [! "روپئیہ"] 
                    symbol [! "ر"]
                ]
            ]
        ] 
        posix [
            messages [
                yesstr [! "ہاں"] 
                nostr [! "نہيں"]
            ]
        ]
    ]

