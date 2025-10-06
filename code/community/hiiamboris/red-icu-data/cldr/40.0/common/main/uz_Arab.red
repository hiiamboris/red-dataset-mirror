
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "uz"] 
            script [#type "Arab"]
        ] 
        localeDisplayNames [
            languages [
                language [#type "fa" ! "دری"] 
                language [#type "ps" ! "پشتو"] 
                language [#type "uz" ! "اوزبیک"]
            ] 
            scripts [
                script [#type "Arab" #draft "contributed" ! "عربی"]
            ] 
            territories [
                territory [#type "AF" ! "افغانستان"]
            ]
        ] 
        layout [
            orientation [
                characterOrder [! "right-to-left"]
            ]
        ] 
        characters [
            exemplarCharacters [! {[\u064B \u064C \u064D \u064E \u064F \u0650 \u0651 \u0652 \u0654 \u0670 ء آ أ ؤ ئ ا ب پ ة ت ث ج چ ح خ د ذ ر ز ژ س ش ص ض ط ظ ع غ ف ق ک گ ل م ن ه و ۇ ۉ ی]}] 
            exemplarCharacters [#type "auxiliary" ! {[\u200C\u200D\u200E\u200F ټ ځ څ ډ ړ ږ ښ ګ ڼ ي ۍ ې]}] 
            exemplarCharacters [#type "index" #draft "unconfirmed" ! {[ء آ أ ؤ ئ ا ب پ ة ت ث ټ ج چ ح خ ځ څ د ذ ډ ر ز ړ ږ ژ س ش ښ ص ض ط ظ ع غ ف ق ک ګ گ ل م ن ڼ ه و ۇ ۉ ي ی ۍ ې]}] 
            exemplarCharacters [#type "numbers" ! {[\u200E \- ‑ , ٫ ٬ . % ٪ ‰ ؉ + − 0۰ 1۱ 2۲ 3۳ 4۴ 5۵ 6۶ 7۷ 8۸ 9۹]}]
        ] 
        dates [
            calendars [
                calendar [
                    #type "generic" 
                    dateFormats [
                        dateFormatLength [
                            #type "full" 
                            dateFormat [
                                pattern [#draft "unconfirmed" ! "G y نچی ییل d نچی MMMM EEEE کونی"] 
                                datetimeSkeleton [#draft "unconfirmed" ! "GyMMMMEEEEd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "long" 
                            dateFormat [
                                pattern [#draft "unconfirmed" ! "d نچی MMMM y G"] 
                                datetimeSkeleton [#draft "unconfirmed" ! "GyMMMMd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "medium" 
                            dateFormat [
                                pattern [#draft "unconfirmed" ! "d MMM y G"] 
                                datetimeSkeleton [#draft "unconfirmed" ! "GyMMMd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [#draft "unconfirmed" ! "GGGGG y/M/d"] 
                                datetimeSkeleton [#draft "unconfirmed" ! "GGGGGyMd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "Md" #draft "unconfirmed" ! "M/d"] 
                            dateFormatItem [#id "MMMMd" #draft "unconfirmed" ! "d نچی MMMM"]
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
                                month [#type "1" #draft "contributed" ! "جنو"] 
                                month [#type "2" #draft "contributed" ! "فبر"] 
                                month [#type "3" #draft "contributed" ! "مار"] 
                                month [#type "4" #draft "contributed" ! "اپر"] 
                                month [#type "5" #draft "contributed" ! "می"] 
                                month [#type "6" #draft "contributed" ! "جون"] 
                                month [#type "7" #draft "contributed" ! "جول"] 
                                month [#type "8" #draft "contributed" ! "اگس"] 
                                month [#type "9" #draft "contributed" ! "سپت"] 
                                month [#type "10" #draft "contributed" ! "اکت"] 
                                month [#type "11" #draft "contributed" ! "نوم"] 
                                month [#type "12" #draft "contributed" ! "دسم"]
                            ] 
                            monthWidth [
                                #type "wide" 
                                month [#type "1" #draft "contributed" ! "جنوری"] 
                                month [#type "2" #draft "contributed" ! "فبروری"] 
                                month [#type "3" #draft "contributed" ! "مارچ"] 
                                month [#type "4" #draft "contributed" ! "اپریل"] 
                                month [#type "5" #draft "contributed" ! "می"] 
                                month [#type "6" #draft "contributed" ! "جون"] 
                                month [#type "7" #draft "contributed" ! "جولای"] 
                                month [#type "8" #draft "contributed" ! "اگست"] 
                                month [#type "9" #draft "contributed" ! "سپتمبر"] 
                                month [#type "10" #draft "contributed" ! "اکتوبر"] 
                                month [#type "11" #draft "contributed" ! "نومبر"] 
                                month [#type "12" #draft "contributed" ! "دسمبر"]
                            ]
                        ]
                    ] 
                    days [
                        dayContext [
                            #type "format" 
                            dayWidth [
                                #type "abbreviated" 
                                day [#type "sun" #draft "contributed" ! "ی."] 
                                day [#type "mon" #draft "contributed" ! "د."] 
                                day [#type "tue" #draft "contributed" ! "س."] 
                                day [#type "wed" #draft "contributed" ! "چ."] 
                                day [#type "thu" #draft "contributed" ! "پ."] 
                                day [#type "fri" #draft "contributed" ! "ج."] 
                                day [#type "sat" #draft "contributed" ! "ش."]
                            ] 
                            dayWidth [
                                #type "wide" 
                                day [#type "sun" #draft "contributed" ! "یکشنبه"] 
                                day [#type "mon" #draft "contributed" ! "دوشنبه"] 
                                day [#type "tue" #draft "contributed" ! "سه‌شنبه"] 
                                day [#type "wed" #draft "contributed" ! "چهارشنبه"] 
                                day [#type "thu" #draft "contributed" ! "پنجشنبه"] 
                                day [#type "fri" #draft "contributed" ! "جمعه"] 
                                day [#type "sat" #draft "contributed" ! "شنبه"]
                            ]
                        ]
                    ] 
                    eras [
                        eraAbbr [
                            era [#type "0" #draft "unconfirmed" ! "ق.م."] 
                            era [#type "1" #draft "unconfirmed" ! "م."]
                        ]
                    ] 
                    dateFormats [
                        dateFormatLength [
                            #type "full" 
                            dateFormat [
                                pattern [#draft "unconfirmed" ! "y نچی ییل d نچی MMMM EEEE کونی"] 
                                datetimeSkeleton [#draft "unconfirmed" ! "yMMMMEEEEd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "long" 
                            dateFormat [
                                pattern [#draft "unconfirmed" ! "d نچی MMMM y"] 
                                datetimeSkeleton [#draft "unconfirmed" ! "yMMMMd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "medium" 
                            dateFormat [
                                pattern [#draft "unconfirmed" ! "d MMM y"] 
                                datetimeSkeleton [#draft "unconfirmed" ! "yMMMd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [#draft "unconfirmed" ! "y/M/d"] 
                                datetimeSkeleton [#draft "unconfirmed" ! "yMd"]
                            ]
                        ]
                    ] 
                    timeFormats [
                        timeFormatLength [
                            #type "full" 
                            timeFormat [
                                pattern [#draft "unconfirmed" ! "H:mm:ss (zzzz)"] 
                                datetimeSkeleton [#draft "unconfirmed" ! "Hmmsszzzz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "long" 
                            timeFormat [
                                pattern [#draft "unconfirmed" ! "H:mm:ss (z)"] 
                                datetimeSkeleton [#draft "unconfirmed" ! "Hmmssz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "medium" 
                            timeFormat [
                                pattern [#draft "unconfirmed" ! "H:mm:ss"] 
                                datetimeSkeleton [#draft "unconfirmed" ! "Hmmss"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "short" 
                            timeFormat [
                                pattern [#draft "unconfirmed" ! "H:mm"] 
                                datetimeSkeleton [#draft "unconfirmed" ! "Hmm"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "Md" #draft "unconfirmed" ! "M/d"] 
                            dateFormatItem [#id "MMMMd" #draft "unconfirmed" ! "d نچی MMMM"]
                        ]
                    ]
                ]
            ] 
            timeZoneNames [
                zone [
                    #type "Asia/Kabul" 
                    exemplarCity [! "کابل"]
                ] 
                metazone [
                    #type "Afghanistan" 
                    long [
                        standard [#draft "unconfirmed" ! "افغانستان وقتی"]
                    ]
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
                decimal [! "٫"] 
                group [! "٬"] 
                percentSign [! "٪"] 
                exponential [! "×۱۰^^"] 
                timeSeparator [! ":"]
            ] 
            symbols [
                #numberSystem "latn" 
                decimal [! ","] 
                group [! "."] 
                plusSign [! "‎+"] 
                minusSign [! "‎−"]
            ] 
            currencyFormats [
                #numberSystem "latn" 
                currencyFormatLength [
                    currencyFormat [
                        #type "standard" 
                        pattern [#draft "unconfirmed" ! "#,##0.00 ¤"]
                    ]
                ] 
                currencyFormatLength [
                    #type "short" 
                    currencyFormat [
                        #type "standard" 
                        pattern [#type "1000" #count "one" #draft "provisional" ! "0K ¤"] 
                        pattern [#type "1000" #count "other" #draft "provisional" ! "0K ¤"] 
                        pattern [#type "10000" #count "one" #draft "provisional" ! "00K ¤"] 
                        pattern [#type "10000" #count "other" #draft "provisional" ! "00K ¤"] 
                        pattern [#type "100000" #count "one" #draft "provisional" ! "000K ¤"] 
                        pattern [#type "100000" #count "other" #draft "provisional" ! "000K ¤"] 
                        pattern [#type "1000000" #count "one" #draft "provisional" ! "0M ¤"] 
                        pattern [#type "1000000" #count "other" #draft "provisional" ! "0M ¤"] 
                        pattern [#type "10000000" #count "one" #draft "provisional" ! "00M ¤"] 
                        pattern [#type "10000000" #count "other" #draft "provisional" ! "00M ¤"] 
                        pattern [#type "100000000" #count "one" #draft "provisional" ! "000M ¤"] 
                        pattern [#type "100000000" #count "other" #draft "provisional" ! "000M ¤"] 
                        pattern [#type "1000000000" #count "one" #draft "provisional" ! "0G ¤"] 
                        pattern [#type "1000000000" #count "other" #draft "provisional" ! "0G ¤"] 
                        pattern [#type "10000000000" #count "one" #draft "provisional" ! "00G ¤"] 
                        pattern [#type "10000000000" #count "other" #draft "provisional" ! "00G ¤"] 
                        pattern [#type "100000000000" #count "one" #draft "provisional" ! "000G ¤"] 
                        pattern [#type "100000000000" #count "other" #draft "provisional" ! "000G ¤"] 
                        pattern [#type "1000000000000" #count "one" #draft "provisional" ! "0T ¤"] 
                        pattern [#type "1000000000000" #count "other" #draft "provisional" ! "0T ¤"] 
                        pattern [#type "10000000000000" #count "one" #draft "provisional" ! "00T ¤"] 
                        pattern [#type "10000000000000" #count "other" #draft "provisional" ! "00T ¤"] 
                        pattern [#type "100000000000000" #count "one" #draft "provisional" ! "000T ¤"] 
                        pattern [#type "100000000000000" #count "other" #draft "provisional" ! "000T ¤"]
                    ]
                ]
            ] 
            currencies [
                currency [
                    #type "AFN" 
                    displayName [! "افغانی"] 
                    symbol [! "؋"]
                ]
            ]
        ]
    ]

