
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "es"] 
            territory [#type "US"]
        ] 
        localeDisplayNames [
            languages [
                language [#type "ace" ! "acehnés"] 
                language [#type "alt" ! "altái meridional"] 
                language [#type "ar_001" ! "árabe estándar moderno"] 
                language [#type "arp" ! "arapaho"] 
                language [#type "ars" #draft "contributed" ! "árabe najdi"] 
                language [#type "bax" #draft "contributed" ! "bamun"] 
                language [#type "bho" #draft "contributed" ! "bhojpuri"] 
                language [#type "bla" ! "siksika"] 
                language [#type "bua" #draft "contributed" ! "buriat"] 
                language [#type "dum" #draft "contributed" ! "neerlandés medieval"] 
                language [#type "enm" #draft "contributed" ! "inglés medieval"] 
                language [#type "eu" ! "euskera"] 
                language [#type "frm" #draft "contributed" ! "francés medieval"] 
                language [#type "gan" #draft "contributed" ! "gan (China)"] 
                language [#type "gmh" #draft "contributed" ! "alemán de la alta edad media"] 
                language [#type "grc" #draft "contributed" ! "griego antiguo"] 
                language [#type "gu" ! "gurayatí"] 
                language [#type "hil" #draft "contributed" ! "hiligainón"] 
                language [#type "hsn" #draft "contributed" ! "xiang (China)"] 
                language [#type "ht" ! "criollo haitiano"] 
                language [#type "inh" #draft "contributed" ! "ingusetio"] 
                language [#type "kab" ! "cabilio"] 
                language [#type "kbd" #draft "contributed" ! "kabardiano"] 
                language [#type "krc" #draft "contributed" ! "karachay-balkar"] 
                language [#type "lo" ! "lao"] 
                language [#type "lou" #draft "contributed" ! "creole de Luisiana"] 
                language [#type "lrc" ! "lorí del norte"] 
                language [#type "lus" #draft "contributed" ! "lushai"] 
                language [#type "mga" #draft "contributed" ! "irlandés medieval"] 
                language [#type "nd" ! "ndebele del norte"] 
                language [#type "nl_BE" ! "flamenco"] 
                language [#type "nr" ! "ndebele meridional"] 
                language [#type "nso" #draft "contributed" ! "sotho septentrional"] 
                language [#type "rm" ! "romanche"] 
                language [#type "se" ! "sami del norte"] 
                language [#type "shu" #draft "contributed" ! "árabe chadiano"] 
                language [#type "sma" ! "sami meridional"] 
                language [#type "smn" ! "sami de Inari"] 
                language [#type "ss" #draft "contributed" ! "siswati"] 
                language [#type "st" ! "sesoto"] 
                language [#type "sw_CD" #draft "contributed" ! "swahili del Congo"] 
                language [#type "syr" ! "siriaco"] 
                language [#type "tet" #draft "contributed" ! "tetún"] 
                language [#type "tn" #draft "contributed" ! "setchwana"] 
                language [#type "tyv" ! "tuviniano"] 
                language [#type "tzm" ! "tamazight del Marruecos Central"] 
                language [#type "ug" #alt "variant" ! "uigur variante"] 
                language [#type "xal" #draft "contributed" ! "kalmyk"] 
                language [#type "zh_Hans" ! "chino simplificado"] 
                language [#type "zh_Hans" #alt "long" ! "chino mandarín simplificado"] 
                language [#type "zh_Hant" ! "chino tradicional"] 
                language [#type "zh_Hant" #alt "long" ! "chino mandarín tradicional"]
            ] 
            scripts [
                script [#type "Hrkt" ! "silabarios del japonés"] 
                script [#type "Zzzz" ! "letra desconocida"]
            ] 
            territories [
                territory [#type "011" ! "África occidental"] 
                territory [#type "014" ! "África oriental"] 
                territory [#type "015" ! "África septentrional"] 
                territory [#type "018" ! "África meridional"] 
                territory [#type "030" ! "Asia oriental"] 
                territory [#type "034" ! "Asia meridional"] 
                territory [#type "035" ! "Sudeste asiático"] 
                territory [#type "039" ! "Europa meridional"] 
                territory [#type "145" ! "Asia occidental"] 
                territory [#type "151" ! "Europa oriental"] 
                territory [#type "154" ! "Europa septentrional"] 
                territory [#type "155" ! "Europa occidental"] 
                territory [#type "AC" ! "Isla de la Ascensión"] 
                territory [#type "BA" ! "Bosnia y Herzegovina"] 
                territory [#type "EH" ! "Sahara Occidental"] 
                territory [#type "GB" #alt "short" ! "RU"] 
                territory [#type "GG" ! "Guernsey"] 
                territory [#type "QO" ! "Territorios alejados de Oceanía"] 
                territory [#type "TA" ! "Tristán de Acuña"] 
                territory [#type "UM" ! "Islas menores alejadas de EE. UU."]
            ] 
            types [
                type [#key "numbers" #type "gujr" ! "dígitos en gujarati"]
            ] 
            measurementSystemNames [
                measurementSystemName [#type "UK" ! "imperial"]
            ]
        ] 
        characters [
            moreInformation [! "[...]"]
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
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "yyyyMEd" ! "E, d/M/y GGGGG"]
                        ] 
                        intervalFormats [
                            intervalFormatFallback [! "{0}-{1}"] 
                            intervalFormatItem [
                                #id "GyMEd" 
                                greatestDifference [#id "d" ! "E, dd/MM/y – E, dd/MM/y GGGGG"] 
                                greatestDifference [#id "G" ! "E, dd/MM/y GGGGG – E, dd/MM/y GGGGG"] 
                                greatestDifference [#id "M" ! "E, dd/MM/y – E, dd/MM/y GGGGG"] 
                                greatestDifference [#id "y" ! "E, dd/MM/y – E, dd/MM/y GGGGG"]
                            ] 
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" ! "d/M – d/M"] 
                                greatestDifference [#id "M" ! "d/M – d/M"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMd" 
                                greatestDifference [#id "M" ! "d 'de' MMM – d 'de' MMM 'de' y G"]
                            ]
                        ]
                    ]
                ] 
                calendar [
                    #type "gregorian" 
                    days [
                        dayContext [
                            #type "format" 
                            dayWidth [
                                #type "narrow" 
                                day [#type "sun" ! "D"] 
                                day [#type "mon" ! "L"] 
                                day [#type "tue" ! "M"] 
                                day [#type "wed" ! "M"] 
                                day [#type "thu" ! "J"] 
                                day [#type "fri" ! "V"] 
                                day [#type "sat" ! "S"]
                            ]
                        ]
                    ] 
                    dateFormats [
                        dateFormatLength [
                            #type "full" 
                            dateFormat [
                                pattern [! "EEEE, d 'de' MMMM 'de' y"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "long" 
                            dateFormat [
                                pattern [! "d 'de' MMMM 'de' y"]
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
                                pattern [! "d/M/y"] 
                                datetimeSkeleton [#draft "contributed" ! "yMd"]
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
                                pattern [! "{1}, {0}"]
                            ]
                        ] 
                        dateTimeFormatLength [
                            #type "long" 
                            dateTimeFormat [
                                pattern [! "{1}, {0}"]
                            ]
                        ] 
                        dateTimeFormatLength [
                            #type "medium" 
                            dateTimeFormat [
                                pattern [! "{1}, {0}"]
                            ]
                        ] 
                        dateTimeFormatLength [
                            #type "short" 
                            dateTimeFormat [
                                pattern [! "{1}, {0}"]
                            ]
                        ] 
                        availableFormats [
                            dateFormatItem [#id "Ehm" ! "E h:mm a"] 
                            dateFormatItem [#id "EHm" ! "E HH:mm"] 
                            dateFormatItem [#id "Ehms" ! "E h:mm:ss a"] 
                            dateFormatItem [#id "EHms" ! "E HH:mm:ss"] 
                            dateFormatItem [#id "GyMMMd" ! "d MMM y G"] 
                            dateFormatItem [#id "Hmsvvvv" ! "HH:mm:ss (vvvv)"] 
                            dateFormatItem [#id "MMd" ! "d/MM"] 
                            dateFormatItem [#id "MMdd" ! "dd/MM"] 
                            dateFormatItem [#id "MMMEd" ! "E, d 'de' MMM"] 
                            dateFormatItem [#id "yMEd" ! "E, d/M/y"] 
                            dateFormatItem [#id "yMM" ! "MM/y"] 
                            dateFormatItem [#id "yMMMEd" ! "EEE, d 'de' MMM 'de' y"] 
                            dateFormatItem [#id "yQQQ" ! "QQQ y"]
                        ] 
                        intervalFormats [
                            intervalFormatFallback [! "{0} – {1}"] 
                            intervalFormatItem [
                                #id "h" 
                                greatestDifference [#id "a" ! "h a – h a"]
                            ] 
                            intervalFormatItem [
                                #id "H" 
                                greatestDifference [#id "H" ! "HH–HH"]
                            ] 
                            intervalFormatItem [
                                #id "hm" 
                                greatestDifference [#id "h" ! "h:mm–h:mm a"] 
                                greatestDifference [#id "m" ! "h:mm–h:mm a"]
                            ] 
                            intervalFormatItem [
                                #id "Hm" 
                                greatestDifference [#id "H" ! "HH:mm–HH:mm"] 
                                greatestDifference [#id "m" ! "HH:mm–HH:mm"]
                            ] 
                            intervalFormatItem [
                                #id "hmv" 
                                greatestDifference [#id "a" ! "h:mm a – h:mm a v"]
                            ] 
                            intervalFormatItem [
                                #id "Hmv" 
                                greatestDifference [#id "H" ! "HH:mm–HH:mm v"] 
                                greatestDifference [#id "m" ! "HH:mm–HH:mm v"]
                            ] 
                            intervalFormatItem [
                                #id "hv" 
                                greatestDifference [#id "a" ! "h a – h a v"]
                            ] 
                            intervalFormatItem [
                                #id "Hv" 
                                greatestDifference [#id "H" ! "HH–HH v"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" ! "E, d/M – E, d/M"] 
                                greatestDifference [#id "M" ! "E, d/M – E, d/M"]
                            ] 
                            intervalFormatItem [
                                #id "MMMd" 
                                greatestDifference [#id "d" ! "d–d 'de' MMM"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" ! "E, d/M/y – E, d/M/y"] 
                                greatestDifference [#id "M" ! "E, d/M/y – E, d/M/y"] 
                                greatestDifference [#id "y" ! "E, d/M/y – E, d/M/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMM" 
                                greatestDifference [#id "M" ! "MMM–MMM 'de' y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMd" 
                                greatestDifference [#id "d" ! "d–d 'de' MMM 'de' y"] 
                                greatestDifference [#id "M" ! "d 'de' MMM – d 'de' MMM y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMM" 
                                greatestDifference [#id "y" ! "MMMM 'de' y – MMMM 'de' y"]
                            ]
                        ]
                    ]
                ]
            ] 
            fields [
                field [
                    #type "week-short" 
                    relative [#type "-1" ! "sem. pasada"] 
                    relative [#type "0" ! "esta sem."] 
                    relative [#type "1" ! "próxima sem."]
                ] 
                field [
                    #type "week-narrow" 
                    relative [#type "-1" ! "sem. pasada"] 
                    relative [#type "0" ! "esta sem."] 
                    relative [#type "1" ! "próxima sem."]
                ] 
                field [
                    #type "weekOfMonth-short" 
                    displayName [! "sem. de m"]
                ] 
                field [
                    #type "weekOfMonth-narrow" 
                    displayName [! "sem. de m"]
                ] 
                field [
                    #type "dayOfYear-short" 
                    displayName [! "día del a"]
                ] 
                field [
                    #type "dayOfYear-narrow" 
                    displayName [! "día del a"]
                ] 
                field [
                    #type "weekdayOfMonth" 
                    displayName [! "día de la semana del mes"]
                ] 
                field [
                    #type "weekdayOfMonth-short" 
                    displayName [! "día sem. de m"]
                ] 
                field [
                    #type "weekdayOfMonth-narrow" 
                    displayName [! "día sem. de m"]
                ] 
                field [
                    #type "sun" 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "dentro de {0} domingo"] 
                        relativeTimePattern [#count "other" ! "dentro de {0} domingos"]
                    ]
                ] 
                field [
                    #type "tue" 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "dentro de {0} martes"] 
                        relativeTimePattern [#count "other" ! "dentro de {0} martes"]
                    ]
                ] 
                field [
                    #type "wed-short" 
                    relative [#type "-1" ! "el mie. pasado"] 
                    relative [#type "0" ! "este mié."] 
                    relative [#type "1" ! "el próximo mié."]
                ] 
                field [
                    #type "fri-narrow" 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "hace {0} VI"] 
                        relativeTimePattern [#count "other" ! "hace {0} VI"]
                    ]
                ] 
                field [
                    #type "sat-narrow" 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "hace {0} SA"] 
                        relativeTimePattern [#count "other" ! "hace {0} SA"]
                    ]
                ] 
                field [
                    #type "dayperiod-short" 
                    displayName [! "a. m./p. m."]
                ] 
                field [
                    #type "dayperiod-narrow" 
                    displayName [! "a. m./p. m."]
                ]
            ] 
            timeZoneNames [
                zone [
                    #type "America/Nassau" 
                    exemplarCity [! "Nassau"]
                ] 
                zone [
                    #type "America/Fort_Nelson" 
                    exemplarCity [! "Fort Nelson"]
                ] 
                zone [
                    #type "Africa/Djibouti" 
                    exemplarCity [! "Yibutí"]
                ] 
                zone [
                    #type "Asia/Pyongyang" 
                    exemplarCity [! "Pionyang"]
                ] 
                zone [
                    #type "Europe/Astrakhan" 
                    exemplarCity [! "Astrakhan"]
                ] 
                zone [
                    #type "Europe/Ulyanovsk" 
                    exemplarCity [! "Ulyanovsk"]
                ] 
                zone [
                    #type "Europe/Kirov" 
                    exemplarCity [! "Kirov"]
                ] 
                zone [
                    #type "Pacific/Wake" 
                    exemplarCity [! "Wake"]
                ] 
                zone [
                    #type "Pacific/Honolulu" 
                    short [
                        generic [! "HST"] 
                        standard [! "HST"] 
                        daylight [! "HDT"]
                    ] 
                    exemplarCity [! "Honolulu"]
                ] 
                zone [
                    #type "America/St_Thomas" 
                    exemplarCity [! "St. Thomas"]
                ] 
                metazone [
                    #type "Alaska" 
                    short [
                        generic [! "AKT"] 
                        standard [! "AKST"] 
                        daylight [! "AKDT"]
                    ]
                ] 
                metazone [
                    #type "America_Central" 
                    short [
                        generic [! "CT"] 
                        standard [! "CST"] 
                        daylight [! "CDT"]
                    ]
                ] 
                metazone [
                    #type "America_Eastern" 
                    short [
                        generic [! "ET"] 
                        standard [! "EST"] 
                        daylight [! "EDT"]
                    ]
                ] 
                metazone [
                    #type "America_Mountain" 
                    long [
                        generic [! "hora de las Montañas Rocosas"] 
                        standard [! "hora estándar de las Montañas Rocosas"] 
                        daylight [! "hora de verano de las Montañas Rocosas"]
                    ] 
                    short [
                        generic [! "MT"] 
                        standard [! "MST"] 
                        daylight [! "MDT"]
                    ]
                ] 
                metazone [
                    #type "America_Pacific" 
                    short [
                        generic [! "PT"] 
                        standard [! "PST"] 
                        daylight [! "PDT"]
                    ]
                ] 
                metazone [
                    #type "Apia" 
                    long [
                        generic [! "hora de Apia"] 
                        standard [! "hora estándar de Apia"] 
                        daylight [! "hora de verano de Apia"]
                    ]
                ] 
                metazone [
                    #type "Atlantic" 
                    short [
                        generic [! "AT"] 
                        standard [! "AST"] 
                        daylight [! "ADT"]
                    ]
                ] 
                metazone [
                    #type "Chamorro" 
                    long [
                        standard [! "hora de Chamorro"]
                    ]
                ] 
                metazone [
                    #type "Cocos" 
                    long [
                        standard [! "hora de las Islas Cocos"]
                    ]
                ] 
                metazone [
                    #type "Cook" 
                    long [
                        generic [! "hora de las Islas Cook"] 
                        standard [! "hora estándar de las Islas Cook"] 
                        daylight [! "hora de verano media de las Islas Cook"]
                    ]
                ] 
                metazone [
                    #type "Easter" 
                    long [
                        generic [! "hora de la isla de Pascua"] 
                        standard [! "hora estándar de la isla de Pascua"] 
                        daylight [! "hora de verano de la isla de Pascua"]
                    ]
                ] 
                metazone [
                    #type "Europe_Eastern" 
                    long [
                        generic [! "hora de Europa oriental"] 
                        standard [! "hora estándar de Europa oriental"] 
                        daylight [! "hora de verano de Europa oriental"]
                    ]
                ] 
                metazone [
                    #type "Europe_Further_Eastern" 
                    long [
                        standard [! "hora del extremo oriental de Europa"]
                    ]
                ] 
                metazone [
                    #type "Europe_Western" 
                    long [
                        generic [! "hora de Europa occidental"] 
                        standard [! "hora estándar de Europa occidental"] 
                        daylight [! "hora de verano de Europa occidental"]
                    ]
                ] 
                metazone [
                    #type "Falkland" 
                    long [
                        generic [! "hora de las islas Malvinas"] 
                        standard [! "hora estándar de las islas Malvinas"] 
                        daylight [! "hora de verano de las islas Malvinas"]
                    ]
                ] 
                metazone [
                    #type "Gilbert_Islands" 
                    long [
                        standard [! "hora de las islas Gilbert"]
                    ]
                ] 
                metazone [
                    #type "Hawaii_Aleutian" 
                    short [
                        generic [! "HAT"] 
                        standard [! "HAST"] 
                        daylight [! "HADT"]
                    ]
                ] 
                metazone [
                    #type "Indian_Ocean" 
                    long [
                        standard [! "hora del Océano Índico"]
                    ]
                ] 
                metazone [
                    #type "Macquarie" 
                    long [
                        standard [! "hora de la isla Macquarie"]
                    ]
                ] 
                metazone [
                    #type "Marquesas" 
                    long [
                        standard [! "hora de las islas Marquesas"]
                    ]
                ] 
                metazone [
                    #type "Marshall_Islands" 
                    long [
                        standard [! "hora de las Islas Marshall"]
                    ]
                ] 
                metazone [
                    #type "Norfolk" 
                    long [
                        generic [! "hora de la isla Norfolk"] 
                        standard [! "hora estándar de la isla Norfolk"] 
                        daylight [! "hora de verano de la isla Norfolk"]
                    ]
                ] 
                metazone [
                    #type "Phoenix_Islands" 
                    long [
                        standard [! "hora de las islas Fénix"]
                    ]
                ] 
                metazone [
                    #type "Pyongyang" 
                    long [
                        standard [! "hora de Pyongyang"]
                    ]
                ] 
                metazone [
                    #type "Solomon" 
                    long [
                        standard [! "hora de las Islas Salomón"]
                    ]
                ] 
                metazone [
                    #type "Wake" 
                    long [
                        standard [! "hora de la isla Wake"]
                    ]
                ]
            ]
        ] 
        numbers [
            decimalFormats [
                #numberSystem "latn" 
                decimalFormatLength [
                    #type "short" 
                    decimalFormat [
                        pattern [#type "1000" #count "one" ! "0 K"] 
                        pattern [#type "1000" #count "other" ! "0 K"] 
                        pattern [#type "10000" #count "one" ! "00 K"] 
                        pattern [#type "10000" #count "other" ! "00 K"] 
                        pattern [#type "100000" #count "one" ! "000 K"] 
                        pattern [#type "100000" #count "other" ! "000 K"]
                    ]
                ]
            ] 
            currencyFormats [
                #numberSystem "latn" 
                currencyFormatLength [
                    #type "short" 
                    currencyFormat [
                        #type "standard" 
                        pattern [#type "10000000000" #count "one" ! "¤00 B"] 
                        pattern [#type "10000000000" #count "other" ! "¤00 B"] 
                        pattern [#type "100000000000" #count "one" ! "¤000 B"] 
                        pattern [#type "100000000000" #count "other" ! "¤000 B"] 
                        pattern [#type "1000000000000" #count "one" ! "¤0 T"] 
                        pattern [#type "1000000000000" #count "other" ! "¤0 T"] 
                        pattern [#type "10000000000000" #count "one" ! "¤00 T"] 
                        pattern [#type "10000000000000" #count "other" ! "¤00 T"] 
                        pattern [#type "100000000000000" #count "one" ! "¤000 T"] 
                        pattern [#type "100000000000000" #count "other" ! "¤000 T"]
                    ]
                ]
            ] 
            currencies [
                currency [
                    #type "BDT" 
                    displayName [#draft "contributed" ! "taka bangladesí"] 
                    displayName [#count "one" #draft "contributed" ! "taka bangladesí"] 
                    displayName [#count "other" #draft "contributed" ! "takas bangladesíes"]
                ] 
                currency [
                    #type "BTN" 
                    displayName [#draft "contributed" ! "ngultrum butanés"] 
                    displayName [#count "one" #draft "contributed" ! "ngultrum butanés"] 
                    displayName [#count "other" #draft "contributed" ! "gultrums bultaneses"]
                ] 
                currency [
                    #type "ETB" 
                    displayName [! "birr"] 
                    displayName [#count "one" ! "birr"] 
                    displayName [#count "other" ! "birres"]
                ] 
                currency [
                    #type "FKP" 
                    symbol [#alt "narrow" #draft "contributed" ! "£"]
                ] 
                currency [
                    #type "JPY" 
                    symbol [! "¥"]
                ] 
                currency [
                    #type "LAK" 
                    displayName [! "kip laosiano"] 
                    displayName [#count "one" ! "kip laosiano"] 
                    displayName [#count "other" ! "kips laosianos"]
                ] 
                currency [
                    #type "RON" 
                    symbol [#alt "narrow" #draft "contributed" ! "lei"]
                ] 
                currency [
                    #type "SSP" 
                    symbol [#alt "narrow" #draft "contributed" ! "£"]
                ] 
                currency [
                    #type "SYP" 
                    symbol [#alt "narrow" #draft "contributed" ! "£"]
                ] 
                currency [
                    #type "THB" 
                    displayName [! "bat"] 
                    displayName [#count "one" ! "bat"] 
                    displayName [#count "other" ! "bats"]
                ] 
                currency [
                    #type "USD" 
                    symbol [! "$"]
                ] 
                currency [
                    #type "UZS" 
                    displayName [! "sum"] 
                    displayName [#count "one" ! "sum"] 
                    displayName [#count "other" ! "sums"]
                ] 
                currency [
                    #type "VEF" 
                    symbol [#alt "narrow" #draft "contributed" ! "Bs"]
                ] 
                currency [
                    #type "VND" 
                    displayName [! "dong vietnamita"] 
                    displayName [#count "one" ! "dong vietnamita"] 
                    displayName [#count "other" ! "dongs vietnamitas"]
                ] 
                currency [
                    #type "XAF" 
                    displayName [! "franco CFA de África central"] 
                    displayName [#count "one" ! "franco CFA de África central"] 
                    displayName [#count "other" ! "francos CFA de África central"]
                ] 
                currency [
                    #type "ZMW" 
                    displayName [#draft "contributed" ! "kwacha zambiano"] 
                    displayName [#count "one" #draft "contributed" ! "kwacha zambiano"] 
                    displayName [#count "other" #draft "contributed" ! "kwachas zambianos"]
                ]
            ] 
            minimalPairs [
                genderMinimalPairs [#gender "feminine" ! "{0}a"] 
                genderMinimalPairs [#gender "masculine" ! "{0}o"]
            ]
        ] 
        units [
            unitLength [
                #type "long" 
                compoundUnit [
                    #type "10p-2" 
                    unitPrefixPattern [! "centí{0}"]
                ] 
                compoundUnit [
                    #type "10p-12" 
                    unitPrefixPattern [! "picó{0}"]
                ] 
                compoundUnit [
                    #type "10p3" 
                    unitPrefixPattern [! "kiló{0}"]
                ] 
                unit [
                    #type "concentr-milligram-ofglucose-per-deciliter" 
                    displayName [! "miligramos por decilitro"]
                ] 
                unit [
                    #type "electric-ampere" 
                    displayName [! "amperios"] 
                    unitPattern [#count "one" ! "{0} amperio"] 
                    unitPattern [#count "other" ! "{0} amperios"]
                ] 
                unit [
                    #type "electric-milliampere" 
                    displayName [! "miliamperio"] 
                    unitPattern [#count "one" ! "{0} miliamperio"] 
                    unitPattern [#count "other" ! "{0} miliamperios"]
                ] 
                unit [
                    #type "electric-ohm" 
                    displayName [! "ohmios"] 
                    unitPattern [#count "one" ! "{0} ohmio"] 
                    unitPattern [#count "other" ! "{0} ohmios"]
                ] 
                unit [
                    #type "energy-foodcalorie" 
                    displayName [! "Calorías"] 
                    unitPattern [#count "one" ! "{0} Caloría"] 
                    unitPattern [#count "other" ! "{0} Calorías"]
                ] 
                unit [
                    #type "energy-kilojoule" 
                    displayName [! "kilojulios"] 
                    unitPattern [#count "one" ! "{0} kilojulio"] 
                    unitPattern [#count "other" ! "{0} kilojulio"]
                ] 
                unit [
                    #type "energy-joule" 
                    displayName [! "julios"] 
                    unitPattern [#count "one" ! "{0} julio"] 
                    unitPattern [#count "other" ! "{0} julios"]
                ] 
                unit [
                    #type "energy-kilowatt-hour" 
                    displayName [! "kilovatios por hora"] 
                    unitPattern [#count "one" ! "{0} kilovatio por hora"] 
                    unitPattern [#count "other" ! "{0} kilovatios por hora"]
                ] 
                unit [
                    #type "graphics-em" 
                    gender [! "feminine"] 
                    displayName [! "em tipográfica"] 
                    unitPattern [#count "one" ! "{0} em"] 
                    unitPattern [#count "other" ! "{0} em"]
                ] 
                unit [
                    #type "graphics-megapixel" 
                    displayName [! "megapixeles"] 
                    unitPattern [#count "one" ! "{0} megapixel"] 
                    unitPattern [#count "other" ! "{0} megapixeles"]
                ] 
                unit [
                    #type "graphics-pixel-per-centimeter" 
                    displayName [! "pixeles por centímetro"] 
                    unitPattern [#count "one" ! "{0} pixel por centímetro"] 
                    unitPattern [#count "other" ! "{0} pixeles por centímetro"]
                ] 
                unit [
                    #type "graphics-pixel-per-inch" 
                    displayName [! "pixeles por pulgada"] 
                    unitPattern [#count "one" ! "{0} pixel por pulgada"] 
                    unitPattern [#count "other" ! "{0} pixeles por pulgada"]
                ] 
                unit [
                    #type "length-nautical-mile" 
                    displayName [! "millas naúticas"] 
                    unitPattern [#count "one" ! "{0} milla naútica"] 
                    unitPattern [#count "other" ! "{0} millas naúticas"]
                ] 
                unit [
                    #type "power-horsepower" 
                    unitPattern [#count "one" ! "{0} caballo de fuerza"] 
                    unitPattern [#count "other" ! "{0} caballos de fuerza"]
                ] 
                unit [
                    #type "temperature-generic" 
                    unitPattern [#count "one" ! "{0} grado"] 
                    unitPattern [#count "other" ! "{0} grados"]
                ] 
                unit [
                    #type "temperature-kelvin" 
                    displayName [! "kelvin"] 
                    unitPattern [#count "one" ! "kelvin"] 
                    unitPattern [#count "other" ! "{0} kelvin"]
                ] 
                unit [
                    #type "torque-pound-force-foot" 
                    displayName [! "libra fuerza-pies"] 
                    unitPattern [#count "one" ! "{0} libra fuerza-pie"] 
                    unitPattern [#count "other" ! "{0} libra fuerza-pies"]
                ] 
                unit [
                    #type "volume-acre-foot" 
                    displayName [! "acres-pies"] 
                    unitPattern [#count "one" ! "{0} acre-pie"] 
                    unitPattern [#count "other" ! "{0} acres pies"]
                ] 
                unit [
                    #type "volume-fluid-ounce-imperial" 
                    displayName [! "onzas fluidas imperiales"] 
                    unitPattern [#count "one" ! "onza fluida imperial"] 
                    unitPattern [#count "other" ! "{0} onzas fluidas imperiales"]
                ] 
                unit [
                    #type "volume-dram" 
                    displayName [! "dracma fluida"] 
                    unitPattern [#count "one" ! "{0} dracma fluida"] 
                    unitPattern [#count "other" ! "{0} dreacmas fluidas"]
                ] 
                unit [
                    #type "volume-jigger" 
                    displayName [! "jigger"] 
                    unitPattern [#count "one" ! "{0} jigger"] 
                    unitPattern [#count "other" ! "{0} jiggers"]
                ] 
                coordinateUnit [
                    coordinateUnitPattern [#type "east" ! "{0} este"] 
                    coordinateUnitPattern [#type "north" ! "{0} norte"] 
                    coordinateUnitPattern [#type "south" ! "{0} sur"] 
                    coordinateUnitPattern [#type "west" ! "{0} oeste"]
                ]
            ] 
            unitLength [
                #type "short" 
                unit [
                    #type "concentr-percent" 
                    displayName [! "%"]
                ] 
                unit [
                    #type "concentr-permille" 
                    displayName [! "‰"]
                ] 
                unit [
                    #type "digital-byte" 
                    displayName [! "byte"]
                ] 
                unit [
                    #type "digital-bit" 
                    displayName [! "bit"]
                ] 
                unit [
                    #type "duration-year" 
                    unitPattern [#count "one" ! "{0} a"] 
                    unitPattern [#count "other" ! "{0} aa."] 
                    perUnitPattern [! "{0}/a"]
                ] 
                unit [
                    #type "duration-month" 
                    unitPattern [#count "one" ! "{0} m"] 
                    unitPattern [#count "other" ! "{0} mm."]
                ] 
                unit [
                    #type "duration-day" 
                    displayName [! "días"] 
                    unitPattern [#count "one" ! "{0} día"] 
                    unitPattern [#count "other" ! "{0} días"] 
                    perUnitPattern [! "{0}/d"]
                ] 
                unit [
                    #type "duration-minute" 
                    displayName [! "mins"]
                ] 
                unit [
                    #type "energy-foodcalorie" 
                    displayName [! "Cal"] 
                    unitPattern [#count "one" ! "{0} Cal"] 
                    unitPattern [#count "other" ! "{0} Cal"]
                ] 
                unit [
                    #type "energy-therm-us" 
                    displayName [! "th US"] 
                    unitPattern [#count "one" ! "{0} th US"] 
                    unitPattern [#count "other" ! "{0} th US"]
                ] 
                unit [
                    #type "graphics-dot" 
                    displayName [! "px"] 
                    unitPattern [#count "one" ! "{0} px"] 
                    unitPattern [#count "other" ! "{0} px"]
                ] 
                unit [
                    #type "length-yard" 
                    displayName [! "yd"]
                ] 
                unit [
                    #type "length-light-year" 
                    unitPattern [#count "one" ! "{0} a. l."] 
                    unitPattern [#count "other" ! "{0} a. l."]
                ] 
                unit [
                    #type "length-furlong" 
                    displayName [! "furlongs"] 
                    unitPattern [#count "one" ! "{0} fur"] 
                    unitPattern [#count "other" ! "{0} fur"]
                ] 
                unit [
                    #type "length-nautical-mile" 
                    displayName [! "mn"] 
                    unitPattern [#count "one" ! "{0} mn"] 
                    unitPattern [#count "other" ! "{0} mn"]
                ] 
                unit [
                    #type "length-mile-scandinavian" 
                    displayName [! "mil"] 
                    unitPattern [#count "one" ! "{0} mil"] 
                    unitPattern [#count "other" ! "{0} mil"]
                ] 
                unit [
                    #type "speed-knot" 
                    displayName [! "nudo"] 
                    unitPattern [#count "one" ! "{0} nudo"] 
                    unitPattern [#count "other" ! "{0} nudos"]
                ] 
                unit [
                    #type "torque-pound-force-foot" 
                    displayName [! "lbf⋅ft"] 
                    unitPattern [#count "one" ! "{0} lbf⋅ft"] 
                    unitPattern [#count "other" ! "{0} lbf⋅ft"]
                ] 
                unit [
                    #type "volume-pint-metric" 
                    displayName [! "ptm"] 
                    unitPattern [#count "one" ! "{0} ptm"] 
                    unitPattern [#count "other" ! "{0} ptm"]
                ] 
                unit [
                    #type "volume-cup-metric" 
                    displayName [! "Tm"] 
                    unitPattern [#count "one" ! "{0} Tm"] 
                    unitPattern [#count "other" ! "{0} Tm"]
                ] 
                unit [
                    #type "volume-bushel" 
                    displayName [! "bsh"] 
                    unitPattern [#count "one" ! "{0} bsh"] 
                    unitPattern [#count "other" ! "{0} bsh"]
                ] 
                unit [
                    #type "volume-cup" 
                    displayName [! "tza."] 
                    unitPattern [#count "one" ! "{0} tza."] 
                    unitPattern [#count "other" ! "{0} tzas."]
                ] 
                unit [
                    #type "volume-dessert-spoon" 
                    displayName [! "cdapostre"] 
                    unitPattern [#count "one" ! "{0} cdapostre"] 
                    unitPattern [#count "other" ! "{0} cdapostre"]
                ] 
                unit [
                    #type "volume-dessert-spoon-imperial" 
                    displayName [! "cdapostre imp."] 
                    unitPattern [#count "one" ! "{0} cdapostre imp."] 
                    unitPattern [#count "other" ! "{0} cdaspostre imp."]
                ] 
                unit [
                    #type "volume-dram" 
                    displayName [! "fl dracma"] 
                    unitPattern [#count "one" ! "{0} fl dracma"] 
                    unitPattern [#count "other" ! "{0} fl dracmas"]
                ] 
                unit [
                    #type "volume-jigger" 
                    displayName [! "jigger"] 
                    unitPattern [#count "one" ! "{0} jigger"] 
                    unitPattern [#count "other" ! "{0} jiggers"]
                ]
            ] 
            unitLength [
                #type "narrow" 
                unit [
                    #type "area-hectare" 
                    displayName [! "hectárea"]
                ] 
                unit [
                    #type "duration-year" 
                    displayName [! "a"] 
                    unitPattern [#count "one" ! "{0}a"] 
                    unitPattern [#count "other" ! "{0}a"]
                ] 
                unit [
                    #type "duration-month" 
                    displayName [! "m"] 
                    unitPattern [#count "one" ! "{0}m"] 
                    unitPattern [#count "other" ! "{0}m"]
                ] 
                unit [
                    #type "duration-day" 
                    displayName [! "día"] 
                    unitPattern [#count "one" ! "{0}d"] 
                    unitPattern [#count "other" ! "{0}d"]
                ] 
                unit [
                    #type "graphics-dot" 
                    displayName [! "punto"] 
                    unitPattern [#count "one" ! "{0} p"] 
                    unitPattern [#count "other" ! "{0} p"]
                ] 
                unit [
                    #type "length-furlong" 
                    displayName [! "furlong"]
                ] 
                unit [
                    #type "length-fathom" 
                    displayName [! "braza"]
                ] 
                unit [
                    #type "length-mile-scandinavian" 
                    displayName [! "mil"] 
                    unitPattern [#count "one" ! "{0}mil"] 
                    unitPattern [#count "other" ! "{0}mil"]
                ] 
                unit [
                    #type "temperature-fahrenheit" 
                    unitPattern [#count "one" ! "{0}°"] 
                    unitPattern [#count "other" ! "{0}°"]
                ]
            ]
        ] 
        listPatterns [
            listPattern [
                #type "unit-short" 
                listPatternPart [#type "end" ! "{0} y {1}"]
            ]
        ] 
        characterLabels [
            characterLabelPattern [#type "miscellaneous" ! "{0} — Varios"] 
            characterLabel [#type "activities" ! "actividades"] 
            characterLabel [#type "african_scripts" ! "símbolos de escritura de África"] 
            characterLabel [#type "american_scripts" ! "símbolos de escritura de América"] 
            characterLabel [#type "arrows" ! "flechas"] 
            characterLabel [#type "currency_symbols" ! "símbolo de moneda"] 
            characterLabel [#type "dash_connector" ! "guion o conector"] 
            characterLabel [#type "digits" ! "dígito"] 
            characterLabel [#type "dingbats" ! "dingbat"] 
            characterLabel [#type "divination_symbols" ! "símbolo de adivinación"] 
            characterLabel [#type "downwards_arrows" ! "flecha hacia abajo"] 
            characterLabel [#type "east_asian_scripts" ! "sistema de escritura de Asia Oriental"] 
            characterLabel [#type "food_drink" ! "comida y bebida"] 
            characterLabel [#type "format" ! "formato"] 
            characterLabel [#type "full_width_form_variant" ! "variante de formato ancho completo"] 
            characterLabel [#type "geometric_shapes" ! "forma geométrica"] 
            characterLabel [#type "half_width_form_variant" ! "variante de formato medio ancho"] 
            characterLabel [#type "han_characters" ! "caracter Han"] 
            characterLabel [#type "han_radicals" ! "radical Han"] 
            characterLabel [#type "keycap" ! "tecla"] 
            characterLabel [#type "leftwards_arrows" ! "flecha hacia la izquierda"] 
            characterLabel [#type "leftwards_rightwards_arrows" ! "flecha hacia la derecha"] 
            characterLabel [#type "male" ! "hombre"] 
            characterLabel [#type "math_symbols" ! "símbolo matemático"] 
            characterLabel [#type "miscellaneous" ! "varios"] 
            characterLabel [#type "rightwards_arrows" ! "flecha hacia la derecha"] 
            characterLabel [#type "smiley" ! "cara sonriente"] 
            characterLabel [#type "smileys_people" ! "cara sonriente o persona"]
        ] 
        typographicNames [
            styleName [#type "wght" #subtype "500" ! "mediana"] 
            styleName [#type "wght" #subtype "900" ! "negra"] 
            styleName [#type "wght" #subtype "950" ! "extranegra"] 
            styleName [#type "wght" #subtype "950" #alt "ultrablack" ! "ultranegra"]
        ]
    ]

