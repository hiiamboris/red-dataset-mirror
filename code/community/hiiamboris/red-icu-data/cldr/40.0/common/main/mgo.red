
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "mgo"]
        ] 
        localeDisplayNames [
            languages [
                language [#type "mgo" ! "metaʼ"] 
                language [#type "und" ! "ngam tisɔʼ"]
            ] 
            scripts [
                script [#type "Latn" ! "ngam ŋwaʼri"] 
                script [#type "Zxxx" ! "ngam choʼ"] 
                script [#type "Zzzz" ! "abo ŋwaʼri tisɔʼ"]
            ] 
            territories [
                territory [#type "CM" ! "Kamalun"] 
                territory [#type "ZZ" ! "aba aben tisɔ̀"]
            ] 
            types [
                type [#key "calendar" #type "gregorian" ! "ngàb mə̀kala"] 
                type [#key "numbers" #type "latn" ! "inu"]
            ] 
            codePatterns [
                codePattern [#type "language" ! "{0}"] 
                codePattern [#type "script" ! "{0}"] 
                codePattern [#type "territory" ! "{0}"]
            ]
        ] 
        characters [
            exemplarCharacters [! {[a à b {ch} d e è ə {ə\u0300} f g {gh} i ì j k m n ŋ o ò ɔ {ɔ\u0300} p r s t u ù w y z ʼ]}] 
            exemplarCharacters [#type "auxiliary" ! "[c h l q v x]"] 
            exemplarCharacters [#type "index" ! {[A B {CH} D E Ə F G {GH} I J K M N Ŋ O Ɔ P R S T U W Y Z ʼ]}] 
            exemplarCharacters [#type "numbers" ! "[\- ‑ , . % ‰ + 0 1 2 3 4 5 6 7 8 9]"] 
            exemplarCharacters [#type "punctuation" ! "[, ; \: ! ? . ' ‘ ’ &quot; “ ”]"] 
            ellipsis [#type "final" ! "{0}…"] 
            ellipsis [#type "initial" ! "…{0}"] 
            ellipsis [#type "medial" ! "{0}…{1}"] 
            moreInformation [! "?"]
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
                                pattern [! "EEEE, G y MMMM dd"] 
                                datetimeSkeleton [! "GyMMMMEEEEdd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "long" 
                            dateFormat [
                                pattern [! "G y MMMM d"] 
                                datetimeSkeleton [! "GyMMMMd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "medium" 
                            dateFormat [
                                pattern [! "G y MMM d"] 
                                datetimeSkeleton [! "GyMMMd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "GGGGG y-MM-dd"] 
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
                            dateFormatItem [#id "d" ! "d"]
                        ] 
                        intervalFormats [
                            intervalFormatFallback [! "{0} – {1}"]
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
                                month [#type "1" ! "mbegtug"] 
                                month [#type "2" ! "imeg àbùbì"] 
                                month [#type "3" ! "imeg mbəŋchubi"] 
                                month [#type "4" ! "iməg ngwə̀t"] 
                                month [#type "5" ! "iməg fog"] 
                                month [#type "6" ! "iməg ichiibɔd"] 
                                month [#type "7" ! "iməg àdùmbə̀ŋ"] 
                                month [#type "8" ! "iməg ichika"] 
                                month [#type "9" ! "iməg kud"] 
                                month [#type "10" ! "iməg tèsiʼe"] 
                                month [#type "11" ! "iməg zò"] 
                                month [#type "12" ! "iməg krizmed"]
                            ] 
                            monthWidth [
                                #type "narrow" 
                                month [#type "1" ! "M1"] 
                                month [#type "2" ! "A2"] 
                                month [#type "3" ! "M3"] 
                                month [#type "4" ! "N4"] 
                                month [#type "5" ! "F5"] 
                                month [#type "6" ! "I6"] 
                                month [#type "7" ! "A7"] 
                                month [#type "8" ! "I8"] 
                                month [#type "9" ! "K9"] 
                                month [#type "10" ! "10"] 
                                month [#type "11" ! "11"] 
                                month [#type "12" ! "12"]
                            ] 
                            monthWidth [
                                #type "wide" 
                                month [#type "1" ! "iməg mbegtug"] 
                                month [#type "2" ! "imeg àbùbì"] 
                                month [#type "3" ! "imeg mbəŋchubi"] 
                                month [#type "4" ! "iməg ngwə̀t"] 
                                month [#type "5" ! "iməg fog"] 
                                month [#type "6" ! "iməg ichiibɔd"] 
                                month [#type "7" ! "iməg àdùmbə̀ŋ"] 
                                month [#type "8" ! "iməg ichika"] 
                                month [#type "9" ! "iməg kud"] 
                                month [#type "10" ! "iməg tèsiʼe"] 
                                month [#type "11" ! "iməg zò"] 
                                month [#type "12" ! "iməg krizmed"]
                            ]
                        ] 
                        monthContext [
                            #type "stand-alone" 
                            monthWidth [
                                #type "abbreviated" 
                                month [#type "1" ! "mbegtug"] 
                                month [#type "2" ! "imeg àbùbì"] 
                                month [#type "3" ! "imeg mbəŋchubi"] 
                                month [#type "4" ! "iməg ngwə̀t"] 
                                month [#type "5" ! "iməg fog"] 
                                month [#type "6" ! "iməg ichiibɔd"] 
                                month [#type "7" ! "iməg àdùmbə̀ŋ"] 
                                month [#type "8" ! "iməg ichika"] 
                                month [#type "9" ! "iməg kud"] 
                                month [#type "10" ! "iməg tèsiʼe"] 
                                month [#type "11" ! "iməg zò"] 
                                month [#type "12" ! "iməg krizmed"]
                            ] 
                            monthWidth [
                                #type "narrow" 
                                month [#type "1" ! "M1"] 
                                month [#type "2" ! "A2"] 
                                month [#type "3" ! "M3"] 
                                month [#type "4" ! "N4"] 
                                month [#type "5" ! "F5"] 
                                month [#type "6" ! "I6"] 
                                month [#type "7" ! "A7"] 
                                month [#type "8" ! "I8"] 
                                month [#type "9" ! "K9"] 
                                month [#type "10" ! "10"] 
                                month [#type "11" ! "11"] 
                                month [#type "12" ! "12"]
                            ] 
                            monthWidth [
                                #type "wide" 
                                month [#type "1" ! "iməg mbegtug"] 
                                month [#type "2" ! "imeg àbùbì"] 
                                month [#type "3" ! "imeg mbəŋchubi"] 
                                month [#type "4" ! "iməg ngwə̀t"] 
                                month [#type "5" ! "iməg fog"] 
                                month [#type "6" ! "iməg ichiibɔd"] 
                                month [#type "7" ! "iməg àdùmbə̀ŋ"] 
                                month [#type "8" ! "iməg ichika"] 
                                month [#type "9" ! "iməg kud"] 
                                month [#type "10" ! "iməg tèsiʼe"] 
                                month [#type "11" ! "iməg zò"] 
                                month [#type "12" ! "iməg krizmed"]
                            ]
                        ]
                    ] 
                    days [
                        dayContext [
                            #type "format" 
                            dayWidth [
                                #type "abbreviated" 
                                day [#type "sun" ! "Aneg 1"] 
                                day [#type "mon" ! "Aneg 2"] 
                                day [#type "tue" ! "Aneg 3"] 
                                day [#type "wed" ! "Aneg 4"] 
                                day [#type "thu" ! "Aneg 5"] 
                                day [#type "fri" ! "Aneg 6"] 
                                day [#type "sat" ! "Aneg 7"]
                            ] 
                            dayWidth [
                                #type "narrow" 
                                day [#type "sun" ! "A1"] 
                                day [#type "mon" ! "A2"] 
                                day [#type "tue" ! "A3"] 
                                day [#type "wed" ! "A4"] 
                                day [#type "thu" ! "A5"] 
                                day [#type "fri" ! "A6"] 
                                day [#type "sat" ! "A7"]
                            ] 
                            dayWidth [
                                #type "short" 
                                day [#type "sun" ! "1"] 
                                day [#type "mon" ! "2"] 
                                day [#type "tue" ! "3"] 
                                day [#type "wed" ! "4"] 
                                day [#type "thu" ! "5"] 
                                day [#type "fri" ! "6"] 
                                day [#type "sat" ! "7"]
                            ] 
                            dayWidth [
                                #type "wide" 
                                day [#type "sun" ! "Aneg 1"] 
                                day [#type "mon" ! "Aneg 2"] 
                                day [#type "tue" ! "Aneg 3"] 
                                day [#type "wed" ! "Aneg 4"] 
                                day [#type "thu" ! "Aneg 5"] 
                                day [#type "fri" ! "Aneg 6"] 
                                day [#type "sat" ! "Aneg 7"]
                            ]
                        ] 
                        dayContext [
                            #type "stand-alone" 
                            dayWidth [
                                #type "abbreviated" 
                                day [#type "sun" ! "Aneg 1"] 
                                day [#type "mon" ! "Aneg 2"] 
                                day [#type "tue" ! "Aneg 3"] 
                                day [#type "wed" ! "Aneg 4"] 
                                day [#type "thu" ! "Aneg 5"] 
                                day [#type "fri" ! "Aneg 6"] 
                                day [#type "sat" ! "Aneg 7"]
                            ] 
                            dayWidth [
                                #type "narrow" 
                                day [#type "sun" ! "A1"] 
                                day [#type "mon" ! "A2"] 
                                day [#type "tue" ! "A3"] 
                                day [#type "wed" ! "A4"] 
                                day [#type "thu" ! "A5"] 
                                day [#type "fri" ! "A6"] 
                                day [#type "sat" ! "A7"]
                            ] 
                            dayWidth [
                                #type "short" 
                                day [#type "sun" ! "1"] 
                                day [#type "mon" ! "2"] 
                                day [#type "tue" ! "3"] 
                                day [#type "wed" ! "4"] 
                                day [#type "thu" ! "5"] 
                                day [#type "fri" ! "6"] 
                                day [#type "sat" ! "7"]
                            ] 
                            dayWidth [
                                #type "wide" 
                                day [#type "sun" ! "Aneg 1"] 
                                day [#type "mon" ! "Aneg 2"] 
                                day [#type "tue" ! "Aneg 3"] 
                                day [#type "wed" ! "Aneg 4"] 
                                day [#type "thu" ! "Aneg 5"] 
                                day [#type "fri" ! "Aneg 6"] 
                                day [#type "sat" ! "Aneg 7"]
                            ]
                        ]
                    ] 
                    dayPeriods [
                        dayPeriodContext [
                            #type "format" 
                            dayPeriodWidth [
                                #type "abbreviated" 
                                dayPeriod [#type "am" ! "AM"] 
                                dayPeriod [#type "pm" ! "PM"]
                            ] 
                            dayPeriodWidth [
                                #type "wide" 
                                dayPeriod [#type "am" ! "AM"] 
                                dayPeriod [#type "pm" ! "PM"]
                            ]
                        ]
                    ] 
                    eras [
                        eraAbbr [
                            era [#type "0" ! "BCE"] 
                            era [#type "1" ! "CE"]
                        ]
                    ] 
                    dateFormats [
                        dateFormatLength [
                            #type "full" 
                            dateFormat [
                                pattern [! "EEEE, y MMMM dd"] 
                                datetimeSkeleton [! "yMMMMEEEEdd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "long" 
                            dateFormat [
                                pattern [! "y MMMM d"] 
                                datetimeSkeleton [! "yMMMMd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "medium" 
                            dateFormat [
                                pattern [! "y MMM d"] 
                                datetimeSkeleton [! "yMMMd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "y-MM-dd"] 
                                datetimeSkeleton [! "yMMdd"]
                            ]
                        ]
                    ] 
                    timeFormats [
                        timeFormatLength [
                            #type "full" 
                            timeFormat [
                                pattern [! "HH:mm:ss zzzz"] 
                                datetimeSkeleton [! "HHmmsszzzz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "long" 
                            timeFormat [
                                pattern [! "HH:mm:ss z"] 
                                datetimeSkeleton [! "HHmmssz"]
                            ]
                        ] 
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
                            dateFormatItem [#id "d" ! "d"]
                        ] 
                        intervalFormats [
                            intervalFormatFallback [! "{0} – {1}"]
                        ]
                    ]
                ]
            ] 
            fields [
                field [
                    #type "era" 
                    displayName [! "Era"]
                ] 
                field [
                    #type "year" 
                    displayName [! "fituʼ"]
                ] 
                field [
                    #type "month" 
                    displayName [! "iməg"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "+{0} m"] 
                        relativeTimePattern [#count "other" ! "+{0} m"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "-{0} m"] 
                        relativeTimePattern [#count "other" ! "-{0} m"]
                    ]
                ] 
                field [
                    #type "week" 
                    displayName [! "nkap"]
                ] 
                field [
                    #type "day" 
                    displayName [! "anəg"] 
                    relative [#type "-1" ! "ikwiri"] 
                    relative [#type "0" ! "tèchɔ̀ŋ"] 
                    relative [#type "1" ! "isu"] 
                    relative [#type "2" ! "isu ywi"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "+{0} d"] 
                        relativeTimePattern [#count "other" ! "+{0} d"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "-{0} d"] 
                        relativeTimePattern [#count "other" ! "-{0} d"]
                    ]
                ] 
                field [
                    #type "weekday" 
                    displayName [! "anəg agu nkap"]
                ] 
                field [
                    #type "dayperiod" 
                    displayName [! "Dayperiod"]
                ] 
                field [
                    #type "hour" 
                    displayName [! "Hour"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "+{0} h"] 
                        relativeTimePattern [#count "other" ! "+{0} h"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "-{0} h"] 
                        relativeTimePattern [#count "other" ! "-{0} h"]
                    ]
                ] 
                field [
                    #type "minute" 
                    displayName [! "Minute"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "+{0} min"] 
                        relativeTimePattern [#count "other" ! "+{0} min"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "-{0} min"] 
                        relativeTimePattern [#count "other" ! "-{0} min"]
                    ]
                ] 
                field [
                    #type "second" 
                    displayName [! "Second"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "+{0} s"] 
                        relativeTimePattern [#count "other" ! "+{0} s"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "-{0} s"] 
                        relativeTimePattern [#count "other" ! "-{0} s"]
                    ]
                ] 
                field [
                    #type "zone" 
                    displayName [! "Zone"]
                ]
            ] 
            timeZoneNames [
                hourFormat [! "+HH:mm;-HH:mm"] 
                gmtFormat [! "GMT{0}"] 
                gmtZeroFormat [! "GMT"] 
                regionFormat [! "{0}"] 
                fallbackFormat [! "{1} ({0})"]
            ]
        ] 
        numbers [
            defaultNumberingSystem [! "latn"] 
            otherNumberingSystems [
                native [! "latn"]
            ] 
            symbols [
                #numberSystem "latn" 
                decimal [! "."] 
                group [! ","] 
                list [! ";"] 
                percentSign [! "%"] 
                plusSign [! "+"] 
                minusSign [! "-"] 
                exponential [! "E"] 
                perMille [! "‰"] 
                infinity [! "∞"] 
                nan [! "NaN"]
            ] 
            decimalFormats [
                #numberSystem "latn" 
                decimalFormatLength [
                    decimalFormat [
                        pattern [! "#,##0.###"]
                    ]
                ]
            ] 
            scientificFormats [
                #numberSystem "latn" 
                scientificFormatLength [
                    scientificFormat [
                        pattern [! "#E0"]
                    ]
                ]
            ] 
            percentFormats [
                #numberSystem "latn" 
                percentFormatLength [
                    percentFormat [
                        pattern [! "#,##0%"]
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
                unitPattern [#count "one" ! "{0} {1}"] 
                unitPattern [#count "other" ! "{0} {1}"]
            ] 
            currencies [
                currency [
                    #type "XAF" 
                    displayName [! "shirè"] 
                    symbol [! "FCFA"]
                ] 
                currency [
                    #type "XXX" 
                    displayName [! "iku ikap mɔʼɔ"]
                ]
            ]
        ] 
        units [
            unitLength [
                #type "long" 
                unit [
                    #type "duration-month" 
                    displayName [#draft "provisional" ! "m"] 
                    unitPattern [#count "one" ! "{0} m"] 
                    unitPattern [#count "other" ! "{0} m"]
                ] 
                unit [
                    #type "duration-day" 
                    displayName [#draft "provisional" ! "d"] 
                    unitPattern [#count "one" ! "{0} d"] 
                    unitPattern [#count "other" ! "{0} d"]
                ] 
                unit [
                    #type "duration-hour" 
                    displayName [#draft "provisional" ! "h"] 
                    unitPattern [#count "one" ! "{0} h"] 
                    unitPattern [#count "other" ! "{0} h"]
                ] 
                unit [
                    #type "duration-minute" 
                    displayName [#draft "provisional" ! "min"] 
                    unitPattern [#count "one" ! "{0} min"] 
                    unitPattern [#count "other" ! "{0} min"]
                ] 
                unit [
                    #type "duration-second" 
                    displayName [#draft "provisional" ! "s"] 
                    unitPattern [#count "one" ! "{0} s"] 
                    unitPattern [#count "other" ! "{0} s"]
                ]
            ] 
            unitLength [
                #type "short" 
                unit [
                    #type "duration-month" 
                    displayName [#draft "provisional" ! "m"]
                ] 
                unit [
                    #type "duration-day" 
                    displayName [#draft "provisional" ! "d"]
                ] 
                unit [
                    #type "duration-hour" 
                    displayName [#draft "provisional" ! "h"]
                ] 
                unit [
                    #type "duration-minute" 
                    displayName [#draft "provisional" ! "min"]
                ] 
                unit [
                    #type "duration-second" 
                    displayName [#draft "provisional" ! "s"]
                ]
            ]
        ] 
        posix [
            messages [
                yesstr [! "èè"] 
                nostr [! "ideg."]
            ]
        ]
    ]

