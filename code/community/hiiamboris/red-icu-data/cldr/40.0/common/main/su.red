
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "su"]
        ] 
        localeDisplayNames [
            localeDisplayPattern [
                localePattern [! "{0} ({1})"] 
                localeSeparator [! "{0}, {1}"] 
                localeKeyTypePattern [! "{0}: {1}"]
            ] 
            languages [
                language [#type "de" ! "Jérman"] 
                language [#type "de_AT" ! "Jérman Austria"] 
                language [#type "de_CH" ! "Jérman Swiss Luhur"] 
                language [#type "en" ! "Inggris"] 
                language [#type "en_AU" ! "Inggris Australia"] 
                language [#type "en_CA" ! "Inggris Kanada"] 
                language [#type "en_GB" #alt "short" ! "Inggris UK"] 
                language [#type "en_US" ! "Inggris Amerika"] 
                language [#type "en_US" #alt "short" ! "Inggris AS"] 
                language [#type "es" ! "Spanyol"] 
                language [#type "es_419" ! "Spanyol Amérika Latin"] 
                language [#type "es_ES" ! "Spanyol Éropa"] 
                language [#type "es_MX" ! "Spanyol Méksiko"] 
                language [#type "fr" ! "Prancis"] 
                language [#type "fr_CA" ! "Prancis Kanada"] 
                language [#type "fr_CH" ! "Prancis Swiss"] 
                language [#type "it" ! "Italia"] 
                language [#type "ja" ! "Jepang"] 
                language [#type "pt" ! "Portugis"] 
                language [#type "pt_BR" ! "Portugis Brasil"] 
                language [#type "pt_PT" ! "Portugis Éropa"] 
                language [#type "ru" ! "Rusia"] 
                language [#type "su" ! "Basa Sunda"] 
                language [#type "und" ! "Basa teu dikenal"] 
                language [#type "zh" ! "Tiongkok"] 
                language [#type "zh" #alt "menu" ! "Tiongkok, Mandarin"] 
                language [#type "zh_Hans" ! "Tiongkok Sederhana"] 
                language [#type "zh_Hans" #alt "long" ! "Tiongkok Mandarin Sederhana"] 
                language [#type "zh_Hant" ! "Tiongkok Tradisional"] 
                language [#type "zh_Hant" #alt "long" ! "Tiongkok Mandarin Tradisional"]
            ] 
            scripts [
                script [#type "Cyrl" ! "Sirilik"] 
                script [#type "Hans" ! "Sederhana"] 
                script [#type "Hans" #alt "stand-alone" ! "Han Sederhana"] 
                script [#type "Hant" ! "Tradisional"] 
                script [#type "Hant" #alt "stand-alone" ! "Han Tradisional"] 
                script [#type "Latn" ! "Latin"] 
                script [#type "Zxxx" ! "Non-tulisan"] 
                script [#type "Zzzz" ! "Tulisan Teu Dikenal"]
            ] 
            territories [
                territory [#type "BR" ! "Brasil"] 
                territory [#type "CN" ! "Tiongkok"] 
                territory [#type "DE" ! "Jérman"] 
                territory [#type "FR" ! "Prancis"] 
                territory [#type "GB" ! "Britania Raya"] 
                territory [#type "IN" ! "India"] 
                territory [#type "IT" ! "Italia"] 
                territory [#type "JP" ! "Jepang"] 
                territory [#type "RU" ! "Rusia"] 
                territory [#type "US" ! "Amérika Sarikat"] 
                territory [#type "ZZ" ! "Wilayah Teu Dikenal"]
            ] 
            types [
                type [#key "calendar" #type "gregorian" ! "Kalénder Grégorian"] 
                type [#key "collation" #type "standard" ! "Aturan Runtuyan Standar"] 
                type [#key "numbers" #type "latn" ! "Digit Barat"]
            ] 
            measurementSystemNames [
                measurementSystemName [#type "metric" ! "Métrik"] 
                measurementSystemName [#type "UK" ! "U.K."] 
                measurementSystemName [#type "US" ! "A.S."]
            ] 
            codePatterns [
                codePattern [#type "language" ! "Basa: {0}"] 
                codePattern [#type "script" ! "Skrip: {0}"] 
                codePattern [#type "territory" ! "Daérah: {0}"]
            ]
        ] 
        characters [
            exemplarCharacters [#draft "contributed" ! {[a b c d e é f g h i j k l m n o p q r s t u v w x y z]}] 
            exemplarCharacters [#type "auxiliary" #draft "contributed" ! {[á à ă â å ä ã ā æ ç è ĕ ê ë ē í ì ĭ î ï ī ñ ó ò ŏ ô ö ø ō œ ú ù ŭ û ü ū ÿ]}] 
            exemplarCharacters [#type "index" #draft "contributed" ! {[A B C D E É F G H I J K L M N O P Q R S T U V W X Y Z]}] 
            exemplarCharacters [#type "numbers" #draft "contributed" ! "[\- ‑ , . % ‰ + 0 1 2 3 4 5 6 7 8 9]"] 
            exemplarCharacters [#type "punctuation" #draft "contributed" ! {[\- ‐ ‑ – — , ; \: ! ? . … ' ‘ ’ &quot; “ ” ( ) \[ \] § @ * / \&amp; # † ‡ ′ ″]}]
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
                                pattern [! "d/M/y GGGGG"] 
                                datetimeSkeleton [! "GGGGGyMd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        dateTimeFormatLength [
                            #type "full" 
                            dateTimeFormat [
                                pattern [! "{1} 'jam' {0}"]
                            ]
                        ] 
                        dateTimeFormatLength [
                            #type "long" 
                            dateTimeFormat [
                                pattern [! "{1} 'jam' {0}"]
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
                                month [#type "1" ! "Jan"] 
                                month [#type "2" ! "Péb"] 
                                month [#type "3" ! "Mar"] 
                                month [#type "4" ! "Apr"] 
                                month [#type "5" ! "Méi"] 
                                month [#type "6" ! "Jun"] 
                                month [#type "7" ! "Jul"] 
                                month [#type "8" ! "Ags"] 
                                month [#type "9" ! "Sép"] 
                                month [#type "10" ! "Okt"] 
                                month [#type "11" ! "Nop"] 
                                month [#type "12" ! "Dés"]
                            ] 
                            monthWidth [
                                #type "narrow" 
                                month [#type "1" ! "J"] 
                                month [#type "2" ! "P"] 
                                month [#type "3" ! "M"] 
                                month [#type "4" ! "A"] 
                                month [#type "5" ! "M"] 
                                month [#type "6" ! "J"] 
                                month [#type "7" ! "J"] 
                                month [#type "8" ! "A"] 
                                month [#type "9" ! "S"] 
                                month [#type "10" ! "O"] 
                                month [#type "11" ! "N"] 
                                month [#type "12" ! "D"]
                            ] 
                            monthWidth [
                                #type "wide" 
                                month [#type "1" ! "Januari"] 
                                month [#type "2" ! "Pébruari"] 
                                month [#type "3" ! "Maret"] 
                                month [#type "4" ! "April"] 
                                month [#type "5" ! "Méi"] 
                                month [#type "6" ! "Juni"] 
                                month [#type "7" ! "Juli"] 
                                month [#type "8" ! "Agustus"] 
                                month [#type "9" ! "Séptémber"] 
                                month [#type "10" ! "Oktober"] 
                                month [#type "11" ! "Nopémber"] 
                                month [#type "12" ! "Désémber"]
                            ]
                        ] 
                        monthContext [
                            #type "stand-alone" 
                            monthWidth [
                                #type "narrow" 
                                month [#type "1" ! "J"] 
                                month [#type "2" ! "P"] 
                                month [#type "3" ! "M"] 
                                month [#type "4" ! "A"] 
                                month [#type "5" ! "M"] 
                                month [#type "6" ! "J"] 
                                month [#type "7" ! "J"] 
                                month [#type "8" ! "A"] 
                                month [#type "9" ! "S"] 
                                month [#type "10" ! "O"] 
                                month [#type "11" ! "N"] 
                                month [#type "12" ! "D"]
                            ] 
                            monthWidth [
                                #type "wide" 
                                month [#type "1" ! "Januari"] 
                                month [#type "2" ! "Pébruari"] 
                                month [#type "3" ! "Maret"] 
                                month [#type "4" ! "April"] 
                                month [#type "5" ! "Méi"] 
                                month [#type "6" ! "Juni"] 
                                month [#type "7" ! "Juli"] 
                                month [#type "8" ! "Agustus"] 
                                month [#type "9" ! "Séptémber"] 
                                month [#type "10" ! "Oktober"] 
                                month [#type "11" ! "Nopémber"] 
                                month [#type "12" ! "Désémber"]
                            ]
                        ]
                    ] 
                    days [
                        dayContext [
                            #type "format" 
                            dayWidth [
                                #type "abbreviated" 
                                day [#type "sun" ! "Mng"] 
                                day [#type "mon" ! "Sen"] 
                                day [#type "tue" ! "Sal"] 
                                day [#type "wed" ! "Reb"] 
                                day [#type "thu" ! "Kem"] 
                                day [#type "fri" ! "Jum"] 
                                day [#type "sat" ! "Sap"]
                            ] 
                            dayWidth [
                                #type "narrow" 
                                day [#type "sun" ! "M"] 
                                day [#type "mon" ! "S"] 
                                day [#type "tue" ! "S"] 
                                day [#type "wed" ! "R"] 
                                day [#type "thu" ! "K"] 
                                day [#type "fri" ! "J"] 
                                day [#type "sat" ! "S"]
                            ] 
                            dayWidth [
                                #type "wide" 
                                day [#type "sun" ! "Minggu"] 
                                day [#type "mon" ! "Senén"] 
                                day [#type "tue" ! "Salasa"] 
                                day [#type "wed" ! "Rebo"] 
                                day [#type "thu" ! "Kemis"] 
                                day [#type "fri" ! "Jumaah"] 
                                day [#type "sat" ! "Saptu"]
                            ]
                        ] 
                        dayContext [
                            #type "stand-alone" 
                            dayWidth [
                                #type "abbreviated" 
                                day [#type "sun" ! "Mng"] 
                                day [#type "mon" ! "Sen"] 
                                day [#type "tue" ! "Sal"] 
                                day [#type "wed" ! "Reb"] 
                                day [#type "thu" ! "Kem"] 
                                day [#type "fri" ! "Jum"] 
                                day [#type "sat" ! "Sap"]
                            ] 
                            dayWidth [
                                #type "narrow" 
                                day [#type "sun" ! "M"] 
                                day [#type "mon" ! "S"] 
                                day [#type "tue" ! "S"] 
                                day [#type "wed" ! "R"] 
                                day [#type "thu" ! "K"] 
                                day [#type "fri" ! "J"] 
                                day [#type "sat" ! "S"]
                            ] 
                            dayWidth [
                                #type "wide" 
                                day [#type "sun" ! "Minggu"] 
                                day [#type "mon" ! "Senén"] 
                                day [#type "tue" ! "Salasa"] 
                                day [#type "wed" ! "Rebo"] 
                                day [#type "thu" ! "Kemis"] 
                                day [#type "fri" ! "Jumaah"] 
                                day [#type "sat" ! "Saptu"]
                            ]
                        ]
                    ] 
                    quarters [
                        quarterContext [
                            #type "format" 
                            quarterWidth [
                                #type "abbreviated" 
                                quarter [#type "1" ! "K1"] 
                                quarter [#type "2" ! "K2"] 
                                quarter [#type "3" ! "K3"] 
                                quarter [#type "4" ! "K4"]
                            ] 
                            quarterWidth [
                                #type "wide" 
                                quarter [#type "1" ! "kuartal ka-1"] 
                                quarter [#type "2" ! "kuartal ka-2"] 
                                quarter [#type "3" ! "kuartal ka-3"] 
                                quarter [#type "4" ! "kuartal ka-4"]
                            ]
                        ] 
                        quarterContext [
                            #type "stand-alone" 
                            quarterWidth [
                                #type "abbreviated" 
                                quarter [#type "1" ! "K1"] 
                                quarter [#type "2" ! "K2"] 
                                quarter [#type "3" ! "K3"] 
                                quarter [#type "4" ! "K4"]
                            ] 
                            quarterWidth [
                                #type "wide" 
                                quarter [#type "1" ! "kuartal ka-1"] 
                                quarter [#type "2" ! "kuartal ka-2"] 
                                quarter [#type "3" ! "kuartal ka-3"] 
                                quarter [#type "4" ! "kuartal-ka 4"]
                            ]
                        ]
                    ] 
                    eras [
                        eraAbbr [
                            era [#type "0" ! "SM"] 
                            era [#type "1" ! "M"]
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
                                pattern [! "d/M/yy"] 
                                datetimeSkeleton [! "yyMd"]
                            ]
                        ]
                    ] 
                    timeFormats [
                        timeFormatLength [
                            #type "full" 
                            timeFormat [
                                pattern [! "H.mm.ss zzzz"] 
                                datetimeSkeleton [! "Hmmsszzzz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "long" 
                            timeFormat [
                                pattern [! "H.mm.ss z"] 
                                datetimeSkeleton [! "Hmmssz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "medium" 
                            timeFormat [
                                pattern [! "H.mm.ss"] 
                                datetimeSkeleton [! "Hmmss"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "short" 
                            timeFormat [
                                pattern [! "H.mm"] 
                                datetimeSkeleton [! "Hmm"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        dateTimeFormatLength [
                            #type "full" 
                            dateTimeFormat [
                                pattern [! "{1} 'jam' {0}"]
                            ]
                        ] 
                        dateTimeFormatLength [
                            #type "long" 
                            dateTimeFormat [
                                pattern [! "{1} 'jam' {0}"]
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
                            dateFormatItem [#id "Bhm" ! "h.mm B"] 
                            dateFormatItem [#id "Bhms" ! "h.mm.ss B"] 
                            dateFormatItem [#id "EBhm" ! "E h.mm B"] 
                            dateFormatItem [#id "EBhms" ! "E h.mm.ss B"] 
                            dateFormatItem [#id "Ed" ! "E d"] 
                            dateFormatItem [#id "Ehm" ! "E h.mm a"] 
                            dateFormatItem [#id "EHm" ! "E HH.mm"] 
                            dateFormatItem [#id "Ehms" ! "E h.mm.ss a"] 
                            dateFormatItem [#id "EHms" ! "E HH:mm:ss"] 
                            dateFormatItem [#id "Gy" ! "y G"] 
                            dateFormatItem [#id "GyMd" ! "d/M/y GGGGG"] 
                            dateFormatItem [#id "GyMMM" ! "MMM y G"] 
                            dateFormatItem [#id "GyMMMd" ! "d MMM y G"] 
                            dateFormatItem [#id "GyMMMEd" ! "E, d MMM y G"] 
                            dateFormatItem [#id "h" ! "h a"] 
                            dateFormatItem [#id "hm" ! "h.mm a"] 
                            dateFormatItem [#id "Hm" ! "HH.mm"] 
                            dateFormatItem [#id "hms" ! "h.mm.ss a"] 
                            dateFormatItem [#id "Hms" ! "HH.mm.ss"] 
                            dateFormatItem [#id "hmsv" ! "h.mm.ss a v"] 
                            dateFormatItem [#id "Hmsv" ! "HH.mm.ss v"] 
                            dateFormatItem [#id "hmv" ! "h.mm a v"] 
                            dateFormatItem [#id "Hmv" ! "HH.mm v"] 
                            dateFormatItem [#id "M" ! "L"] 
                            dateFormatItem [#id "Md" ! "d/M"] 
                            dateFormatItem [#id "MEd" ! "E, d/M"] 
                            dateFormatItem [#id "MMMd" ! "d MMM"] 
                            dateFormatItem [#id "MMMEd" ! "E, d MMM"] 
                            dateFormatItem [#id "MMMMd" ! "d MMMM"] 
                            dateFormatItem [#id "ms" ! "mm.ss"] 
                            dateFormatItem [#id "yM" ! "M/y"] 
                            dateFormatItem [#id "yMd" ! "d/M/y"] 
                            dateFormatItem [#id "yMEd" ! "E, d/M/y"] 
                            dateFormatItem [#id "yMMM" ! "MMM y"] 
                            dateFormatItem [#id "yMMMd" ! "d MMM, y"] 
                            dateFormatItem [#id "yMMMEd" ! "E, d MMM y"] 
                            dateFormatItem [#id "yMMMM" ! "MMMM y"] 
                            dateFormatItem [#id "yQQQ" ! "QQQ y"] 
                            dateFormatItem [#id "yQQQQ" ! "QQQQ y"]
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
                    displayName [! "éra"]
                ] 
                field [
                    #type "year" 
                    displayName [! "taun"] 
                    relative [#type "-1" ! "taun kamari"] 
                    relative [#type "0" ! "taun ieu"] 
                    relative [#type "1" ! "taun payun"]
                ] 
                field [
                    #type "year-short" 
                    displayName [! "tn."]
                ] 
                field [
                    #type "year-narrow" 
                    displayName [! "tn."]
                ] 
                field [
                    #type "quarter" 
                    displayName [! "triwulan"]
                ] 
                field [
                    #type "quarter-short" 
                    displayName [! "tri."]
                ] 
                field [
                    #type "quarter-narrow" 
                    displayName [! "tri."]
                ] 
                field [
                    #type "month" 
                    displayName [! "sasih"]
                ] 
                field [
                    #type "month-short" 
                    displayName [! "sa."]
                ] 
                field [
                    #type "month-narrow" 
                    displayName [! "sa."]
                ] 
                field [
                    #type "week" 
                    displayName [! "minggu"]
                ] 
                field [
                    #type "week-short" 
                    displayName [! "mgg."]
                ] 
                field [
                    #type "week-narrow" 
                    displayName [! "mgg."]
                ] 
                field [
                    #type "day" 
                    displayName [! "dinten"] 
                    relative [#type "-1" ! "kamari"] 
                    relative [#type "0" ! "dinten ieu"] 
                    relative [#type "1" ! "énjing"]
                ] 
                field [
                    #type "day-short" 
                    displayName [! "dinten"] 
                    relative [#type "-1" ! "kamari"] 
                    relative [#type "0" ! "dinten ieu"] 
                    relative [#type "1" ! "énjing"]
                ] 
                field [
                    #type "day-narrow" 
                    displayName [! "dinten"] 
                    relative [#type "-1" ! "kamari"] 
                    relative [#type "0" ! "dinten ieu"] 
                    relative [#type "1" ! "énjing"]
                ] 
                field [
                    #type "weekday" 
                    displayName [! "dinten dina saminggu"]
                ] 
                field [
                    #type "sun" 
                    relative [#type "-1" ! "Minggu kamari"] 
                    relative [#type "0" ! "Minggu ieu"] 
                    relative [#type "1" ! "Minggu payun"]
                ] 
                field [
                    #type "dayperiod" 
                    displayName [! "AM/PM"]
                ] 
                field [
                    #type "hour" 
                    displayName [! "jam"]
                ] 
                field [
                    #type "hour-short" 
                    displayName [! "j."]
                ] 
                field [
                    #type "hour-narrow" 
                    displayName [! "j."]
                ] 
                field [
                    #type "minute" 
                    displayName [! "menit"]
                ] 
                field [
                    #type "minute-short" 
                    displayName [! "mnt."]
                ] 
                field [
                    #type "minute-narrow" 
                    displayName [! "mnt."]
                ] 
                field [
                    #type "second" 
                    displayName [! "detik"]
                ] 
                field [
                    #type "second-short" 
                    displayName [! "dtk."]
                ] 
                field [
                    #type "second-narrow" 
                    displayName [! "dtk."]
                ] 
                field [
                    #type "zone" 
                    displayName [! "zona waktu"]
                ]
            ] 
            timeZoneNames [
                fallbackFormat [! "{1} ({0})"] 
                zone [
                    #type "Etc/UTC" 
                    long [
                        standard [! "Waktu Universal Terkoordinasi"]
                    ]
                ] 
                zone [
                    #type "Etc/Unknown" 
                    exemplarCity [! "Kota Teu Dikenal"]
                ] 
                zone [
                    #type "Asia/Macau" 
                    exemplarCity [#draft "unconfirmed" ! "Makau"]
                ] 
                metazone [
                    #type "America_Central" 
                    long [
                        generic [! "Waktu Tengah"] 
                        standard [! "Waktu Standar Tengah"] 
                        daylight [! "Waktu Usum Panas Tengah"]
                    ]
                ] 
                metazone [
                    #type "America_Eastern" 
                    long [
                        generic [! "Waktu Wétan"] 
                        standard [! "Waktu Standar Wétan"] 
                        daylight [! "Waktu Usum Panas Wétan"]
                    ]
                ] 
                metazone [
                    #type "America_Mountain" 
                    long [
                        generic [! "Waktu Pagunungan"] 
                        standard [! "Waktu Standar Pagunungan"] 
                        daylight [! "Waktu Usum Panas Pagunungan"]
                    ]
                ] 
                metazone [
                    #type "America_Pacific" 
                    long [
                        generic [! "Waktu Pasifik"] 
                        standard [! "Waktu Standar Pasifik"] 
                        daylight [! "Waktu Usum Panas Pasifik"]
                    ]
                ] 
                metazone [
                    #type "Atlantic" 
                    long [
                        generic [! "Waktu Atlantik"] 
                        standard [! "Waktu Standar Atlantik"] 
                        daylight [! "Waktu Usum Panas Atlantik"]
                    ]
                ] 
                metazone [
                    #type "Colombia" 
                    long [
                        generic [! "Waktu Kolombia"] 
                        standard [! "Waktu Standar Kolombia"] 
                        daylight [! "Waktu Usum Panas Kolombia"]
                    ]
                ] 
                metazone [
                    #type "Europe_Central" 
                    long [
                        generic [! "Waktu Éropa Tengah"] 
                        standard [! "Waktu Standar Éropa Tengah"] 
                        daylight [! "Waktu Usum Panas Éropa Tengah"]
                    ]
                ] 
                metazone [
                    #type "Europe_Eastern" 
                    long [
                        generic [! "Waktu Éropa Timur"] 
                        standard [! "Waktu Standar Éropa Timur"] 
                        daylight [! "Waktu Usum Panas Éropa Timur"]
                    ]
                ] 
                metazone [
                    #type "Europe_Western" 
                    long [
                        generic [! "Waktu Éropa Barat"] 
                        standard [! "Waktu Standar Éropa Barat"] 
                        daylight [! "Waktu Usum Panas Éropa Barat"]
                    ]
                ] 
                metazone [
                    #type "Galapagos" 
                    long [
                        standard [! "Waktu Galapagos"]
                    ]
                ] 
                metazone [
                    #type "GMT" 
                    long [
                        standard [! "Waktu Greenwich"]
                    ]
                ]
            ]
        ] 
        numbers [
            symbols [
                #numberSystem "latn" 
                decimal [! ","] 
                group [! "."] 
                plusSign [! "+"] 
                timeSeparator [#draft "contributed" ! "."]
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
                        pattern [! "¤#,##0.00"]
                    ]
                ] 
                unitPattern [#count "other" ! "{0} {1}"]
            ] 
            currencies [
                currency [
                    #type "BRL" 
                    displayName [! "Real Brasil"] 
                    displayName [#count "other" ! "real Brasil"] 
                    symbol [#draft "contributed" ! "R$"] 
                    symbol [#alt "narrow" #draft "contributed" ! "R$"]
                ] 
                currency [
                    #type "CNY" 
                    displayName [! "Yuan Tiongkok"] 
                    displayName [#count "other" ! "yuan Tiongkok"] 
                    symbol [#draft "contributed" ! "CN¥"] 
                    symbol [#alt "narrow" #draft "contributed" ! "¥"]
                ] 
                currency [
                    #type "EUR" 
                    displayName [! "Euro"] 
                    displayName [#count "other" ! "euro"] 
                    symbol [#draft "contributed" ! "€"] 
                    symbol [#alt "narrow" #draft "contributed" ! "€"]
                ] 
                currency [
                    #type "GBP" 
                    displayName [! "Pound Inggris"] 
                    displayName [#count "other" ! "pound Inggris"] 
                    symbol [#draft "contributed" ! "£"] 
                    symbol [#alt "narrow" #draft "contributed" ! "£"]
                ] 
                currency [
                    #type "IDR" 
                    displayName [! "Rupee Indonésia"] 
                    displayName [#count "other" ! "rupee Indonésia"] 
                    symbol [! "Rp"] 
                    symbol [#alt "narrow" #draft "contributed" ! "Rp"]
                ] 
                currency [
                    #type "INR" 
                    displayName [! "Rupee India"] 
                    displayName [#count "other" ! "rupee India"] 
                    symbol [#draft "contributed" ! "₹"] 
                    symbol [#alt "narrow" #draft "contributed" ! "₹"]
                ] 
                currency [
                    #type "JPY" 
                    displayName [! "Yén Jepang"] 
                    displayName [#count "other" ! "yén Jepang"] 
                    symbol [#draft "contributed" ! "¥"] 
                    symbol [#alt "narrow" #draft "contributed" ! "¥"]
                ] 
                currency [
                    #type "RUB" 
                    displayName [! "Rubel Rusia"] 
                    displayName [#count "other" ! "rubel Rusia"] 
                    symbol [#draft "contributed" ! "RUB"] 
                    symbol [#alt "narrow" #draft "contributed" ! "₽"]
                ] 
                currency [
                    #type "USD" 
                    displayName [! "Dolar A.S."] 
                    displayName [#count "other" ! "dolar A.S."] 
                    symbol [#draft "contributed" ! "$"] 
                    symbol [#alt "narrow" #draft "contributed" ! "$"]
                ] 
                currency [
                    #type "XXX" 
                    displayName [! "Mata Uang Teu Dikenal"] 
                    displayName [#count "other" ! "(mata uang teu dikenal)"]
                ]
            ]
        ] 
        units [
            unitLength [
                #type "narrow" 
                unit [
                    #type "consumption-mile-per-gallon-imperial" 
                    unitPattern [#count "other" ! "{0}m/gUK"]
                ] 
                unit [
                    #type "volume-gallon-imperial" 
                    unitPattern [#count "other" ! "{0}galIm"]
                ] 
                unit [
                    #type "volume-fluid-ounce-imperial" 
                    unitPattern [#count "other" ! "{0}fl oz Im"]
                ] 
                unit [
                    #type "volume-dessert-spoon-imperial" 
                    unitPattern [#count "other" ! "{0}dsp-Imp"]
                ]
            ] 
            durationUnit [
                #type "hm" 
                durationUnitPattern [! "h.mm"]
            ] 
            durationUnit [
                #type "hms" 
                durationUnitPattern [! "h.mm.ss"]
            ] 
            durationUnit [
                #type "ms" 
                durationUnitPattern [! "m.ss"]
            ]
        ] 
        listPatterns [
            listPattern [
                listPatternPart [#type "start" ! "{0}, {1}"] 
                listPatternPart [#type "middle" ! "{0}, {1}"] 
                listPatternPart [#type "end" ! "{0}, sareng {1}"] 
                listPatternPart [#type "2" ! "{0} sareng {1}"]
            ] 
            listPattern [
                #type "standard-short" 
                listPatternPart [#type "start" #draft "unconfirmed" ! "{0}, {1}"] 
                listPatternPart [#type "2" #draft "unconfirmed" ! "{0} &amp; {1}"]
            ]
        ] 
        posix [
            messages [
                yesstr [! "enya:e"] 
                nostr [! "teu:t"]
            ]
        ]
    ]

