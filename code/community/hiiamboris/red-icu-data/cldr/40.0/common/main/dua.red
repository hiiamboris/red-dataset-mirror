
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "dua"]
        ] 
        localeDisplayNames [
            languages [
                language [#type "dua" ! "duálá"]
            ] 
            territories [
                territory [#type "CM" ! "Cameroun"]
            ]
        ] 
        characters [
            exemplarCharacters [! {[a á b ɓ c d ɗ e é ɛ {ɛ\u0301} f g i í j k l m n {ny} ŋ o ó ɔ {ɔ\u0301} p r s t u ú ū w y]}] 
            exemplarCharacters [#type "auxiliary" ! "[h q v x z]"] 
            exemplarCharacters [#type "index" ! {[A B Ɓ C D Ɗ E Ɛ F G I J K L M N Ŋ O Ɔ P S T U W Y]}] 
            exemplarCharacters [#type "numbers" ! "[  \- ‑ , % ‰ + 0 1 2 3 4 5 6 7 8 9]"]
        ] 
        delimiters [
            quotationStart [! "«"] 
            quotationEnd [! "»"] 
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
                                pattern [! "EEEE d MMMM y G"] 
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
                                pattern [! "d/M/y GGGGG"] 
                                datetimeSkeleton [! "GGGGGyMd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "d" ! "d"] 
                            dateFormatItem [#id "Ed" ! "E d"] 
                            dateFormatItem [#id "hm" ! "h:mm a"] 
                            dateFormatItem [#id "Hm" ! "HH:mm"] 
                            dateFormatItem [#id "hms" ! "h:mm:ss a"] 
                            dateFormatItem [#id "Hms" ! "HH:mm:ss"] 
                            dateFormatItem [#id "M" ! "L"] 
                            dateFormatItem [#id "Md" ! "d/M"] 
                            dateFormatItem [#id "MEd" ! "E d/M"] 
                            dateFormatItem [#id "MMM" ! "LLL"] 
                            dateFormatItem [#id "MMMd" ! "d MMM"] 
                            dateFormatItem [#id "MMMEd" ! "E d MMM"] 
                            dateFormatItem [#id "ms" ! "m:ss"] 
                            dateFormatItem [#id "y" ! "y"] 
                            dateFormatItem [#id "yM" ! "M/y"] 
                            dateFormatItem [#id "yMd" ! "d/M/y"] 
                            dateFormatItem [#id "yMEd" ! "E d/M/y"] 
                            dateFormatItem [#id "yMMM" ! "MMM y"] 
                            dateFormatItem [#id "yMMMd" ! "d MMM y"] 
                            dateFormatItem [#id "yMMMEd" ! "E d MMM y"] 
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
                                month [#type "1" ! "di"] 
                                month [#type "2" ! "ŋgɔn"] 
                                month [#type "3" ! "sɔŋ"] 
                                month [#type "4" ! "diɓ"] 
                                month [#type "5" ! "emi"] 
                                month [#type "6" ! "esɔ"] 
                                month [#type "7" ! "mad"] 
                                month [#type "8" ! "diŋ"] 
                                month [#type "9" ! "nyɛt"] 
                                month [#type "10" ! "may"] 
                                month [#type "11" ! "tin"] 
                                month [#type "12" ! "elá"]
                            ] 
                            monthWidth [
                                #type "wide" 
                                month [#type "1" ! "dimɔ́di"] 
                                month [#type "2" ! "ŋgɔndɛ"] 
                                month [#type "3" ! "sɔŋɛ"] 
                                month [#type "4" ! "diɓáɓá"] 
                                month [#type "5" ! "emiasele"] 
                                month [#type "6" ! "esɔpɛsɔpɛ"] 
                                month [#type "7" ! "madiɓɛ́díɓɛ́"] 
                                month [#type "8" ! "diŋgindi"] 
                                month [#type "9" ! "nyɛtɛki"] 
                                month [#type "10" ! "mayésɛ́"] 
                                month [#type "11" ! "tiníní"] 
                                month [#type "12" ! "eláŋgɛ́"]
                            ]
                        ] 
                        monthContext [
                            #type "stand-alone" 
                            monthWidth [
                                #type "narrow" 
                                month [#type "1" ! "d"] 
                                month [#type "2" ! "ŋ"] 
                                month [#type "3" ! "s"] 
                                month [#type "4" ! "d"] 
                                month [#type "5" ! "e"] 
                                month [#type "6" ! "e"] 
                                month [#type "7" ! "m"] 
                                month [#type "8" ! "d"] 
                                month [#type "9" ! "n"] 
                                month [#type "10" ! "m"] 
                                month [#type "11" ! "t"] 
                                month [#type "12" ! "e"]
                            ]
                        ]
                    ] 
                    days [
                        dayContext [
                            #type "format" 
                            dayWidth [
                                #type "abbreviated" 
                                day [#type "sun" ! "ét"] 
                                day [#type "mon" ! "mɔ́s"] 
                                day [#type "tue" ! "kwa"] 
                                day [#type "wed" ! "muk"] 
                                day [#type "thu" ! "ŋgi"] 
                                day [#type "fri" ! "ɗón"] 
                                day [#type "sat" ! "esa"]
                            ] 
                            dayWidth [
                                #type "wide" 
                                day [#type "sun" ! "éti"] 
                                day [#type "mon" ! "mɔ́sú"] 
                                day [#type "tue" ! "kwasú"] 
                                day [#type "wed" ! "mukɔ́sú"] 
                                day [#type "thu" ! "ŋgisú"] 
                                day [#type "fri" ! "ɗónɛsú"] 
                                day [#type "sat" ! "esaɓasú"]
                            ]
                        ] 
                        dayContext [
                            #type "stand-alone" 
                            dayWidth [
                                #type "narrow" 
                                day [#type "sun" ! "e"] 
                                day [#type "mon" ! "m"] 
                                day [#type "tue" ! "k"] 
                                day [#type "wed" ! "m"] 
                                day [#type "thu" ! "ŋ"] 
                                day [#type "fri" ! "ɗ"] 
                                day [#type "sat" ! "e"]
                            ]
                        ]
                    ] 
                    quarters [
                        quarterContext [
                            #type "format" 
                            quarterWidth [
                                #type "abbreviated" 
                                quarter [#type "1" ! "ndu1"] 
                                quarter [#type "2" ! "ndu2"] 
                                quarter [#type "3" ! "ndu3"] 
                                quarter [#type "4" ! "ndu4"]
                            ] 
                            quarterWidth [
                                #type "wide" 
                                quarter [#type "1" ! "ndúmbū nyá ɓosó"] 
                                quarter [#type "2" ! "ndúmbū ní lóndɛ́ íɓaá"] 
                                quarter [#type "3" ! "ndúmbū ní lóndɛ́ ílálo"] 
                                quarter [#type "4" ! "ndúmbū ní lóndɛ́ ínɛ́y"]
                            ]
                        ]
                    ] 
                    dayPeriods [
                        dayPeriodContext [
                            #type "format" 
                            dayPeriodWidth [
                                #type "abbreviated" 
                                dayPeriod [#type "am" ! "idiɓa"] 
                                dayPeriod [#type "pm" ! "ebyámu"]
                            ] 
                            dayPeriodWidth [
                                #type "wide" 
                                dayPeriod [#type "am" ! "idiɓa"] 
                                dayPeriod [#type "pm" ! "ebyámu"]
                            ]
                        ]
                    ] 
                    eras [
                        eraNames [
                            era [#type "0" ! "ɓoso ɓwá yáɓe lá"] 
                            era [#type "1" ! "mbúsa kwédi a Yés"]
                        ] 
                        eraAbbr [
                            era [#type "0" ! "ɓ.Ys"] 
                            era [#type "1" ! "mb.Ys"]
                        ]
                    ] 
                    dateFormats [
                        dateFormatLength [
                            #type "full" 
                            dateFormat [
                                pattern [! "EEEE d MMMM y"] 
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
                                pattern [! "d/M/y"] 
                                datetimeSkeleton [! "yMd"]
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
                        availableFormats [
                            dateFormatItem [#id "d" ! "d"] 
                            dateFormatItem [#id "Ed" ! "E d"] 
                            dateFormatItem [#id "hm" ! "h:mm a"] 
                            dateFormatItem [#id "Hm" ! "HH:mm"] 
                            dateFormatItem [#id "hms" ! "h:mm:ss a"] 
                            dateFormatItem [#id "Hms" ! "HH:mm:ss"] 
                            dateFormatItem [#id "M" ! "L"] 
                            dateFormatItem [#id "Md" ! "d/M"] 
                            dateFormatItem [#id "MEd" ! "E d/M"] 
                            dateFormatItem [#id "MMM" ! "LLL"] 
                            dateFormatItem [#id "MMMd" ! "d MMM"] 
                            dateFormatItem [#id "MMMEd" ! "E d MMM"] 
                            dateFormatItem [#id "ms" ! "m:ss"] 
                            dateFormatItem [#id "y" ! "y"] 
                            dateFormatItem [#id "yM" ! "M/y"] 
                            dateFormatItem [#id "yMd" ! "d/M/y"] 
                            dateFormatItem [#id "yMEd" ! "E d/M/y"] 
                            dateFormatItem [#id "yMMM" ! "MMM y"] 
                            dateFormatItem [#id "yMMMd" ! "d MMM y"] 
                            dateFormatItem [#id "yMMMEd" ! "E d MMM y"] 
                            dateFormatItem [#id "yQQQ" ! "QQQ y"] 
                            dateFormatItem [#id "yQQQQ" ! "QQQQ y"]
                        ]
                    ]
                ]
            ] 
            fields [
                field [
                    #type "era" 
                    displayName [! "póndá"]
                ] 
                field [
                    #type "year" 
                    displayName [! "mbú"]
                ] 
                field [
                    #type "month" 
                    displayName [! "mɔ́di"]
                ] 
                field [
                    #type "week" 
                    displayName [! "disama"]
                ] 
                field [
                    #type "day" 
                    displayName [! "búnyá"] 
                    relative [#type "-1" ! "kíɛlɛ nítómb́í"] 
                    relative [#type "0" ! "wɛ́ŋgɛ̄"] 
                    relative [#type "1" ! "kíɛlɛ"]
                ] 
                field [
                    #type "weekday" 
                    displayName [! "mínyá má disama"]
                ] 
                field [
                    #type "dayperiod" 
                    displayName [! "epasi a búnyá"]
                ] 
                field [
                    #type "hour" 
                    displayName [! "ŋgandɛ"]
                ] 
                field [
                    #type "minute" 
                    displayName [! "ndɔkɔ"]
                ] 
                field [
                    #type "second" 
                    displayName [! "píndí"]
                ]
            ]
        ] 
        numbers [
            symbols [
                #numberSystem "latn" 
                decimal [! ","] 
                group [! " "]
            ] 
            decimalFormats [
                #numberSystem "latn" 
                decimalFormatLength [
                    decimalFormat [
                        pattern [! "#,##0.###"]
                    ]
                ]
            ] 
            percentFormats [
                #numberSystem "latn" 
                percentFormatLength [
                    percentFormat [
                        pattern [! "#,##0 %"]
                    ]
                ]
            ] 
            currencyFormats [
                #numberSystem "latn" 
                currencyFormatLength [
                    currencyFormat [
                        #type "standard" 
                        pattern [! "#,##0.00 ¤"]
                    ]
                ] 
                currencyFormatLength [
                    #type "short" 
                    currencyFormat [
                        #type "standard" 
                        pattern [#type "1000" #count "other" #draft "provisional" ! "0K ¤"] 
                        pattern [#type "10000" #count "other" #draft "provisional" ! "00K ¤"] 
                        pattern [#type "100000" #count "other" #draft "provisional" ! "000K ¤"] 
                        pattern [#type "1000000" #count "other" #draft "provisional" ! "0M ¤"] 
                        pattern [#type "10000000" #count "other" #draft "provisional" ! "00M ¤"] 
                        pattern [#type "100000000" #count "other" #draft "provisional" ! "000M ¤"] 
                        pattern [#type "1000000000" #count "other" #draft "provisional" ! "0G ¤"] 
                        pattern [#type "10000000000" #count "other" #draft "provisional" ! "00G ¤"] 
                        pattern [#type "100000000000" #count "other" #draft "provisional" ! "000G ¤"] 
                        pattern [#type "1000000000000" #count "other" #draft "provisional" ! "0T ¤"] 
                        pattern [#type "10000000000000" #count "other" #draft "provisional" ! "00T ¤"] 
                        pattern [#type "100000000000000" #count "other" #draft "provisional" ! "000T ¤"]
                    ]
                ]
            ]
        ] 
        posix [
            messages [
                yesstr [! "ee:e"] 
                nostr [! "kɛ́m:k"]
            ]
        ]
    ]

