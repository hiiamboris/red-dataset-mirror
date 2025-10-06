
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "mi"]
        ] 
        localeDisplayNames [
            localeDisplayPattern [
                localePattern [! "{0} ({1})"] 
                localeSeparator [! "{0}, {1}"] 
                localeKeyTypePattern [! "{0}: {1}"]
            ] 
            languages [
                language [#type "de" ! "Tiamana"] 
                language [#type "de_AT" ! "Tiamana Atiria"] 
                language [#type "de_CH" ! "Tiamana Ōkawa Huiterangi"] 
                language [#type "en" ! "Ingarihi"] 
                language [#type "en_AU" ! "Ingarihi Ahitereiriana"] 
                language [#type "en_CA" ! "Ingarihi Kānata"] 
                language [#type "en_GB" ! "Ingarihi Piritene"] 
                language [#type "en_GB" #alt "short" ! "Ingarihi UK"] 
                language [#type "en_US" ! "Ingarihi Amerikana"] 
                language [#type "en_US" #alt "short" ! "Ingarihi US"] 
                language [#type "es" ! "Paniora"] 
                language [#type "es_419" ! "Paniora Amerika ki te Tonga"] 
                language [#type "es_ES" ! "Paniora Uropi"] 
                language [#type "es_MX" ! "Paniora Mēhikana"] 
                language [#type "fr" ! "Wīwī"] 
                language [#type "fr_CA" ! "Wīwī Kānata"] 
                language [#type "fr_CH" ! "Wīwī Huiterangi"] 
                language [#type "it" ! "Ītariana"] 
                language [#type "ja" ! "Hapanihi"] 
                language [#type "mi" ! "te reo Māori"] 
                language [#type "pt" ! "Pōtukīhi"] 
                language [#type "pt_BR" ! "Pōtukīhi Parahi"] 
                language [#type "pt_PT" ! "Pōtukīhi Uropi"] 
                language [#type "ru" ! "Ruhiana"] 
                language [#type "und" ! "Reo Tē Mōhiotia"] 
                language [#type "zh" ! "Hainamana"] 
                language [#type "zh" #alt "menu" ! "Hainamana Manarini"] 
                language [#type "zh_Hans" ! "Hainamana Māmā"] 
                language [#type "zh_Hant" ! "Hainamana Tukuiho"]
            ] 
            scripts [
                script [#type "Arab" ! "Arapika"] 
                script [#type "Cyrl" ! "Hīririki"] 
                script [#type "Hans" ! "Māmā"] 
                script [#type "Hans" #alt "stand-alone" ! "Hana Māmā"] 
                script [#type "Hant" ! "Tukuiho"] 
                script [#type "Hant" #alt "stand-alone" ! "Hana Tukuiho"] 
                script [#type "Latn" ! "Rātina"] 
                script [#type "Zxxx" ! "Tuhikore"] 
                script [#type "Zzzz" ! "Momotuhi Tē Mōhiotia"]
            ] 
            territories [
                territory [#type "BR" ! "Parahi"] 
                territory [#type "CN" ! "Haina"] 
                territory [#type "DE" ! "Tiamana"] 
                territory [#type "FR" ! "Wīwī"] 
                territory [#type "GB" ! "Hononga o Piritene"] 
                territory [#type "IN" ! "Inia"] 
                territory [#type "IT" ! "Itāria"] 
                territory [#type "JP" ! "Hapani"] 
                territory [#type "MK" ! "Makerōnia ki te Raki"] 
                territory [#type "NZ" ! "Aotearoa"] 
                territory [#type "RU" ! "Rūhia"] 
                territory [#type "US" ! "Hononga o Amerika"] 
                territory [#type "ZZ" ! "Rohe Tē Mōhiotia"]
            ] 
            types [
                type [#key "calendar" #type "gregorian" ! "Maramataka Pākehā"] 
                type [#key "collation" #type "standard" ! "Raupapa Kōmaka Arowhānui"] 
                type [#key "numbers" #type "latn" ! "Ngā Mati Pākehā"]
            ] 
            measurementSystemNames [
                measurementSystemName [#type "metric" ! "Ngahuru"] 
                measurementSystemName [#type "UK" ! "UK"] 
                measurementSystemName [#type "US" ! "US"]
            ] 
            codePatterns [
                codePattern [#type "language" ! "Reo: {0}"] 
                codePattern [#type "script" ! "Momotuhi: {0}"] 
                codePattern [#type "territory" ! "Rohe: {0}"]
            ]
        ] 
        characters [
            exemplarCharacters [! "[a ā e ē h i ī k m n {ng} o ō p r t u ū w {wh}]"] 
            exemplarCharacters [#type "auxiliary" ! "[b c d f g j l q s v x y z]"] 
            exemplarCharacters [#type "index" ! "[A E H I K M N O P R T U W]"]
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
                                pattern [! "dd-MM-y GGGGG"] 
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
                        intervalFormats [
                            intervalFormatFallback [! "{0} ki te {1}"] 
                            intervalFormatItem [
                                #id "d" 
                                greatestDifference [#id "d" ! "d–d"]
                            ] 
                            intervalFormatItem [
                                #id "M" 
                                greatestDifference [#id "M" ! "MM–MM"]
                            ] 
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" ! "MM-dd – MM-dd"] 
                                greatestDifference [#id "M" ! "MM-dd – MM-dd"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" ! "MM-dd, E – MM-dd, E"] 
                                greatestDifference [#id "M" ! "MM-dd, E – MM-dd, E"]
                            ] 
                            intervalFormatItem [
                                #id "MMM" 
                                greatestDifference [#id "M" ! "LLL–LLL"]
                            ] 
                            intervalFormatItem [
                                #id "MMMd" 
                                greatestDifference [#id "d" ! "MMM d–d"] 
                                greatestDifference [#id "M" ! "MMM d – MMM d"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" ! "MMM d, E – MMM d, E"] 
                                greatestDifference [#id "M" ! "MMM d, E – MMM d, E"]
                            ] 
                            intervalFormatItem [
                                #id "y" 
                                greatestDifference [#id "y" ! "G y–y"]
                            ] 
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" ! "GGGGG y-MM – y-MM"] 
                                greatestDifference [#id "y" ! "GGGGG y-MM – y-MM"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" ! "GGGGG y-MM-dd – y-MM-dd"] 
                                greatestDifference [#id "M" ! "GGGGG y-MM-dd – y-MM-dd"] 
                                greatestDifference [#id "y" ! "GGGGG y-MM-dd – y-MM-dd"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" ! "GGGGG y-MM-dd, E – y-MM-dd, E"] 
                                greatestDifference [#id "M" ! "GGGGG y-MM-dd, E – y-MM-dd, E"] 
                                greatestDifference [#id "y" ! "GGGGG y-MM-dd, E – y-MM-dd, E"]
                            ] 
                            intervalFormatItem [
                                #id "yMMM" 
                                greatestDifference [#id "M" ! "G y MMM–MMM"] 
                                greatestDifference [#id "y" ! "G y MMM – y MMM"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMd" 
                                greatestDifference [#id "d" ! "G y MMM d–d"] 
                                greatestDifference [#id "M" ! "G y MMM d – MMM d"] 
                                greatestDifference [#id "y" ! "G y MMM d – y MMM d"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" ! "G y MMM d, E – MMM d, E"] 
                                greatestDifference [#id "M" ! "G y MMM d, E – MMM d, E"] 
                                greatestDifference [#id "y" ! "G y MMM d, E – y MMM d, E"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMM" 
                                greatestDifference [#id "M" ! "G y MMMM–MMMM"] 
                                greatestDifference [#id "y" ! "G y MMMM – y MMMM"]
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
                                month [#type "1" ! "Kohi"] 
                                month [#type "2" ! "Hui"] 
                                month [#type "3" ! "Pou"] 
                                month [#type "4" ! "Pae"] 
                                month [#type "5" ! "Hara"] 
                                month [#type "6" ! "Pipi"] 
                                month [#type "7" ! "Hōngo"] 
                                month [#type "8" ! "Here"] 
                                month [#type "9" ! "Mahu"] 
                                month [#type "10" ! "Nuku"] 
                                month [#type "11" ! "Rangi"] 
                                month [#type "12" ! "Haki"]
                            ] 
                            monthWidth [
                                #type "narrow" 
                                month [#type "1" ! "K"] 
                                month [#type "2" ! "H"] 
                                month [#type "3" ! "P"] 
                                month [#type "4" ! "P"] 
                                month [#type "5" ! "H"] 
                                month [#type "6" ! "P"] 
                                month [#type "7" ! "H"] 
                                month [#type "8" ! "H"] 
                                month [#type "9" ! "M"] 
                                month [#type "10" ! "N"] 
                                month [#type "11" ! "R"] 
                                month [#type "12" ! "H"]
                            ] 
                            monthWidth [
                                #type "wide" 
                                month [#type "1" ! "Kohitātea"] 
                                month [#type "2" ! "Huitanguru"] 
                                month [#type "3" ! "Poutūterangi"] 
                                month [#type "4" ! "Paengawhāwhā"] 
                                month [#type "5" ! "Haratua"] 
                                month [#type "6" ! "Pipiri"] 
                                month [#type "7" ! "Hōngongoi"] 
                                month [#type "8" ! "Hereturikōkā"] 
                                month [#type "9" ! "Mahuru"] 
                                month [#type "10" ! "Whiringa-ā-nuku"] 
                                month [#type "11" ! "Whiringa-ā-rangi"] 
                                month [#type "12" ! "Hakihea"]
                            ]
                        ] 
                        monthContext [
                            #type "stand-alone" 
                            monthWidth [
                                #type "abbreviated" 
                                month [#type "1" ! "Kohi"] 
                                month [#type "2" ! "Hui"] 
                                month [#type "3" ! "Pou"] 
                                month [#type "4" ! "Pae"] 
                                month [#type "5" ! "Hara"] 
                                month [#type "6" ! "Pipi"] 
                                month [#type "7" ! "Hōngo"] 
                                month [#type "8" ! "Here"] 
                                month [#type "9" ! "Mahu"] 
                                month [#type "10" ! "Nuku"] 
                                month [#type "11" ! "Rangi"] 
                                month [#type "12" ! "Haki"]
                            ] 
                            monthWidth [
                                #type "narrow" 
                                month [#type "1" ! "K"] 
                                month [#type "2" ! "H"] 
                                month [#type "3" ! "P"] 
                                month [#type "4" ! "P"] 
                                month [#type "5" ! "H"] 
                                month [#type "6" ! "P"] 
                                month [#type "7" ! "H"] 
                                month [#type "8" ! "H"] 
                                month [#type "9" ! "M"] 
                                month [#type "10" ! "N"] 
                                month [#type "11" ! "R"] 
                                month [#type "12" ! "H"]
                            ] 
                            monthWidth [
                                #type "wide" 
                                month [#type "1" ! "Kohitātea"] 
                                month [#type "2" ! "Huitanguru"] 
                                month [#type "3" ! "Poutūterangi"] 
                                month [#type "4" ! "Paengawhāwhā"] 
                                month [#type "5" ! "Haratua"] 
                                month [#type "6" ! "Pipiri"] 
                                month [#type "7" ! "Hōngongoi"] 
                                month [#type "8" ! "Hereturikōkā"] 
                                month [#type "9" ! "Mahuru"] 
                                month [#type "10" ! "Whiringa-ā-nuku"] 
                                month [#type "11" ! "Whiringa-ā-rangi"] 
                                month [#type "12" ! "Hakihea"]
                            ]
                        ]
                    ] 
                    days [
                        dayContext [
                            #type "format" 
                            dayWidth [
                                #type "abbreviated" 
                                day [#type "sun" ! "Tap"] 
                                day [#type "mon" ! "Hin"] 
                                day [#type "tue" ! "Tū"] 
                                day [#type "wed" ! "Apa"] 
                                day [#type "thu" ! "Par"] 
                                day [#type "fri" ! "Mer"] 
                                day [#type "sat" ! "Hor"]
                            ] 
                            dayWidth [
                                #type "narrow" 
                                day [#type "sun" ! "T"] 
                                day [#type "mon" ! "H"] 
                                day [#type "tue" ! "T"] 
                                day [#type "wed" ! "A"] 
                                day [#type "thu" ! "P"] 
                                day [#type "fri" ! "M"] 
                                day [#type "sat" ! "H"]
                            ] 
                            dayWidth [
                                #type "short" 
                                day [#type "sun" ! "Tap"] 
                                day [#type "mon" ! "Hin"] 
                                day [#type "tue" ! "Tū"] 
                                day [#type "wed" ! "Apa"] 
                                day [#type "thu" ! "Par"] 
                                day [#type "fri" ! "Mer"] 
                                day [#type "sat" ! "Hor"]
                            ] 
                            dayWidth [
                                #type "wide" 
                                day [#type "sun" ! "Rātapu"] 
                                day [#type "mon" ! "Rāhina"] 
                                day [#type "tue" ! "Rātū"] 
                                day [#type "wed" ! "Rāapa"] 
                                day [#type "thu" ! "Rāpare"] 
                                day [#type "fri" ! "Rāmere"] 
                                day [#type "sat" ! "Rāhoroi"]
                            ]
                        ] 
                        dayContext [
                            #type "stand-alone" 
                            dayWidth [
                                #type "abbreviated" 
                                day [#type "sun" ! "Tap"] 
                                day [#type "mon" ! "Hin"] 
                                day [#type "tue" ! "Tū"] 
                                day [#type "wed" ! "Apa"] 
                                day [#type "thu" ! "Par"] 
                                day [#type "fri" ! "Mer"] 
                                day [#type "sat" ! "Hor"]
                            ] 
                            dayWidth [
                                #type "narrow" 
                                day [#type "sun" ! "T"] 
                                day [#type "mon" ! "H"] 
                                day [#type "tue" ! "T"] 
                                day [#type "wed" ! "A"] 
                                day [#type "thu" ! "P"] 
                                day [#type "fri" ! "M"] 
                                day [#type "sat" ! "H"]
                            ] 
                            dayWidth [
                                #type "short" 
                                day [#type "sun" ! "Tap"] 
                                day [#type "mon" ! "Hin"] 
                                day [#type "tue" ! "Tū"] 
                                day [#type "wed" ! "Apa"] 
                                day [#type "thu" ! "Par"] 
                                day [#type "fri" ! "Mer"] 
                                day [#type "sat" ! "Hor"]
                            ] 
                            dayWidth [
                                #type "wide" 
                                day [#type "sun" ! "Rātapu"] 
                                day [#type "mon" ! "Rāhina"] 
                                day [#type "tue" ! "Rātū"] 
                                day [#type "wed" ! "Rāapa"] 
                                day [#type "thu" ! "Rāpare"] 
                                day [#type "fri" ! "Rāmere"] 
                                day [#type "sat" ! "Rāhoroi"]
                            ]
                        ]
                    ] 
                    quarters [
                        quarterContext [
                            #type "format" 
                            quarterWidth [
                                #type "abbreviated" 
                                quarter [#type "1" ! "HW1"] 
                                quarter [#type "2" ! "HW2"] 
                                quarter [#type "3" ! "HW3"] 
                                quarter [#type "4" ! "HW4"]
                            ] 
                            quarterWidth [
                                #type "narrow" 
                                quarter [#type "1" ! "1"] 
                                quarter [#type "2" ! "2"] 
                                quarter [#type "3" ! "3"] 
                                quarter [#type "4" ! "4"]
                            ] 
                            quarterWidth [
                                #type "wide" 
                                quarter [#type "1" ! "Hauwhā tuatahi"] 
                                quarter [#type "2" ! "Hauwhā tuarua"] 
                                quarter [#type "3" ! "Hauwhā tuatoru"] 
                                quarter [#type "4" ! "Hauwhā tuawhā"]
                            ]
                        ] 
                        quarterContext [
                            #type "stand-alone" 
                            quarterWidth [
                                #type "abbreviated" 
                                quarter [#type "1" ! "HW1"] 
                                quarter [#type "2" ! "HW2"] 
                                quarter [#type "3" ! "HW3"] 
                                quarter [#type "4" ! "HW4"]
                            ] 
                            quarterWidth [
                                #type "narrow" 
                                quarter [#type "1" ! "1"] 
                                quarter [#type "2" ! "2"] 
                                quarter [#type "3" ! "3"] 
                                quarter [#type "4" ! "4"]
                            ] 
                            quarterWidth [
                                #type "wide" 
                                quarter [#type "1" ! "Hauwhā tuatahi"] 
                                quarter [#type "2" ! "Hauwhā tuarua"] 
                                quarter [#type "3" ! "Hauwhā tuatoru"] 
                                quarter [#type "4" ! "Hauwhā tuawhā"]
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
                                #type "narrow" 
                                dayPeriod [#type "am" ! "AM"] 
                                dayPeriod [#type "pm" ! "PM"]
                            ] 
                            dayPeriodWidth [
                                #type "wide" 
                                dayPeriod [#type "am" ! "AM"] 
                                dayPeriod [#type "pm" ! "PM"]
                            ]
                        ] 
                        dayPeriodContext [
                            #type "stand-alone" 
                            dayPeriodWidth [
                                #type "abbreviated" 
                                dayPeriod [#type "am" ! "AM"] 
                                dayPeriod [#type "pm" ! "PM"]
                            ] 
                            dayPeriodWidth [
                                #type "narrow" 
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
                        eraNames [
                            era [#type "0" ! "BCE"] 
                            era [#type "0" #alt "variant" ! "BCE"] 
                            era [#type "1" ! "CE"] 
                            era [#type "1" #alt "variant" ! "CE"]
                        ] 
                        eraAbbr [
                            era [#type "0" ! "BCE"] 
                            era [#type "1" ! "CE"]
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
                                pattern [! "dd-MM-y"] 
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
                            dateFormatItem [#id "Bh" ! "h B"] 
                            dateFormatItem [#id "Bhm" ! "h:mm B"] 
                            dateFormatItem [#id "Bhms" ! "h:mm:ss B"] 
                            dateFormatItem [#id "d" ! "d"] 
                            dateFormatItem [#id "E" ! "ccc"] 
                            dateFormatItem [#id "EBhm" ! "E h:mm B"] 
                            dateFormatItem [#id "EBhms" ! "E h:mm:ss B"] 
                            dateFormatItem [#id "Ed" ! "E, d"] 
                            dateFormatItem [#id "Ehm" ! "E h:mm a"] 
                            dateFormatItem [#id "EHm" ! "E HH:mm"] 
                            dateFormatItem [#id "Ehms" ! "E h:mm:ss a"] 
                            dateFormatItem [#id "EHms" ! "E HH:mm:ss"] 
                            dateFormatItem [#id "Gy" ! "y G"] 
                            dateFormatItem [#id "GyMMM" ! "MMM y G"] 
                            dateFormatItem [#id "GyMMMd" ! "d MMM y G"] 
                            dateFormatItem [#id "GyMMMEd" ! "E, d MMM y G"] 
                            dateFormatItem [#id "h" ! "h a"] 
                            dateFormatItem [#id "H" ! "HH"] 
                            dateFormatItem [#id "hm" ! "h:mm a"] 
                            dateFormatItem [#id "Hm" ! "HH:mm"] 
                            dateFormatItem [#id "hms" ! "h:mm:ss a"] 
                            dateFormatItem [#id "Hms" ! "HH:mm:ss"] 
                            dateFormatItem [#id "hmsv" ! "h:mm:ss a v"] 
                            dateFormatItem [#id "Hmsv" ! "HH:mm:ss v"] 
                            dateFormatItem [#id "hmv" ! "h:mm a v"] 
                            dateFormatItem [#id "Hmv" ! "HH:mm v"] 
                            dateFormatItem [#id "M" ! "L"] 
                            dateFormatItem [#id "Md" ! "dd-MM"] 
                            dateFormatItem [#id "MEd" ! "E, dd-MM"] 
                            dateFormatItem [#id "MMM" ! "LLL"] 
                            dateFormatItem [#id "MMMd" ! "d MMM"] 
                            dateFormatItem [#id "MMMEd" ! "E, d MMM"] 
                            dateFormatItem [#id "MMMMd" ! "d MMMM"] 
                            dateFormatItem [#id "MMMMW" #count "other" ! "'wiki' W 'o' MMMM"] 
                            dateFormatItem [#id "ms" ! "mm:ss"] 
                            dateFormatItem [#id "y" ! "y"] 
                            dateFormatItem [#id "yM" ! "MM-y"] 
                            dateFormatItem [#id "yMd" ! "dd-MM-y"] 
                            dateFormatItem [#id "yMEd" ! "E, dd-MM-y"] 
                            dateFormatItem [#id "yMMM" ! "MMM y"] 
                            dateFormatItem [#id "yMMMd" ! "d MMM y"] 
                            dateFormatItem [#id "yMMMEd" ! "E, d MMM y"] 
                            dateFormatItem [#id "yMMMM" ! "MMMM y"] 
                            dateFormatItem [#id "yQQQ" ! "QQQ y"] 
                            dateFormatItem [#id "yQQQQ" ! "QQQQ y"] 
                            dateFormatItem [#id "yw" #count "other" ! "'wiki' w 'o' Y"]
                        ] 
                        intervalFormats [
                            intervalFormatFallback [! "{0} ki te {1}"]
                        ]
                    ]
                ]
            ] 
            fields [
                field [
                    #type "era" 
                    displayName [! "wā"]
                ] 
                field [
                    #type "year" 
                    displayName [! "tau"]
                ] 
                field [
                    #type "year-short" 
                    displayName [! "t"]
                ] 
                field [
                    #type "year-narrow" 
                    displayName [! "t"]
                ] 
                field [
                    #type "quarter" 
                    displayName [! "hauwhā"]
                ] 
                field [
                    #type "quarter-short" 
                    displayName [! "hw"]
                ] 
                field [
                    #type "quarter-narrow" 
                    displayName [! "hw"]
                ] 
                field [
                    #type "month" 
                    displayName [! "marama"]
                ] 
                field [
                    #type "month-short" 
                    displayName [! "m"]
                ] 
                field [
                    #type "month-narrow" 
                    displayName [! "m"]
                ] 
                field [
                    #type "week" 
                    displayName [! "wiki"]
                ] 
                field [
                    #type "week-short" 
                    displayName [! "w"]
                ] 
                field [
                    #type "week-narrow" 
                    displayName [! "w"]
                ] 
                field [
                    #type "day" 
                    displayName [! "rā"] 
                    relative [#type "-1" ! "inanahi"] 
                    relative [#type "0" ! "āianei"] 
                    relative [#type "1" ! "āpōpō"]
                ] 
                field [
                    #type "day-short" 
                    displayName [! "rā"]
                ] 
                field [
                    #type "day-narrow" 
                    displayName [! "rā"]
                ] 
                field [
                    #type "weekday" 
                    displayName [! "rā o te wiki"]
                ] 
                field [
                    #type "dayperiod" 
                    displayName [! "AM/PM"]
                ] 
                field [
                    #type "hour" 
                    displayName [! "hāora"]
                ] 
                field [
                    #type "hour-short" 
                    displayName [! "hr"]
                ] 
                field [
                    #type "hour-narrow" 
                    displayName [! "hr"]
                ] 
                field [
                    #type "minute" 
                    displayName [! "meneti"]
                ] 
                field [
                    #type "minute-short" 
                    displayName [! "men"]
                ] 
                field [
                    #type "minute-narrow" 
                    displayName [! "men"]
                ] 
                field [
                    #type "second" 
                    displayName [! "hēkona"]
                ] 
                field [
                    #type "second-short" 
                    displayName [! "hēk"]
                ] 
                field [
                    #type "second-narrow" 
                    displayName [! "hēk"]
                ] 
                field [
                    #type "zone" 
                    displayName [! "rohe wā"]
                ]
            ] 
            timeZoneNames [
                hourFormat [! "+HH:mm;-HH:mm"] 
                gmtFormat [! "GMT{0}"] 
                gmtZeroFormat [! "GMT"] 
                regionFormat [! "{0}"] 
                regionFormat [#type "daylight" ! "{0} (+1)"] 
                regionFormat [#type "standard" ! "{0} (+0)"] 
                fallbackFormat [! "{1} ({0})"] 
                zone [
                    #type "Etc/UTC" 
                    long [
                        standard [! "Wā Aonui Kōtuitui"]
                    ]
                ] 
                zone [
                    #type "Etc/Unknown" 
                    exemplarCity [! "Tāone Tē Mōhiotia"]
                ] 
                zone [
                    #type "America/Argentina/Rio_Gallegos" 
                    exemplarCity [! "Rio Gallegos"]
                ] 
                zone [
                    #type "America/Mendoza" 
                    exemplarCity [! "Mendoza"]
                ] 
                zone [
                    #type "America/Argentina/San_Juan" 
                    exemplarCity [! "San Juan"]
                ] 
                zone [
                    #type "America/Argentina/Ushuaia" 
                    exemplarCity [! "Ushuaia"]
                ] 
                zone [
                    #type "America/Argentina/La_Rioja" 
                    exemplarCity [! "La Rioja"]
                ] 
                zone [
                    #type "America/Argentina/San_Luis" 
                    exemplarCity [! "San Luis"]
                ] 
                zone [
                    #type "America/Catamarca" 
                    exemplarCity [! "Catamarca"]
                ] 
                zone [
                    #type "America/Argentina/Salta" 
                    exemplarCity [! "Salta"]
                ] 
                zone [
                    #type "America/Jujuy" 
                    exemplarCity [! "Jujuy"]
                ] 
                zone [
                    #type "America/Argentina/Tucuman" 
                    exemplarCity [! "Tucuman"]
                ] 
                zone [
                    #type "America/Cordoba" 
                    exemplarCity [! "Cordoba"]
                ] 
                zone [
                    #type "America/Buenos_Aires" 
                    exemplarCity [! "Buenos Aires"]
                ] 
                zone [
                    #type "America/La_Paz" 
                    exemplarCity [! "La Paz"]
                ] 
                zone [
                    #type "America/Eirunepe" 
                    exemplarCity [! "Eirunepe"]
                ] 
                zone [
                    #type "America/Rio_Branco" 
                    exemplarCity [! "Rio Branco"]
                ] 
                zone [
                    #type "America/Porto_Velho" 
                    exemplarCity [! "Porto Velho"]
                ] 
                zone [
                    #type "America/Boa_Vista" 
                    exemplarCity [! "Boa Vista"]
                ] 
                zone [
                    #type "America/Manaus" 
                    exemplarCity [! "Manaus"]
                ] 
                zone [
                    #type "America/Cuiaba" 
                    exemplarCity [! "Cuiaba"]
                ] 
                zone [
                    #type "America/Santarem" 
                    exemplarCity [! "Santarem"]
                ] 
                zone [
                    #type "America/Campo_Grande" 
                    exemplarCity [! "Campo Grande"]
                ] 
                zone [
                    #type "America/Belem" 
                    exemplarCity [! "Belem"]
                ] 
                zone [
                    #type "America/Araguaina" 
                    exemplarCity [! "Araguaina"]
                ] 
                zone [
                    #type "America/Sao_Paulo" 
                    exemplarCity [! "Sao Paulo"]
                ] 
                zone [
                    #type "America/Bahia" 
                    exemplarCity [! "Bahia"]
                ] 
                zone [
                    #type "America/Fortaleza" 
                    exemplarCity [! "Fortaleza"]
                ] 
                zone [
                    #type "America/Maceio" 
                    exemplarCity [! "Maceio"]
                ] 
                zone [
                    #type "America/Recife" 
                    exemplarCity [! "Recife"]
                ] 
                zone [
                    #type "America/Noronha" 
                    exemplarCity [! "Noronha"]
                ] 
                zone [
                    #type "Pacific/Easter" 
                    exemplarCity [! "Easter"]
                ] 
                zone [
                    #type "America/Santiago" 
                    exemplarCity [! "Santiago"]
                ] 
                zone [
                    #type "America/Bogota" 
                    exemplarCity [! "Bogota"]
                ] 
                zone [
                    #type "Pacific/Galapagos" 
                    exemplarCity [! "Galapagos"]
                ] 
                zone [
                    #type "America/Guayaquil" 
                    exemplarCity [! "Guayaquil"]
                ] 
                zone [
                    #type "Atlantic/Stanley" 
                    exemplarCity [! "Stanley"]
                ] 
                zone [
                    #type "America/Cayenne" 
                    exemplarCity [! "Cayenne"]
                ] 
                zone [
                    #type "America/Guyana" 
                    exemplarCity [! "Guyana"]
                ] 
                zone [
                    #type "Pacific/Chatham" 
                    exemplarCity [! "Rēkohu"]
                ] 
                zone [
                    #type "Pacific/Auckland" 
                    exemplarCity [! "Tāmaki Makaurau"]
                ] 
                zone [
                    #type "America/Lima" 
                    exemplarCity [! "Lima"]
                ] 
                zone [
                    #type "America/Asuncion" 
                    exemplarCity [! "Asuncion"]
                ] 
                zone [
                    #type "America/Paramaribo" 
                    exemplarCity [! "Paramaribo"]
                ] 
                zone [
                    #type "America/Montevideo" 
                    exemplarCity [! "Montevideo"]
                ] 
                zone [
                    #type "America/Caracas" 
                    exemplarCity [! "Caracas"]
                ] 
                metazone [
                    #type "America_Central" 
                    long [
                        generic [! "Wā Waenga"] 
                        standard [! "Wā Arowhānui Waenga"] 
                        daylight [! "Wā Awatea Waenga"]
                    ]
                ] 
                metazone [
                    #type "America_Eastern" 
                    long [
                        generic [! "Wā Rāwhiti"] 
                        standard [! "Wā Arowhānui Rāwhiti"] 
                        daylight [! "Wā Awatea Rāwhiti"]
                    ]
                ] 
                metazone [
                    #type "America_Mountain" 
                    long [
                        generic [! "Wā Maunga"] 
                        standard [! "Wā Arowhānui Maunga"] 
                        daylight [! "Wā Awatea Maunga"]
                    ]
                ] 
                metazone [
                    #type "America_Pacific" 
                    long [
                        generic [! "Wā Kiwa"] 
                        standard [! "Wā Arowhānui Kiwa"] 
                        daylight [! "Wā Awatea Kiwa"]
                    ]
                ] 
                metazone [
                    #type "Atlantic" 
                    long [
                        generic [! "Wā Ranatiki"] 
                        standard [! "Wā Arowhānui Ranatiki"] 
                        daylight [! "Wā Awatea Ranatiki"]
                    ]
                ] 
                metazone [
                    #type "Europe_Central" 
                    long [
                        generic [! "Wā Uropi Waenga"] 
                        standard [! "Wā Arowhānui Uropi Waenga"] 
                        daylight [! "Wā Raumati Uropi Waenga"]
                    ]
                ] 
                metazone [
                    #type "Europe_Eastern" 
                    long [
                        generic [! "Wā Uropi Rāwhiti"] 
                        standard [! "Wā Arowhānui Uropi Rāwhiti"] 
                        daylight [! "Wā Raumati Uropi Rāwhiti"]
                    ]
                ] 
                metazone [
                    #type "Europe_Western" 
                    long [
                        generic [! "Wā Uropi Uru"] 
                        standard [! "Wā Arowhānui Uropi Uru"] 
                        daylight [! "Wā Raumati Uropi Uru"]
                    ]
                ] 
                metazone [
                    #type "GMT" 
                    long [
                        standard [! "Wā Toharite Greenwich"]
                    ]
                ]
            ]
        ] 
        numbers [
            symbols [
                #numberSystem "latn" 
                decimal [! "."] 
                group [! ","] 
                percentSign [! "%"] 
                plusSign [! "+"] 
                minusSign [! "-"] 
                exponential [! "E"] 
                superscriptingExponent [! "×"] 
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
                decimalFormatLength [
                    #type "long" 
                    decimalFormat [
                        pattern [#type "1000" #count "other" ! "0K"] 
                        pattern [#type "10000" #count "other" ! "00K"] 
                        pattern [#type "100000" #count "other" ! "000K"] 
                        pattern [#type "1000000" #count "other" ! "0M"] 
                        pattern [#type "10000000" #count "other" ! "00M"] 
                        pattern [#type "100000000" #count "other" ! "000M"] 
                        pattern [#type "1000000000" #count "other" ! "0G"] 
                        pattern [#type "10000000000" #count "other" ! "00G"] 
                        pattern [#type "100000000000" #count "other" ! "000G"] 
                        pattern [#type "1000000000000" #count "other" ! "0T"] 
                        pattern [#type "10000000000000" #count "other" ! "00T"] 
                        pattern [#type "100000000000000" #count "other" ! "000T"]
                    ]
                ] 
                decimalFormatLength [
                    #type "short" 
                    decimalFormat [
                        pattern [#type "1000" #count "other" ! "0K"] 
                        pattern [#type "10000" #count "other" ! "00K"] 
                        pattern [#type "100000" #count "other" ! "000K"] 
                        pattern [#type "1000000" #count "other" ! "0M"] 
                        pattern [#type "10000000" #count "other" ! "00M"] 
                        pattern [#type "100000000" #count "other" ! "000M"] 
                        pattern [#type "1000000000" #count "other" ! "0G"] 
                        pattern [#type "10000000000" #count "other" ! "00G"] 
                        pattern [#type "100000000000" #count "other" ! "000G"] 
                        pattern [#type "1000000000000" #count "other" ! "0T"] 
                        pattern [#type "10000000000000" #count "other" ! "00T"] 
                        pattern [#type "100000000000000" #count "other" ! "000T"]
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
                    currencyFormat [
                        #type "accounting" 
                        pattern [! "¤ #,##0.00"]
                    ]
                ] 
                currencyFormatLength [
                    #type "short" 
                    currencyFormat [
                        #type "standard" 
                        pattern [#type "1000" #count "other" ! "¤ 0K"] 
                        pattern [#type "10000" #count "other" ! "¤ 00K"] 
                        pattern [#type "100000" #count "other" ! "¤ 000K"] 
                        pattern [#type "1000000" #count "other" ! "¤ 0M"] 
                        pattern [#type "10000000" #count "other" ! "¤ 00M"] 
                        pattern [#type "100000000" #count "other" ! "¤ 000M"] 
                        pattern [#type "1000000000" #count "other" ! "¤ 0G"] 
                        pattern [#type "10000000000" #count "other" ! "¤ 00G"] 
                        pattern [#type "100000000000" #count "other" ! "¤ 000G"] 
                        pattern [#type "1000000000000" #count "other" ! "¤ 0T"] 
                        pattern [#type "10000000000000" #count "other" ! "¤ 00T"] 
                        pattern [#type "100000000000000" #count "other" ! "¤ 000T"]
                    ]
                ] 
                unitPattern [#count "other" ! "{0} {1}"]
            ] 
            currencies [
                currency [
                    #type "BRL" 
                    displayName [! "Real Parahi"] 
                    displayName [#count "other" ! "real Parahi"]
                ] 
                currency [
                    #type "CNY" 
                    displayName [! "Yuan Haina"] 
                    displayName [#count "other" ! "yuan Haina"]
                ] 
                currency [
                    #type "EUR" 
                    displayName [! "Euro"] 
                    displayName [#count "other" ! "euro"]
                ] 
                currency [
                    #type "GBP" 
                    displayName [! "Pāuna Piritene"] 
                    displayName [#count "other" ! "pāuna Piritene"]
                ] 
                currency [
                    #type "INR" 
                    displayName [! "Rupī Iniana"] 
                    displayName [#count "other" ! "rupī Iniana"]
                ] 
                currency [
                    #type "JPY" 
                    displayName [! "Yen Hapanihi"] 
                    displayName [#count "other" ! "yen Hapanihi"] 
                    symbol [#draft "contributed" ! "¥"]
                ] 
                currency [
                    #type "NZD" 
                    displayName [! "Tāra o Aotearoa"] 
                    displayName [#count "other" ! "tāra o Aotearoa"] 
                    symbol [! "$"]
                ] 
                currency [
                    #type "RUB" 
                    displayName [! "Rūpera Ruhiana"] 
                    displayName [#count "other" ! "rūpera Ruhiana"]
                ] 
                currency [
                    #type "USD" 
                    displayName [! "Tāra US"] 
                    displayName [#count "other" ! "tāra US"]
                ] 
                currency [
                    #type "XXX" 
                    displayName [! "Moni Tē Mōhiotia"] 
                    displayName [#count "other" ! "(moni tē mōhiotia)"]
                ]
            ] 
            miscPatterns [
                #numberSystem "latn" 
                pattern [#type "atLeast" ! "⩾{0}"] 
                pattern [#type "range" ! "{0}–{1}"]
            ]
        ] 
        units [
            durationUnit [
                #type "hm" 
                durationUnitPattern [! "h:mm"]
            ] 
            durationUnit [
                #type "hms" 
                durationUnitPattern [! "h:mm:ss"]
            ] 
            durationUnit [
                #type "ms" 
                durationUnitPattern [! "m:ss"]
            ]
        ] 
        listPatterns [
            listPattern [
                listPatternPart [#type "start" ! "{0}, {1}"] 
                listPatternPart [#type "middle" ! "{0}, {1}"] 
                listPatternPart [#type "end" ! "{0}, {1}"] 
                listPatternPart [#type "2" ! "{0}, {1}"]
            ]
        ] 
        posix [
            messages [
                yesstr [! "āe:ā"] 
                nostr [! "kāo:k"]
            ]
        ]
    ]

