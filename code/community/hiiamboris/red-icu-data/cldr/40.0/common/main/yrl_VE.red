
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "yrl"] 
            territory [#type "VE"]
        ] 
        localeDisplayNames [
            languages [
                language [#type "br" ! "beretan"] 
                language [#type "chn" ! "yarigan xinoki"] 
                language [#type "de" ! "areman"] 
                language [#type "de_CH" ! "areman iwaté (Suisa)"] 
                language [#type "gmh" ! "areman iwaté médiu"] 
                language [#type "goh" ! "areman arkaiku iwaté"] 
                language [#type "gsw" ! "areman (Suisa)"] 
                language [#type "lv" ! "retan"] 
                language [#type "mul" ! "siía ñeẽga"] 
                language [#type "nds_NL" ! "sakisan yatuka"] 
                language [#type "und" ! "ũba uyukuau ñeẽga"] 
                language [#type "wa" ! "waran"] 
                language [#type "yrl" ! "ñengatú"] 
                language [#type "zgh" ! "tamasiriti marukinu padran"] 
                language [#type "zh" ! "xinañeẽga"] 
                language [#type "zh" #alt "menu" ! "xinañeẽga, mãdarĩ"] 
                language [#type "zh_Hans" ! "xinañeẽga iwasuĩma"] 
                language [#type "zh_Hans" #alt "long" ! "xinañeẽga mãdarĩ (iwasuĩma)"] 
                language [#type "zh_Hant" ! "xinañeẽga katuwa"] 
                language [#type "zh_Hant" #alt "long" ! "xinañeẽga mãdarĩ (katuwa)"] 
                language [#type "zxx" ! "ũba aykué ñeẽga sesewaraitá"]
            ] 
            scripts [
                script [#type "Visp" ! "ñeẽga xipiawera"]
            ] 
            territories [
                territory [#type "AC" ! "Asesan Kapuãma"] 
                territory [#type "BL" ! "San Batulumeu"] 
                territory [#type "BT" ! "Butan"] 
                territory [#type "CR" ! "Koñta Rika"] 
                territory [#type "GA" ! "Gaban"] 
                territory [#type "KN" ! "San Kirituwan suí Newi"] 
                territory [#type "PM" ! "San Peduru asuí Mikelan"] 
                territory [#type "TA" ! "Tiritan Kũya"] 
                territory [#type "UN" ! "Nasan Yepewasuwaitá"]
            ] 
            variants [
                variant [#type "1606NICT" #draft "contributed" ! "frãsañeẽga kaxiímawara 1606 upé"] 
                variant [#type "1694ACAD" ! "frãsañeẽga kuiriwara"] 
                variant [#type "AO1990" ! "Kuatiasawasupí Ewakisawa ñeẽga Putugewara 1990"] 
                variant [#type "COLB1945" ! "Kõvẽsan kuatiasawasupí Brasiu-Putugau 1945"] 
                variant [#type "KKCOR" #draft "contributed" ! "kuatiasawasupí pañé-yara"]
            ] 
            types [
                type [#key "collation" #type "big5han" ! "Xinañẽẽga rikusawarupí muakaresawa - Big5"] 
                type [#key "collation" #type "gb2312han" ! "Xinañeẽga iwasuĩma muakarewa - GB2312"] 
                type [#key "collation" #type "search" ! "Sikaisá purusawa pañérupí"] 
                type [#key "colStrength" #type "primary" #draft "contributed" ! "Reyupurawaka letera básika ñũtú"]
            ] 
            codePatterns [
                codePattern [#type "language" ! "Ñeẽga: {0}"]
            ]
        ] 
        dates [
            calendars [
                calendar [
                    #type "gregorian" 
                    dayPeriods [
                        dayPeriodContext [
                            #type "format" 
                            dayPeriodWidth [
                                #type "abbreviated" 
                                dayPeriod [#type "am" ! "a. m."] 
                                dayPeriod [#type "pm" ! "p. m."]
                            ] 
                            dayPeriodWidth [
                                #type "narrow" 
                                dayPeriod [#type "am" ! "a. m."] 
                                dayPeriod [#type "pm" ! "p. m."]
                            ] 
                            dayPeriodWidth [
                                #type "wide" 
                                dayPeriod [#type "am" ! "a. m."] 
                                dayPeriod [#type "pm" ! "p. m."]
                            ]
                        ] 
                        dayPeriodContext [
                            #type "stand-alone" 
                            dayPeriodWidth [
                                #type "abbreviated" 
                                dayPeriod [#type "am" ! "a. m."] 
                                dayPeriod [#type "pm" ! "p. m."]
                            ] 
                            dayPeriodWidth [
                                #type "narrow" 
                                dayPeriod [#type "am" ! "a. m."] 
                                dayPeriod [#type "pm" ! "p. m."]
                            ] 
                            dayPeriodWidth [
                                #type "wide" 
                                dayPeriod [#type "am" ! "a. m."] 
                                dayPeriod [#type "pm" ! "p. m."]
                            ]
                        ]
                    ] 
                    dateFormats [
                        dateFormatLength [
                            #type "full" 
                            dateFormat [
                                pattern [! "EEEE, d MMMM y"]
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
                                pattern [! "dd/MM/y"]
                            ]
                        ]
                    ] 
                    timeFormats [
                        timeFormatLength [
                            #type "full" 
                            timeFormat [
                                pattern [#draft "contributed" ! "h:mm:ss a zzzz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "long" 
                            timeFormat [
                                pattern [#draft "contributed" ! "h:mm:ss a z"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "medium" 
                            timeFormat [
                                pattern [#draft "contributed" ! "h:mm:ss a"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "short" 
                            timeFormat [
                                pattern [#draft "contributed" ! "h:mm a"]
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
                    ]
                ]
            ] 
            fields [
                field [
                    #type "dayperiod-short" 
                    displayName [! "a. m./p. m."]
                ] 
                field [
                    #type "dayperiod" 
                    displayName [! "a. m./p. m."]
                ] 
                field [
                    #type "dayperiod-narrow" 
                    displayName [! "a. m./p. m."]
                ]
            ] 
            timeZoneNames [
                zone [
                    #type "America/St_Kitts" 
                    exemplarCity [! "Sã Kirituwan"]
                ] 
                metazone [
                    #type "Bhutan" 
                    long [
                        standard [! "Butan Hurariyu"]
                    ]
                ] 
                metazone [
                    #type "Pierre_Miquelon" 
                    long [
                        generic [! "Sã Peduru asuí Mikiran Hurariyu"] 
                        standard [! "Sã Peduru asuí Mikiran Hurariyu Retewa"] 
                        daylight [! "Sã Peduru asuí Mikiran Kurasí Ara Hurariyu"]
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
                        pattern [#type "1000000" #count "one" ! "0 millón"] 
                        pattern [#type "1000000" #count "other" ! "0 millón-ita"] 
                        pattern [#type "10000000" #count "one" ! "00 millón"] 
                        pattern [#type "10000000" #count "other" ! "00 millón-ita"] 
                        pattern [#type "100000000" #count "one" ! "000 millón"] 
                        pattern [#type "100000000" #count "other" ! "000 millón-ita"] 
                        pattern [#type "1000000000" #count "one" ! "0 billón"] 
                        pattern [#type "1000000000" #count "other" ! "0 billón-ita"] 
                        pattern [#type "10000000000" #count "one" ! "00 billón"] 
                        pattern [#type "10000000000" #count "other" ! "00 billón-ita"] 
                        pattern [#type "100000000000" #count "one" ! "000 billón"] 
                        pattern [#type "100000000000" #count "other" ! "000 billón-ita"] 
                        pattern [#type "1000000000000" #count "one" ! "0 tirillón"] 
                        pattern [#type "1000000000000" #count "other" ! "0 tirillón-ita"] 
                        pattern [#type "10000000000000" #count "one" ! "00 tirillón"] 
                        pattern [#type "10000000000000" #count "other" ! "00 tirillón-ita"] 
                        pattern [#type "100000000000000" #count "one" ! "000 tirillón"] 
                        pattern [#type "100000000000000" #count "other" ! "000 tirillón-ita"]
                    ]
                ]
            ] 
            currencies [
                currency [
                    #type "AOR" 
                    displayName [! "Kuãsa ãgulawara yumũñãwa yuiri (1995–1999)"] 
                    displayName [#count "one" ! "Kuãsa ãgulawara yumuñãwa yuiri (AOR)"] 
                    displayName [#count "other" ! "Kuãsa-ita ãgulawara yumuñãwa-itayuiri (AOR)"]
                ]
            ]
        ] 
        units [
            unitLength [
                #type "long" 
                unit [
                    #type "area-square-mile" 
                    displayName [! "milla kuadaradu-ita"] 
                    unitPattern [#count "one" ! "{0} milla kuadaradu"] 
                    unitPattern [#count "other" ! "{0} milla kuadaradu-ita"] 
                    perUnitPattern [! "{0} milla kuadaradu rupi"]
                ] 
                unit [
                    #type "concentr-permillion" 
                    displayName [! "pisawera-ita millón rupi"] 
                    unitPattern [#count "one" ! "{0} pisawera millón rupi"] 
                    unitPattern [#count "other" ! "{0} pisawera-ita millón rupi"]
                ] 
                unit [
                    #type "consumption-mile-per-gallon" 
                    displayName [! "milla-ita karóti rupi"] 
                    unitPattern [#count "one" ! "{0} milla karóti rupi"] 
                    unitPattern [#count "other" ! "{0} milla-ita karóti rupi"]
                ] 
                unit [
                    #type "consumption-mile-per-gallon-imperial" 
                    displayName [! "milla-ita karóti ĩperiawa rupi"] 
                    unitPattern [#count "one" ! "{0} milla karóti ĩperiawa rupi"] 
                    unitPattern [#count "other" ! "{0} milla-ita karóti ĩperiawa rupi"]
                ] 
                unit [
                    #type "length-mile" 
                    displayName [! "milla-ita"] 
                    unitPattern [#count "one" ! "{0} milla"] 
                    unitPattern [#count "other" ! "{0} milla-ita"]
                ] 
                unit [
                    #type "length-nautical-mile" 
                    displayName [! "milla paranãuara-ita"] 
                    unitPattern [#count "one" ! "{0} milla paranãuara"] 
                    unitPattern [#count "other" ! "{0} milla paranãuara-ita"]
                ] 
                unit [
                    #type "length-mile-scandinavian" 
                    displayName [! "milla esikãdinaua-ita"] 
                    unitPattern [#count "one" ! "{0} milla esikãdinaua"] 
                    unitPattern [#count "other" ! "{0} milla esikãdinaua-ita"]
                ] 
                unit [
                    #type "speed-mile-per-hour" 
                    displayName [! "milla-ita hura rupi"] 
                    unitPattern [#count "one" ! "{0} milla hura rupi"] 
                    unitPattern [#count "other" ! "{0} milla-ita hura rupi"]
                ] 
                unit [
                    #type "volume-cubic-mile" 
                    displayName [! "milla kúbika-ita"] 
                    unitPattern [#count "one" ! "{0} milla kúbika"] 
                    unitPattern [#count "other" ! "{0} milla kúbika-ita"]
                ]
            ] 
            unitLength [
                #type "short" 
                unit [
                    #type "area-square-mile" 
                    displayName [! "milla-itá²"]
                ] 
                unit [
                    #type "concentr-permillion" 
                    displayName [! "pisawera millón rupi"]
                ] 
                unit [
                    #type "consumption-mile-per-gallon" 
                    displayName [! "milla-itá/gal"]
                ] 
                unit [
                    #type "consumption-mile-per-gallon-imperial" 
                    displayName [! "millas/gal. imp."]
                ] 
                unit [
                    #type "length-mile" 
                    displayName [! "milla"]
                ] 
                unit [
                    #type "speed-mile-per-hour" 
                    displayName [! "milla-itá/hura"]
                ]
            ] 
            unitLength [
                #type "narrow" 
                unit [
                    #type "length-mile" 
                    unitPattern [#count "one" ! "{0} milla"] 
                    unitPattern [#count "other" ! "{0} milla"]
                ]
            ]
        ] 
        characterLabels [
            characterLabelPattern [#type "all" ! "{0} — pañé"] 
            characterLabel [#type "punctuation" ! "pũtuasan"]
        ] 
        typographicNames [
            axisName [#type "slnt" ! "ĩkrinasan"] 
            featureName [#type "afrc" ! "frasan-ita puãmuwa"] 
            featureName [#type "frac" ! "frasan-ita diagunau"]
        ]
    ]

