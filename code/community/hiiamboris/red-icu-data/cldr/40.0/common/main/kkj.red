
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "kkj"]
        ] 
        localeDisplayNames [
            languages [
                language [#type "en" ! "yaman"] 
                language [#type "fr" ! "numbu buy"] 
                language [#type "kkj" ! "kakɔ"]
            ] 
            territories [
                territory [#type "CM" ! "Kamɛrun"]
            ]
        ] 
        characters [
            exemplarCharacters [! {[a á à â {a\u0327} b ɓ c d ɗ {ɗy} e é è ê ɛ {ɛ\u0301} {ɛ\u0300} {ɛ\u0302} {ɛ\u0327} f g {gb} {gw} h i í ì î {i\u0327} j k {kp} {kw} l m {mb} n {nd} ǌ {ny} ŋ {ŋg} {ŋgb} {ŋgw} o ó ò ô ɔ {ɔ\u0301} {ɔ\u0300} {ɔ\u0302} {ɔ\u0327} p r s t u ú ù û {u\u0327} v w y]}] 
            exemplarCharacters [#type "auxiliary" ! "[q x z]"] 
            exemplarCharacters [#type "index" ! {[A B Ɓ C D Ɗ {Ɗy} E Ɛ F G {Gb} {Gw} H I {I\u0327} J K {Kp} {Kw} L M {Mb} N {Nd} ǋ {Ny} Ŋ {Ŋg} {Ŋgb} {Ŋgw} O Ɔ {Ɔ\u0327} P R S T U {U\u0327} V W Y]}] 
            exemplarCharacters [#type "numbers" ! "[\- ‑ , . % ‰ + 0 1 2 3 4 5 6 7 8 9]"] 
            exemplarCharacters [#type "punctuation" ! "[, \: ! ? . … ‘ ‹ › “ ” « » ( ) *]"]
        ] 
        delimiters [
            quotationStart [! "«"] 
            quotationEnd [! "»"] 
            alternateQuotationStart [! "‹"] 
            alternateQuotationEnd [! "›"]
        ] 
        dates [
            calendars [
                calendar [
                    #type "generic" 
                    dateFormats [
                        dateFormatLength [
                            #type "full" 
                            dateFormat [
                                pattern [! "EEEE dd MMMM y G"] 
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
                                pattern [! "dd/MM y GGGGG"] 
                                datetimeSkeleton [! "GGGGGyMMdd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        dateTimeFormatLength [
                            #type "full" 
                            dateTimeFormat [
                                pattern [! "{1} {0}"]
                            ]
                        ] 
                        dateTimeFormatLength [
                            #type "long" 
                            dateTimeFormat [
                                pattern [! "{1} {0}"]
                            ]
                        ] 
                        dateTimeFormatLength [
                            #type "medium" 
                            dateTimeFormat [
                                pattern [! "{1} {0}"]
                            ]
                        ] 
                        dateTimeFormatLength [
                            #type "short" 
                            dateTimeFormat [
                                pattern [! "{1} {0}"]
                            ]
                        ] 
                        availableFormats [
                            dateFormatItem [#id "Ed" ! "E d"] 
                            dateFormatItem [#id "Gy" ! "y G"] 
                            dateFormatItem [#id "GyMMM" ! "MMM y G"] 
                            dateFormatItem [#id "GyMMMd" ! "d MMM y G"] 
                            dateFormatItem [#id "GyMMMEd" ! "E d MMM y G"] 
                            dateFormatItem [#id "Md" ! "dd/MM"] 
                            dateFormatItem [#id "MEd" ! "E dd/MM"] 
                            dateFormatItem [#id "MMMd" ! "d MMM"] 
                            dateFormatItem [#id "MMMEd" ! "E d MMM"] 
                            dateFormatItem [#id "yyyyM" ! "MM y GGGGG"] 
                            dateFormatItem [#id "yyyyMd" ! "dd/MM y GGGGG"] 
                            dateFormatItem [#id "yyyyMEd" ! "E dd/MM y GGGGG"] 
                            dateFormatItem [#id "yyyyMMM" ! "MMM y G"] 
                            dateFormatItem [#id "yyyyMMMd" ! "d MMM y G"] 
                            dateFormatItem [#id "yyyyMMMEd" ! "E d MMM y G"]
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
                                month [#type "1" ! "pamba"] 
                                month [#type "2" ! "wanja"] 
                                month [#type "3" ! "mbiyɔ mɛndoŋgɔ"] 
                                month [#type "4" ! "Nyɔlɔmbɔŋgɔ"] 
                                month [#type "5" ! "Mɔnɔ ŋgbanja"] 
                                month [#type "6" ! "Nyaŋgwɛ ŋgbanja"] 
                                month [#type "7" ! "kuŋgwɛ"] 
                                month [#type "8" ! "fɛ"] 
                                month [#type "9" ! "njapi"] 
                                month [#type "10" ! "nyukul"] 
                                month [#type "11" ! "M11"] 
                                month [#type "12" ! "ɓulɓusɛ"]
                            ]
                        ] 
                        monthContext [
                            #type "stand-alone" 
                            monthWidth [
                                #type "wide" 
                                month [#type "1" ! "pamba"] 
                                month [#type "2" ! "wanja"] 
                                month [#type "3" ! "mbiyɔ mɛndoŋgɔ"] 
                                month [#type "4" ! "Nyɔlɔmbɔŋgɔ"] 
                                month [#type "5" ! "Mɔnɔ ŋgbanja"] 
                                month [#type "6" ! "Nyaŋgwɛ ŋgbanja"] 
                                month [#type "7" ! "kuŋgwɛ"] 
                                month [#type "8" ! "fɛ"] 
                                month [#type "9" ! "njapi"] 
                                month [#type "10" ! "nyukul"] 
                                month [#type "11" ! "M11"] 
                                month [#type "12" ! "ɓulɓusɛ"]
                            ]
                        ]
                    ] 
                    days [
                        dayContext [
                            #type "format" 
                            dayWidth [
                                #type "abbreviated" 
                                day [#type "sun" ! "sɔndi"] 
                                day [#type "mon" ! "lundi"] 
                                day [#type "tue" ! "mardi"] 
                                day [#type "wed" ! "mɛrkɛrɛdi"] 
                                day [#type "thu" ! "yedi"] 
                                day [#type "fri" ! "vaŋdɛrɛdi"] 
                                day [#type "sat" ! "mɔnɔ sɔndi"]
                            ] 
                            dayWidth [
                                #type "narrow" 
                                day [#type "sun" ! "so"] 
                                day [#type "mon" ! "lu"] 
                                day [#type "tue" ! "ma"] 
                                day [#type "wed" ! "mɛ"] 
                                day [#type "thu" ! "ye"] 
                                day [#type "fri" ! "va"] 
                                day [#type "sat" ! "ms"]
                            ] 
                            dayWidth [
                                #type "short" 
                                day [#type "sun" ! "sɔndi"] 
                                day [#type "mon" ! "lundi"] 
                                day [#type "tue" ! "mardi"] 
                                day [#type "wed" ! "mɛrkɛrɛdi"] 
                                day [#type "thu" ! "yedi"] 
                                day [#type "fri" ! "vaŋdɛrɛdi"] 
                                day [#type "sat" ! "mɔnɔ sɔndi"]
                            ] 
                            dayWidth [
                                #type "wide" 
                                day [#type "sun" ! "sɔndi"] 
                                day [#type "mon" ! "lundi"] 
                                day [#type "tue" ! "mardi"] 
                                day [#type "wed" ! "mɛrkɛrɛdi"] 
                                day [#type "thu" ! "yedi"] 
                                day [#type "fri" ! "vaŋdɛrɛdi"] 
                                day [#type "sat" ! "mɔnɔ sɔndi"]
                            ]
                        ] 
                        dayContext [
                            #type "stand-alone" 
                            dayWidth [
                                #type "abbreviated" 
                                day [#type "sun" ! "sɔndi"] 
                                day [#type "mon" ! "lundi"] 
                                day [#type "tue" ! "mardi"] 
                                day [#type "wed" ! "mɛrkɛrɛdi"] 
                                day [#type "thu" ! "yedi"] 
                                day [#type "fri" ! "vaŋdɛrɛdi"] 
                                day [#type "sat" ! "mɔnɔ sɔndi"]
                            ] 
                            dayWidth [
                                #type "narrow" 
                                day [#type "sun" ! "so"] 
                                day [#type "mon" ! "lu"] 
                                day [#type "tue" ! "ma"] 
                                day [#type "wed" ! "mɛ"] 
                                day [#type "thu" ! "ye"] 
                                day [#type "fri" ! "va"] 
                                day [#type "sat" ! "ms"]
                            ] 
                            dayWidth [
                                #type "short" 
                                day [#type "sun" ! "so"] 
                                day [#type "mon" ! "lu"] 
                                day [#type "tue" ! "ma"] 
                                day [#type "wed" ! "mɛ"] 
                                day [#type "thu" ! "ye"] 
                                day [#type "fri" ! "va"] 
                                day [#type "sat" ! "ms"]
                            ] 
                            dayWidth [
                                #type "wide" 
                                day [#type "sun" ! "sɔndi"] 
                                day [#type "mon" ! "lundi"] 
                                day [#type "tue" ! "mardi"] 
                                day [#type "wed" ! "mɛrkɛrɛdi"] 
                                day [#type "thu" ! "yedi"] 
                                day [#type "fri" ! "vaŋdɛrɛdi"] 
                                day [#type "sat" ! "mɔnɔ sɔndi"]
                            ]
                        ]
                    ] 
                    dateFormats [
                        dateFormatLength [
                            #type "full" 
                            dateFormat [
                                pattern [! "EEEE dd MMMM y"] 
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
                                pattern [! "dd/MM y"] 
                                datetimeSkeleton [! "yMMdd"]
                            ]
                        ]
                    ] 
                    timeFormats [
                        timeFormatLength [
                            #type "medium" 
                            timeFormat [
                                pattern [! "HH:mm:ss"] 
                                datetimeSkeleton [! "HHmmss"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "short" 
                            timeFormat [
                                pattern [! "HH:mm"] 
                                datetimeSkeleton [! "HHmm"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        dateTimeFormatLength [
                            #type "full" 
                            dateTimeFormat [
                                pattern [! "{1} {0}"]
                            ]
                        ] 
                        dateTimeFormatLength [
                            #type "long" 
                            dateTimeFormat [
                                pattern [! "{1} {0}"]
                            ]
                        ] 
                        dateTimeFormatLength [
                            #type "medium" 
                            dateTimeFormat [
                                pattern [! "{1} {0}"]
                            ]
                        ] 
                        dateTimeFormatLength [
                            #type "short" 
                            dateTimeFormat [
                                pattern [! "{1} {0}"]
                            ]
                        ] 
                        availableFormats [
                            dateFormatItem [#id "Ed" ! "E d"] 
                            dateFormatItem [#id "Gy" ! "y G"] 
                            dateFormatItem [#id "GyMMM" ! "MMM y G"] 
                            dateFormatItem [#id "GyMMMd" ! "d MMM y G"] 
                            dateFormatItem [#id "GyMMMEd" ! "E d MMM y G"] 
                            dateFormatItem [#id "Md" ! "dd/MM"] 
                            dateFormatItem [#id "MEd" ! "E dd/MM"] 
                            dateFormatItem [#id "MMMd" ! "d MMM"] 
                            dateFormatItem [#id "MMMEd" ! "E d MMM"] 
                            dateFormatItem [#id "yM" ! "MM y"] 
                            dateFormatItem [#id "yMd" ! "dd/MM y"] 
                            dateFormatItem [#id "yMEd" ! "E dd/MM y"] 
                            dateFormatItem [#id "yMMM" ! "MMM y"] 
                            dateFormatItem [#id "yMMMd" ! "d MMM y"] 
                            dateFormatItem [#id "yMMMEd" ! "E d MMM y"]
                        ]
                    ]
                ]
            ] 
            fields [
                field [
                    #type "day" 
                    relative [#type "-1" ! "kwey"] 
                    relative [#type "0" ! "muka"] 
                    relative [#type "1" ! "nɛmɛnɔ"]
                ]
            ]
        ] 
        numbers [
            defaultNumberingSystem [! "latn"] 
            otherNumberingSystems [
                native [! "latn"]
            ] 
            symbols [
                #numberSystem "latn" 
                decimal [! ","] 
                group [! "."]
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
                    #type "XAF" 
                    displayName [! "Franc CFA"] 
                    symbol [! "FCFA"]
                ]
            ]
        ] 
        listPatterns [
            listPattern [
                listPatternPart [#type "start" ! "{0}, {1}"] 
                listPatternPart [#type "middle" ! "{0}, {1}"] 
                listPatternPart [#type "end" ! "{0}, {1}"]
            ]
        ]
    ]

