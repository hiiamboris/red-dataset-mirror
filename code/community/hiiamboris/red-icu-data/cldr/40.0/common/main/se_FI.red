
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "se"] 
            territory [#type "FI"]
        ] 
        localeDisplayNames [
            languages [
                language [#type "ace" ! "ačehgiella"] 
                language [#type "ar_001" ! "standárda arábagiella"] 
                language [#type "be" ! "vilgesruoššagiella"] 
                language [#type "bn" ! "bengalagiella"] 
                language [#type "de_AT" ! "nuortariikkalaš duiskkagiella"] 
                language [#type "de_CH" ! "šveicalaš duiskkagiella"] 
                language [#type "en_AU" ! "austrálialaš eaŋgalsgiella"] 
                language [#type "en_CA" ! "kanádalaš eaŋgalsgiella"] 
                language [#type "en_GB" ! "brihttalaš eaŋgalsgiella"] 
                language [#type "en_GB" #alt "short" ! "brihttalaš eaŋgalsgiella"] 
                language [#type "en_US" ! "amerihkálaš eaŋgalsgiella"] 
                language [#type "en_US" #alt "short" ! "amerihkálaš eaŋgalsgiella"] 
                language [#type "es_419" ! "latiinna-amerihkalaš spánskkagiella"] 
                language [#type "es_ES" ! "espánjalaš spánskkagiella"] 
                language [#type "es_MX" ! "meksikolaš spánskkagiella"] 
                language [#type "fj" ! "fižigiella"] 
                language [#type "fr_CA" ! "kanádalaš fránskkagiella"] 
                language [#type "fr_CH" ! "šveicalaš fránskkagiella"] 
                language [#type "hy" ! "armenagiella"] 
                language [#type "kk" ! "kazakhgiella"] 
                language [#type "km" ! "kambožagiella"] 
                language [#type "ne" ! "nepalagiella"] 
                language [#type "nl_BE" ! "belgialaš hollánddagiella"] 
                language [#type "pa" ! "panjabagiella"] 
                language [#type "pt_BR" ! "brasilialaš portugálagiella"] 
                language [#type "pt_PT" ! "portugálalaš portugálagiella"] 
                language [#type "ro_MD" ! "moldávialaš romániagiella"] 
                language [#type "swb" ! "komoragiella"] 
                language [#type "th" ! "thaigiella"] 
                language [#type "vi" ! "vietnamagiella"] 
                language [#type "zh_Hans" ! "álkes kiinnágiella"] 
                language [#type "zh_Hant" ! "árbevirolaš kiinnágiella"]
            ] 
            scripts [
                script [#type "Arab" ! "arábalaš"] 
                script [#type "Hani" ! "kiinnálaš"] 
                script [#type "Hans" ! "álkes kiinnálaš"] 
                script [#type "Hant" ! "árbevirolaš kiinnálaš"] 
                script [#type "Zxxx" ! "orrut čállojuvvot"] 
                script [#type "Zzzz" ! "dovdameahttun čállin"]
            ] 
            territories [
                territory [#type "001" ! "Máilbmi"] 
                territory [#type "002" ! "Afrihka"] 
                territory [#type "003" ! "Davvi-Amerihká ja Gaska-Amerihká"] 
                territory [#type "005" ! "Lulli-Amerihká"] 
                territory [#type "011" ! "Oarje-Afrihká"] 
                territory [#type "013" ! "Gaska-Amerihká"] 
                territory [#type "014" ! "Nuorta-Afrihká"] 
                territory [#type "015" ! "Davvi-Afrihká"] 
                territory [#type "017" ! "Gaska-Afrihká"] 
                territory [#type "018" ! "Lulli-Afrihká"] 
                territory [#type "019" ! "Amerihka"] 
                territory [#type "021" ! "Davvi-Amerihká"] 
                territory [#type "057" ! "Mikronesia guovlu"] 
                territory [#type "419" ! "Latiinnalaš Amerihká"] 
                territory [#type "BA" ! "Bosnia ja Hercegovina"] 
                territory [#type "CI" #alt "variant" ! "Côte d’Ivoire"] 
                territory [#type "EZ" ! "Euroavádat"] 
                territory [#type "KH" ! "Kamboža"] 
                territory [#type "SD" ! "Sudan"] 
                territory [#type "TD" ! "Chad"] 
                territory [#type "UN" ! "Ovttastuvvan Našuvnnat"]
            ] 
            types [
                type [#key "calendar" #type "buddhist" ! "buddhista kaleandar"] 
                type [#key "calendar" #type "chinese" ! "kiinná kaleandar"] 
                type [#key "calendar" #type "coptic" ! "koptalaš kaleandar"] 
                type [#key "calendar" #type "dangi" ! "dangi kaleandar"] 
                type [#key "calendar" #type "ethiopic" ! "etiohpalaš kaleandar"] 
                type [#key "calendar" #type "ethiopic-amete-alem" ! "etiohpalaš-amete-alem kaleandar"] 
                type [#key "calendar" #type "gregorian" ! "gregorialaš kalendar"]
            ] 
            codePatterns [
                codePattern [#type "script" ! "čállin: {0}"]
            ]
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
                                pattern [! "d.M.y GGGGG"] 
                                datetimeSkeleton [! "GGGGGyMd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "Ed" ! "E d"] 
                            dateFormatItem [#id "Gy" ! "y G"] 
                            dateFormatItem [#id "GyMMM" ! "MMM y G"] 
                            dateFormatItem [#id "GyMMMd" ! "d MMM y G"] 
                            dateFormatItem [#id "GyMMMEd" ! "E d MMM y G"] 
                            dateFormatItem [#id "Md" ! "d/M"] 
                            dateFormatItem [#id "MEd" ! "E d.M"] 
                            dateFormatItem [#id "MMMd" ! "d MMM"] 
                            dateFormatItem [#id "MMMEd" ! "E d MMM"] 
                            dateFormatItem [#id "MMMMd" ! "d MMMM"] 
                            dateFormatItem [#id "y" ! "y G"] 
                            dateFormatItem [#id "yyyy" ! "y G"] 
                            dateFormatItem [#id "yyyyM" ! "MM.y. GGGG"] 
                            dateFormatItem [#id "yyyyMd" ! "dd.MM.y GGGG"] 
                            dateFormatItem [#id "yyyyMEd" ! "E dd.MM.y GGGG"] 
                            dateFormatItem [#id "yyyyMMM" ! "MMM y G"] 
                            dateFormatItem [#id "yyyyMMMd" ! "d MMM y G"] 
                            dateFormatItem [#id "yyyyMMMEd" ! "E d MMM y G"] 
                            dateFormatItem [#id "yyyyMMMM" ! "MMMM y G"] 
                            dateFormatItem [#id "yyyyQQQ" ! "QQQ y G"] 
                            dateFormatItem [#id "yyyyQQQQ" ! "QQQQ y G"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "M" 
                                greatestDifference [#id "M" ! "M – M"]
                            ] 
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" ! "d.M –d.M"] 
                                greatestDifference [#id "M" ! "d.M – d.M"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" ! "E d.M – E d.M"] 
                                greatestDifference [#id "M" ! "E d.M – E d.M"]
                            ] 
                            intervalFormatItem [
                                #id "MMM" 
                                greatestDifference [#id "M" ! "MMM – MMM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMd" 
                                greatestDifference [#id "d" ! "d–d MMM"] 
                                greatestDifference [#id "M" ! "d MMM – d MMM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" ! "E d MMM – E d MMM"] 
                                greatestDifference [#id "M" ! "E d MMM – E d MMM"]
                            ] 
                            intervalFormatItem [
                                #id "y" 
                                greatestDifference [#id "y" ! "y–y G"]
                            ] 
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" ! "M.y – M.y GGGG"] 
                                greatestDifference [#id "y" ! "M.y – M.y GGGG"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" ! "d.M.y – d.M.y GGGG"] 
                                greatestDifference [#id "M" ! "d.M.y – d.M.y GGGG"] 
                                greatestDifference [#id "y" ! "d.M.y – d.M.y GGGG"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" ! "E d.M.y – E d.M.y GGGG"] 
                                greatestDifference [#id "M" ! "E d.M.y – E.d.M.y GGGG"] 
                                greatestDifference [#id "y" ! "E d.M.y – E d.M.y GGGG"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMd" 
                                greatestDifference [#id "d" ! "d–d.MMM y G"] 
                                greatestDifference [#id "M" ! "d.MMM – d.MMM y G"] 
                                greatestDifference [#id "y" ! "d MMM y – d MMM y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" ! "E d MMM y – E d MMM y G"] 
                                greatestDifference [#id "M" ! "E d MMM y – E d MMM y G"] 
                                greatestDifference [#id "y" ! "E d MMM y – E d MMM y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMM" 
                                greatestDifference [#id "M" ! "MMMM – MMMM y G"] 
                                greatestDifference [#id "y" ! "MMMM y – MMMM y G"]
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
                                month [#type "4" ! "cuoŋ"]
                            ]
                        ] 
                        monthContext [
                            #type "stand-alone" 
                            monthWidth [
                                #type "abbreviated" 
                                month [#type "4" ! "cuoŋ"]
                            ]
                        ]
                    ] 
                    days [
                        dayContext [
                            #type "format" 
                            dayWidth [
                                #type "abbreviated" 
                                day [#type "sun" ! "so"] 
                                day [#type "mon" ! "má"] 
                                day [#type "tue" ! "di"] 
                                day [#type "wed" ! "ga"] 
                                day [#type "thu" ! "du"] 
                                day [#type "fri" ! "be"] 
                                day [#type "sat" ! "lá"]
                            ] 
                            dayWidth [
                                #type "narrow" 
                                day [#type "mon" ! "M"] 
                                day [#type "tue" ! "D"]
                            ] 
                            dayWidth [
                                #type "short" 
                                day [#type "sun" ! "so"] 
                                day [#type "mon" ! "má"] 
                                day [#type "tue" ! "di"] 
                                day [#type "wed" ! "ga"] 
                                day [#type "thu" ! "du"] 
                                day [#type "fri" ! "be"] 
                                day [#type "sat" ! "lá"]
                            ] 
                            dayWidth [
                                #type "wide" 
                                day [#type "mon" ! "mánnodat"] 
                                day [#type "tue" ! "disdat"] 
                                day [#type "wed" ! "gaskavahkku"] 
                                day [#type "thu" ! "duorastat"] 
                                day [#type "fri" ! "bearjadat"] 
                                day [#type "sat" ! "lávvordat"]
                            ]
                        ] 
                        dayContext [
                            #type "stand-alone" 
                            dayWidth [
                                #type "abbreviated" 
                                day [#type "sun" ! "so"] 
                                day [#type "mon" ! "má"] 
                                day [#type "tue" ! "di"] 
                                day [#type "wed" ! "ga"] 
                                day [#type "thu" ! "du"] 
                                day [#type "fri" ! "be"] 
                                day [#type "sat" ! "lá"]
                            ] 
                            dayWidth [
                                #type "narrow" 
                                day [#type "sun" ! "S"] 
                                day [#type "mon" ! "M"] 
                                day [#type "tue" ! "D"] 
                                day [#type "wed" ! "G"] 
                                day [#type "thu" ! "D"] 
                                day [#type "fri" ! "B"] 
                                day [#type "sat" ! "L"]
                            ] 
                            dayWidth [
                                #type "short" 
                                day [#type "sun" ! "so"] 
                                day [#type "mon" ! "má"] 
                                day [#type "tue" ! "di"] 
                                day [#type "wed" ! "ga"] 
                                day [#type "thu" ! "du"] 
                                day [#type "fri" ! "be"] 
                                day [#type "sat" ! "lá"]
                            ] 
                            dayWidth [
                                #type "wide" 
                                day [#type "mon" ! "mánnodat"] 
                                day [#type "tue" ! "disdat"] 
                                day [#type "thu" ! "duorastat"] 
                                day [#type "sat" ! "lávvordat"]
                            ]
                        ]
                    ] 
                    quarters [
                        quarterContext [
                            #type "format" 
                            quarterWidth [
                                #type "abbreviated" 
                                quarter [#type "1" ! "1Q"] 
                                quarter [#type "2" ! "2Q"] 
                                quarter [#type "3" ! "3Q"] 
                                quarter [#type "4" ! "4Q"]
                            ] 
                            quarterWidth [
                                #type "wide" 
                                quarter [#type "1" ! "1. njealjádas"] 
                                quarter [#type "2" ! "2. njealjádas"] 
                                quarter [#type "3" ! "3. njealjádas"] 
                                quarter [#type "4" ! "4. njealjádas"]
                            ]
                        ] 
                        quarterContext [
                            #type "stand-alone" 
                            quarterWidth [
                                #type "abbreviated" 
                                quarter [#type "1" ! "Q1"] 
                                quarter [#type "2" ! "2Q"] 
                                quarter [#type "3" ! "3Q"] 
                                quarter [#type "4" ! "4Q"]
                            ] 
                            quarterWidth [
                                #type "wide" 
                                quarter [#type "1" ! "1. njealjádas"] 
                                quarter [#type "2" ! "2. njealjádas"] 
                                quarter [#type "3" ! "3. njealjádas"] 
                                quarter [#type "4" ! "4. njealjádas"]
                            ]
                        ]
                    ] 
                    dayPeriods [
                        dayPeriodContext [
                            #type "format" 
                            dayPeriodWidth [
                                #type "abbreviated" 
                                dayPeriod [#type "am" ! "ib"] 
                                dayPeriod [#type "pm" ! "eb"]
                            ] 
                            dayPeriodWidth [
                                #type "narrow" 
                                dayPeriod [#type "am" ! "i"] 
                                dayPeriod [#type "pm" ! "e"]
                            ] 
                            dayPeriodWidth [
                                #type "wide" 
                                dayPeriod [#type "am" ! "ib"] 
                                dayPeriod [#type "pm" ! "eb"]
                            ]
                        ] 
                        dayPeriodContext [
                            #type "stand-alone" 
                            dayPeriodWidth [
                                #type "abbreviated" 
                                dayPeriod [#type "am" ! "ib"] 
                                dayPeriod [#type "pm" ! "eb"]
                            ] 
                            dayPeriodWidth [
                                #type "narrow" 
                                dayPeriod [#type "am" ! "ib"] 
                                dayPeriod [#type "pm" ! "eb"]
                            ] 
                            dayPeriodWidth [
                                #type "wide" 
                                dayPeriod [#type "am" ! "ib"] 
                                dayPeriod [#type "pm" ! "eb"]
                            ]
                        ]
                    ] 
                    eras [
                        eraNames [
                            era [#type "0" ! "ovdal Kristusa"] 
                            era [#type "0" #alt "variant" ! "ovdal áigelogu"] 
                            era [#type "1" ! "maŋŋel Kristusa"] 
                            era [#type "1" #alt "variant" ! "áigelohku"]
                        ] 
                        eraAbbr [
                            era [#type "0" ! "oKr."] 
                            era [#type "0" #alt "variant" ! "oáá."] 
                            era [#type "1" ! "mKr."] 
                            era [#type "1" #alt "variant" ! "áá."]
                        ]
                    ] 
                    dateFormats [
                        dateFormatLength [
                            #type "full" 
                            dateFormat [
                                pattern [! "EEEE d MMMM y"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "long" 
                            dateFormat [
                                pattern [! "d MMMM y"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "medium" 
                            dateFormat [
                                pattern [! "d MMM y"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "dd.MM.y"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "Ed" ! "d E"] 
                            dateFormatItem [#id "Gy" ! "y G"] 
                            dateFormatItem [#id "GyMMM" ! "MMM y G"] 
                            dateFormatItem [#id "GyMMMd" ! "d MMM y G"] 
                            dateFormatItem [#id "GyMMMEd" ! "E d MMM y G"] 
                            dateFormatItem [#id "Md" ! "d/M"] 
                            dateFormatItem [#id "MEd" ! "E d.M"] 
                            dateFormatItem [#id "MMMd" ! "d MMM"] 
                            dateFormatItem [#id "MMMEd" ! "E d MMM"] 
                            dateFormatItem [#id "MMMMd" ! "d MMMM"] 
                            dateFormatItem [#id "MMMMW" #count "one" ! "MMMM:'a' 'vahkku' W"] 
                            dateFormatItem [#id "MMMMW" #count "two" ! "MMMM:'a' 'vahkku' W"] 
                            dateFormatItem [#id "MMMMW" #count "other" ! "MMMM:'a' 'vahkku' W"] 
                            dateFormatItem [#id "yM" ! "MM.y"] 
                            dateFormatItem [#id "yMd" ! "dd.MM.y"] 
                            dateFormatItem [#id "yMEd" ! "E dd.MM.y"] 
                            dateFormatItem [#id "yMMM" ! "MMM y"] 
                            dateFormatItem [#id "yMMMd" ! "d MMM y"] 
                            dateFormatItem [#id "yMMMEd" ! "E d MMM y"] 
                            dateFormatItem [#id "yMMMM" ! "MMMM y"] 
                            dateFormatItem [#id "yQQQ" ! "QQQ y"] 
                            dateFormatItem [#id "yQQQQ" ! "QQQQ y"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "M" 
                                greatestDifference [#id "M" ! "M–M"]
                            ] 
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" ! "d.M.–d.M."] 
                                greatestDifference [#id "M" ! "d.M.–d.M."]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" ! "E d.M.–E.d.M"] 
                                greatestDifference [#id "M" ! "E d.M.–E d.M."]
                            ] 
                            intervalFormatItem [
                                #id "MMM" 
                                greatestDifference [#id "M" ! "MMM–MMM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMd" 
                                greatestDifference [#id "d" ! "d–d MMM"] 
                                greatestDifference [#id "M" ! "d MMM–d MMM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" ! "E d.MMM–E d.MMM"] 
                                greatestDifference [#id "M" ! "E d.MMM–E d.MMM"]
                            ] 
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" ! "M.y–M.y"] 
                                greatestDifference [#id "y" ! "M.y – M.y"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" ! "d.M.y – d.M.y"] 
                                greatestDifference [#id "M" ! "d.M.y – d.M.y"] 
                                greatestDifference [#id "y" ! "d.M.y – d.M.y"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" ! "E d.M.y – E d.M.y"] 
                                greatestDifference [#id "M" ! "E d.M.y – E d.M.y"] 
                                greatestDifference [#id "y" ! "E d.M.y – E d.M.y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMM" 
                                greatestDifference [#id "M" ! "MMM – MMM y"] 
                                greatestDifference [#id "y" ! "MMM y – MMM y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMd" 
                                greatestDifference [#id "d" ! "d–d MMM y"] 
                                greatestDifference [#id "M" ! "d MMM – d MMM y"] 
                                greatestDifference [#id "y" ! "d MMM y – d MMM y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" ! "E d MMM – E d MMM y"] 
                                greatestDifference [#id "M" ! "E d MMM – E d MMM y"] 
                                greatestDifference [#id "y" ! "E d MMM y – E d MMM y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMM" 
                                greatestDifference [#id "M" ! "MMMM – MMMM y"] 
                                greatestDifference [#id "y" ! "MMMM y – MMMM y"]
                            ]
                        ]
                    ]
                ]
            ] 
            fields [
                field [
                    #type "era" 
                    displayName [! "áigodat"]
                ] 
                field [
                    #type "era-short" 
                    displayName [! "áig."]
                ] 
                field [
                    #type "era-narrow" 
                    displayName [! "áig."]
                ] 
                field [
                    #type "year" 
                    displayName [! "jahki"] 
                    relative [#type "-1" ! "diibmá"] 
                    relative [#type "0" ! "dán jagi"] 
                    relative [#type "1" ! "boahtte jagi"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "{0} jagi siste"] 
                        relativeTimePattern [#count "two" ! "{0} jagi siste"] 
                        relativeTimePattern [#count "other" ! "{0} jagi siste"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "diibmá"] 
                        relativeTimePattern [#count "two" ! "ovddet jagi"] 
                        relativeTimePattern [#count "other" ! "{0} jagi dás ovdal"]
                    ]
                ] 
                field [
                    #type "year-short" 
                    displayName [! "j."] 
                    relative [#type "0" ! "dán jagi"] 
                    relative [#type "1" ! "boahtte jagi"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "{0} j. siste"] 
                        relativeTimePattern [#count "two" ! "{0} jagi siste"] 
                        relativeTimePattern [#count "other" ! "{0} j. siste"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "diibmá"] 
                        relativeTimePattern [#count "two" ! "ovddet jagi"] 
                        relativeTimePattern [#count "other" ! "{0} j. dás ovdal"]
                    ]
                ] 
                field [
                    #type "year-narrow" 
                    displayName [! "j."] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "{0} jagi siste"] 
                        relativeTimePattern [#count "two" ! "{0} jagi siste"] 
                        relativeTimePattern [#count "other" ! "{0} jagi siste"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} j. dás ovdal"] 
                        relativeTimePattern [#count "two" ! "{0} jagi dás ovdal"] 
                        relativeTimePattern [#count "other" ! "{0} j. dás ovdal"]
                    ]
                ] 
                field [
                    #type "quarter" 
                    displayName [! "njealjádasjahki"] 
                    relative [#type "-1" ! "mannan njealjádasjagi"] 
                    relative [#type "0" ! "dán njealjádasjagi"] 
                    relative [#type "1" ! "boahtte njealjádasjagi"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "čuovvovaš {0} njealjádasjagi"] 
                        relativeTimePattern [#count "two" ! "čuovvovaš {0} njealjádasjagi"] 
                        relativeTimePattern [#count "other" ! "čuovvovaš {0} njealjádasjagi"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "-{0} njealjádasjagi dás ovdal"] 
                        relativeTimePattern [#count "two" ! "-{0} njealjádasjagi dás ovdal"] 
                        relativeTimePattern [#count "other" ! "-{0} njealjádasjagi dás ovdal"]
                    ]
                ] 
                field [
                    #type "quarter-short" 
                    displayName [! "njealj.j."] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "boahtte {0} njealj.j."] 
                        relativeTimePattern [#count "two" ! "boahtte {0} njealjádasjagi"] 
                        relativeTimePattern [#count "other" ! "boahtte {0} njealj.j."]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} njealj.j. dás ovdal"] 
                        relativeTimePattern [#count "two" ! "{0} njealjádasjagi dás ovdal"] 
                        relativeTimePattern [#count "other" ! "{0} njealj.j. dás ovdal"]
                    ]
                ] 
                field [
                    #type "quarter-narrow" 
                    displayName [! "jahkenjealjádas"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "boahtte {0} njealj.j."] 
                        relativeTimePattern [#count "two" ! "boahtte {0} njealjádasjagi"] 
                        relativeTimePattern [#count "other" ! "boahtte {0} njealj.j."]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} njealj.j. dás ovdal"] 
                        relativeTimePattern [#count "two" ! "-{0} njealjádasjagi dás ovdal"] 
                        relativeTimePattern [#count "other" ! "{0} njealj.j. dás ovdal"]
                    ]
                ] 
                field [
                    #type "month" 
                    relative [#type "-1" ! "mannan mánu"] 
                    relative [#type "0" ! "dán mánu"] 
                    relative [#type "1" ! "boahtte mánu"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "{0} mánu siste"] 
                        relativeTimePattern [#count "two" ! "{0} mánu siste"] 
                        relativeTimePattern [#count "other" ! "{0} mánu siste"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} mánnu dás ovdal"] 
                        relativeTimePattern [#count "two" ! "{0} mánu dás ovdal"] 
                        relativeTimePattern [#count "other" ! "{0} mánu dás ovdal"]
                    ]
                ] 
                field [
                    #type "month-short" 
                    displayName [! "m."] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "{0} mánu siste"] 
                        relativeTimePattern [#count "two" ! "{0} mánu siste"] 
                        relativeTimePattern [#count "other" ! "{0} mánu siste"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} mánnu dás ovdal"] 
                        relativeTimePattern [#count "two" ! "{0} mánu dás ovdal"] 
                        relativeTimePattern [#count "other" ! "{0} mánu dás ovdal"]
                    ]
                ] 
                field [
                    #type "month-narrow" 
                    displayName [! "m."] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "{0} mánu geahčen"] 
                        relativeTimePattern [#count "two" ! "{0} mánu geahčen"] 
                        relativeTimePattern [#count "other" ! "{0} mánu geahčen"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} mánnu dás ovdal"] 
                        relativeTimePattern [#count "two" ! "{0} mánu dás ovdal"] 
                        relativeTimePattern [#count "other" ! "{0} mánu dás ovdal"]
                    ]
                ] 
                field [
                    #type "week" 
                    displayName [! "vahkku"] 
                    relative [#type "-1" ! "mannan vahku"] 
                    relative [#type "0" ! "dán vahku"] 
                    relative [#type "1" ! "boahtte vahku"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "{0} vahku geahčen"] 
                        relativeTimePattern [#count "two" ! "{0} vahku geahčen"] 
                        relativeTimePattern [#count "other" ! "{0} vahku geahčen"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} vahkku dás ovdal"] 
                        relativeTimePattern [#count "two" ! "{0} vahku dás ovdal"] 
                        relativeTimePattern [#count "other" ! "{0} vahku dás ovdal"]
                    ] 
                    relativePeriod [! "{0} vahkku"]
                ] 
                field [
                    #type "week-short" 
                    displayName [! "v(k)"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "{0} v(k) siste"] 
                        relativeTimePattern [#count "two" ! "{0} vahku siste"] 
                        relativeTimePattern [#count "other" ! "{0} v(k) siste"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} v(k) dás ovdal"] 
                        relativeTimePattern [#count "two" ! "{0} vahku dás ovdal"] 
                        relativeTimePattern [#count "other" ! "{0} v(k) dás ovdal"]
                    ] 
                    relativePeriod [! "{0} vahkku"]
                ] 
                field [
                    #type "week-narrow" 
                    displayName [! "v(k)"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "{0} v(k) geahčen"] 
                        relativeTimePattern [#count "two" ! "{0} v(k) geahčen"] 
                        relativeTimePattern [#count "other" ! "{0} v(k) geahčen"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} vahkku dás ovdal"] 
                        relativeTimePattern [#count "two" ! "{0} vahku dás ovdal"] 
                        relativeTimePattern [#count "other" ! "{0} v(k) dás ovdal"]
                    ] 
                    relativePeriod [! "{0} vahkku"]
                ] 
                field [
                    #type "weekOfMonth" 
                    displayName [! "mánu vahkku"]
                ] 
                field [
                    #type "weekOfMonth-short" 
                    displayName [! "m. v(k)"]
                ] 
                field [
                    #type "weekOfMonth-narrow" 
                    displayName [! "m. v(k)"]
                ] 
                field [
                    #type "day" 
                    relative [#type "-2" ! "ovddet beaivvi"] 
                    relative [#type "2" ! "don beaivve"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "{0} beaivve siste"] 
                        relativeTimePattern [#count "two" ! "{0} beaivve siste"] 
                        relativeTimePattern [#count "other" ! "{0} beaivve siste"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "ikte"] 
                        relativeTimePattern [#count "two" ! "ovddet beaivve"] 
                        relativeTimePattern [#count "other" ! "{0} beaivve dás ovdal"]
                    ]
                ] 
                field [
                    #type "day-short" 
                    displayName [! "b."] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "{0} beaivve siste"] 
                        relativeTimePattern [#count "two" ! "{0} beaivve siste"] 
                        relativeTimePattern [#count "other" ! "{0} beaivve siste"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "ikte"] 
                        relativeTimePattern [#count "two" ! "ovddet beaivve"] 
                        relativeTimePattern [#count "other" ! "{0} beaivve dás ovdal"]
                    ]
                ] 
                field [
                    #type "day-narrow" 
                    displayName [! "b."] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "{0} beaivve siste"] 
                        relativeTimePattern [#count "two" ! "{0} beaivve siste"] 
                        relativeTimePattern [#count "other" ! "{0} beaivve siste"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "ikte"] 
                        relativeTimePattern [#count "two" ! "ovddet beaivve"] 
                        relativeTimePattern [#count "other" ! "{0} beaivve dás ovdal"]
                    ]
                ] 
                field [
                    #type "dayOfYear" 
                    displayName [! "jagi beaivi"]
                ] 
                field [
                    #type "dayOfYear-short" 
                    displayName [! "j. beaivi"]
                ] 
                field [
                    #type "dayOfYear-narrow" 
                    displayName [! "j. beaivi"]
                ] 
                field [
                    #type "weekday" 
                    displayName [! "vahkkobeaivi"]
                ] 
                field [
                    #type "weekday-short" 
                    displayName [! "v(k) beaivi"]
                ] 
                field [
                    #type "weekday-narrow" 
                    displayName [! "v(k) beaivi"]
                ] 
                field [
                    #type "weekdayOfMonth" 
                    displayName [! "mánu vahkkobeaivi"]
                ] 
                field [
                    #type "weekdayOfMonth-short" 
                    displayName [! "m. v(k)b."]
                ] 
                field [
                    #type "weekdayOfMonth-narrow" 
                    displayName [! "m. v(k)b."]
                ] 
                field [
                    #type "sun" 
                    relative [#type "-1" ! "mannan sotnabeaivve"] 
                    relative [#type "0" ! "dán sotnabeaivve"] 
                    relative [#type "1" ! "boahtte sotnabeaivve"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "boahtte sotnabeaivve"] 
                        relativeTimePattern [#count "two" ! "boahtte {0} sotnabeaivve"] 
                        relativeTimePattern [#count "other" ! "boahtte {0} sotnabeaivve"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "mannan sotnabeaivve"] 
                        relativeTimePattern [#count "two" ! "ovddet sotnabeaivve"] 
                        relativeTimePattern [#count "other" ! "{0} sotnabeaivve dás ovdal"]
                    ]
                ] 
                field [
                    #type "sun-short" 
                    relative [#type "-1" ! "mannan so"] 
                    relative [#type "0" ! "dán so"] 
                    relative [#type "1" ! "boahtte so"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "boahtte so"] 
                        relativeTimePattern [#count "two" ! "maŋit sotnabeaivve"] 
                        relativeTimePattern [#count "other" ! "{0} boahtte so"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "mannan so"] 
                        relativeTimePattern [#count "two" ! "ovddet sotnabeaivve"] 
                        relativeTimePattern [#count "other" ! "{0} so dás ovdal"]
                    ]
                ] 
                field [
                    #type "sun-narrow" 
                    relative [#type "-1" ! "mannan so"] 
                    relative [#type "0" ! "dán so"] 
                    relative [#type "1" ! "boahtte so"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "{0} boahtte so"] 
                        relativeTimePattern [#count "two" ! "boahtte {0} sotnabeaivve"] 
                        relativeTimePattern [#count "other" ! "{0} boahtte so"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} mannan so"] 
                        relativeTimePattern [#count "two" ! "ovddet sotnabeaivve"] 
                        relativeTimePattern [#count "other" ! "{0} so dás ovdal"]
                    ]
                ] 
                field [
                    #type "mon" 
                    relative [#type "-1" ! "mannan mánnodaga"] 
                    relative [#type "0" ! "dán mánnodaga"] 
                    relative [#type "1" ! "boahtte mánnodaga"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "{0} boahtte mánnodaga"] 
                        relativeTimePattern [#count "two" ! "boahtte {0} mánnodaga"] 
                        relativeTimePattern [#count "other" ! "boahtte {0} mánnodaga"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "mannan mánnodaga"] 
                        relativeTimePattern [#count "two" ! "ovddet mánnodaga"] 
                        relativeTimePattern [#count "other" ! "{0} mánnodaga dás ovdal"]
                    ]
                ] 
                field [
                    #type "mon-short" 
                    relative [#type "-1" ! "mannan má"] 
                    relative [#type "0" ! "dán má"] 
                    relative [#type "1" ! "boahtte má"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "{0} boahtte má"] 
                        relativeTimePattern [#count "two" ! "{0} boahtte mánnodaga"] 
                        relativeTimePattern [#count "other" ! "{0} boahtte má"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "mannan má"] 
                        relativeTimePattern [#count "two" ! "ovddet má"] 
                        relativeTimePattern [#count "other" ! "{0} má dás ovdal"]
                    ]
                ] 
                field [
                    #type "mon-narrow" 
                    relative [#type "-1" ! "mannan má"] 
                    relative [#type "0" ! "dán má"] 
                    relative [#type "1" ! "boahtte má"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "{0} boahtte má"] 
                        relativeTimePattern [#count "two" ! "{0} boahtte mánnodaga"] 
                        relativeTimePattern [#count "other" ! "{0} boahtte má"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} mannan má"] 
                        relativeTimePattern [#count "two" ! "ovddet má"] 
                        relativeTimePattern [#count "other" ! "{0} má dás ovdal"]
                    ]
                ] 
                field [
                    #type "tue" 
                    relative [#type "-1" ! "mannan disdaga"] 
                    relative [#type "0" ! "dán disdaga"] 
                    relative [#type "1" ! "boahtte disdaga"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "{0} boahtte disdaga"] 
                        relativeTimePattern [#count "two" ! "{0} boahtte disdaga"] 
                        relativeTimePattern [#count "other" ! "{0} boahtte disdaga"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "mannan disdaga"] 
                        relativeTimePattern [#count "two" ! "ovddet disdaga"] 
                        relativeTimePattern [#count "other" ! "{0} disdaga dás ovdal"]
                    ]
                ] 
                field [
                    #type "tue-short" 
                    relative [#type "-1" ! "mannan di"] 
                    relative [#type "0" ! "dán di"] 
                    relative [#type "1" ! "boahtte di"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "boahtte di"] 
                        relativeTimePattern [#count "two" ! "{0} boahtte disdaga"] 
                        relativeTimePattern [#count "other" ! "{0} boahtte di"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "mannan di"] 
                        relativeTimePattern [#count "two" ! "ovddet disdaga"] 
                        relativeTimePattern [#count "other" ! "{0} di dás ovdal"]
                    ]
                ] 
                field [
                    #type "tue-narrow" 
                    relative [#type "-1" ! "mannan di"] 
                    relative [#type "0" ! "dán di"] 
                    relative [#type "1" ! "boahtte di"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "{0} boahtte di"] 
                        relativeTimePattern [#count "two" ! "{0} boahtte disdaga"] 
                        relativeTimePattern [#count "other" ! "{0} boahtte di"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} mannan di"] 
                        relativeTimePattern [#count "two" ! "ovddet disdaga"] 
                        relativeTimePattern [#count "other" ! "{0} di dás ovdal"]
                    ]
                ] 
                field [
                    #type "wed" 
                    relative [#type "-1" ! "mannan gaskavahku"] 
                    relative [#type "0" ! "dán gaskavahku"] 
                    relative [#type "1" ! "boahtte gaskavahku"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "boahtte gaskavahku"] 
                        relativeTimePattern [#count "two" ! "{0} boahtte gaskavahku"] 
                        relativeTimePattern [#count "other" ! "{0} boahtte gaskavahku"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "mannan gaskavahku"] 
                        relativeTimePattern [#count "two" ! "ovddet gaskavahku"] 
                        relativeTimePattern [#count "other" ! "{0} gaskavahku dás ovdal"]
                    ]
                ] 
                field [
                    #type "wed-short" 
                    relative [#type "-1" ! "mannan ga"] 
                    relative [#type "0" ! "dán ga"] 
                    relative [#type "1" ! "boahtte ga"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "boahtte ga"] 
                        relativeTimePattern [#count "two" ! "{0} boahtte gaskavahku"] 
                        relativeTimePattern [#count "other" ! "{0} boahtte ga"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "mannan ga"] 
                        relativeTimePattern [#count "two" ! "ovddet gaskavahku"] 
                        relativeTimePattern [#count "other" ! "{0} ga dás ovdal"]
                    ]
                ] 
                field [
                    #type "wed-narrow" 
                    relative [#type "-1" ! "mannan ga"] 
                    relative [#type "0" ! "dán ga"] 
                    relative [#type "1" ! "boahtte ga"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "{0} boahtte ga"] 
                        relativeTimePattern [#count "two" ! "{0} boahtte gaskavahku"] 
                        relativeTimePattern [#count "other" ! "{0} boahtte ga"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} mannan ga"] 
                        relativeTimePattern [#count "two" ! "ovddet gaskavahku"] 
                        relativeTimePattern [#count "other" ! "{0} ga dás ovdal"]
                    ]
                ] 
                field [
                    #type "thu" 
                    relative [#type "-1" ! "mannan duorastaga"] 
                    relative [#type "0" ! "dán duorastaga"] 
                    relative [#type "1" ! "boahtte duorastaga"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "boahtte duorastaga"] 
                        relativeTimePattern [#count "two" ! "+{0} boahtte duorastaga"] 
                        relativeTimePattern [#count "other" ! "+{0} boahtte duorastaga"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "mannan duorastaga"] 
                        relativeTimePattern [#count "two" ! "ovddet duorastaga"] 
                        relativeTimePattern [#count "other" ! "{0} duorastaga dás ovdal"]
                    ]
                ] 
                field [
                    #type "thu-short" 
                    relative [#type "-1" ! "mannan du"] 
                    relative [#type "0" ! "dán du"] 
                    relative [#type "1" ! "boahtte du"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "boahtte du"] 
                        relativeTimePattern [#count "two" ! "+{0} boahtte duorastaga"] 
                        relativeTimePattern [#count "other" ! "+{0} boahtte du"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "mannan du"] 
                        relativeTimePattern [#count "two" ! "ovddet duorastaga"] 
                        relativeTimePattern [#count "other" ! "{0} du dás ovdal"]
                    ]
                ] 
                field [
                    #type "thu-narrow" 
                    relative [#type "-1" ! "mannan du"] 
                    relative [#type "0" ! "dán du"] 
                    relative [#type "1" ! "boahtte du"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "{0} boahtte du"] 
                        relativeTimePattern [#count "two" ! "+{0} boahtte duorastaga"] 
                        relativeTimePattern [#count "other" ! "+{0} boahtte du"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} mannan du"] 
                        relativeTimePattern [#count "two" ! "ovddet duorastaga"] 
                        relativeTimePattern [#count "other" ! "{0} du dás ovdal"]
                    ]
                ] 
                field [
                    #type "fri" 
                    relative [#type "-1" ! "mannan bearjadaga"] 
                    relative [#type "0" ! "dán bearjadaga"] 
                    relative [#type "1" ! "boahtte bearjadaga"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "boahtte bearjadaga"] 
                        relativeTimePattern [#count "two" ! "boahtte {0} bearjadaga"] 
                        relativeTimePattern [#count "other" ! "boahtte {0} bearjadaga"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "mannan bearjadaga"] 
                        relativeTimePattern [#count "two" ! "ovddet bearjadaga"] 
                        relativeTimePattern [#count "other" ! "-{0} bearjadaga dás ovdal"]
                    ]
                ] 
                field [
                    #type "fri-short" 
                    relative [#type "-1" ! "mannan be"] 
                    relative [#type "0" ! "dán be"] 
                    relative [#type "1" ! "boahtte be"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "boahtte be"] 
                        relativeTimePattern [#count "two" ! "boahtte {0} bearjadaga"] 
                        relativeTimePattern [#count "other" ! "boahtte {0} be"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "mannan be"] 
                        relativeTimePattern [#count "two" ! "ovddet bearjadaga"] 
                        relativeTimePattern [#count "other" ! "-{0} be dás ovdal"]
                    ]
                ] 
                field [
                    #type "fri-narrow" 
                    relative [#type "-1" ! "mannan be"] 
                    relative [#type "0" ! "dán be"] 
                    relative [#type "1" ! "boahtte be"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "boahtte {0} be"] 
                        relativeTimePattern [#count "two" ! "boahtte {0} bearjadaga"] 
                        relativeTimePattern [#count "other" ! "boahtte {0} be"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} mannan be"] 
                        relativeTimePattern [#count "two" ! "ovddet bearjadaga"] 
                        relativeTimePattern [#count "other" ! "-{0} be dás ovdal"]
                    ]
                ] 
                field [
                    #type "sat" 
                    relative [#type "-1" ! "mannan lávvordaga"] 
                    relative [#type "0" ! "dán lávvordaga"] 
                    relative [#type "1" ! "boahtte lávvordaga"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "{0} boahtte lávvordaga"] 
                        relativeTimePattern [#count "two" ! "boahtte {0} lávvordaga"] 
                        relativeTimePattern [#count "other" ! "boahtte {0} lávvordaga"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "mannan lávvordaga"] 
                        relativeTimePattern [#count "two" ! "ovddet lávvordaga"] 
                        relativeTimePattern [#count "other" ! "-{0} lávvordaga dás ovdal"]
                    ]
                ] 
                field [
                    #type "sat-short" 
                    relative [#type "-1" ! "mannan lá"] 
                    relative [#type "0" ! "dán lá"] 
                    relative [#type "1" ! "boahtte lá"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "+{0} boahtte lá"] 
                        relativeTimePattern [#count "two" ! "boahtte {0} lá"] 
                        relativeTimePattern [#count "other" ! "boahtte {0} lá"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "mannan lá"] 
                        relativeTimePattern [#count "two" ! "ovddet lá"] 
                        relativeTimePattern [#count "other" ! "-{0} lá dás ovdal"]
                    ]
                ] 
                field [
                    #type "sat-narrow" 
                    relative [#type "-1" ! "mannan lá"] 
                    relative [#type "0" ! "dán lá"] 
                    relative [#type "1" ! "boahtte lá"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "+{0} boahtte lá"] 
                        relativeTimePattern [#count "two" ! "boahtte {0} lá"] 
                        relativeTimePattern [#count "other" ! "boahtte {0} lá"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} mannan lá"] 
                        relativeTimePattern [#count "two" ! "ovddet lá"] 
                        relativeTimePattern [#count "other" ! "-{0} lá dás ovdal"]
                    ]
                ] 
                field [
                    #type "dayperiod-short" 
                    displayName [! "ib/eb"]
                ] 
                field [
                    #type "dayperiod" 
                    displayName [! "ib/eb"]
                ] 
                field [
                    #type "hour" 
                    relative [#type "0" ! "dán diimmu"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "{0} diimmu siste"] 
                        relativeTimePattern [#count "two" ! "{0} diimmu siste"] 
                        relativeTimePattern [#count "other" ! "{0} diimmu siste"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} diibmu áigi"] 
                        relativeTimePattern [#count "two" ! "{0} diimmu áigi"] 
                        relativeTimePattern [#count "other" ! "{0} diimmu áigi"]
                    ]
                ] 
                field [
                    #type "hour-short" 
                    displayName [! "dmu"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "{0} dmu siste"] 
                        relativeTimePattern [#count "two" ! "{0} diimmu siste"] 
                        relativeTimePattern [#count "other" ! "{0} dmu siste"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} dmu áigi"] 
                        relativeTimePattern [#count "two" ! "{0} diimmu áigi"] 
                        relativeTimePattern [#count "other" ! "{0} dmu áigi"]
                    ]
                ] 
                field [
                    #type "hour-narrow" 
                    displayName [! "dmu"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "{0} dmu siste"] 
                        relativeTimePattern [#count "two" ! "{0} diimmu siste"] 
                        relativeTimePattern [#count "other" ! "{0} dmu siste"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} dmu áigi"] 
                        relativeTimePattern [#count "two" ! "{0} diimmu áigi"] 
                        relativeTimePattern [#count "other" ! "{0} dmu áigi"]
                    ]
                ] 
                field [
                    #type "minute" 
                    relative [#type "0" ! "dán minuhta"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "{0} minuhta siste"] 
                        relativeTimePattern [#count "two" ! "{0} minuhta siste"] 
                        relativeTimePattern [#count "other" ! "{0} minuhta siste"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} minuhtta áigi"] 
                        relativeTimePattern [#count "two" ! "{0} minuhta áigi"] 
                        relativeTimePattern [#count "other" ! "{0} minuhta áigi"]
                    ]
                ] 
                field [
                    #type "minute-short" 
                    displayName [! "min."] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "{0} min. siste"] 
                        relativeTimePattern [#count "two" ! "{0} minuhta siste"] 
                        relativeTimePattern [#count "other" ! "{0} min. siste"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} min. áigi"] 
                        relativeTimePattern [#count "two" ! "{0} minuhta áigi"] 
                        relativeTimePattern [#count "other" ! "{0} min. áigi"]
                    ]
                ] 
                field [
                    #type "minute-narrow" 
                    displayName [! "min."] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "{0} min. siste"] 
                        relativeTimePattern [#count "two" ! "{0} minuhta siste"] 
                        relativeTimePattern [#count "other" ! "{0} min. siste"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} min. áigi"] 
                        relativeTimePattern [#count "two" ! "{0} minuhta áigi"] 
                        relativeTimePattern [#count "other" ! "{0} min. áigi"]
                    ]
                ] 
                field [
                    #type "second" 
                    relative [#type "0" ! "dál"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "{0} sekundda siste"] 
                        relativeTimePattern [#count "two" ! "{0} sekundda siste"] 
                        relativeTimePattern [#count "other" ! "{0} sekundda siste"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} sekunda áigi"] 
                        relativeTimePattern [#count "two" ! "{0} sekundda áigi"] 
                        relativeTimePattern [#count "other" ! "{0} sekundda áigi"]
                    ]
                ] 
                field [
                    #type "second-short" 
                    displayName [! "sek."] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "{0} sek. siste"] 
                        relativeTimePattern [#count "two" ! "{0} sekundda siste"] 
                        relativeTimePattern [#count "other" ! "{0} sek. siste"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} sek. áigi"] 
                        relativeTimePattern [#count "two" ! "{0} sekundda áigi"] 
                        relativeTimePattern [#count "other" ! "{0} sek. áigi"]
                    ]
                ] 
                field [
                    #type "second-narrow" 
                    displayName [! "sek."] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "{0} sek. siste"] 
                        relativeTimePattern [#count "two" ! "{0} sekundda siste"] 
                        relativeTimePattern [#count "other" ! "{0} sek. siste"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} sek. áigi"] 
                        relativeTimePattern [#count "two" ! "{0} sekundda áigi"] 
                        relativeTimePattern [#count "other" ! "{0} sek. áigi"]
                    ]
                ] 
                field [
                    #type "zone-short" 
                    displayName [! "á.av."]
                ] 
                field [
                    #type "zone-narrow" 
                    displayName [! "á.av."]
                ]
            ] 
            timeZoneNames [
                hourFormat [! "+HH:mm;-HH:mm"] 
                gmtFormat [! "{0} GMT"] 
                gmtZeroFormat [! "GMT"] 
                regionFormat [#type "daylight" ! "{0} geasseáigi"] 
                regionFormat [#type "standard" ! "{0} dálveáigi"] 
                zone [
                    #type "Etc/UTC" 
                    long [
                        standard [! "koordinerejuvvon oktasaš áigi"]
                    ]
                ] 
                zone [
                    #type "Etc/Unknown" 
                    exemplarCity [! "Dovdameahttun gávpot"]
                ] 
                zone [
                    #type "Europe/Tirane" 
                    exemplarCity [! "Tirana"]
                ] 
                zone [
                    #type "Asia/Yerevan" 
                    exemplarCity [! "Jerevan"]
                ] 
                zone [
                    #type "Europe/Vienna" 
                    exemplarCity [! "Wien"]
                ] 
                zone [
                    #type "Europe/Brussels" 
                    exemplarCity [! "Brüssel"]
                ] 
                zone [
                    #type "Indian/Cocos" 
                    exemplarCity [! "Kokos"]
                ] 
                zone [
                    #type "Europe/Zurich" 
                    exemplarCity [! "Zürich"]
                ] 
                zone [
                    #type "Atlantic/Cape_Verde" 
                    exemplarCity [! "Kap Verde"]
                ] 
                zone [
                    #type "Indian/Christmas" 
                    exemplarCity [! "Juovlasuolu"]
                ] 
                zone [
                    #type "Europe/Prague" 
                    exemplarCity [! "Praha"]
                ] 
                zone [
                    #type "Europe/Copenhagen" 
                    exemplarCity [! "København"]
                ] 
                zone [
                    #type "Africa/Cairo" 
                    exemplarCity [! "Kairo"]
                ] 
                zone [
                    #type "Atlantic/Canary" 
                    exemplarCity [! "Kanária"]
                ] 
                zone [
                    #type "Europe/Helsinki" 
                    exemplarCity [! "Helsset"]
                ] 
                zone [
                    #type "Europe/London" 
                    long [
                        daylight [! "Brihtalaš geasseáigi"]
                    ]
                ] 
                zone [
                    #type "America/Danmarkshavn" 
                    exemplarCity [! "Dánmárkkuhámman"]
                ] 
                zone [
                    #type "Europe/Athens" 
                    exemplarCity [! "Athena"]
                ] 
                zone [
                    #type "Atlantic/South_Georgia" 
                    exemplarCity [! "Lulli-Georgia"]
                ] 
                zone [
                    #type "Europe/Dublin" 
                    long [
                        daylight [! "Irlánddalaš dálveáigi"]
                    ]
                ] 
                zone [
                    #type "Europe/Isle_of_Man" 
                    exemplarCity [! "Mansuolu"]
                ] 
                zone [
                    #type "Asia/Tehran" 
                    exemplarCity [! "Teheran"]
                ] 
                zone [
                    #type "Europe/Rome" 
                    exemplarCity [! "Roma"]
                ] 
                zone [
                    #type "Europe/Luxembourg" 
                    exemplarCity [! "Luxenburg"]
                ] 
                zone [
                    #type "Asia/Rangoon" 
                    exemplarCity [! "Rangoon"]
                ] 
                zone [
                    #type "Asia/Ulaanbaatar" 
                    exemplarCity [! "Ulan-Bator"]
                ] 
                zone [
                    #type "Indian/Maldives" 
                    exemplarCity [! "Malediivvat"]
                ] 
                zone [
                    #type "Pacific/Marquesas" 
                    exemplarCity [! "Marquesasat"]
                ] 
                zone [
                    #type "Europe/Warsaw" 
                    exemplarCity [! "Warsawa"]
                ] 
                zone [
                    #type "Atlantic/Azores" 
                    exemplarCity [! "Azorat"]
                ] 
                zone [
                    #type "Europe/Lisbon" 
                    exemplarCity [! "Lisboa"]
                ] 
                zone [
                    #type "Europe/Bucharest" 
                    exemplarCity [! "Bukarest"]
                ] 
                zone [
                    #type "Europe/Belgrade" 
                    exemplarCity [! "Belgrad"]
                ] 
                zone [
                    #type "Europe/Moscow" 
                    exemplarCity [! "Moskva"]
                ] 
                zone [
                    #type "Europe/Ulyanovsk" 
                    exemplarCity [! "Uljanovsk"]
                ] 
                zone [
                    #type "Asia/Yekaterinburg" 
                    exemplarCity [! "Jekaterinburg"]
                ] 
                zone [
                    #type "Asia/Novokuznetsk" 
                    exemplarCity [! "Novokusneck"]
                ] 
                zone [
                    #type "Asia/Krasnoyarsk" 
                    exemplarCity [! "Krasnojarsk"]
                ] 
                zone [
                    #type "Asia/Irkutsk" 
                    exemplarCity [! "Irkuck"]
                ] 
                zone [
                    #type "Asia/Yakutsk" 
                    exemplarCity [! "Jakuck"]
                ] 
                zone [
                    #type "Asia/Sakhalin" 
                    exemplarCity [! "Sahalin"]
                ] 
                zone [
                    #type "Asia/Kamchatka" 
                    exemplarCity [! "Kamčatka"]
                ] 
                zone [
                    #type "Asia/Damascus" 
                    exemplarCity [! "Damaskos"]
                ] 
                zone [
                    #type "America/North_Dakota/Beulah" 
                    exemplarCity [! "Beulah, Davvi-Dakota"]
                ] 
                zone [
                    #type "America/North_Dakota/New_Salem" 
                    exemplarCity [! "New Salem, Davvi-Dakota"]
                ] 
                zone [
                    #type "America/North_Dakota/Center" 
                    exemplarCity [! "Guovddáš, Davvi-Dakota"]
                ] 
                metazone [
                    #type "Afghanistan" 
                    long [
                        standard [! "Afganisthana áigi"]
                    ]
                ] 
                metazone [
                    #type "Africa_Central" 
                    long [
                        standard [! "Gaska-Afrihká áigi"]
                    ]
                ] 
                metazone [
                    #type "Africa_Eastern" 
                    long [
                        standard [! "Nuorta-Afrihká áigi"]
                    ]
                ] 
                metazone [
                    #type "Africa_Southern" 
                    long [
                        standard [! "Lulli-Afrihká dálveáigi"]
                    ]
                ] 
                metazone [
                    #type "Africa_Western" 
                    long [
                        generic [! "Oarje-Afrihká áigi"] 
                        standard [! "Oarje-Afrihká dálveáigi"] 
                        daylight [! "Oarje-Afrihká geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Alaska" 
                    long [
                        generic [! "Alaska áigi"] 
                        standard [! "Alaska dálveáigi"] 
                        daylight [! "Alaska geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Amazon" 
                    long [
                        generic [! "Amazona áigi"] 
                        standard [! "Amazona dálveáigi"] 
                        daylight [! "Amazona geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "America_Central" 
                    long [
                        generic [! "dábálašáigi"] 
                        standard [! "dábálaš dálveáigi"] 
                        daylight [! "dábálaš geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "America_Eastern" 
                    long [
                        generic [! "áigi nuortan"] 
                        standard [! "dálveáigi nuortan"] 
                        daylight [! "geasseáigi nuortan"]
                    ]
                ] 
                metazone [
                    #type "America_Mountain" 
                    long [
                        generic [! "duottaráigi"] 
                        standard [! "dálveduottaráigi"] 
                        daylight [! "geasseduottaráigi"]
                    ]
                ] 
                metazone [
                    #type "America_Pacific" 
                    long [
                        generic [! "Jaskesábi áigi"] 
                        standard [! "Jaskesábi dálveáigi"] 
                        daylight [! "Jaskesábi geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Apia" 
                    long [
                        generic [! "Apia áigi"] 
                        standard [! "Apia dálveáigi"] 
                        daylight [! "Apia geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Arabian" 
                    long [
                        generic [! "Arábia áigi"] 
                        standard [! "Arábia dálveáigi"] 
                        daylight [! "Arábia geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Argentina" 
                    long [
                        generic [! "Argentina áigi"] 
                        standard [! "Argentina dálveáigi"] 
                        daylight [! "Argentina geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Argentina_Western" 
                    long [
                        generic [! "Oarje-Argentina áigi"] 
                        standard [! "Oarje-Argentina dálveáigi"] 
                        daylight [! "Oarje-Argentina geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Armenia" 
                    long [
                        generic [! "Armenia áigi"] 
                        standard [! "Armenia dálveáigi"] 
                        daylight [! "Armenia geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Atlantic" 
                    long [
                        generic [! "atlántalaš áigi"] 
                        standard [! "atlántalaš dálveáigi"] 
                        daylight [! "atlántalaš geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Australia_Central" 
                    long [
                        generic [! "Gaska-Austrália áigi"] 
                        standard [! "Gaska-Austrália dálveáigi"] 
                        daylight [! "Gaska-Austrália geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Australia_CentralWestern" 
                    long [
                        generic [! "Gaska-Austrália oarjjabeali áigi"] 
                        standard [! "Gaska-Austrália oarjjabeali dálveáigi"] 
                        daylight [! "Gaska-Austrália oarjjabeali geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Australia_Eastern" 
                    long [
                        generic [! "Nuorta-Austrália áigi"] 
                        standard [! "Nuorta-Austrália dálveáigi"] 
                        daylight [! "Nuorta-Austrália geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Australia_Western" 
                    long [
                        generic [! "Oarje-Austrália áigi"] 
                        standard [! "Oarje-Austrália dálveáigi"] 
                        daylight [! "Oarje-Austrália geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Azerbaijan" 
                    long [
                        generic [! "Aserbaižana áigi"] 
                        standard [! "Aserbaižana dálveáigi"] 
                        daylight [! "Aserbaižana geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Azores" 
                    long [
                        generic [! "Azoraid áigi"] 
                        standard [! "Azoraid dálveáigi"] 
                        daylight [! "Azoraid geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Bangladesh" 
                    long [
                        generic [! "Bangladesha áigi"] 
                        standard [! "Bangladesha dálveáigi"] 
                        daylight [! "Bangladesha geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Bhutan" 
                    long [
                        standard [! "Bhutana áigi"]
                    ]
                ] 
                metazone [
                    #type "Bolivia" 
                    long [
                        standard [! "Bolivia áigi"]
                    ]
                ] 
                metazone [
                    #type "Brasilia" 
                    long [
                        generic [! "Brasilia áigi"] 
                        standard [! "Brasilia dálveáigi"] 
                        daylight [! "Brasilia geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Brunei" 
                    long [
                        standard [! "Brunei Darussalama áigi"]
                    ]
                ] 
                metazone [
                    #type "Cape_Verde" 
                    long [
                        generic [! "Kap Verde áigi"] 
                        standard [! "Kap Verde dálveáigi"] 
                        daylight [! "Kap Verde geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Chamorro" 
                    long [
                        standard [! "Čamorro dálveáigi"]
                    ]
                ] 
                metazone [
                    #type "Chatham" 
                    long [
                        generic [! "Chathama áigi"] 
                        standard [! "Chathama dálveáigi"] 
                        daylight [! "Chathama geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Chile" 
                    long [
                        generic [! "Chile áigi"] 
                        standard [! "Chile dálveáigi"] 
                        daylight [! "Chile geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "China" 
                    long [
                        generic [! "Kiinná áigi"] 
                        standard [! "Kiinná dálveáigi"] 
                        daylight [! "Kiinná geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Choibalsan" 
                    long [
                        generic [! "Choibolsana áigi"] 
                        standard [! "Choibolsana dálveáigi"] 
                        daylight [! "Choibolsana geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Christmas" 
                    long [
                        standard [! "Juovlasullo áigi"]
                    ]
                ] 
                metazone [
                    #type "Cocos" 
                    long [
                        standard [! "Kokossulloid áigi"]
                    ]
                ] 
                metazone [
                    #type "Colombia" 
                    long [
                        generic [! "Colombia áigi"] 
                        standard [! "Colombia dálveáigi"] 
                        daylight [! "Colombia geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Cook" 
                    long [
                        generic [! "Cooksulloid áigi"] 
                        standard [! "Cooksulloid dálveáigi"] 
                        daylight [! "Cooksulloid geasi beallemuttu áigi"]
                    ]
                ] 
                metazone [
                    #type "Cuba" 
                    long [
                        generic [! "Cuba áigi"] 
                        standard [! "Cuba dálveáigi"] 
                        daylight [! "Cuba geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Davis" 
                    long [
                        standard [! "Davisa áigi"]
                    ]
                ] 
                metazone [
                    #type "DumontDUrville" 
                    long [
                        standard [! "Dumont-d’Urville áigi"]
                    ]
                ] 
                metazone [
                    #type "East_Timor" 
                    long [
                        standard [! "Nuorta-Timora áigi"]
                    ]
                ] 
                metazone [
                    #type "Easter" 
                    long [
                        generic [! "Beassášsullo áigi"] 
                        standard [! "Beassášsullo dálveáigi"] 
                        daylight [! "Beassášsullo geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Ecuador" 
                    long [
                        standard [! "Ecuadora áigi"]
                    ]
                ] 
                metazone [
                    #type "Europe_Central" 
                    long [
                        generic [! "Gaska-Eurohpá áigi"] 
                        standard [! "Gaska-Eurohpá dálveáigi"] 
                        daylight [! "Gaska-Eurohpá geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Europe_Eastern" 
                    long [
                        generic [! "Nuorta-Eurohpa áigi"] 
                        standard [! "Nuorta-Eurohpa dálveáigi"] 
                        daylight [! "Nuorta-Eurohpa geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Europe_Further_Eastern" 
                    long [
                        standard [! "Gáiddus-Nuortti eurohpalaš áigi"]
                    ]
                ] 
                metazone [
                    #type "Europe_Western" 
                    long [
                        generic [! "Oarje-Eurohpá áigi"] 
                        standard [! "Oarje-Eurohpá dálveáigi"] 
                        daylight [! "Oarje-Eurohpá geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Falkland" 
                    long [
                        generic [! "Falklandsulluid áigi"] 
                        standard [! "Falklandsulluid dálveáigi"] 
                        daylight [! "Falklandsulluid geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Fiji" 
                    long [
                        generic [! "Fiji áigi"] 
                        standard [! "Fiji dálveáigi"] 
                        daylight [! "Fiji geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "French_Guiana" 
                    long [
                        standard [! "Frankriikka Guyana áigi"]
                    ]
                ] 
                metazone [
                    #type "French_Southern" 
                    long [
                        standard [! "Frankriikka lulli &amp; antárktisa áigi"]
                    ]
                ] 
                metazone [
                    #type "Galapagos" 
                    long [
                        standard [! "Galapagosa áigi"]
                    ]
                ] 
                metazone [
                    #type "Gambier" 
                    long [
                        standard [! "Gambiera áigi"]
                    ]
                ] 
                metazone [
                    #type "Georgia" 
                    long [
                        generic [! "Georgia áigi"] 
                        standard [! "Georgia dálveáigi"] 
                        daylight [! "Georgia geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Gilbert_Islands" 
                    long [
                        standard [! "Gilbertsulloid áigi"]
                    ]
                ] 
                metazone [
                    #type "GMT" 
                    long [
                        standard [! "Greenwicha áigi"]
                    ]
                ] 
                metazone [
                    #type "Greenland_Eastern" 
                    long [
                        generic [! "Nuorta-Ruonáeatnama áigi"] 
                        standard [! "Nuorta-Ruonáeatnama dálveáigi"] 
                        daylight [! "Nuorta-Ruonáeatnama geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Greenland_Western" 
                    long [
                        generic [! "Oarje-Ruonáeatnama áigi"] 
                        standard [! "Oarje-Ruonáeatnama dálveáigi"] 
                        daylight [! "Oarje-Ruonáeatnama geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Gulf" 
                    long [
                        standard [! "Golfa dálveáigi"]
                    ]
                ] 
                metazone [
                    #type "Guyana" 
                    long [
                        standard [! "Guyana áigi"]
                    ]
                ] 
                metazone [
                    #type "Hawaii_Aleutian" 
                    long [
                        generic [! "Hawaii-aleuhtalaš áigi"] 
                        standard [! "Hawaii-aleuhtalaš dálveáigi"] 
                        daylight [! "Hawaii-aleuhtalaš geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Hong_Kong" 
                    long [
                        generic [! "Hong Konga áigi"] 
                        standard [! "Hong Konga dálveáigi"] 
                        daylight [! "Hong Konga geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Hovd" 
                    long [
                        generic [! "Hovda áigi"] 
                        standard [! "Hovda dálveáigi"] 
                        daylight [! "Hovda geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "India" 
                    long [
                        standard [! "India dálveáigi"]
                    ]
                ] 
                metazone [
                    #type "Indian_Ocean" 
                    long [
                        standard [! "Indiaábi áigi"]
                    ]
                ] 
                metazone [
                    #type "Indochina" 
                    long [
                        standard [! "Indokiinná áigi"]
                    ]
                ] 
                metazone [
                    #type "Indonesia_Central" 
                    long [
                        standard [! "Gaska-Indonesia áigi"]
                    ]
                ] 
                metazone [
                    #type "Indonesia_Eastern" 
                    long [
                        standard [! "Nuorta-Indonesia áigi"]
                    ]
                ] 
                metazone [
                    #type "Indonesia_Western" 
                    long [
                        standard [! "Oarje-Indonesia áigi"]
                    ]
                ] 
                metazone [
                    #type "Iran" 
                    long [
                        generic [! "Irana áigi"] 
                        standard [! "Irana dálveáigi"] 
                        daylight [! "Irana geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Irkutsk" 
                    long [
                        generic [! "Irkucka áigi"] 
                        standard [! "Irkucka dálveáigi"] 
                        daylight [! "Irkucka geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Israel" 
                    long [
                        generic [! "Israela áigi"] 
                        standard [! "Israela dálveáigi"] 
                        daylight [! "Israela geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Japan" 
                    long [
                        generic [! "Japána áigi"] 
                        standard [! "Japána dálveáigi"] 
                        daylight [! "Japána geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Kazakhstan_Eastern" 
                    long [
                        standard [! "Nuorta-Kasakstana áigi"]
                    ]
                ] 
                metazone [
                    #type "Kazakhstan_Western" 
                    long [
                        standard [! "Oarje-Kasakstana áigi"]
                    ]
                ] 
                metazone [
                    #type "Korea" 
                    long [
                        generic [! "Korea áigi"] 
                        standard [! "Korea dálveáigi"] 
                        daylight [! "Korea geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Kosrae" 
                    long [
                        standard [! "Kosraea áigi"]
                    ]
                ] 
                metazone [
                    #type "Krasnoyarsk" 
                    long [
                        generic [! "Krasnojarska áigi"] 
                        standard [! "Krasnojarska dálveáigi"] 
                        daylight [! "Krasnojarska geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Kyrgystan" 
                    long [
                        standard [! "Kirgisia áigi"]
                    ]
                ] 
                metazone [
                    #type "Line_Islands" 
                    long [
                        standard [! "Linesulloid áigi"]
                    ]
                ] 
                metazone [
                    #type "Lord_Howe" 
                    long [
                        generic [! "Lord Howe áigi"] 
                        standard [! "Lord Howe dálveáigi"] 
                        daylight [! "Lord Howe geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Macquarie" 
                    long [
                        standard [! "MacQuarie sullo áigi"]
                    ]
                ] 
                metazone [
                    #type "Magadan" 
                    long [
                        generic [! "Magadana áigi"] 
                        standard [! "Magadana dálveáigi"] 
                        daylight [! "Magadana geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Malaysia" 
                    long [
                        standard [! "Malesia áigi"]
                    ]
                ] 
                metazone [
                    #type "Maldives" 
                    long [
                        standard [! "Malediivvaid áigi"]
                    ]
                ] 
                metazone [
                    #type "Marquesas" 
                    long [
                        standard [! "Marquesasiid áigi"]
                    ]
                ] 
                metazone [
                    #type "Marshall_Islands" 
                    long [
                        standard [! "Marshallsulloid áigi"]
                    ]
                ] 
                metazone [
                    #type "Mauritius" 
                    long [
                        generic [! "Mauritiusa áigi"] 
                        standard [! "Mauritiusa dálveáigi"] 
                        daylight [! "Mauritiusa geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Mawson" 
                    long [
                        standard [! "Mawsona áigi"]
                    ]
                ] 
                metazone [
                    #type "Mexico_Northwest" 
                    long [
                        generic [! "Oarjedavvi-Meksiko áigi"] 
                        standard [! "Oarjedavvi-Meksiko dálveáigi"] 
                        daylight [! "Oarjedavvi-Meksiko geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Mexico_Pacific" 
                    long [
                        generic [! "Meksiko Jáskesábi áigi"] 
                        standard [! "Meksiko Jáskesábi dálveáigi"] 
                        daylight [! "Meksiko Jáskesábi geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Mongolia" 
                    long [
                        generic [! "Ulan-Batora áigi"] 
                        standard [! "Ulan-Batora dálveáigi"] 
                        daylight [! "Ulan-Batora geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Moscow" 
                    long [
                        generic [! "Moskva áigi"] 
                        standard [! "Moskva dálveáigi"] 
                        daylight [! "Moskva geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Myanmar" 
                    long [
                        standard [! "Myanmara áigi"]
                    ]
                ] 
                metazone [
                    #type "Nauru" 
                    long [
                        standard [! "Nauru áigi"]
                    ]
                ] 
                metazone [
                    #type "Nepal" 
                    long [
                        standard [! "Nepala áigi"]
                    ]
                ] 
                metazone [
                    #type "New_Caledonia" 
                    long [
                        generic [! "Ođđa-Kaledonia áigi"] 
                        standard [! "Ođđa-Kaledonia dálveáigi"] 
                        daylight [! "Ođđa-Kaledonia geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "New_Zealand" 
                    long [
                        generic [! "Ođđa-Selánda áigi"] 
                        standard [! "Ođđa-Selánda dálveáigi"] 
                        daylight [! "Ođđa-Selánda geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Newfoundland" 
                    long [
                        generic [! "Newfoundlanda áigi"] 
                        standard [! "Newfoundlanda dálveáigi"] 
                        daylight [! "Newfoundlanda geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Niue" 
                    long [
                        standard [! "Niuea áigi"]
                    ]
                ] 
                metazone [
                    #type "Norfolk" 
                    long [
                        standard [! "Norfolksullo áigi"]
                    ]
                ] 
                metazone [
                    #type "Noronha" 
                    long [
                        generic [! "Fernando de Noronha áigi"] 
                        standard [! "Fernando de Noronha dálveáigi"] 
                        daylight [! "Fernando de Noronha geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Novosibirsk" 
                    long [
                        generic [! "Novosibirska áigi"] 
                        standard [! "Novosibirska dálveáigi"] 
                        daylight [! "Novosibirska geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Omsk" 
                    long [
                        generic [! "Omska áigi"] 
                        standard [! "Omska dálveáigi"] 
                        daylight [! "Omska geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Pakistan" 
                    long [
                        generic [! "Pakistana áigi"] 
                        standard [! "Pakistana dálveáigi"] 
                        daylight [! "Pakistana geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Palau" 
                    long [
                        standard [! "Palaua áigi"]
                    ]
                ] 
                metazone [
                    #type "Papua_New_Guinea" 
                    long [
                        standard [! "Papua Ođđa-Guinea áigi"]
                    ]
                ] 
                metazone [
                    #type "Paraguay" 
                    long [
                        generic [! "Paraguaya áigi"] 
                        standard [! "Paraguaya dálveáigi"] 
                        daylight [! "Paraguaya geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Peru" 
                    long [
                        generic [! "Peru áigi"] 
                        standard [! "Peru dálveáigi"] 
                        daylight [! "Peru geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Philippines" 
                    long [
                        generic [! "Filippiinnaid áigi"] 
                        standard [! "Filippiinnaid dálveáigi"] 
                        daylight [! "Filippiinnaid geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Phoenix_Islands" 
                    long [
                        standard [! "Phoenixsulloid áigi"]
                    ]
                ] 
                metazone [
                    #type "Pierre_Miquelon" 
                    long [
                        generic [! "St. Pierre &amp; Miquelo áigi"] 
                        standard [! "St. Pierre &amp; Miquelo dálveáigi"] 
                        daylight [! "St. Pierre &amp; Miquelo geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Pitcairn" 
                    long [
                        standard [! "Pitcairnsulloid áigi"]
                    ]
                ] 
                metazone [
                    #type "Ponape" 
                    long [
                        standard [! "Ponape áigi"]
                    ]
                ] 
                metazone [
                    #type "Pyongyang" 
                    long [
                        standard [! "Pyongyanga áigi"]
                    ]
                ] 
                metazone [
                    #type "Reunion" 
                    long [
                        standard [! "Reuniona áigi"]
                    ]
                ] 
                metazone [
                    #type "Rothera" 
                    long [
                        standard [! "Rothera áigi"]
                    ]
                ] 
                metazone [
                    #type "Sakhalin" 
                    long [
                        generic [! "Sahalina áigi"] 
                        standard [! "Sahalina dálveáigi"] 
                        daylight [! "Sahalina geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Samoa" 
                    long [
                        generic [! "Samoa áigi"] 
                        standard [! "Samoa dálveáigi"] 
                        daylight [! "Samoa geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Seychelles" 
                    long [
                        standard [! "Seychellaid áigi"]
                    ]
                ] 
                metazone [
                    #type "Singapore" 
                    long [
                        standard [! "Singapore dálveáigi"]
                    ]
                ] 
                metazone [
                    #type "Solomon" 
                    long [
                        standard [! "Salomonsulloid áigi"]
                    ]
                ] 
                metazone [
                    #type "South_Georgia" 
                    long [
                        standard [! "Lulli-Georgia áigi"]
                    ]
                ] 
                metazone [
                    #type "Suriname" 
                    long [
                        standard [! "Suriname áigi"]
                    ]
                ] 
                metazone [
                    #type "Syowa" 
                    long [
                        standard [! "Syowa áigi"]
                    ]
                ] 
                metazone [
                    #type "Tahiti" 
                    long [
                        standard [! "Tahiti áigi"]
                    ]
                ] 
                metazone [
                    #type "Taipei" 
                    long [
                        generic [! "Taipeia áigi"] 
                        standard [! "Taipeia dálveáigi"] 
                        daylight [! "Taipeia geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Tajikistan" 
                    long [
                        standard [! "Tažikistana áigi"]
                    ]
                ] 
                metazone [
                    #type "Tokelau" 
                    long [
                        standard [! "Tokelaua áigi"]
                    ]
                ] 
                metazone [
                    #type "Tonga" 
                    long [
                        generic [! "Tonga áigi"] 
                        standard [! "Tonga dálveáigi"] 
                        daylight [! "Tonga geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Truk" 
                    long [
                        standard [! "Chuuka áigi"]
                    ]
                ] 
                metazone [
                    #type "Turkmenistan" 
                    long [
                        generic [! "Turkmenistana áigi"] 
                        standard [! "Turkmenistana dálveáigi"] 
                        daylight [! "Turkmenistana geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Tuvalu" 
                    long [
                        standard [! "Tuvalu áigi"]
                    ]
                ] 
                metazone [
                    #type "Uruguay" 
                    long [
                        generic [! "Uruguaya áigi"] 
                        standard [! "Uruguaya dálveáigi"] 
                        daylight [! "Uruguaya geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Uzbekistan" 
                    long [
                        generic [! "Usbekistana áigi"] 
                        standard [! "Usbekistana dálveáigi"] 
                        daylight [! "Usbekistana geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Vanuatu" 
                    long [
                        generic [! "Vanuatu áigi"] 
                        standard [! "Vanuatu dálveáigi"] 
                        daylight [! "Vanuatu geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Venezuela" 
                    long [
                        standard [! "Venezuela áigi"]
                    ]
                ] 
                metazone [
                    #type "Vladivostok" 
                    long [
                        generic [! "Vladivostoka áigi"] 
                        standard [! "Vladivostoka dálveáigi"] 
                        daylight [! "Vladivostoka geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Volgograd" 
                    long [
                        generic [! "Volgograda áigi"] 
                        standard [! "Volgograda dálveáigi"] 
                        daylight [! "Volgograda geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Vostok" 
                    long [
                        standard [! "Vostoka áigi"]
                    ]
                ] 
                metazone [
                    #type "Wake" 
                    long [
                        standard [! "Wakesullo áigi"]
                    ]
                ] 
                metazone [
                    #type "Wallis" 
                    long [
                        standard [! "Wallis- ja Futuna áigi"]
                    ]
                ] 
                metazone [
                    #type "Yakutsk" 
                    long [
                        generic [! "Jakucka áigi"] 
                        standard [! "Jakucka dálveáigi"] 
                        daylight [! "Jakucka geasseáigi"]
                    ]
                ] 
                metazone [
                    #type "Yekaterinburg" 
                    long [
                        generic [! "Jekaterinburga áigi"] 
                        standard [! "Jekaterinburga dálveáigi"] 
                        daylight [! "Jekaterinburga geasseáigi"]
                    ]
                ]
            ]
        ] 
        numbers [
            decimalFormats [
                #numberSystem "latn" 
                decimalFormatLength [
                    #type "long" 
                    decimalFormat [
                        pattern [#type "1000" #count "two" ! "0 dt"] 
                        pattern [#type "1000" #count "other" ! "0 duháhat"] 
                        pattern [#type "10000" #count "one" ! "00 duháhat"] 
                        pattern [#type "10000" #count "two" ! "00 dt"] 
                        pattern [#type "100000" #count "one" ! "000 duháhat"] 
                        pattern [#type "100000" #count "two" ! "000 dt"] 
                        pattern [#type "1000000" #count "two" ! "0 mn"] 
                        pattern [#type "10000000" #count "one" ! "00 miljonat"] 
                        pattern [#type "10000000" #count "two" ! "00 mn"] 
                        pattern [#type "100000000" #count "one" ! "000 miljonat"] 
                        pattern [#type "100000000" #count "two" ! "000 mn"] 
                        pattern [#type "1000000000" #count "one" ! "0 miljárda"] 
                        pattern [#type "1000000000" #count "two" ! "0 miljárdat"] 
                        pattern [#type "1000000000" #count "other" ! "0 miljárdat"] 
                        pattern [#type "10000000000" #count "one" ! "00 miljárdat"] 
                        pattern [#type "10000000000" #count "two" ! "00 md"] 
                        pattern [#type "10000000000" #count "other" ! "00 miljárdat"] 
                        pattern [#type "100000000000" #count "one" ! "000 miljárdat"] 
                        pattern [#type "100000000000" #count "two" ! "000 md"] 
                        pattern [#type "100000000000" #count "other" ! "000 miljárdat"] 
                        pattern [#type "1000000000000" #count "one" ! "0 biljovdna"] 
                        pattern [#type "1000000000000" #count "two" ! "0 bn"] 
                        pattern [#type "1000000000000" #count "other" ! "0 biljovdnat"] 
                        pattern [#type "10000000000000" #count "one" ! "00 biljovdnat"] 
                        pattern [#type "10000000000000" #count "two" ! "00 bn"] 
                        pattern [#type "10000000000000" #count "other" ! "00 biljovdnat"] 
                        pattern [#type "100000000000000" #count "one" ! "000 biljovdnat"] 
                        pattern [#type "100000000000000" #count "two" ! "000 bn"] 
                        pattern [#type "100000000000000" #count "other" ! "000 biljovdnat"]
                    ]
                ]
            ]
        ]
    ]

