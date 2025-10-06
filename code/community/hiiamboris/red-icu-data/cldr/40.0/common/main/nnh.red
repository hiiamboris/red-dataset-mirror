
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "nnh"]
        ] 
        localeDisplayNames [
            languages [
                language [#type "bas" ! "Shwóŋò pʉa mbasǎ"] 
                language [#type "bax" ! "Shwóŋò pamom"] 
                language [#type "bbj" ! "Shwóŋò pʉa nzsekàʼa"] 
                language [#type "bfd" ! "Shwóŋò pafud"] 
                language [#type "bkm" ! "Shwóŋò pʉ̀a njinikom"] 
                language [#type "bss" ! "Shwóŋò pakɔsi"] 
                language [#type "bum" ! "Shwóŋò mbulu"] 
                language [#type "byv" ! "Shwóŋò ngáŋtÿɔʼ"] 
                language [#type "de" ! "nzǎmɔ̂ɔn"] 
                language [#type "en" ! "ngilísè"] 
                language [#type "ewo" ! "Shwóŋò pʉa Yɔɔnmendi"] 
                language [#type "ff" ! "Shwóŋò menkesaŋ"] 
                language [#type "fr" ! "felaŋsée"] 
                language [#type "kkj" ! "Shwóŋò pʉa shÿó Bɛgtùa"] 
                language [#type "nnh" ! "Shwóŋò ngiembɔɔn"] 
                language [#type "yav" ! "Shwóŋò pʉa shÿó Mbafìa"] 
                language [#type "ybb" ! "Shwóŋò Tsaŋ"]
            ] 
            territories [
                territory [#type "CM" ! "Kàmalûm"]
            ] 
            keys [
                key [#type "calendar" ! "fʉ̀ʼ njÿó"] 
                key [#type "currency" ! "nkáb"]
            ] 
            measurementSystemNames [
                measurementSystemName [#type "metric" ! "fʉ̀ʼʉ mmó"]
            ]
        ] 
        characters [
            exemplarCharacters [! {[a á à â ǎ b c d e é è ê ě ɛ {ɛ\u0301} {ɛ\u0300} {ɛ\u0302} {ɛ\u030C} f g h i í ì j k l m ḿ n ń ŋ o ó ò ô ǒ ɔ {ɔ\u0301} {ɔ\u0300} {ɔ\u0302} {ɔ\u030C} p {pf} s {sh} t {ts} u ú ù û ǔ ʉ {ʉ\u0301} {ʉ\u0300} {ʉ\u0302} {ʉ\u030C} v w ẅ y ÿ z ʼ]}] 
            exemplarCharacters [#type "auxiliary" ! "[q r x]"] 
            exemplarCharacters [#type "index" ! {[A B C D E Ɛ F G H I J K L M N Ŋ O Ɔ P {Pf} R S {Sh} T {Ts} U Ʉ V W Ẅ Y Ÿ Z ʼ]}] 
            exemplarCharacters [#type "numbers" ! "[\- ‑ , . % ‰ + 0 1 2 3 4 5 6 7 8 9]"] 
            exemplarCharacters [#type "punctuation" ! "[, ; \: ! ? . ' ‘ ’ « »]"]
        ] 
        delimiters [
            quotationStart [! "«"] 
            quotationEnd [! "»"] 
            alternateQuotationStart [! "“"] 
            alternateQuotationEnd [! "”"]
        ] 
        dates [
            calendars [
                calendar [
                    #type "generic" 
                    dateFormats [
                        dateFormatLength [
                            #type "full" 
                            dateFormat [
                                pattern [! "EEEE , 'lyɛ'̌ʼ d 'na' MMMM, y G"] 
                                datetimeSkeleton [! "GyMMMMEEEEd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "long" 
                            dateFormat [
                                pattern [! "'lyɛ'̌ʼ d 'na' MMMM, y G"] 
                                datetimeSkeleton [! "GyMMMMd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "medium" 
                            dateFormat [
                                pattern [! "d MMM, y G"] 
                                datetimeSkeleton [! "GyMMMd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "dd/MM/yy GGGGG"] 
                                datetimeSkeleton [! "GGGGGyyMMdd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        dateTimeFormatLength [
                            #type "full" 
                            dateTimeFormat [
                                pattern [! "{1},{0}"]
                            ]
                        ] 
                        dateTimeFormatLength [
                            #type "long" 
                            dateTimeFormat [
                                pattern [! "{1}, {0}"]
                            ]
                        ] 
                        availableFormats [
                            dateFormatItem [#id "yMd" ! "d/M/y"] 
                            dateFormatItem [#id "yMEd" ! "E , 'lyɛ'̌ʼ d 'na' M, y"] 
                            dateFormatItem [#id "yMMM" ! "MMM y"] 
                            dateFormatItem [#id "yMMMd" ! "'lyɛ'̌ʼ d 'na' MMMM, y"] 
                            dateFormatItem [#id "yMMMEd" ! "E , 'lyɛ'̌ʼ d 'na' MMM, y"]
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
                                month [#type "1" ! "saŋ tsetsɛ̀ɛ lùm"] 
                                month [#type "2" ! "saŋ kàg ngwóŋ"] 
                                month [#type "3" ! "saŋ lepyè shúm"] 
                                month [#type "4" ! "saŋ cÿó"] 
                                month [#type "5" ! "saŋ tsɛ̀ɛ cÿó"] 
                                month [#type "6" ! "saŋ njÿoláʼ"] 
                                month [#type "7" ! "saŋ tyɛ̀b tyɛ̀b mbʉ̀ŋ"] 
                                month [#type "8" ! "saŋ mbʉ̀ŋ"] 
                                month [#type "9" ! "saŋ ngwɔ̀ʼ mbÿɛ"] 
                                month [#type "10" ! "saŋ tàŋa tsetsáʼ"] 
                                month [#type "11" ! "saŋ mejwoŋó"] 
                                month [#type "12" ! "saŋ lùm"]
                            ] 
                            monthWidth [
                                #type "wide" 
                                month [#type "1" ! "saŋ tsetsɛ̀ɛ lùm"] 
                                month [#type "2" ! "saŋ kàg ngwóŋ"] 
                                month [#type "3" ! "saŋ lepyè shúm"] 
                                month [#type "4" ! "saŋ cÿó"] 
                                month [#type "5" ! "saŋ tsɛ̀ɛ cÿó"] 
                                month [#type "6" ! "saŋ njÿoláʼ"] 
                                month [#type "7" ! "saŋ tyɛ̀b tyɛ̀b mbʉ̀ŋ"] 
                                month [#type "8" ! "saŋ mbʉ̀ŋ"] 
                                month [#type "9" ! "saŋ ngwɔ̀ʼ mbÿɛ"] 
                                month [#type "10" ! "saŋ tàŋa tsetsáʼ"] 
                                month [#type "11" ! "saŋ mejwoŋó"] 
                                month [#type "12" ! "saŋ lùm"]
                            ]
                        ] 
                        monthContext [
                            #type "stand-alone" 
                            monthWidth [
                                #type "abbreviated" 
                                month [#type "1" ! "saŋ tsetsɛ̀ɛ lùm"] 
                                month [#type "2" ! "saŋ kàg ngwóŋ"] 
                                month [#type "3" ! "saŋ lepyè shúm"] 
                                month [#type "4" ! "saŋ cÿó"] 
                                month [#type "5" ! "saŋ tsɛ̀ɛ cÿó"] 
                                month [#type "6" ! "saŋ njÿoláʼ"] 
                                month [#type "7" ! "saŋ tyɛ̀b tyɛ̀b mbʉ̀ŋ"] 
                                month [#type "8" ! "saŋ mbʉ̀ŋ"] 
                                month [#type "9" ! "saŋ ngwɔ̀ʼ mbÿɛ"] 
                                month [#type "10" ! "saŋ tàŋa tsetsáʼ"] 
                                month [#type "11" ! "saŋ mejwoŋó"] 
                                month [#type "12" ! "saŋ lùm"]
                            ] 
                            monthWidth [
                                #type "wide" 
                                month [#type "1" ! "saŋ tsetsɛ̀ɛ lùm"] 
                                month [#type "2" ! "saŋ kàg ngwóŋ"] 
                                month [#type "3" ! "saŋ lepyè shúm"] 
                                month [#type "4" ! "saŋ cÿó"] 
                                month [#type "5" ! "saŋ tsɛ̀ɛ cÿó"] 
                                month [#type "6" ! "saŋ njÿoláʼ"] 
                                month [#type "7" ! "saŋ tyɛ̀b tyɛ̀b mbʉ̀ŋ"] 
                                month [#type "8" ! "saŋ mbʉ̀ŋ"] 
                                month [#type "9" ! "saŋ ngwɔ̀ʼ mbÿɛ"] 
                                month [#type "10" ! "saŋ tàŋa tsetsáʼ"] 
                                month [#type "11" ! "saŋ mejwoŋó"] 
                                month [#type "12" ! "saŋ lùm"]
                            ]
                        ]
                    ] 
                    days [
                        dayContext [
                            #type "format" 
                            dayWidth [
                                #type "abbreviated" 
                                day [#type "sun" ! "lyɛʼɛ́ sẅíŋtè"] 
                                day [#type "mon" ! "mvfò lyɛ̌ʼ"] 
                                day [#type "tue" ! "mbɔ́ɔntè mvfò lyɛ̌ʼ"] 
                                day [#type "wed" ! "tsètsɛ̀ɛ lyɛ̌ʼ"] 
                                day [#type "thu" ! "mbɔ́ɔntè tsetsɛ̀ɛ lyɛ̌ʼ"] 
                                day [#type "fri" ! "mvfò màga lyɛ̌ʼ"] 
                                day [#type "sat" ! "màga lyɛ̌ʼ"]
                            ] 
                            dayWidth [
                                #type "short" 
                                day [#type "sun" ! "lyɛʼɛ́ sẅíŋtè"] 
                                day [#type "mon" ! "mvfò lyɛ̌ʼ"] 
                                day [#type "tue" ! "mbɔ́ɔntè mvfò lyɛ̌ʼ"] 
                                day [#type "wed" ! "tsètsɛ̀ɛ lyɛ̌ʼ"] 
                                day [#type "thu" ! "mbɔ́ɔntè tsetsɛ̀ɛ lyɛ̌ʼ"] 
                                day [#type "fri" ! "mvfò màga lyɛ̌ʼ"] 
                                day [#type "sat" ! "màga lyɛ̌ʼ"]
                            ] 
                            dayWidth [
                                #type "wide" 
                                day [#type "sun" ! "lyɛʼɛ́ sẅíŋtè"] 
                                day [#type "mon" ! "mvfò lyɛ̌ʼ"] 
                                day [#type "tue" ! "mbɔ́ɔntè mvfò lyɛ̌ʼ"] 
                                day [#type "wed" ! "tsètsɛ̀ɛ lyɛ̌ʼ"] 
                                day [#type "thu" ! "mbɔ́ɔntè tsetsɛ̀ɛ lyɛ̌ʼ"] 
                                day [#type "fri" ! "mvfò màga lyɛ̌ʼ"] 
                                day [#type "sat" ! "màga lyɛ̌ʼ"]
                            ]
                        ] 
                        dayContext [
                            #type "stand-alone" 
                            dayWidth [
                                #type "abbreviated" 
                                day [#type "sun" ! "lyɛʼɛ́ sẅíŋtè"] 
                                day [#type "mon" ! "mvfò lyɛ̌ʼ"] 
                                day [#type "tue" ! "mbɔ́ɔntè mvfò lyɛ̌ʼ"] 
                                day [#type "wed" ! "tsètsɛ̀ɛ lyɛ̌ʼ"] 
                                day [#type "thu" ! "mbɔ́ɔntè tsetsɛ̀ɛ lyɛ̌ʼ"] 
                                day [#type "fri" ! "mvfò màga lyɛ̌ʼ"] 
                                day [#type "sat" ! "màga lyɛ̌ʼ"]
                            ] 
                            dayWidth [
                                #type "short" 
                                day [#type "sun" ! "lyɛʼɛ́ sẅíŋtè"] 
                                day [#type "mon" ! "mvfò lyɛ̌ʼ"] 
                                day [#type "tue" ! "mbɔ́ɔntè mvfò lyɛ̌ʼ"] 
                                day [#type "wed" ! "tsètsɛ̀ɛ lyɛ̌ʼ"] 
                                day [#type "thu" ! "mbɔ́ɔntè tsetsɛ̀ɛ lyɛ̌ʼ"] 
                                day [#type "fri" ! "mvfò màga lyɛ̌ʼ"] 
                                day [#type "sat" ! "màga lyɛ̌ʼ"]
                            ] 
                            dayWidth [
                                #type "wide" 
                                day [#type "sun" ! "lyɛʼɛ́ sẅíŋtè"] 
                                day [#type "mon" ! "mvfò lyɛ̌ʼ"] 
                                day [#type "tue" ! "mbɔ́ɔntè mvfò lyɛ̌ʼ"] 
                                day [#type "wed" ! "tsètsɛ̀ɛ lyɛ̌ʼ"] 
                                day [#type "thu" ! "mbɔ́ɔntè tsetsɛ̀ɛ lyɛ̌ʼ"] 
                                day [#type "fri" ! "mvfò màga lyɛ̌ʼ"] 
                                day [#type "sat" ! "màga lyɛ̌ʼ"]
                            ]
                        ]
                    ] 
                    dayPeriods [
                        dayPeriodContext [
                            #type "format" 
                            dayPeriodWidth [
                                #type "abbreviated" 
                                dayPeriod [#type "am" ! "mbaʼámbaʼ"] 
                                dayPeriod [#type "pm" ! "ncwònzém"]
                            ] 
                            dayPeriodWidth [
                                #type "wide" 
                                dayPeriod [#type "am" ! "mbaʼámbaʼ"] 
                                dayPeriod [#type "pm" ! "ncwònzém"]
                            ]
                        ]
                    ] 
                    eras [
                        eraNames [
                            era [#type "0" ! "mé zyé Yěsô"] 
                            era [#type "1" ! "mé gÿo ńzyé Yěsô"]
                        ] 
                        eraAbbr [
                            era [#type "0" ! "m.z.Y."] 
                            era [#type "1" ! "m.g.n.Y."]
                        ]
                    ] 
                    dateFormats [
                        dateFormatLength [
                            #type "full" 
                            dateFormat [
                                pattern [! "EEEE , 'lyɛ'̌ʼ d 'na' MMMM, y"] 
                                datetimeSkeleton [! "yMMMMEEEEd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "long" 
                            dateFormat [
                                pattern [! "'lyɛ'̌ʼ d 'na' MMMM, y"] 
                                datetimeSkeleton [! "yMMMMd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "medium" 
                            dateFormat [
                                pattern [! "d MMM, y"] 
                                datetimeSkeleton [! "yMMMd"]
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
                    dateTimeFormats [
                        dateTimeFormatLength [
                            #type "full" 
                            dateTimeFormat [
                                pattern [! "{1},{0}"]
                            ]
                        ] 
                        dateTimeFormatLength [
                            #type "long" 
                            dateTimeFormat [
                                pattern [! "{1}, {0}"]
                            ]
                        ] 
                        availableFormats [
                            dateFormatItem [#id "yMd" ! "d/M/y"] 
                            dateFormatItem [#id "yMEd" ! "E , 'lyɛ'̌ʼ d 'na' M, y"] 
                            dateFormatItem [#id "yMMM" ! "MMM y"] 
                            dateFormatItem [#id "yMMMd" ! "'lyɛ'̌ʼ d 'na' MMMM, y"] 
                            dateFormatItem [#id "yMMMEd" ! "E , 'lyɛ'̌ʼ d 'na' MMM, y"]
                        ]
                    ]
                ]
            ] 
            fields [
                field [
                    #type "era" 
                    displayName [! "tsɔ́ fʉ̀ʼ"]
                ] 
                field [
                    #type "year" 
                    displayName [! "ngùʼ"]
                ] 
                field [
                    #type "day" 
                    displayName [! "lyɛ̌ʼ"] 
                    relative [#type "-1" ! "jǔɔ gẅie à ka tɔ̌g"] 
                    relative [#type "0" ! "lyɛ̌ʼɔɔn"] 
                    relative [#type "1" ! "jǔɔ gẅie à ne ntóo"]
                ] 
                field [
                    #type "weekday" 
                    displayName [! "ngàba láʼ"]
                ] 
                field [
                    #type "hour" 
                    displayName [! "fʉ̀ʼ nèm"]
                ]
            ]
        ] 
        numbers [
            symbols [
                #numberSystem "latn" 
                decimal [! ","] 
                group [! "."] 
                list [! ";"] 
                percentSign [! "%"]
            ] 
            decimalFormats [
                #numberSystem "latn" 
                decimalFormatLength [
                    decimalFormat [
                        pattern [! "#,##0.###"]
                    ]
                ]
            ] 
            currencyFormats [
                #numberSystem "latn" 
                currencyFormatLength [
                    currencyFormat [
                        #type "standard" 
                        pattern [! "¤ #,##0.00"]
                    ]
                ] 
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
                    #type "XAF" 
                    displayName [! "feláŋ CFA"] 
                    symbol [! "FCFA"]
                ]
            ]
        ]
    ]

