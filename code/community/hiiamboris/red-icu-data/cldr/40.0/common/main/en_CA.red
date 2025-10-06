
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "en"] 
            territory [#type "CA"]
        ] 
        localeDisplayNames [
            languages [
                language [#type "bn" ! "Bengali"] 
                language [#type "en_US" #alt "short" ! "U.S. English"] 
                language [#type "mfe" ! "Mauritian"] 
                language [#type "mus" ! "Creek"] 
                language [#type "nds_NL" ! "West Low German"] 
                language [#type "ro_MD" ! "Moldovan"] 
                language [#type "sah" ! "Yakut"] 
                language [#type "tvl" ! "Tuvaluan"]
            ] 
            territories [
                territory [#type "AG" ! "Antigua and Barbuda"] 
                territory [#type "BA" ! "Bosnia and Herzegovina"] 
                territory [#type "BL" ! "Saint-Barthélemy"] 
                territory [#type "EA" ! "Ceuta and Melilla"] 
                territory [#type "GB" #alt "short" ! "U.K."] 
                territory [#type "GS" ! "South Georgia and South Sandwich Islands"] 
                territory [#type "HM" ! "Heard and McDonald Islands"] 
                territory [#type "KN" ! "Saint Kitts and Nevis"] 
                territory [#type "LC" ! "Saint Lucia"] 
                territory [#type "MF" ! "Saint Martin"] 
                territory [#type "PM" ! "Saint-Pierre-et-Miquelon"] 
                territory [#type "SH" ! "Saint Helena"] 
                territory [#type "SJ" ! "Svalbard and Jan Mayen"] 
                territory [#type "ST" ! "São Tomé and Príncipe"] 
                territory [#type "TC" ! "Turks and Caicos Islands"] 
                territory [#type "TT" ! "Trinidad and Tobago"] 
                territory [#type "US" #alt "short" ! "U.S."] 
                territory [#type "VC" ! "Saint Vincent and the Grenadines"] 
                territory [#type "WF" ! "Wallis and Futuna"]
            ] 
            keys [
                key [#type "colCaseLevel" ! "Case-Sensitive Sorting"]
            ] 
            types [
                type [#key "calendar" #type "dangi" ! "Korean Calendar"] 
                type [#key "calendar" #type "ethiopic" ! "Ethiopian Calendar"] 
                type [#key "colNormalization" #type "no" ! "Sort Without Normalisation"] 
                type [#key "colNormalization" #type "yes" ! "Sort Unicode Normalised"] 
                type [#key "d0" #type "fwidth" ! "To Full Width"] 
                type [#key "d0" #type "hwidth" ! "To Half Width"] 
                type [#key "d0" #type "lower" ! "To Lower Case"] 
                type [#key "d0" #type "title" ! "To Title Case"] 
                type [#key "d0" #type "upper" ! "To Upper Case"] 
                type [#key "hc" #type "h11" ! "12-Hour System (0–11)"] 
                type [#key "hc" #type "h12" ! "12-Hour System (1–12)"] 
                type [#key "hc" #type "h23" ! "24-Hour System (0–23)"] 
                type [#key "hc" #type "h24" ! "24-Hour System (1–24)"] 
                type [#key "ms" #type "ussystem" ! "U.S. Measurement System"]
            ] 
            measurementSystemNames [
                measurementSystemName [#type "UK" ! "U.K."] 
                measurementSystemName [#type "US" ! "U.S."]
            ]
        ] 
        dates [
            calendars [
                calendar [
                    #type "chinese" 
                    dateFormats [
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "r-MM-dd"] 
                                pattern [#alt "variant" ! "d/M/r"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "GyMMMEd" ! "E, MMM d, r(U)"] 
                            dateFormatItem [#id "GyMMMMd" ! "d MMMM r(U)"] 
                            dateFormatItem [#id "GyMMMMEd" ! "E, d MMMM r(U)"] 
                            dateFormatItem [#id "M" ! "LL"] 
                            dateFormatItem [#id "Md" ! "MM-dd"] 
                            dateFormatItem [#id "Md" #alt "variant" ! "d/M"] 
                            dateFormatItem [#id "MEd" ! "E, MM-dd"] 
                            dateFormatItem [#id "MEd" #alt "variant" ! "E, d/M"] 
                            dateFormatItem [#id "UMd" ! "U-MM-dd"] 
                            dateFormatItem [#id "UMd" #alt "variant" ! "d/M/U"] 
                            dateFormatItem [#id "yMd" #alt "variant" ! "d/M/r"] 
                            dateFormatItem [#id "yyyyM" ! "r-MM"] 
                            dateFormatItem [#id "yyyyMd" ! "r-MM-dd"] 
                            dateFormatItem [#id "yyyyMd" #alt "variant" ! "d/M/r"] 
                            dateFormatItem [#id "yyyyMEd" ! "E, r-MM-dd"] 
                            dateFormatItem [#id "yyyyMEd" #alt "variant" ! "E, d/M/r"] 
                            dateFormatItem [#id "yyyyMMMEd" ! "E, MMM d, r(U)"] 
                            dateFormatItem [#id "yyyyMMMMd" ! "d MMMM r(U)"] 
                            dateFormatItem [#id "yyyyMMMMEd" ! "E, d MMMM r(U)"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" ! "MM-dd – MM-dd"] 
                                greatestDifference [#id "d" #alt "variant" ! "d/M – d/M"] 
                                greatestDifference [#id "M" ! "MM-dd – MM-dd"] 
                                greatestDifference [#id "M" #alt "variant" ! "d/M – d/M"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" ! "E, MM-dd – E, MM-dd"] 
                                greatestDifference [#id "d" #alt "variant" ! "E, d/M – E, d/M"] 
                                greatestDifference [#id "M" ! "E, MM-dd – E, MM-dd"] 
                                greatestDifference [#id "M" #alt "variant" ! "E, d/M – E, d/M"]
                            ] 
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" ! "y-MM – y-MM"] 
                                greatestDifference [#id "y" ! "y-MM – y-MM"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" ! "y-MM-dd – y-MM-dd"] 
                                greatestDifference [#id "d" #alt "variant" ! "d/M/y – d/M/y"] 
                                greatestDifference [#id "M" ! "y-MM-dd – y-MM-dd"] 
                                greatestDifference [#id "M" #alt "variant" ! "d/M/y – d/M/y"] 
                                greatestDifference [#id "y" ! "y-MM-dd – y-MM-dd"] 
                                greatestDifference [#id "y" #alt "variant" ! "d/M/y – d/M/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" ! "E, y-MM-dd – E, y-MM-dd"] 
                                greatestDifference [#id "d" #alt "variant" ! "E, d/M/y – E, d/M/y"] 
                                greatestDifference [#id "M" ! "E, y-MM-dd – E, y-MM-dd"] 
                                greatestDifference [#id "M" #alt "variant" ! "E, d/M/y – E, d/M/y"] 
                                greatestDifference [#id "y" ! "E, y-MM-dd – E, y-MM-dd"] 
                                greatestDifference [#id "y" #alt "variant" ! "E, d/M/y – E, d/M/y"]
                            ]
                        ]
                    ]
                ] 
                calendar [
                    #type "generic" 
                    dateFormats [
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [#alt "variant" ! "d/M/y GGGGG"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "EBhm" ! "E, h:mm B"] 
                            dateFormatItem [#id "EBhms" ! "E, h:mm:ss B"] 
                            dateFormatItem [#id "Ed" ! "E d"] 
                            dateFormatItem [#id "Ehm" ! "E, h:mm a"] 
                            dateFormatItem [#id "EHm" ! "E, HH:mm"] 
                            dateFormatItem [#id "Ehms" ! "E, h:mm:ss a"] 
                            dateFormatItem [#id "EHms" ! "E, HH:mm:ss"] 
                            dateFormatItem [#id "Md" #alt "variant" ! "d/M"] 
                            dateFormatItem [#id "MEd" #alt "variant" ! "E, d/M"] 
                            dateFormatItem [#id "yyyyMd" #alt "variant" ! "d/M/y GGGGG"] 
                            dateFormatItem [#id "yyyyMEd" #alt "variant" ! "E, d/M/y GGGGG"]
                        ] 
                        intervalFormats [
                            intervalFormatFallback [! "{0}–{1}"] 
                            intervalFormatItem [
                                #id "Bh" 
                                greatestDifference [#id "B" ! "h B–h B"] 
                                greatestDifference [#id "h" ! "h–h B"]
                            ] 
                            intervalFormatItem [
                                #id "Bhm" 
                                greatestDifference [#id "B" ! "h:mm B–h:mm B"] 
                                greatestDifference [#id "h" ! "h:mm–h:mm B"] 
                                greatestDifference [#id "m" ! "h:mm–h:mm B"]
                            ] 
                            intervalFormatItem [
                                #id "d" 
                                greatestDifference [#id "d" ! "d–d"]
                            ] 
                            intervalFormatItem [
                                #id "Gy" 
                                greatestDifference [#id "G" ! "y G–y G"] 
                                greatestDifference [#id "y" ! "y–y G"]
                            ] 
                            intervalFormatItem [
                                #id "GyM" 
                                greatestDifference [#id "G" ! "M/y GGGGG–M/y GGGGG"] 
                                greatestDifference [#id "M" ! "M/y–M/y GGGGG"] 
                                greatestDifference [#id "y" ! "M/y–M/y GGGGG"]
                            ] 
                            intervalFormatItem [
                                #id "GyMd" 
                                greatestDifference [#id "d" ! "M/d/y–M/d/y GGGGG"] 
                                greatestDifference [#id "G" ! "M/d/y GGGGG–M/d/y GGGGG"] 
                                greatestDifference [#id "M" ! "M/d/y–M/d/y GGGGG"] 
                                greatestDifference [#id "y" ! "M/d/y–M/d/y GGGGG"]
                            ] 
                            intervalFormatItem [
                                #id "GyMEd" 
                                greatestDifference [#id "d" ! "E, M/d/y–E, M/d/y GGGGG"] 
                                greatestDifference [#id "G" ! "E, M/d/y GGGGG–E, M/d/y GGGGG"] 
                                greatestDifference [#id "M" ! "E, M/d/y–E, M/d/y GGGGG"] 
                                greatestDifference [#id "y" ! "E, M/d/y–E, M/d/y GGGGG"]
                            ] 
                            intervalFormatItem [
                                #id "GyMMM" 
                                greatestDifference [#id "G" ! "MMM y G–MMM y G"] 
                                greatestDifference [#id "M" ! "MMM–MMM y G"] 
                                greatestDifference [#id "y" ! "MMM y–MMM y G"]
                            ] 
                            intervalFormatItem [
                                #id "GyMMMd" 
                                greatestDifference [#id "d" ! "MMM d–d, y G"] 
                                greatestDifference [#id "G" ! "MMM d, y G–MMM d, y G"] 
                                greatestDifference [#id "M" ! "MMM d–MMM d, y G"] 
                                greatestDifference [#id "y" ! "MMM d, y–MMM d, y G"]
                            ] 
                            intervalFormatItem [
                                #id "GyMMMEd" 
                                greatestDifference [#id "d" ! "E, MMM d–E, MMM d, y G"] 
                                greatestDifference [#id "G" ! "E, MMM d, y G–E, MMM d, y G"] 
                                greatestDifference [#id "M" ! "E, MMM d–E, MMM d, y G"] 
                                greatestDifference [#id "y" ! "E, MMM d, y–E, MMM d, y G"]
                            ] 
                            intervalFormatItem [
                                #id "M" 
                                greatestDifference [#id "M" ! "M–M"]
                            ] 
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" ! "M/d–M/d"] 
                                greatestDifference [#id "d" #alt "variant" ! "d/M – d/M"] 
                                greatestDifference [#id "M" ! "M/d–M/d"] 
                                greatestDifference [#id "M" #alt "variant" ! "d/M – d/M"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" ! "E, M/d–E, M/d"] 
                                greatestDifference [#id "d" #alt "variant" ! "E, d/M – E, d/M"] 
                                greatestDifference [#id "M" ! "E, M/d–E, M/d"] 
                                greatestDifference [#id "M" #alt "variant" ! "E, d/M – E, d/M"]
                            ] 
                            intervalFormatItem [
                                #id "MMM" 
                                greatestDifference [#id "M" ! "MMM–MMM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMd" 
                                greatestDifference [#id "d" ! "MMM d–d"] 
                                greatestDifference [#id "M" ! "MMM d–MMM d"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" ! "E, MMM d–E, MMM d"] 
                                greatestDifference [#id "M" ! "E, MMM d–E, MMM d"]
                            ] 
                            intervalFormatItem [
                                #id "y" 
                                greatestDifference [#id "y" ! "y–y G"]
                            ] 
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" ! "M/y–M/y GGGGG"] 
                                greatestDifference [#id "y" ! "M/y–M/y GGGGG"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" ! "M/d/y–M/d/y GGGGG"] 
                                greatestDifference [#id "d" #alt "variant" ! "d/M/y – d/M/y GGGGG"] 
                                greatestDifference [#id "M" ! "M/d/y–M/d/y GGGGG"] 
                                greatestDifference [#id "M" #alt "variant" ! "d/M/y – d/M/y GGGGG"] 
                                greatestDifference [#id "y" ! "M/d/y–M/d/y GGGGG"] 
                                greatestDifference [#id "y" #alt "variant" ! "d/M/y – d/M/y GGGGG"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" ! "E, M/d/y–E, M/d/y GGGGG"] 
                                greatestDifference [#id "d" #alt "variant" ! "E, d/M/y – E, d/M/y GGGGG"] 
                                greatestDifference [#id "M" ! "E, M/d/y–E, M/d/y GGGGG"] 
                                greatestDifference [#id "M" #alt "variant" ! "E, d/M/y – E, d/M/y GGGGG"] 
                                greatestDifference [#id "y" ! "E, M/d/y–E, M/d/y GGGGG"] 
                                greatestDifference [#id "y" #alt "variant" ! "E, d/M/y – E, d/M/y GGGGG"]
                            ] 
                            intervalFormatItem [
                                #id "yMMM" 
                                greatestDifference [#id "M" ! "MMM–MMM y G"] 
                                greatestDifference [#id "y" ! "MMM y–MMM y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMd" 
                                greatestDifference [#id "d" ! "MMM d–d, y G"] 
                                greatestDifference [#id "M" ! "MMM d–MMM d, y G"] 
                                greatestDifference [#id "y" ! "MMM d, y–MMM d, y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" ! "E, MMM d–E, MMM d, y G"] 
                                greatestDifference [#id "M" ! "E, MMM d–E, MMM d, y G"] 
                                greatestDifference [#id "y" ! "E, MMM d, y–E, MMM d, y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMM" 
                                greatestDifference [#id "M" ! "MMMM–MMMM y G"] 
                                greatestDifference [#id "y" ! "MMMM y–MMMM y G"]
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
                                month [#type "9" ! "Sept"]
                            ]
                        ] 
                        monthContext [
                            #type "stand-alone" 
                            monthWidth [
                                #type "abbreviated" 
                                month [#type "9" ! "Sept"]
                            ]
                        ]
                    ] 
                    dayPeriods [
                        dayPeriodContext [
                            #type "format" 
                            dayPeriodWidth [
                                #type "abbreviated" 
                                dayPeriod [#type "am" ! "a.m."] 
                                dayPeriod [#type "pm" ! "p.m."]
                            ] 
                            dayPeriodWidth [
                                #type "narrow" 
                                dayPeriod [#type "midnight" ! "mid"] 
                                dayPeriod [#type "am" ! "am"] 
                                dayPeriod [#type "pm" ! "pm"] 
                                dayPeriod [#type "morning1" ! "mor"] 
                                dayPeriod [#type "afternoon1" ! "aft"] 
                                dayPeriod [#type "evening1" ! "eve"] 
                                dayPeriod [#type "night1" ! "night"]
                            ] 
                            dayPeriodWidth [
                                #type "wide" 
                                dayPeriod [#type "am" ! "a.m."] 
                                dayPeriod [#type "pm" ! "p.m."]
                            ]
                        ] 
                        dayPeriodContext [
                            #type "stand-alone" 
                            dayPeriodWidth [
                                #type "abbreviated" 
                                dayPeriod [#type "am" ! "a.m."] 
                                dayPeriod [#type "pm" ! "p.m."]
                            ] 
                            dayPeriodWidth [
                                #type "narrow" 
                                dayPeriod [#type "midnight" ! "mid"] 
                                dayPeriod [#type "am" ! "a.m."] 
                                dayPeriod [#type "pm" ! "pm"] 
                                dayPeriod [#type "morning1" ! "mor"] 
                                dayPeriod [#type "afternoon1" ! "aft"] 
                                dayPeriod [#type "evening1" ! "eve"]
                            ] 
                            dayPeriodWidth [
                                #type "wide" 
                                dayPeriod [#type "am" ! "a.m."] 
                                dayPeriod [#type "pm" ! "p.m."]
                            ]
                        ]
                    ] 
                    dateFormats [
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "y-MM-dd"] 
                                pattern [#alt "variant" ! "d/M/yy"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "EBhm" ! "E, h:mm B"] 
                            dateFormatItem [#id "EBhms" ! "E, h:mm:ss B"] 
                            dateFormatItem [#id "Ed" ! "E d"] 
                            dateFormatItem [#id "Md" ! "MM-dd"] 
                            dateFormatItem [#id "Md" #alt "variant" ! "d/M"] 
                            dateFormatItem [#id "MEd" ! "E, MM-dd"] 
                            dateFormatItem [#id "MEd" #alt "variant" ! "E, d/M"] 
                            dateFormatItem [#id "MMdd" ! "MM-dd"] 
                            dateFormatItem [#id "MMdd" #alt "variant" ! "dd/MM"] 
                            dateFormatItem [#id "yM" ! "MM/y"] 
                            dateFormatItem [#id "yMd" ! "y-MM-dd"] 
                            dateFormatItem [#id "yMd" #alt "variant" ! "d/M/y"] 
                            dateFormatItem [#id "yMEd" ! "E, y-MM-dd"] 
                            dateFormatItem [#id "yMEd" #alt "variant" ! "E, d/M/y"]
                        ] 
                        intervalFormats [
                            intervalFormatFallback [! "{0}–{1}"] 
                            intervalFormatItem [
                                #id "Bh" 
                                greatestDifference [#id "B" ! "h B–h B"] 
                                greatestDifference [#id "h" ! "h–h B"]
                            ] 
                            intervalFormatItem [
                                #id "Bhm" 
                                greatestDifference [#id "B" ! "h:mm B–h:mm B"] 
                                greatestDifference [#id "h" ! "h:mm–h:mm B"] 
                                greatestDifference [#id "m" ! "h:mm–h:mm B"]
                            ] 
                            intervalFormatItem [
                                #id "d" 
                                greatestDifference [#id "d" ! "d–d"]
                            ] 
                            intervalFormatItem [
                                #id "Gy" 
                                greatestDifference [#id "G" ! "y G–y G"] 
                                greatestDifference [#id "y" ! "y–y G"]
                            ] 
                            intervalFormatItem [
                                #id "GyM" 
                                greatestDifference [#id "G" ! "M/y GGGGG–M/y GGGGG"] 
                                greatestDifference [#id "M" ! "M/y–M/y GGGGG"] 
                                greatestDifference [#id "y" ! "M/y–M/y GGGGG"]
                            ] 
                            intervalFormatItem [
                                #id "GyMd" 
                                greatestDifference [#id "d" ! "M/d/y–M/d/y GGGGG"] 
                                greatestDifference [#id "G" ! "M/d/y GGGGG–M/d/y GGGGG"] 
                                greatestDifference [#id "M" ! "M/d/y–M/d/y GGGGG"] 
                                greatestDifference [#id "y" ! "M/d/y–M/d/y GGGGG"]
                            ] 
                            intervalFormatItem [
                                #id "GyMEd" 
                                greatestDifference [#id "d" ! "E, M/d/y–E, M/d/y GGGGG"] 
                                greatestDifference [#id "G" ! "E, M/d/y GGGGG–E, M/d/y GGGGG"] 
                                greatestDifference [#id "M" ! "E, M/d/y–E, M/d/y GGGGG"] 
                                greatestDifference [#id "y" ! "E, M/d/y–E, M/d/y GGGGG"]
                            ] 
                            intervalFormatItem [
                                #id "GyMMM" 
                                greatestDifference [#id "G" ! "MMM y G–MMM y G"] 
                                greatestDifference [#id "M" ! "MMM–MMM y G"] 
                                greatestDifference [#id "y" ! "MMM y–MMM y G"]
                            ] 
                            intervalFormatItem [
                                #id "GyMMMd" 
                                greatestDifference [#id "d" ! "MMM d–d, y G"] 
                                greatestDifference [#id "G" ! "MMM d, y G–MMM d, y G"] 
                                greatestDifference [#id "M" ! "MMM d–MMM d, y G"] 
                                greatestDifference [#id "y" ! "MMM d, y–MMM d, y G"]
                            ] 
                            intervalFormatItem [
                                #id "GyMMMEd" 
                                greatestDifference [#id "d" ! "E, MMM d–E, MMM d, y G"] 
                                greatestDifference [#id "G" ! "E, MMM d, y G–E, MMM d, y G"] 
                                greatestDifference [#id "M" ! "E, MMM d–E, MMM d, y G"] 
                                greatestDifference [#id "y" ! "E, MMM d, y–E, MMM d, y G"]
                            ] 
                            intervalFormatItem [
                                #id "h" 
                                greatestDifference [#id "a" ! "h a–h a"] 
                                greatestDifference [#id "h" ! "h–h a"]
                            ] 
                            intervalFormatItem [
                                #id "H" 
                                greatestDifference [#id "H" ! "HH–HH"]
                            ] 
                            intervalFormatItem [
                                #id "hm" 
                                greatestDifference [#id "a" ! "h:mm a–h:mm a"] 
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
                                greatestDifference [#id "a" ! "h:mm a–h:mm a v"] 
                                greatestDifference [#id "h" ! "h:mm–h:mm a v"] 
                                greatestDifference [#id "m" ! "h:mm–h:mm a v"]
                            ] 
                            intervalFormatItem [
                                #id "Hmv" 
                                greatestDifference [#id "H" ! "HH:mm–HH:mm v"] 
                                greatestDifference [#id "m" ! "HH:mm–HH:mm v"]
                            ] 
                            intervalFormatItem [
                                #id "hv" 
                                greatestDifference [#id "a" ! "h a–h a v"] 
                                greatestDifference [#id "h" ! "h–h a v"]
                            ] 
                            intervalFormatItem [
                                #id "Hv" 
                                greatestDifference [#id "H" ! "HH–HH v"]
                            ] 
                            intervalFormatItem [
                                #id "M" 
                                greatestDifference [#id "M" ! "M–M"]
                            ] 
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" ! "M/d–M/d"] 
                                greatestDifference [#id "d" #alt "variant" ! "d/M – d/M"] 
                                greatestDifference [#id "M" ! "M/d–M/d"] 
                                greatestDifference [#id "M" #alt "variant" ! "d/M – d/M"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" ! "E, M/d–E, M/d"] 
                                greatestDifference [#id "d" #alt "variant" ! "E, d/M – E, d/M"] 
                                greatestDifference [#id "M" ! "E, M/d–E, M/d"] 
                                greatestDifference [#id "M" #alt "variant" ! "E, d/M – E, d/M"]
                            ] 
                            intervalFormatItem [
                                #id "MMM" 
                                greatestDifference [#id "M" ! "MMM–MMM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMd" 
                                greatestDifference [#id "d" ! "MMM d–d"] 
                                greatestDifference [#id "M" ! "MMM d–MMM d"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" ! "E, MMM d–E, MMM d"] 
                                greatestDifference [#id "M" ! "E, MMM d–E, MMM d"]
                            ] 
                            intervalFormatItem [
                                #id "y" 
                                greatestDifference [#id "y" ! "y–y"]
                            ] 
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" ! "M/y–M/y"] 
                                greatestDifference [#id "y" ! "M/y–M/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" ! "M/d/y–M/d/y"] 
                                greatestDifference [#id "d" #alt "variant" ! "d/M/y – d/M/y"] 
                                greatestDifference [#id "M" ! "M/d/y–M/d/y"] 
                                greatestDifference [#id "M" #alt "variant" ! "d/M/y – d/M/y"] 
                                greatestDifference [#id "y" ! "M/d/y–M/d/y"] 
                                greatestDifference [#id "y" #alt "variant" ! "d/M/y – d/M/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" ! "E, M/d/y–E, M/d/y"] 
                                greatestDifference [#id "d" #alt "variant" ! "E, d/M/y – E, d/M/y"] 
                                greatestDifference [#id "M" ! "E, M/d/y–E, M/d/y"] 
                                greatestDifference [#id "M" #alt "variant" ! "E, d/M/y – E, d/M/y"] 
                                greatestDifference [#id "y" ! "E, M/d/y–E, M/d/y"] 
                                greatestDifference [#id "y" #alt "variant" ! "E, d/M/y – E, d/M/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMM" 
                                greatestDifference [#id "M" ! "MMM–MMM y"] 
                                greatestDifference [#id "y" ! "MMM y–MMM y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMd" 
                                greatestDifference [#id "d" ! "MMM d–d, y"] 
                                greatestDifference [#id "M" ! "MMM d–MMM d, y"] 
                                greatestDifference [#id "y" ! "MMM d, y–MMM d, y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" ! "E, MMM d–E, MMM d, y"] 
                                greatestDifference [#id "M" ! "E, MMM d–E, MMM d, y"] 
                                greatestDifference [#id "y" ! "E, MMM d, y–E, MMM d, y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMM" 
                                greatestDifference [#id "M" ! "MMMM–MMMM y"] 
                                greatestDifference [#id "y" ! "MMMM y–MMMM y"]
                            ]
                        ]
                    ]
                ] 
                calendar [
                    #type "islamic" 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "Ed" ! "E d"]
                        ]
                    ]
                ]
            ] 
            fields [
                field [
                    #type "year-short" 
                    displayName [! "yr"] 
                    relative [#type "-1" ! "last yr"] 
                    relative [#type "0" ! "this yr"] 
                    relative [#type "1" ! "next yr"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} yr"] 
                        relativeTimePattern [#count "other" ! "in {0} yrs"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} yr ago"] 
                        relativeTimePattern [#count "other" ! "{0} yrs ago"]
                    ]
                ] 
                field [
                    #type "year-narrow" 
                    relative [#type "-1" ! "last yr"] 
                    relative [#type "0" ! "this yr"] 
                    relative [#type "1" ! "next yr"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} yr"] 
                        relativeTimePattern [#count "other" ! "in {0} yrs"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} yr ago"] 
                        relativeTimePattern [#count "other" ! "{0} yrs ago"]
                    ]
                ] 
                field [
                    #type "quarter-short" 
                    displayName [! "qtr"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} qtr"] 
                        relativeTimePattern [#count "other" ! "in {0} qtrs"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} qtr ago"] 
                        relativeTimePattern [#count "other" ! "{0} qtrs ago"]
                    ]
                ] 
                field [
                    #type "quarter-narrow" 
                    displayName [! "qtr"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} qtr"] 
                        relativeTimePattern [#count "other" ! "in {0} qtrs"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} qtr ago"] 
                        relativeTimePattern [#count "other" ! "{0} qtrs ago"]
                    ]
                ] 
                field [
                    #type "month-short" 
                    displayName [! "mo"] 
                    relative [#type "-1" ! "last mo"] 
                    relative [#type "0" ! "this mo"] 
                    relative [#type "1" ! "next mo"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} mo"] 
                        relativeTimePattern [#count "other" ! "in {0} mos"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} mo ago"] 
                        relativeTimePattern [#count "other" ! "{0} mos ago"]
                    ]
                ] 
                field [
                    #type "month-narrow" 
                    displayName [! "mo"] 
                    relative [#type "-1" ! "last mo"] 
                    relative [#type "0" ! "this mo"] 
                    relative [#type "1" ! "next mo"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} mo"] 
                        relativeTimePattern [#count "other" ! "in {0} mos"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} mo ago"] 
                        relativeTimePattern [#count "other" ! "{0} mos ago"]
                    ]
                ] 
                field [
                    #type "week-short" 
                    displayName [! "wk"] 
                    relative [#type "-1" ! "last wk"] 
                    relative [#type "0" ! "this wk"] 
                    relative [#type "1" ! "next wk"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} wk"] 
                        relativeTimePattern [#count "other" ! "in {0} wks"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} wk ago"] 
                        relativeTimePattern [#count "other" ! "{0} wks ago"]
                    ]
                ] 
                field [
                    #type "week-narrow" 
                    displayName [! "wk"] 
                    relative [#type "-1" ! "last wk"] 
                    relative [#type "0" ! "this wk"] 
                    relative [#type "1" ! "next wk"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} wk"] 
                        relativeTimePattern [#count "other" ! "in {0} wks"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} wk ago"] 
                        relativeTimePattern [#count "other" ! "{0} wks ago"]
                    ]
                ] 
                field [
                    #type "weekOfMonth-short" 
                    displayName [! "wk of mo"]
                ] 
                field [
                    #type "weekOfMonth-narrow" 
                    displayName [! "wk of mo"]
                ] 
                field [
                    #type "dayOfYear-short" 
                    displayName [! "day of yr"]
                ] 
                field [
                    #type "dayOfYear-narrow" 
                    displayName [! "day of yr"]
                ] 
                field [
                    #type "weekday-short" 
                    displayName [! "day of wk"]
                ] 
                field [
                    #type "weekday-narrow" 
                    displayName [! "day of wk"]
                ] 
                field [
                    #type "weekdayOfMonth-short" 
                    displayName [! "wkday of mo"]
                ] 
                field [
                    #type "weekdayOfMonth-narrow" 
                    displayName [! "wkday of mo"]
                ] 
                field [
                    #type "sun-short" 
                    relative [#type "-1" ! "last Sun"] 
                    relative [#type "0" ! "this Sun"] 
                    relative [#type "1" ! "next Sun"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} Sun"] 
                        relativeTimePattern [#count "other" ! "in {0} Sun’s"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} Sun ago"] 
                        relativeTimePattern [#count "other" ! "{0} Sun’s ago"]
                    ]
                ] 
                field [
                    #type "sun-narrow" 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "other" ! "in {0} Su’s"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "other" ! "{0} Su’s ago"]
                    ]
                ] 
                field [
                    #type "mon-short" 
                    relative [#type "-1" ! "last Mon"] 
                    relative [#type "0" ! "this Mon"] 
                    relative [#type "1" ! "next Mon"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} Mon"] 
                        relativeTimePattern [#count "other" ! "in {0} Mon’s"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} Mon ago"] 
                        relativeTimePattern [#count "other" ! "{0} Mon’s ago"]
                    ]
                ] 
                field [
                    #type "mon-narrow" 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "other" ! "in {0} M’s"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "other" ! "{0} M’s ago"]
                    ]
                ] 
                field [
                    #type "tue-short" 
                    relative [#type "-1" ! "last Tue"] 
                    relative [#type "0" ! "this Tue"] 
                    relative [#type "1" ! "next Tue"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} Tue"] 
                        relativeTimePattern [#count "other" ! "in {0} Tue’s"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} Tue ago"] 
                        relativeTimePattern [#count "other" ! "{0} Tue’s ago"]
                    ]
                ] 
                field [
                    #type "tue-narrow" 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "other" ! "in {0} Tu’s"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "other" ! "{0} Tu’s ago"]
                    ]
                ] 
                field [
                    #type "wed-short" 
                    relative [#type "-1" ! "last Wed"] 
                    relative [#type "0" ! "this Wed"] 
                    relative [#type "1" ! "next Wed"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} Wed"] 
                        relativeTimePattern [#count "other" ! "in {0} Wed’s"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} Wed ago"] 
                        relativeTimePattern [#count "other" ! "{0} Wed’s ago"]
                    ]
                ] 
                field [
                    #type "wed-narrow" 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "other" ! "in {0} W’s"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "other" ! "{0} W’s ago"]
                    ]
                ] 
                field [
                    #type "thu-short" 
                    relative [#type "-1" ! "last Thu"] 
                    relative [#type "0" ! "this Thu"] 
                    relative [#type "1" ! "next Thu"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} Thu"] 
                        relativeTimePattern [#count "other" ! "in {0} Thu’s"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} Thu ago"] 
                        relativeTimePattern [#count "other" ! "{0} Thu’s ago"]
                    ]
                ] 
                field [
                    #type "thu-narrow" 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "other" ! "in {0} Th’s"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "other" ! "{0} Th’s ago"]
                    ]
                ] 
                field [
                    #type "fri-short" 
                    relative [#type "-1" ! "last Fri"] 
                    relative [#type "0" ! "this Fri"] 
                    relative [#type "1" ! "next Fri"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} Fri"] 
                        relativeTimePattern [#count "other" ! "in {0} Fri’s"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} Fri ago"] 
                        relativeTimePattern [#count "other" ! "{0} Fri’s ago"]
                    ]
                ] 
                field [
                    #type "fri-narrow" 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "other" ! "in {0} F’s"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "other" ! "{0} F’s ago"]
                    ]
                ] 
                field [
                    #type "sat-short" 
                    relative [#type "-1" ! "last Sat"] 
                    relative [#type "0" ! "this Sat"] 
                    relative [#type "1" ! "next Sat"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} Sat"] 
                        relativeTimePattern [#count "other" ! "in {0} Sat’s"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} Sat ago"] 
                        relativeTimePattern [#count "other" ! "{0} Sat’s ago"]
                    ]
                ] 
                field [
                    #type "sat-narrow" 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "other" ! "in {0} Sa’s"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "other" ! "{0} Sa’s ago"]
                    ]
                ] 
                field [
                    #type "dayperiod-short" 
                    displayName [! "a.m./p.m."]
                ] 
                field [
                    #type "dayperiod" 
                    displayName [! "a.m./p.m."]
                ] 
                field [
                    #type "dayperiod-narrow" 
                    displayName [! "a.m./p.m."]
                ] 
                field [
                    #type "hour-short" 
                    displayName [! "hr"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} hr"] 
                        relativeTimePattern [#count "other" ! "in {0} hrs"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} hr ago"] 
                        relativeTimePattern [#count "other" ! "{0} hrs ago"]
                    ]
                ] 
                field [
                    #type "hour-narrow" 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} hr"] 
                        relativeTimePattern [#count "other" ! "in {0} hrs"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} hr ago"] 
                        relativeTimePattern [#count "other" ! "{0} hrs ago"]
                    ]
                ] 
                field [
                    #type "minute-short" 
                    displayName [! "min"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} min"] 
                        relativeTimePattern [#count "other" ! "in {0} mins"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} min ago"] 
                        relativeTimePattern [#count "other" ! "{0} mins ago"]
                    ]
                ] 
                field [
                    #type "minute-narrow" 
                    displayName [! "min"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} min"] 
                        relativeTimePattern [#count "other" ! "in {0} mins"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} min ago"] 
                        relativeTimePattern [#count "other" ! "{0} mins ago"]
                    ]
                ] 
                field [
                    #type "second-short" 
                    displayName [! "sec"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} sec"] 
                        relativeTimePattern [#count "other" ! "in {0} secs"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} sec ago"] 
                        relativeTimePattern [#count "other" ! "{0} secs ago"]
                    ]
                ] 
                field [
                    #type "second-narrow" 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} sec"] 
                        relativeTimePattern [#count "other" ! "in {0} secs"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} sec ago"] 
                        relativeTimePattern [#count "other" ! "{0} secs ago"]
                    ]
                ]
            ] 
            timeZoneNames [
                regionFormat [#type "daylight" ! "{0} Daylight Saving Time"] 
                zone [
                    #type "America/St_Barthelemy" 
                    exemplarCity [! "Saint-Barthélemy"]
                ] 
                zone [
                    #type "America/St_Johns" 
                    exemplarCity [! "Saint John’s"]
                ] 
                zone [
                    #type "America/St_Kitts" 
                    exemplarCity [! "Saint Kitts"]
                ] 
                zone [
                    #type "Asia/Aqtau" 
                    exemplarCity [! "Aktau"]
                ] 
                zone [
                    #type "America/St_Lucia" 
                    exemplarCity [! "Saint Lucia"]
                ] 
                zone [
                    #type "Asia/Rangoon" 
                    exemplarCity [! "Rangoon"]
                ] 
                zone [
                    #type "Atlantic/St_Helena" 
                    exemplarCity [! "Saint Helena"]
                ] 
                zone [
                    #type "America/St_Vincent" 
                    exemplarCity [! "Saint Vincent"]
                ] 
                zone [
                    #type "America/St_Thomas" 
                    exemplarCity [! "Saint Thomas"]
                ] 
                metazone [
                    #type "Afghanistan" 
                    short [
                        standard [! "AFT"]
                    ]
                ] 
                metazone [
                    #type "Alaska" 
                    long [
                        daylight [! "Alaska Daylight Saving Time"]
                    ]
                ] 
                metazone [
                    #type "America_Central" 
                    long [
                        daylight [! "Central Daylight Saving Time"]
                    ]
                ] 
                metazone [
                    #type "America_Eastern" 
                    long [
                        daylight [! "Eastern Daylight Saving Time"]
                    ]
                ] 
                metazone [
                    #type "America_Mountain" 
                    long [
                        daylight [! "Mountain Daylight Saving Time"]
                    ]
                ] 
                metazone [
                    #type "America_Pacific" 
                    long [
                        daylight [! "Pacific Daylight Saving Time"]
                    ]
                ] 
                metazone [
                    #type "Apia" 
                    long [
                        daylight [! "Apia Daylight Saving Time"]
                    ]
                ] 
                metazone [
                    #type "Arabian" 
                    long [
                        daylight [! "Arabian Daylight Saving Time"]
                    ]
                ] 
                metazone [
                    #type "Argentina" 
                    short [
                        generic [! "ART"]
                    ]
                ] 
                metazone [
                    #type "Atlantic" 
                    long [
                        daylight [! "Atlantic Daylight Saving Time"]
                    ]
                ] 
                metazone [
                    #type "Australia_Central" 
                    long [
                        daylight [! "Australian Central Daylight Saving Time"]
                    ]
                ] 
                metazone [
                    #type "Australia_CentralWestern" 
                    long [
                        daylight [! "Australian Central Western Daylight Saving Time"]
                    ] 
                    short [
                        generic [! "ACWT"] 
                        standard [! "ACWST"] 
                        daylight [! "ACWDT"]
                    ]
                ] 
                metazone [
                    #type "Australia_Eastern" 
                    long [
                        daylight [! "Australian Eastern Daylight Saving Time"]
                    ] 
                    short [
                        generic [! "AET"] 
                        standard [! "AEST"] 
                        daylight [! "AEDT"]
                    ]
                ] 
                metazone [
                    #type "Australia_Western" 
                    long [
                        daylight [! "Australian Western Daylight Saving Time"]
                    ] 
                    short [
                        standard [! "AWST"] 
                        daylight [! "AWDT"]
                    ]
                ] 
                metazone [
                    #type "Bangladesh" 
                    short [
                        standard [! "BST"]
                    ]
                ] 
                metazone [
                    #type "Bhutan" 
                    short [
                        standard [! "BTT"]
                    ]
                ] 
                metazone [
                    #type "Brasilia" 
                    short [
                        generic [! "BRT"] 
                        daylight [! "BRST"]
                    ]
                ] 
                metazone [
                    #type "Brunei" 
                    short [
                        standard [! "BNT"]
                    ]
                ] 
                metazone [
                    #type "Chatham" 
                    long [
                        daylight [! "Chatham Daylight Saving Time"]
                    ] 
                    short [
                        standard [! "CHAST"] 
                        daylight [! "CHADT"]
                    ]
                ] 
                metazone [
                    #type "China" 
                    long [
                        daylight [! "China Daylight Saving Time"]
                    ]
                ] 
                metazone [
                    #type "Christmas" 
                    short [
                        standard [! "CXT"]
                    ]
                ] 
                metazone [
                    #type "Cocos" 
                    short [
                        standard [! "CCT"]
                    ]
                ] 
                metazone [
                    #type "Colombia" 
                    short [
                        daylight [! "COST"]
                    ]
                ] 
                metazone [
                    #type "Cuba" 
                    long [
                        daylight [! "Cuba Daylight Saving Time"]
                    ]
                ] 
                metazone [
                    #type "East_Timor" 
                    short [
                        standard [! "TLT"]
                    ]
                ] 
                metazone [
                    #type "Easter" 
                    short [
                        standard [! "EAST"] 
                        daylight [! "EASST"]
                    ]
                ] 
                metazone [
                    #type "Ecuador" 
                    short [
                        standard [! "ECT"]
                    ]
                ] 
                metazone [
                    #type "Falkland" 
                    short [
                        generic [! "FKT"] 
                        daylight [! "FKST"]
                    ]
                ] 
                metazone [
                    #type "French_Southern" 
                    long [
                        standard [! "French Southern and Antarctic Time"]
                    ]
                ] 
                metazone [
                    #type "Galapagos" 
                    short [
                        standard [! "GALT"]
                    ]
                ] 
                metazone [
                    #type "Greenland_Eastern" 
                    short [
                        generic [! "EGT"]
                    ]
                ] 
                metazone [
                    #type "Guyana" 
                    short [
                        standard [! "GYT"]
                    ]
                ] 
                metazone [
                    #type "Hawaii_Aleutian" 
                    long [
                        daylight [! "Hawaii-Aleutian Daylight Saving Time"]
                    ]
                ] 
                metazone [
                    #type "India" 
                    short [
                        standard [! "IST"]
                    ]
                ] 
                metazone [
                    #type "Indochina" 
                    short [
                        standard [! "ICT"]
                    ]
                ] 
                metazone [
                    #type "Indonesia_Central" 
                    short [
                        standard [! "WITA"]
                    ]
                ] 
                metazone [
                    #type "Indonesia_Eastern" 
                    short [
                        standard [! "WIT"]
                    ]
                ] 
                metazone [
                    #type "Indonesia_Western" 
                    short [
                        standard [! "WIB"]
                    ]
                ] 
                metazone [
                    #type "Iran" 
                    long [
                        daylight [! "Iran Daylight Saving Time"]
                    ] 
                    short [
                        standard [! "IRST"] 
                        daylight [! "IRDT"]
                    ]
                ] 
                metazone [
                    #type "Israel" 
                    long [
                        daylight [! "Israel Daylight Saving Time"]
                    ]
                ] 
                metazone [
                    #type "Japan" 
                    long [
                        daylight [! "Japan Daylight Saving Time"]
                    ]
                ] 
                metazone [
                    #type "Korea" 
                    long [
                        daylight [! "Korean Daylight Saving Time"]
                    ]
                ] 
                metazone [
                    #type "Lord_Howe" 
                    long [
                        daylight [! "Lord Howe Daylight Saving Time"]
                    ]
                ] 
                metazone [
                    #type "Malaysia" 
                    short [
                        standard [! "MYT"]
                    ]
                ] 
                metazone [
                    #type "Maldives" 
                    short [
                        standard [! "MVT"]
                    ]
                ] 
                metazone [
                    #type "Mexico_Northwest" 
                    long [
                        daylight [! "Northwest Mexico Daylight Saving Time"]
                    ]
                ] 
                metazone [
                    #type "Mexico_Pacific" 
                    long [
                        daylight [! "Mexican Pacific Daylight Saving Time"]
                    ]
                ] 
                metazone [
                    #type "Nepal" 
                    short [
                        standard [! "NPT"]
                    ]
                ] 
                metazone [
                    #type "New_Zealand" 
                    long [
                        daylight [! "New Zealand Daylight Saving Time"]
                    ]
                ] 
                metazone [
                    #type "Newfoundland" 
                    long [
                        daylight [! "Newfoundland Daylight Saving Time"]
                    ] 
                    short [
                        generic [! "NT"] 
                        standard [! "NST"] 
                        daylight [! "NDT"]
                    ]
                ] 
                metazone [
                    #type "Norfolk" 
                    long [
                        daylight [! "Norfolk Island Daylight Saving Time"]
                    ]
                ] 
                metazone [
                    #type "Noronha" 
                    short [
                        generic [! "FNT"]
                    ]
                ] 
                metazone [
                    #type "Pakistan" 
                    short [
                        standard [! "PKT"]
                    ]
                ] 
                metazone [
                    #type "Paraguay" 
                    short [
                        generic [! "PYT"] 
                        daylight [! "PYST"]
                    ]
                ] 
                metazone [
                    #type "Peru" 
                    short [
                        generic [! "PET"]
                    ]
                ] 
                metazone [
                    #type "Pierre_Miquelon" 
                    long [
                        generic [! "Saint-Pierre-et-Miquelon Time"] 
                        standard [! "Saint-Pierre-et-Miquelon Standard Time"] 
                        daylight [! "Saint-Pierre-et-Miquelon Daylight Saving Time"]
                    ] 
                    short [
                        generic [! "PMT"] 
                        standard [! "PMST"] 
                        daylight [! "PMDT"]
                    ]
                ] 
                metazone [
                    #type "Samoa" 
                    long [
                        daylight [! "Samoa Daylight Saving Time"]
                    ]
                ] 
                metazone [
                    #type "Taipei" 
                    long [
                        daylight [! "Taipei Daylight Saving Time"]
                    ]
                ] 
                metazone [
                    #type "Uruguay" 
                    short [
                        standard [! "UYT"] 
                        daylight [! "UYST"]
                    ]
                ] 
                metazone [
                    #type "Venezuela" 
                    short [
                        standard [! "VET"]
                    ]
                ] 
                metazone [
                    #type "Wallis" 
                    long [
                        standard [! "Wallis and Futuna Time"]
                    ]
                ]
            ]
        ] 
        numbers [
            currencies [
                currency [
                    #type "AED" 
                    displayName [#count "one" ! "U.A.E. dirham"] 
                    displayName [#count "other" ! "U.A.E. dirhams"]
                ] 
                currency [
                    #type "AFN" 
                    displayName [#count "one" ! "Afghan afghani"] 
                    displayName [#count "other" ! "Afghan afghanis"]
                ] 
                currency [
                    #type "BMD" 
                    displayName [! "Bermudian Dollar"] 
                    displayName [#count "one" ! "Bermudian dollar"] 
                    displayName [#count "other" ! "Bermudian dollars"]
                ] 
                currency [
                    #type "BYB" 
                    displayName [! "Belarusian New Rouble (1994–1999)"] 
                    displayName [#count "one" ! "Belarusian new rouble (1994–1999)"] 
                    displayName [#count "other" ! "Belarusian new roubles (1994–1999)"]
                ] 
                currency [
                    #type "BYN" 
                    displayName [! "Belarusian Rouble"] 
                    displayName [#count "one" ! "Belarusian rouble"] 
                    displayName [#count "other" ! "Belarusian roubles"]
                ] 
                currency [
                    #type "BYR" 
                    displayName [! "Belarusian Rouble (2000–2016)"] 
                    displayName [#count "one" ! "Belarusian rouble (2000–2016)"] 
                    displayName [#count "other" ! "Belarusian roubles (2000–2016)"]
                ] 
                currency [
                    #type "CAD" 
                    symbol [! "$"]
                ] 
                currency [
                    #type "ETB" 
                    displayName [#count "other" ! "Ethiopian birr"]
                ] 
                currency [
                    #type "JPY" 
                    symbol [! "JP¥"]
                ] 
                currency [
                    #type "LSL" 
                    displayName [#count "other" ! "Lesotho maloti"]
                ] 
                currency [
                    #type "LVR" 
                    displayName [! "Latvian Rouble"] 
                    displayName [#count "one" ! "Latvian rouble"] 
                    displayName [#count "other" ! "Latvian roubles"]
                ] 
                currency [
                    #type "MGA" 
                    displayName [#count "other" ! "Malagasy ariary"]
                ] 
                currency [
                    #type "MVR" 
                    displayName [#count "other" ! "Maldivian rufiyaa"]
                ] 
                currency [
                    #type "PHP" 
                    displayName [! "Philippine Peso"] 
                    displayName [#count "one" ! "Philippine peso"] 
                    displayName [#count "other" ! "Philippine pesos"]
                ] 
                currency [
                    #type "RUB" 
                    displayName [! "Russian Rouble"] 
                    displayName [#count "one" ! "Russian rouble"] 
                    displayName [#count "other" ! "Russian roubles"]
                ] 
                currency [
                    #type "RUR" 
                    displayName [! "Russian Rouble (1991–1998)"] 
                    displayName [#count "one" ! "Russian rouble (1991–1998)"] 
                    displayName [#count "other" ! "Russian roubles (1991–1998)"]
                ] 
                currency [
                    #type "SHP" 
                    displayName [! "St Helena Pound"] 
                    displayName [#count "one" ! "St Helena pound"] 
                    displayName [#count "other" ! "St Helena pounds"]
                ] 
                currency [
                    #type "STN" 
                    displayName [! "São Tomé and Príncipe Dobra"] 
                    displayName [#count "one" ! "São Tomé and Príncipe dobra"] 
                    displayName [#count "other" ! "São Tomé and Príncipe dobras"]
                ] 
                currency [
                    #type "TJR" 
                    displayName [! "Tajikistani Rouble"] 
                    displayName [#count "one" ! "Tajikistani rouble"] 
                    displayName [#count "other" ! "Tajikistani roubles"]
                ] 
                currency [
                    #type "TTD" 
                    displayName [! "Trinidad and Tobago Dollar"] 
                    displayName [#count "one" ! "Trinidad and Tobago dollar"] 
                    displayName [#count "other" ! "Trinidad and Tobago dollars"]
                ] 
                currency [
                    #type "USD" 
                    displayName [! "U.S. Dollar"] 
                    displayName [#count "one" ! "U.S. dollar"] 
                    displayName [#count "other" ! "U.S. dollars"] 
                    symbol [! "US$"]
                ] 
                currency [
                    #type "VUV" 
                    displayName [#count "other" ! "Vanuatu vatu"]
                ]
            ]
        ] 
        units [
            unitLength [
                #type "long" 
                compoundUnit [
                    #type "10p1" 
                    unitPrefixPattern [! "deca{0}"]
                ] 
                unit [
                    #type "acceleration-meter-per-square-second" 
                    displayName [! "metres per second squared"] 
                    unitPattern [#count "one" ! "{0} metre per second squared"] 
                    unitPattern [#count "other" ! "{0} metres per second squared"]
                ] 
                unit [
                    #type "area-square-kilometer" 
                    displayName [! "square kilometres"] 
                    unitPattern [#count "one" ! "{0} square kilometre"] 
                    unitPattern [#count "other" ! "{0} square kilometres"] 
                    perUnitPattern [! "{0} per square kilometre"]
                ] 
                unit [
                    #type "area-square-meter" 
                    displayName [! "square metres"] 
                    unitPattern [#count "one" ! "{0} square metre"] 
                    unitPattern [#count "other" ! "{0} square metres"] 
                    perUnitPattern [! "{0} per square metre"]
                ] 
                unit [
                    #type "area-square-centimeter" 
                    displayName [! "square centimetres"] 
                    unitPattern [#count "one" ! "{0} square centimetre"] 
                    unitPattern [#count "other" ! "{0} square centimetres"] 
                    perUnitPattern [! "{0} per square centimetre"]
                ] 
                unit [
                    #type "concentr-milligram-ofglucose-per-deciliter" 
                    displayName [! "milligrams per decilitre"] 
                    unitPattern [#count "one" ! "{0} milligram per decilitre"] 
                    unitPattern [#count "other" ! "{0} milligrams per decilitre"]
                ] 
                unit [
                    #type "concentr-millimole-per-liter" 
                    displayName [! "millimoles per litre"] 
                    unitPattern [#count "one" ! "{0} millimole per litre"] 
                    unitPattern [#count "other" ! "{0} millimoles per litre"]
                ] 
                unit [
                    #type "concentr-percent" 
                    displayName [! "per cent"] 
                    unitPattern [#count "one" ! "{0} per cent"] 
                    unitPattern [#count "other" ! "{0} per cent"]
                ] 
                unit [
                    #type "concentr-permille" 
                    displayName [! "per mille"] 
                    unitPattern [#count "one" ! "{0} per mille"] 
                    unitPattern [#count "other" ! "{0} per mille"]
                ] 
                unit [
                    #type "concentr-permyriad" 
                    displayName [! "per myriad"] 
                    unitPattern [#count "one" ! "{0} per myriad"] 
                    unitPattern [#count "other" ! "{0} per myriad"]
                ] 
                unit [
                    #type "consumption-liter-per-kilometer" 
                    displayName [! "litres per kilometre"] 
                    unitPattern [#count "one" ! "{0} litre per kilometre"] 
                    unitPattern [#count "other" ! "{0} litres per kilometre"]
                ] 
                unit [
                    #type "consumption-liter-per-100-kilometer" 
                    displayName [! "litres per 100 kilometres"] 
                    unitPattern [#count "one" ! "{0} litre per 100 kilometres"] 
                    unitPattern [#count "other" ! "{0} litres per 100 kilometres"]
                ] 
                unit [
                    #type "consumption-mile-per-gallon" 
                    displayName [! "miles per US gallon"] 
                    unitPattern [#count "one" ! "{0} mile per US gallon"] 
                    unitPattern [#count "other" ! "{0} miles per US gallon"]
                ] 
                unit [
                    #type "consumption-mile-per-gallon-imperial" 
                    displayName [! "miles per gallon"] 
                    unitPattern [#count "one" ! "{0} mile per gallon"] 
                    unitPattern [#count "other" ! "{0} miles per gallon"]
                ] 
                unit [
                    #type "energy-kilowatt-hour" 
                    unitPattern [#count "one" ! "{0} kilowatt-hour"]
                ] 
                unit [
                    #type "force-kilowatt-hour-per-100-kilometer" 
                    displayName [! "kilowatt-hour per 100 kilometres"] 
                    unitPattern [#count "one" ! "{0} kilowatt-hour per 100 kilometres"] 
                    unitPattern [#count "other" ! "{0} kilowatt-hours per 100 kilometres"]
                ] 
                unit [
                    #type "graphics-pixel-per-centimeter" 
                    displayName [! "pixels per centimetre"] 
                    unitPattern [#count "one" ! "{0} pixel per centimetre"] 
                    unitPattern [#count "other" ! "{0} pixels per centimetre"]
                ] 
                unit [
                    #type "graphics-dot-per-centimeter" 
                    displayName [! "dots per centimetre"] 
                    unitPattern [#count "one" ! "{0} dot per centimetre"] 
                    unitPattern [#count "other" ! "{0} dots per centimetre"]
                ] 
                unit [
                    #type "graphics-dot" 
                    unitPattern [#count "one" ! "{0} dot"] 
                    unitPattern [#count "other" ! "{0} dots"]
                ] 
                unit [
                    #type "length-earth-radius" 
                    unitPattern [#count "other" ! "{0} earth radii"]
                ] 
                unit [
                    #type "length-kilometer" 
                    displayName [! "kilometres"] 
                    unitPattern [#count "one" ! "{0} kilometre"] 
                    unitPattern [#count "other" ! "{0} kilometres"] 
                    perUnitPattern [! "{0} per kilometre"]
                ] 
                unit [
                    #type "length-meter" 
                    displayName [! "metres"] 
                    unitPattern [#count "one" ! "{0} metre"] 
                    unitPattern [#count "other" ! "{0} metres"] 
                    perUnitPattern [! "{0} per metre"]
                ] 
                unit [
                    #type "length-decimeter" 
                    displayName [! "decimetre"] 
                    unitPattern [#count "one" ! "{0} decimetre"] 
                    unitPattern [#count "other" ! "{0} decimetres"]
                ] 
                unit [
                    #type "length-centimeter" 
                    displayName [! "centimetres"] 
                    unitPattern [#count "one" ! "{0} centimetre"] 
                    unitPattern [#count "other" ! "{0} centimetres"] 
                    perUnitPattern [! "{0} per centimetre"]
                ] 
                unit [
                    #type "length-millimeter" 
                    displayName [! "millimetres"] 
                    unitPattern [#count "one" ! "{0} millimetre"] 
                    unitPattern [#count "other" ! "{0} millimetres"]
                ] 
                unit [
                    #type "length-micrometer" 
                    displayName [! "micrometre"] 
                    unitPattern [#count "one" ! "{0} micrometre"] 
                    unitPattern [#count "other" ! "{0} micrometres"]
                ] 
                unit [
                    #type "length-nanometer" 
                    displayName [! "nanometres"] 
                    unitPattern [#count "one" ! "{0} nanometre"] 
                    unitPattern [#count "other" ! "{0} nanometres"]
                ] 
                unit [
                    #type "length-picometer" 
                    displayName [! "picometres"] 
                    unitPattern [#count "one" ! "{0} picometre"] 
                    unitPattern [#count "other" ! "{0} picometres"]
                ] 
                unit [
                    #type "length-mile-scandinavian" 
                    displayName [! "Scandinavian mile"] 
                    unitPattern [#count "one" ! "{0} Scandinavian mile"] 
                    unitPattern [#count "other" ! "{0} Scandinavian miles"]
                ] 
                unit [
                    #type "light-candela" 
                    displayName [! "candelas"] 
                    unitPattern [#count "other" ! "{0} candelas"]
                ] 
                unit [
                    #type "light-lumen" 
                    displayName [! "lumens"] 
                    unitPattern [#count "other" ! "{0} lumens"]
                ] 
                unit [
                    #type "mass-metric-ton" 
                    displayName [! "tonnes"] 
                    unitPattern [#count "one" ! "{0} tonne"] 
                    unitPattern [#count "other" ! "{0} tonnes"]
                ] 
                unit [
                    #type "mass-stone" 
                    displayName [! "stone"] 
                    unitPattern [#count "other" ! "{0} stone"]
                ] 
                unit [
                    #type "pressure-millimeter-ofhg" 
                    displayName [! "millimetres of mercury"] 
                    unitPattern [#count "one" ! "{0} millimetre of mercury"] 
                    unitPattern [#count "other" ! "{0} millimetres of mercury"]
                ] 
                unit [
                    #type "speed-kilometer-per-hour" 
                    displayName [! "kilometres per hour"] 
                    unitPattern [#count "one" ! "{0} kilometre per hour"] 
                    unitPattern [#count "other" ! "{0} kilometres per hour"]
                ] 
                unit [
                    #type "speed-meter-per-second" 
                    displayName [! "metres per second"] 
                    unitPattern [#count "one" ! "{0} metre per second"] 
                    unitPattern [#count "other" ! "{0} metres per second"]
                ] 
                unit [
                    #type "temperature-generic" 
                    displayName [! "degree"]
                ] 
                unit [
                    #type "temperature-kelvin" 
                    displayName [! "kelvin"] 
                    unitPattern [#count "other" ! "{0} kelvin"]
                ] 
                unit [
                    #type "torque-newton-meter" 
                    displayName [! "newton metres"] 
                    unitPattern [#count "one" ! "{0} newton metre"] 
                    unitPattern [#count "other" ! "{0} newton metres"]
                ] 
                unit [
                    #type "volume-cubic-kilometer" 
                    displayName [! "cubic kilometres"] 
                    unitPattern [#count "one" ! "{0} cubic kilometre"] 
                    unitPattern [#count "other" ! "{0} cubic kilometres"]
                ] 
                unit [
                    #type "volume-cubic-meter" 
                    displayName [! "cubic metres"] 
                    unitPattern [#count "one" ! "{0} cubic metre"] 
                    unitPattern [#count "other" ! "{0} cubic metres"] 
                    perUnitPattern [! "{0} per cubic metre"]
                ] 
                unit [
                    #type "volume-cubic-centimeter" 
                    displayName [! "cubic centimetres"] 
                    unitPattern [#count "one" ! "{0} cubic centimetre"] 
                    unitPattern [#count "other" ! "{0} cubic centimetres"] 
                    perUnitPattern [! "{0} per cubic centimetre"]
                ] 
                unit [
                    #type "volume-megaliter" 
                    displayName [! "megalitres"] 
                    unitPattern [#count "one" ! "{0} megalitre"] 
                    unitPattern [#count "other" ! "{0} megalitres"]
                ] 
                unit [
                    #type "volume-hectoliter" 
                    displayName [! "hectolitres"] 
                    unitPattern [#count "one" ! "{0} hectolitre"] 
                    unitPattern [#count "other" ! "{0} hectolitres"]
                ] 
                unit [
                    #type "volume-liter" 
                    displayName [! "litres"] 
                    unitPattern [#count "one" ! "{0} litre"] 
                    unitPattern [#count "other" ! "{0} litres"] 
                    perUnitPattern [! "{0} per litre"]
                ] 
                unit [
                    #type "volume-deciliter" 
                    displayName [! "decilitres"] 
                    unitPattern [#count "one" ! "{0} decilitre"] 
                    unitPattern [#count "other" ! "{0} decilitres"]
                ] 
                unit [
                    #type "volume-centiliter" 
                    displayName [! "centilitres"] 
                    unitPattern [#count "one" ! "{0} centilitre"] 
                    unitPattern [#count "other" ! "{0} centilitres"]
                ] 
                unit [
                    #type "volume-milliliter" 
                    displayName [! "millilitres"] 
                    unitPattern [#count "one" ! "{0} millilitre"] 
                    unitPattern [#count "other" ! "{0} millilitres"]
                ] 
                unit [
                    #type "volume-gallon" 
                    displayName [! "US gallons"] 
                    unitPattern [#count "one" ! "{0} US gallon"] 
                    unitPattern [#count "other" ! "{0} US gallons"] 
                    perUnitPattern [! "{0} per US gallon"]
                ] 
                unit [
                    #type "volume-gallon-imperial" 
                    displayName [! "gallons"] 
                    unitPattern [#count "one" ! "{0} gallon"] 
                    unitPattern [#count "other" ! "{0} gallons"] 
                    perUnitPattern [! "{0} per gallon"]
                ] 
                unit [
                    #type "volume-quart" 
                    displayName [! "US quarts"] 
                    unitPattern [#count "one" ! "{0} US quart"] 
                    unitPattern [#count "other" ! "{0} US quarts"]
                ] 
                unit [
                    #type "volume-fluid-ounce" 
                    displayName [! "US fluid ounces"] 
                    unitPattern [#count "one" ! "{0} US fluid ounce"] 
                    unitPattern [#count "other" ! "{0} US fluid ounces"]
                ] 
                unit [
                    #type "volume-fluid-ounce-imperial" 
                    displayName [! "fluid ounces"] 
                    unitPattern [#count "one" ! "{0} fluid ounce"] 
                    unitPattern [#count "other" ! "{0} fluid ounces"]
                ] 
                unit [
                    #type "volume-dessert-spoon" 
                    displayName [! "US dessertspoon"] 
                    unitPattern [#count "one" ! "{0} US dessertspoon"] 
                    unitPattern [#count "other" ! "{0} US dessertspoons"]
                ] 
                unit [
                    #type "volume-dessert-spoon-imperial" 
                    displayName [! "dessertspoon"] 
                    unitPattern [#count "one" ! "{0} dessertspoon"] 
                    unitPattern [#count "other" ! "{0} dessertspoons"]
                ] 
                unit [
                    #type "volume-dram" 
                    displayName [! "fluid drams"] 
                    unitPattern [#count "one" ! "{0} fluid dram"] 
                    unitPattern [#count "other" ! "{0} fluid drams"]
                ] 
                unit [
                    #type "volume-quart-imperial" 
                    displayName [! "quart"] 
                    unitPattern [#count "one" ! "{0} quart"] 
                    unitPattern [#count "other" ! "{0} quarts"]
                ]
            ] 
            unitLength [
                #type "short" 
                unit [
                    #type "acceleration-meter-per-square-second" 
                    displayName [! "metres/sec²"]
                ] 
                unit [
                    #type "angle-revolution" 
                    unitPattern [#count "other" ! "{0} revs"]
                ] 
                unit [
                    #type "area-square-meter" 
                    displayName [! "metres²"]
                ] 
                unit [
                    #type "area-square-mile" 
                    perUnitPattern [! "{0}/sq mi"]
                ] 
                unit [
                    #type "area-square-yard" 
                    displayName [! "sq yards"] 
                    unitPattern [#count "one" ! "{0} sq yd"] 
                    unitPattern [#count "other" ! "{0} sq yd"]
                ] 
                unit [
                    #type "area-square-inch" 
                    displayName [! "sq inches"] 
                    unitPattern [#count "one" ! "{0} sq in"] 
                    unitPattern [#count "other" ! "{0} sq in"] 
                    perUnitPattern [! "{0}/sq in"]
                ] 
                unit [
                    #type "concentr-milligram-ofglucose-per-deciliter" 
                    displayName [! "milligrams/decilitre"]
                ] 
                unit [
                    #type "concentr-millimole-per-liter" 
                    displayName [! "millimoles/litre"]
                ] 
                unit [
                    #type "concentr-percent" 
                    displayName [! "per cent"]
                ] 
                unit [
                    #type "concentr-permille" 
                    displayName [! "per mille"]
                ] 
                unit [
                    #type "concentr-permyriad" 
                    displayName [! "per myriad"]
                ] 
                unit [
                    #type "concentr-mole" 
                    displayName [! "moles"]
                ] 
                unit [
                    #type "consumption-liter-per-kilometer" 
                    displayName [! "litres/km"] 
                    unitPattern [#count "one" ! "{0} l/km"]
                ] 
                unit [
                    #type "consumption-liter-per-100-kilometer" 
                    displayName [! "litres/100 km"]
                ] 
                unit [
                    #type "consumption-mile-per-gallon" 
                    displayName [! "miles/US gal"] 
                    unitPattern [#count "one" ! "{0} mpg US"] 
                    unitPattern [#count "other" ! "{0} mpg US"]
                ] 
                unit [
                    #type "consumption-mile-per-gallon-imperial" 
                    displayName [! "miles/gal"] 
                    unitPattern [#count "one" ! "{0} mpg"] 
                    unitPattern [#count "other" ! "{0} mpg"]
                ] 
                unit [
                    #type "digital-byte" 
                    displayName [! "bytes"] 
                    unitPattern [#count "other" ! "{0} bytes"]
                ] 
                unit [
                    #type "digital-bit" 
                    displayName [! "bits"] 
                    unitPattern [#count "other" ! "{0} bits"]
                ] 
                unit [
                    #type "duration-year" 
                    perUnitPattern [! "{0}/yr"]
                ] 
                unit [
                    #type "duration-month" 
                    unitPattern [#count "one" ! "{0} mo"] 
                    unitPattern [#count "other" ! "{0} mos"] 
                    perUnitPattern [! "{0}/mo"]
                ] 
                unit [
                    #type "duration-week" 
                    perUnitPattern [! "{0}/wk"]
                ] 
                unit [
                    #type "duration-hour" 
                    unitPattern [#count "other" ! "{0} hrs"] 
                    perUnitPattern [! "{0}/hr"]
                ] 
                unit [
                    #type "duration-minute" 
                    unitPattern [#count "other" ! "{0} mins"]
                ] 
                unit [
                    #type "duration-second" 
                    unitPattern [#count "other" ! "{0} secs"] 
                    perUnitPattern [! "{0}/sec"]
                ] 
                unit [
                    #type "duration-millisecond" 
                    unitPattern [#count "one" ! "{0} millisec"] 
                    unitPattern [#count "other" ! "{0} millisecs"]
                ] 
                unit [
                    #type "duration-microsecond" 
                    unitPattern [#count "one" ! "{0} μsec"] 
                    unitPattern [#count "other" ! "{0} μsecs"]
                ] 
                unit [
                    #type "duration-nanosecond" 
                    unitPattern [#count "one" ! "{0} nanosec"] 
                    unitPattern [#count "other" ! "{0} nanosecs"]
                ] 
                unit [
                    #type "energy-kilojoule" 
                    displayName [! "kilojoules"]
                ] 
                unit [
                    #type "energy-kilowatt-hour" 
                    displayName [! "kW-hours"]
                ] 
                unit [
                    #type "energy-electronvolt" 
                    displayName [! "electronvolts"]
                ] 
                unit [
                    #type "force-kilowatt-hour-per-100-kilometer" 
                    displayName [! "kWh/100 km"] 
                    unitPattern [#count "one" ! "{0} kWh/100 km"] 
                    unitPattern [#count "other" ! "{0} kWh/100 km"]
                ] 
                unit [
                    #type "graphics-dot" 
                    unitPattern [#count "one" ! "{0} dot"] 
                    unitPattern [#count "other" ! "{0} dots"]
                ] 
                unit [
                    #type "length-meter" 
                    displayName [! "metres"]
                ] 
                unit [
                    #type "length-micrometer" 
                    displayName [! "μmetres"]
                ] 
                unit [
                    #type "mass-carat" 
                    unitPattern [#count "one" ! "{0} ct"] 
                    unitPattern [#count "other" ! "{0} ct"]
                ] 
                unit [
                    #type "mass-grain" 
                    displayName [! "grains"] 
                    unitPattern [#count "other" ! "{0} grains"]
                ] 
                unit [
                    #type "pressure-millimeter-ofhg" 
                    displayName [! "mm Hg"] 
                    unitPattern [#count "one" ! "{0} mm Hg"] 
                    unitPattern [#count "other" ! "{0} mm Hg"]
                ] 
                unit [
                    #type "pressure-bar" 
                    displayName [! "bars"]
                ] 
                unit [
                    #type "speed-meter-per-second" 
                    displayName [! "metres/sec"]
                ] 
                unit [
                    #type "temperature-generic" 
                    displayName [! "deg"]
                ] 
                unit [
                    #type "temperature-celsius" 
                    displayName [! "deg C"] 
                    unitPattern [#count "one" ! "{0} °C"] 
                    unitPattern [#count "other" ! "{0} °C"]
                ] 
                unit [
                    #type "temperature-fahrenheit" 
                    displayName [! "deg F"] 
                    unitPattern [#count "one" ! "{0} °F"] 
                    unitPattern [#count "other" ! "{0} °F"]
                ] 
                unit [
                    #type "volume-cubic-kilometer" 
                    displayName [! "cu kilometres"] 
                    unitPattern [#count "one" ! "{0} cu km"] 
                    unitPattern [#count "other" ! "{0} cu km"]
                ] 
                unit [
                    #type "volume-cubic-meter" 
                    displayName [! "cu metres"] 
                    unitPattern [#count "one" ! "{0}/cu m"] 
                    unitPattern [#count "other" ! "{0}/cu m"] 
                    perUnitPattern [! "{0}/cu m"]
                ] 
                unit [
                    #type "volume-cubic-centimeter" 
                    displayName [! "cu centimetres"] 
                    unitPattern [#count "one" ! "{0}/cu cm"] 
                    unitPattern [#count "other" ! "{0}/cu cm"] 
                    perUnitPattern [! "{0}/cu cm"]
                ] 
                unit [
                    #type "volume-cubic-mile" 
                    displayName [! "cu miles"] 
                    unitPattern [#count "one" ! "{0} cu mi"] 
                    unitPattern [#count "other" ! "{0} cu mi"]
                ] 
                unit [
                    #type "volume-cubic-yard" 
                    displayName [! "cu yards"] 
                    unitPattern [#count "one" ! "{0} cu yd"] 
                    unitPattern [#count "other" ! "{0} cu yd"]
                ] 
                unit [
                    #type "volume-cubic-foot" 
                    displayName [! "cu feet"] 
                    unitPattern [#count "one" ! "{0} cu ft"] 
                    unitPattern [#count "other" ! "{0} cu ft"]
                ] 
                unit [
                    #type "volume-cubic-inch" 
                    displayName [! "cu inches"] 
                    unitPattern [#count "one" ! "{0} cu in"] 
                    unitPattern [#count "other" ! "{0} cu in"]
                ] 
                unit [
                    #type "volume-liter" 
                    displayName [! "litres"]
                ] 
                unit [
                    #type "volume-gallon" 
                    displayName [! "US gal"] 
                    unitPattern [#count "one" ! "{0} US gal"] 
                    unitPattern [#count "other" ! "{0} US gal"] 
                    perUnitPattern [! "{0}/US gal"]
                ] 
                unit [
                    #type "volume-gallon-imperial" 
                    displayName [! "gal"] 
                    unitPattern [#count "one" ! "{0} gal"] 
                    unitPattern [#count "other" ! "{0} gal"] 
                    perUnitPattern [! "{0}/gal"]
                ] 
                unit [
                    #type "volume-quart" 
                    displayName [! "US qts"] 
                    unitPattern [#count "one" ! "{0} US qt"] 
                    unitPattern [#count "other" ! "{0} US qt"]
                ] 
                unit [
                    #type "volume-fluid-ounce" 
                    displayName [! "US fl oz"] 
                    unitPattern [#count "one" ! "{0} US fl oz"] 
                    unitPattern [#count "other" ! "{0} US fl oz"]
                ] 
                unit [
                    #type "volume-fluid-ounce-imperial" 
                    displayName [! "fl oz"] 
                    unitPattern [#count "one" ! "{0} fl oz"] 
                    unitPattern [#count "other" ! "{0} fl oz"]
                ] 
                unit [
                    #type "volume-dessert-spoon" 
                    displayName [! "US dssp"] 
                    unitPattern [#count "one" ! "{0} US dssp"] 
                    unitPattern [#count "other" ! "{0} US dssp"]
                ] 
                unit [
                    #type "volume-dessert-spoon-imperial" 
                    displayName [! "dssp"] 
                    unitPattern [#count "one" ! "{0} dssp"] 
                    unitPattern [#count "other" ! "{0} dssp"]
                ] 
                unit [
                    #type "volume-drop" 
                    displayName [! "drops"] 
                    unitPattern [#count "one" ! "{0} drops"] 
                    unitPattern [#count "other" ! "{0} drops"]
                ] 
                unit [
                    #type "volume-dram" 
                    displayName [! "fl drams"] 
                    unitPattern [#count "one" ! "{0} fl dram"] 
                    unitPattern [#count "other" ! "{0} fl drams"]
                ] 
                unit [
                    #type "volume-jigger" 
                    displayName [! "jiggers"] 
                    unitPattern [#count "other" ! "{0} jiggers"]
                ] 
                unit [
                    #type "volume-pinch" 
                    displayName [! "pinches"] 
                    unitPattern [#count "other" ! "{0} pinches"]
                ] 
                unit [
                    #type "volume-quart-imperial" 
                    displayName [! "qt"] 
                    unitPattern [#count "one" ! "{0} qt"] 
                    unitPattern [#count "other" ! "{0} qt"]
                ]
            ] 
            unitLength [
                #type "narrow" 
                unit [
                    #type "angle-revolution" 
                    unitPattern [#count "other" ! "{0}revs"]
                ] 
                unit [
                    #type "area-square-meter" 
                    displayName [! "metres²"]
                ] 
                unit [
                    #type "concentr-karat" 
                    displayName [! "carat"] 
                    unitPattern [#count "one" ! "{0}ct"] 
                    unitPattern [#count "other" ! "{0}ct"]
                ] 
                unit [
                    #type "consumption-mile-per-gallon" 
                    displayName [! "mpg US"] 
                    unitPattern [#count "one" ! "{0}mpgUS"] 
                    unitPattern [#count "other" ! "{0}mpgUS"]
                ] 
                unit [
                    #type "consumption-mile-per-gallon-imperial" 
                    displayName [! "mpg"] 
                    unitPattern [#count "one" ! "{0}mpg"] 
                    unitPattern [#count "other" ! "{0}mpg"]
                ] 
                unit [
                    #type "digital-bit" 
                    unitPattern [#count "other" ! "{0}bits"]
                ] 
                unit [
                    #type "duration-minute" 
                    unitPattern [#count "one" ! "{0}min"] 
                    unitPattern [#count "other" ! "{0}min"]
                ] 
                unit [
                    #type "electric-ampere" 
                    displayName [! "A"]
                ] 
                unit [
                    #type "electric-ohm" 
                    displayName [! "Ω"]
                ] 
                unit [
                    #type "electric-volt" 
                    displayName [! "V"]
                ] 
                unit [
                    #type "length-meter" 
                    displayName [! "metre"]
                ] 
                unit [
                    #type "light-lux" 
                    displayName [! "lx"]
                ] 
                unit [
                    #type "mass-pound" 
                    unitPattern [#count "one" ! "{0}lb"] 
                    unitPattern [#count "other" ! "{0}lb"]
                ] 
                unit [
                    #type "mass-carat" 
                    displayName [! "ct"] 
                    unitPattern [#count "one" ! "{0}ct"] 
                    unitPattern [#count "other" ! "{0}ct"]
                ] 
                unit [
                    #type "power-watt" 
                    displayName [! "W"]
                ] 
                unit [
                    #type "speed-kilometer-per-hour" 
                    displayName [! "km/h"]
                ] 
                unit [
                    #type "speed-mile-per-hour" 
                    displayName [! "mph"]
                ] 
                unit [
                    #type "temperature-celsius" 
                    unitPattern [#count "one" ! "{0}°"] 
                    unitPattern [#count "other" ! "{0}°"]
                ] 
                unit [
                    #type "temperature-fahrenheit" 
                    unitPattern [#count "one" ! "{0}°F"] 
                    unitPattern [#count "other" ! "{0}°F"]
                ] 
                unit [
                    #type "volume-liter" 
                    displayName [! "litre"]
                ] 
                unit [
                    #type "volume-pint-metric" 
                    displayName [! "mpt"]
                ] 
                unit [
                    #type "volume-gallon" 
                    displayName [! "US gal"] 
                    unitPattern [#count "one" ! "{0}USgal"] 
                    unitPattern [#count "other" ! "{0}USgal"] 
                    perUnitPattern [! "{0}/USgal"]
                ] 
                unit [
                    #type "volume-gallon-imperial" 
                    displayName [! "gal"] 
                    unitPattern [#count "one" ! "{0}gal"] 
                    unitPattern [#count "other" ! "{0}gal"] 
                    perUnitPattern [! "{0}/gal"]
                ] 
                unit [
                    #type "volume-quart" 
                    displayName [! "US qt"] 
                    unitPattern [#count "one" ! "{0}USqt"] 
                    unitPattern [#count "other" ! "{0}USqt"]
                ] 
                unit [
                    #type "volume-cup" 
                    displayName [! "cups"]
                ] 
                unit [
                    #type "volume-fluid-ounce" 
                    displayName [! "US fl oz"] 
                    unitPattern [#count "one" ! "{0}US fl oz"] 
                    unitPattern [#count "other" ! "{0}US fl oz"]
                ] 
                unit [
                    #type "volume-fluid-ounce-imperial" 
                    displayName [! "fl oz"] 
                    unitPattern [#count "one" ! "{0}fl oz"] 
                    unitPattern [#count "other" ! "{0}fl oz"]
                ] 
                unit [
                    #type "volume-dessert-spoon" 
                    displayName [! "US dsp"] 
                    unitPattern [#count "one" ! "{0}USdsp"] 
                    unitPattern [#count "other" ! "{0}USdsp"]
                ] 
                unit [
                    #type "volume-dessert-spoon-imperial" 
                    displayName [! "dsp"] 
                    unitPattern [#count "one" ! "{0}dsp"] 
                    unitPattern [#count "other" ! "{0}dsp"]
                ] 
                unit [
                    #type "volume-dram" 
                    displayName [! "fl dr"] 
                    unitPattern [#count "one" ! "{0}fl dr"] 
                    unitPattern [#count "other" ! "{0}fl dr"]
                ] 
                unit [
                    #type "volume-jigger" 
                    displayName [! "jiggers"] 
                    unitPattern [#count "other" ! "{0}jiggers"]
                ] 
                unit [
                    #type "volume-quart-imperial" 
                    displayName [! "qt"] 
                    unitPattern [#count "one" ! "{0}qt"] 
                    unitPattern [#count "other" ! "{0}qt"]
                ]
            ]
        ] 
        listPatterns [
            listPattern [
                listPatternPart [#type "end" ! "{0} and {1}"]
            ] 
            listPattern [
                #type "or" 
                listPatternPart [#type "end" ! "{0} or {1}"]
            ] 
            listPattern [
                #type "or-narrow" 
                listPatternPart [#type "end" ! "{0} or {1}"]
            ] 
            listPattern [
                #type "or-short" 
                listPatternPart [#type "end" ! "{0} or {1}"]
            ] 
            listPattern [
                #type "standard-short" 
                listPatternPart [#type "end" ! "{0} and {1}"] 
                listPatternPart [#type "2" ! "{0} and {1}"]
            ]
        ] 
        characterLabels [
            characterLabelPattern [#type "all" ! "{0} – all"] 
            characterLabelPattern [#type "compatibility" ! "{0} – compatibility"] 
            characterLabelPattern [#type "enclosed" ! "{0} – enclosed"] 
            characterLabelPattern [#type "extended" ! "{0} – extended"] 
            characterLabelPattern [#type "historic" ! "{0} – historic"] 
            characterLabelPattern [#type "miscellaneous" ! "{0} – miscellaneous"] 
            characterLabelPattern [#type "other" ! "{0} – other"] 
            characterLabelPattern [#type "scripts" ! "scripts – {0}"] 
            characterLabel [#type "downwards_arrows" ! "downward arrow"] 
            characterLabel [#type "downwards_upwards_arrows" ! "downward upward arrow"] 
            characterLabel [#type "leftwards_arrows" ! "leftward arrow"] 
            characterLabel [#type "leftwards_rightwards_arrows" ! "leftward rightward arrow"] 
            characterLabel [#type "letterlike_symbols" ! "letter-like symbol"] 
            characterLabel [#type "limited_use" ! "limited use"] 
            characterLabel [#type "nonspacing" ! "non-spacing"] 
            characterLabel [#type "rightwards_arrows" ! "rightward arrow"] 
            characterLabel [#type "upwards_arrows" ! "upward arrows"]
        ] 
        typographicNames [
            styleName [#type "slnt" #subtype "24" ! "extraslanted"] 
            styleName [#type "wdth" #subtype "62.5" ! "extracondensed"] 
            styleName [#type "wdth" #subtype "62.5" #alt "compressed" ! "extracompressed"] 
            styleName [#type "wdth" #subtype "62.5" #alt "narrow" ! "extranarrow"] 
            styleName [#type "wdth" #subtype "150" ! "extraexpanded"] 
            styleName [#type "wdth" #subtype "150" #alt "extended" ! "extraextended"] 
            styleName [#type "wdth" #subtype "150" #alt "wide" ! "extrawide"] 
            styleName [#type "wght" #subtype "200" ! "extralight"] 
            styleName [#type "wght" #subtype "800" ! "extrabold"] 
            styleName [#type "wght" #subtype "950" ! "extrablack"]
        ]
    ]

