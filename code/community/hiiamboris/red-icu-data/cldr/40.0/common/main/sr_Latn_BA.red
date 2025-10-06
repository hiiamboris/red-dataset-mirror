
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "sr"] 
            script [#type "Latn"] 
            territory [#type "BA"]
        ] 
        localeDisplayNames [
            languages [
                language [#type "ar_001" #draft "contributed" ! "savremeni standardni arapski"] 
                language [#type "arn" #draft "contributed" ! "mapudungun"] 
                language [#type "be" #draft "contributed" ! "bjeloruski"] 
                language [#type "bm" #draft "contributed" ! "bamanankan"] 
                language [#type "bn" #draft "contributed" ! "bangla"] 
                language [#type "de" #draft "contributed" ! "njemački"] 
                language [#type "de_CH" ! "švajcarski visoki njemački"] 
                language [#type "en_GB" ! "engleski (Velika Britanija)"] 
                language [#type "es_ES" ! "španski (Evropa)"] 
                language [#type "fa_AF" #draft "contributed" ! "dari"] 
                language [#type "gsw" ! "njemački (Švajcarska)"] 
                language [#type "ht" #draft "contributed" ! "haićanski kreolski"] 
                language [#type "lo" #draft "contributed" ! "laoški"] 
                language [#type "lrc" ! "sjeverni luri"] 
                language [#type "moh" #draft "contributed" ! "mohok"] 
                language [#type "nd" ! "sjeverni ndebele"] 
                language [#type "nds" #draft "contributed" ! "niskonjemački"] 
                language [#type "nqo" #draft "contributed" ! "n’ko"] 
                language [#type "pt_PT" #draft "contributed" ! "portugalski (Portugal)"] 
                language [#type "se" ! "sjeverni sami"] 
                language [#type "shi" #draft "contributed" ! "južni šilha"] 
                language [#type "si" #draft "contributed" ! "sinhalski"] 
                language [#type "sw_CD" #draft "contributed" ! "kisvahili"] 
                language [#type "tzm" #draft "contributed" ! "centralnoatlaski tamašek"] 
                language [#type "xh" #draft "contributed" ! "isikosa"] 
                language [#type "zgh" #draft "contributed" ! "standardni marokanski tamašek"] 
                language [#type "zh_Hans" #draft "contributed" ! "pojednostavljeni kineski"] 
                language [#type "zh_Hant" #draft "contributed" ! "tradicionalni kineski"] 
                language [#type "zu" #draft "contributed" ! "isizulu"]
            ] 
            territories [
                territory [#type "001" #draft "contributed" ! "svijet"] 
                territory [#type "003" #draft "contributed" ! "Sjevernoamerički kontinent"] 
                territory [#type "015" #draft "contributed" ! "Sjeverna Afrika"] 
                territory [#type "019" #draft "contributed" ! "Sjeverna i Južna Amerika"] 
                territory [#type "021" #draft "contributed" ! "Sjeverna Amerika"] 
                territory [#type "154" #draft "contributed" ! "Sjeverna Evropa"] 
                territory [#type "AC" #draft "contributed" ! "ostrvo Asension"] 
                territory [#type "BY" #draft "contributed" ! "Bjelorusija"] 
                territory [#type "CC" ! "Kokosova (Kiling) ostrva"] 
                territory [#type "CG" #draft "contributed" ! "Kongo"] 
                territory [#type "CP" #draft "contributed" ! "ostrvo Kliperton"] 
                territory [#type "CV" #draft "contributed" ! "Kabo Verde"] 
                territory [#type "CZ" #draft "contributed" ! "Češka Republika"] 
                territory [#type "DE" #draft "contributed" ! "Njemačka"] 
                territory [#type "FK" #alt "variant" #draft "contributed" ! "Folklandska (Malvinska) ostrva"] 
                territory [#type "GS" #draft "contributed" ! "Južna Džordžija i Južna Sendvička ostrva"] 
                territory [#type "GU" ! "Gvam"] 
                territory [#type "HK" #draft "contributed" ! "Hongkong (SAO Kine)"] 
                territory [#type "HM" ! "ostrvo Herd i ostrva Makdonald"] 
                territory [#type "KN" #draft "contributed" ! "Sveti Kits i Nevis"] 
                territory [#type "KP" ! "Sjeverna Koreja"] 
                territory [#type "MK" #draft "contributed" ! "Sjeverna Makedonija"] 
                territory [#type "MO" #draft "contributed" ! "SAR Makao"] 
                territory [#type "MP" ! "Sjeverna Marijanska ostrva"] 
                territory [#type "NF" ! "ostrvo Norfok"] 
                territory [#type "NU" ! "Nijue"] 
                territory [#type "PM" #draft "contributed" ! "Sveti Pjer i Mikelon"] 
                territory [#type "PS" #draft "contributed" ! "palestinske teritorije"] 
                territory [#type "RE" #draft "contributed" ! "Reunion"] 
                territory [#type "UM" ! "Spoljna ostrva SAD"] 
                territory [#type "VC" #draft "contributed" ! "Sveti Vinsent i Grenadini"] 
                territory [#type "VG" #draft "contributed" ! "Britanska Djevičanska Ostrva"] 
                territory [#type "VI" #draft "contributed" ! "Američka Djevičanska Ostrva"]
            ] 
            keys [
                key [#type "collation" #draft "contributed" ! "redoslijed sortiranja"] 
                key [#type "ms" #draft "contributed" ! "sistem mjernih jedinica"]
            ] 
            types [
                type [#key "collation" #type "ducet" #draft "contributed" ! "podrazumijevani Unicode redoslijed sortiranja"] 
                type [#key "collation" #type "search" #draft "contributed" ! "pretraga opšte namjene"] 
                type [#key "collation" #type "standard" #draft "contributed" ! "standardni redoslijed sortiranja"] 
                type [#key "numbers" #type "mymr" #draft "contributed" ! "mjanmarske cifre"]
            ]
        ] 
        dates [
            calendars [
                calendar [
                    #type "generic" 
                    dateTimeFormats [
                        intervalFormats [
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "E, d. MMM – E, d. MMM"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E, d. MMM – E, d. MMM"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "M" #draft "contributed" ! "d.M.y. – d.M.y. GGGGG"]
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
                                #type "wide" 
                                day [#type "sun" #draft "contributed" ! "nedjelja"] 
                                day [#type "mon" ! "ponedjeljak"] 
                                day [#type "tue" #draft "contributed" ! "utorak"] 
                                day [#type "wed" #draft "contributed" ! "srijeda"] 
                                day [#type "thu" #draft "contributed" ! "četvrtak"] 
                                day [#type "fri" #draft "contributed" ! "petak"] 
                                day [#type "sat" #draft "contributed" ! "subota"]
                            ]
                        ] 
                        dayContext [
                            #type "stand-alone" 
                            dayWidth [
                                #type "abbreviated" 
                                day [#type "sun" #draft "contributed" ! "ned"] 
                                day [#type "mon" #draft "contributed" ! "pon"] 
                                day [#type "tue" ! "uto"] 
                                day [#type "wed" ! "sri"] 
                                day [#type "thu" #draft "contributed" ! "čet"] 
                                day [#type "fri" #draft "contributed" ! "pet"] 
                                day [#type "sat" #draft "contributed" ! "sub"]
                            ] 
                            dayWidth [
                                #type "wide" 
                                day [#type "sun" #draft "contributed" ! "nedjelja"] 
                                day [#type "mon" ! "ponedjeljak"] 
                                day [#type "tue" #draft "contributed" ! "utorak"] 
                                day [#type "wed" #draft "contributed" ! "srijeda"] 
                                day [#type "thu" #draft "contributed" ! "četvrtak"] 
                                day [#type "fri" #draft "contributed" ! "petak"] 
                                day [#type "sat" #draft "contributed" ! "subota"]
                            ]
                        ]
                    ] 
                    dayPeriods [
                        dayPeriodContext [
                            #type "format" 
                            dayPeriodWidth [
                                #type "abbreviated" 
                                dayPeriod [#type "midnight" #draft "contributed" ! "ponoć"] 
                                dayPeriod [#type "am" #draft "contributed" ! "prije podne"] 
                                dayPeriod [#type "noon" #draft "contributed" ! "podne"] 
                                dayPeriod [#type "pm" #draft "contributed" ! "po podne"] 
                                dayPeriod [#type "morning1" #draft "contributed" ! "jutro"] 
                                dayPeriod [#type "afternoon1" #draft "contributed" ! "po pod."] 
                                dayPeriod [#type "evening1" #draft "contributed" ! "veče"]
                            ] 
                            dayPeriodWidth [
                                #type "narrow" 
                                dayPeriod [#type "midnight" #draft "contributed" ! "ponoć"] 
                                dayPeriod [#type "noon" #draft "contributed" ! "podne"] 
                                dayPeriod [#type "morning1" #draft "contributed" ! "jutro"] 
                                dayPeriod [#type "afternoon1" #draft "contributed" ! "po pod."] 
                                dayPeriod [#type "evening1" #draft "contributed" ! "veče"] 
                                dayPeriod [#type "night1" #draft "contributed" ! "noć"]
                            ] 
                            dayPeriodWidth [
                                #type "wide" 
                                dayPeriod [#type "am" #draft "contributed" ! "prije podne"] 
                                dayPeriod [#type "pm" #draft "contributed" ! "po podne"]
                            ]
                        ] 
                        dayPeriodContext [
                            #type "stand-alone" 
                            dayPeriodWidth [
                                #type "abbreviated" 
                                dayPeriod [#type "am" #draft "contributed" ! "prije podne"] 
                                dayPeriod [#type "pm" #draft "contributed" ! "po podne"]
                            ] 
                            dayPeriodWidth [
                                #type "narrow" 
                                dayPeriod [#type "am" #draft "contributed" ! "a"] 
                                dayPeriod [#type "pm" #draft "contributed" ! "p"]
                            ] 
                            dayPeriodWidth [
                                #type "wide" 
                                dayPeriod [#type "am" #draft "contributed" ! "prije podne"] 
                                dayPeriod [#type "pm" #draft "contributed" ! "po podne"]
                            ]
                        ]
                    ] 
                    eras [
                        eraNames [
                            era [#type "0" #draft "contributed" ! "prije nove ere"] 
                            era [#type "1" #alt "variant" #draft "contributed" ! "nove ere"]
                        ]
                    ] 
                    dateTimeFormats [
                        intervalFormats [
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" #draft "contributed" ! "MM-dd – MM-dd"] 
                                greatestDifference [#id "M" #draft "contributed" ! "MM-dd – MM-dd"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "E, MM-dd – E, MM-dd"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E, MM-dd – E, MM-dd"]
                            ] 
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" #draft "contributed" ! "y-MM – y-MM"] 
                                greatestDifference [#id "y" #draft "contributed" ! "y-MM – y-MM"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" #draft "contributed" ! "y-MM-dd – y-MM-dd"] 
                                greatestDifference [#id "M" #draft "contributed" ! "y-MM-dd – y-MM-dd"] 
                                greatestDifference [#id "y" #draft "contributed" ! "y-MM-dd – y-MM-dd"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "E, y-MM-dd – E, y-MM-dd"] 
                                greatestDifference [#id "M" #draft "contributed" ! "E, y-MM-dd – E, y-MM-dd"] 
                                greatestDifference [#id "y" #draft "contributed" ! "E, y-MM-dd – E, y-MM-dd"]
                            ]
                        ]
                    ]
                ]
            ] 
            fields [
                field [
                    #type "year" 
                    relative [#type "1" #draft "contributed" ! "sljedeće godine"] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} godine"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} godine"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} godina"]
                    ]
                ] 
                field [
                    #type "year-short" 
                    relative [#type "1" #draft "contributed" ! "sljedeće god."] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} god."] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} god."] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} god."]
                    ]
                ] 
                field [
                    #type "year-narrow" 
                    relative [#type "1" #draft "contributed" ! "sljedeće g."] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} g."] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} g."] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} g."]
                    ]
                ] 
                field [
                    #type "quarter" 
                    relative [#type "1" #draft "contributed" ! "sljedećeg kvartala"] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} kvartala"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} kvartala"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} kvartala"]
                    ]
                ] 
                field [
                    #type "quarter-short" 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} kv."] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} kv."] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} kv."]
                    ]
                ] 
                field [
                    #type "quarter-narrow" 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} kv."] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} kv."] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} kv."]
                    ]
                ] 
                field [
                    #type "month" 
                    displayName [#draft "contributed" ! "mjesec"] 
                    relative [#type "-1" #draft "contributed" ! "prošlog mjeseca"] 
                    relative [#type "0" #draft "contributed" ! "ovog mjeseca"] 
                    relative [#type "1" #draft "contributed" ! "sljedećeg mjeseca"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "za {0} mjesec"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "za {0} mjeseca"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "za {0} mjeseci"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} mjeseca"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} mjeseca"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} mjeseci"]
                    ]
                ] 
                field [
                    #type "month-short" 
                    displayName [#draft "contributed" ! "mjes."] 
                    relative [#type "-1" #draft "contributed" ! "prošlog mjes."] 
                    relative [#type "0" #draft "contributed" ! "ovog mjes."] 
                    relative [#type "1" #draft "contributed" ! "sljedećeg mjes."] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "za {0} mjes."] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "za {0} mjes."] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "za {0} mjes."]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} mjes."] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} mjes."] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} mjes."]
                    ]
                ] 
                field [
                    #type "month-narrow" 
                    relative [#type "1" #draft "contributed" ! "sljedećeg m."] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} m."] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} m."] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} m."]
                    ]
                ] 
                field [
                    #type "week" 
                    displayName [#draft "contributed" ! "nedjelja"] 
                    relative [#type "-1" #draft "contributed" ! "prethodne nedelje"] 
                    relative [#type "0" #draft "contributed" ! "ove nedjelje"] 
                    relative [#type "1" #draft "contributed" ! "naredne nedelje"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "za {0} nedjelju"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "za {0} nedjelje"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "za {0} nedjelja"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} nedjelje"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} nedjelje"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} nedjelja"]
                    ] 
                    relativePeriod [#draft "contributed" ! "nedjelja koja počinje {0}."]
                ] 
                field [
                    #type "week-short" 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} ned."] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} ned."] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} ned."]
                    ] 
                    relativePeriod [#draft "contributed" ! "nedjelja koja počinje {0}."]
                ] 
                field [
                    #type "week-narrow" 
                    relative [#type "1" #draft "contributed" ! "sljedeće n."] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} n."] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} n."] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} n."]
                    ] 
                    relativePeriod [#draft "contributed" ! "nedjelja koja počinje {0}."]
                ] 
                field [
                    #type "weekOfMonth" 
                    displayName [#draft "contributed" ! "nedjelja u mjesecu"]
                ] 
                field [
                    #type "weekOfMonth-short" 
                    displayName [#draft "contributed" ! "ned. u mjes."]
                ] 
                field [
                    #type "weekOfMonth-narrow" 
                    displayName [#draft "contributed" ! "ned. u mjes."]
                ] 
                field [
                    #type "day" 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} dana"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} dana"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} dana"]
                    ]
                ] 
                field [
                    #type "day-short" 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} d."] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} d."] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} d."]
                    ]
                ] 
                field [
                    #type "day-narrow" 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} d."] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} d."] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} d."]
                    ]
                ] 
                field [
                    #type "weekday" 
                    displayName [#draft "contributed" ! "dan u nedjelji"]
                ] 
                field [
                    #type "weekday-short" 
                    displayName [#draft "contributed" ! "dan u nedjelji"]
                ] 
                field [
                    #type "weekday-narrow" 
                    displayName [#draft "contributed" ! "dan u nedjelji"]
                ] 
                field [
                    #type "weekdayOfMonth" 
                    displayName [#draft "contributed" ! "dan u mjesecu"]
                ] 
                field [
                    #type "weekdayOfMonth-short" 
                    displayName [#draft "contributed" ! "dan u mjesecu"]
                ] 
                field [
                    #type "weekdayOfMonth-narrow" 
                    displayName [#draft "contributed" ! "dan u mjesecu"]
                ] 
                field [
                    #type "sun" 
                    relative [#type "-1" #draft "contributed" ! "prošle nedjelje"] 
                    relative [#type "0" #draft "contributed" ! "u nedjelju"] 
                    relative [#type "1" #draft "contributed" ! "sljedeće nedjelje"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "za {0} nedjelju"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "za {0} nedjelje"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "za {0} nedjelja"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} nedjelje"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} nedjelje"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} nedjelja"]
                    ]
                ] 
                field [
                    #type "sun-short" 
                    relative [#type "1" #draft "contributed" ! "slj. ned."] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "za {0} nedjelju"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "za {0} nedjelje"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "za {0} nedjelja"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} nedjelje"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} nedjelje"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} nedjelja"]
                    ]
                ] 
                field [
                    #type "sun-narrow" 
                    relative [#type "1" #draft "contributed" ! "slj. ned."] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "za {0} nedjelju"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "za {0} nedjelje"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "za {0} nedjelja"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} nedjelje"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} nedjelje"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} nedjelja"]
                    ]
                ] 
                field [
                    #type "mon" 
                    relative [#type "-1" #draft "contributed" ! "prošlog ponedjeljka"] 
                    relative [#type "0" #draft "contributed" ! "u ponedjeljak"] 
                    relative [#type "1" #draft "contributed" ! "sljedećeg ponedjeljka"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "za {0} ponedjeljak"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "za {0} ponedjeljka"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "za {0} ponedjeljaka"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} ponedjeljka"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} ponedjeljka"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} ponedjeljaka"]
                    ]
                ] 
                field [
                    #type "mon-short" 
                    relative [#type "1" #draft "contributed" ! "sljedećeg pon"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "za {0} ponedjeljak"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "za {0} ponedjeljka"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "za {0} ponedjeljaka"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} ponedjeljka"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} ponedjeljka"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} ponedjeljaka"]
                    ]
                ] 
                field [
                    #type "mon-narrow" 
                    relative [#type "1" #draft "contributed" ! "sljedećeg pon"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "za {0} ponedjeljak"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "za {0} ponedjeljka"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "za {0} ponedjeljaka"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} ponedjeljka"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} ponedjeljka"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} ponedjeljaka"]
                    ]
                ] 
                field [
                    #type "tue" 
                    relative [#type "1" #draft "contributed" ! "sljedećeg utorka"] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} utorka"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} utorka"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} utoraka"]
                    ]
                ] 
                field [
                    #type "tue-short" 
                    relative [#type "1" #draft "contributed" ! "sljedećeg uto"] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} utorka"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} utorka"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} utoraka"]
                    ]
                ] 
                field [
                    #type "tue-narrow" 
                    relative [#type "1" #draft "contributed" ! "sljedećeg uto"] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} utorka"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} utorka"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} utoraka"]
                    ]
                ] 
                field [
                    #type "wed" 
                    relative [#type "-1" #draft "contributed" ! "prošle srijede"] 
                    relative [#type "0" #draft "contributed" ! "u srijedu"] 
                    relative [#type "1" #draft "contributed" ! "sljedeće srijede"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "za {0} srijedu"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "za {0} srijede"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "za {0} srijeda"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} srijede"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} srijede"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} srijeda"]
                    ]
                ] 
                field [
                    #type "wed-short" 
                    relative [#type "-1" #draft "contributed" ! "prošle sri"] 
                    relative [#type "0" #draft "contributed" ! "u sri"] 
                    relative [#type "1" #draft "contributed" ! "sljedeće sri"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "za {0} srijedu"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "za {0} srijede"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "za {0} srijeda"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} srijede"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} srijede"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} srijeda"]
                    ]
                ] 
                field [
                    #type "wed-narrow" 
                    relative [#type "-1" #draft "contributed" ! "prošle sri"] 
                    relative [#type "0" #draft "contributed" ! "u sri"] 
                    relative [#type "1" #draft "contributed" ! "sljedeće sri"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "za {0} srijedu"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "za {0} srijede"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "za {0} srijeda"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} srijede"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} srijede"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} srijeda"]
                    ]
                ] 
                field [
                    #type "thu" 
                    relative [#type "1" #draft "contributed" ! "sljedećeg četvrtka"] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} četvrtka"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} četvrtka"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} četvrtaka"]
                    ]
                ] 
                field [
                    #type "thu-short" 
                    relative [#type "1" #draft "contributed" ! "sljedećeg čet"] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} četvrtka"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} četvrtka"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} četvrtaka"]
                    ]
                ] 
                field [
                    #type "thu-narrow" 
                    relative [#type "1" #draft "contributed" ! "sljedećeg čet"] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} četvrtka"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} četvrtka"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} četvrtaka"]
                    ]
                ] 
                field [
                    #type "fri" 
                    relative [#type "1" #draft "contributed" ! "sljedećeg petka"] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} petka"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} petka"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} petaka"]
                    ]
                ] 
                field [
                    #type "fri-short" 
                    relative [#type "1" #draft "contributed" ! "sljedećeg pet"] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} petka"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} petka"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} petaka"]
                    ]
                ] 
                field [
                    #type "fri-narrow" 
                    relative [#type "1" #draft "contributed" ! "sljedećeg pet"] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} petka"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} petka"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} petaka"]
                    ]
                ] 
                field [
                    #type "sat" 
                    relative [#type "1" #draft "contributed" ! "sljedeće subote"] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} subote"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} subote"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} subota"]
                    ]
                ] 
                field [
                    #type "sat-short" 
                    relative [#type "1" #draft "contributed" ! "sljedeće sub"] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} subote"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} subote"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} subota"]
                    ]
                ] 
                field [
                    #type "sat-narrow" 
                    relative [#type "1" #draft "contributed" ! "sljedeće sub"] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} subote"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} subote"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} subota"]
                    ]
                ] 
                field [
                    #type "dayperiod-short" 
                    displayName [#draft "contributed" ! "prije podne/po podne"]
                ] 
                field [
                    #type "dayperiod" 
                    displayName [#draft "contributed" ! "prije podne/po podne"]
                ] 
                field [
                    #type "dayperiod-narrow" 
                    displayName [#draft "contributed" ! "prije podne/po podne"]
                ] 
                field [
                    #type "hour" 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} sata"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} sata"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} sati"]
                    ]
                ] 
                field [
                    #type "hour-short" 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} č."] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} č."] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} č."]
                    ]
                ] 
                field [
                    #type "hour-narrow" 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} č."] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} č."] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} č."]
                    ]
                ] 
                field [
                    #type "minute" 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} minuta"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} minuta"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} minuta"]
                    ]
                ] 
                field [
                    #type "minute-short" 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} min."] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} min."] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} min."]
                    ]
                ] 
                field [
                    #type "minute-narrow" 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} min."] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} min."] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} min."]
                    ]
                ] 
                field [
                    #type "second" 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} sekunde"] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} sekunde"] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} sekundi"]
                    ]
                ] 
                field [
                    #type "second-short" 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} sek."] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} sek."] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} sek."]
                    ]
                ] 
                field [
                    #type "second-narrow" 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" #draft "contributed" ! "prije {0} s."] 
                        relativeTimePattern [#count "few" #draft "contributed" ! "prije {0} s."] 
                        relativeTimePattern [#count "other" #draft "contributed" ! "prije {0} s."]
                    ]
                ]
            ] 
            timeZoneNames [
                regionFormat [#type "daylight" #draft "contributed" ! "{0}, ljetnje vrijeme"] 
                regionFormat [#type "standard" #draft "contributed" ! "{0}, standardno vrijeme"] 
                zone [
                    #type "Etc/UTC" 
                    long [
                        standard [#draft "contributed" ! "Koordinisano univerzalno vrijeme"]
                    ]
                ] 
                zone [
                    #type "Antarctica/DumontDUrville" 
                    exemplarCity [#draft "contributed" ! "Dimon d’Irvil"]
                ] 
                zone [
                    #type "Antarctica/Macquarie" 
                    exemplarCity [#draft "contributed" ! "Makvori"]
                ] 
                zone [
                    #type "America/St_Barthelemy" 
                    exemplarCity [#draft "contributed" ! "Sen Bartelemi"]
                ] 
                zone [
                    #type "America/Swift_Current" 
                    exemplarCity [#draft "contributed" ! "Svift Karent"]
                ] 
                zone [
                    #type "America/Regina" 
                    exemplarCity [#draft "contributed" ! "Redžajna"]
                ] 
                zone [
                    #type "America/Resolute" 
                    exemplarCity [#draft "contributed" ! "Rezolut"]
                ] 
                zone [
                    #type "America/St_Johns" 
                    exemplarCity [#draft "contributed" ! "Sent Džons"]
                ] 
                zone [
                    #type "Europe/London" 
                    long [
                        daylight [#draft "contributed" ! "Britanija, ljetnje vrijeme"]
                    ]
                ] 
                zone [
                    #type "America/Scoresbysund" 
                    exemplarCity [#draft "contributed" ! "Itokortormit"]
                ] 
                zone [
                    #type "America/Port-au-Prince" 
                    exemplarCity [#draft "contributed" ! "Port-o-Prens"]
                ] 
                zone [
                    #type "Europe/Dublin" 
                    long [
                        daylight [#draft "contributed" ! "Irska, standardno vrijeme"]
                    ]
                ] 
                zone [
                    #type "Pacific/Niue" 
                    exemplarCity [#draft "contributed" ! "Nijue"]
                ] 
                zone [
                    #type "America/Puerto_Rico" 
                    exemplarCity [#draft "contributed" ! "Portoriko"]
                ] 
                zone [
                    #type "Arctic/Longyearbyen" 
                    exemplarCity [#draft "contributed" ! "Longjir"]
                ] 
                zone [
                    #type "America/Port_of_Spain" 
                    exemplarCity [#draft "contributed" ! "Port ov Spejn"]
                ] 
                zone [
                    #type "America/North_Dakota/Beulah" 
                    exemplarCity [#draft "contributed" ! "Bjula, Sjeverna Dakota"]
                ] 
                zone [
                    #type "America/North_Dakota/New_Salem" 
                    exemplarCity [#draft "contributed" ! "Novi Salem, Sjeverna Dakota"]
                ] 
                zone [
                    #type "America/North_Dakota/Center" 
                    exemplarCity [#draft "contributed" ! "Centar, Sjeverna Dakota"]
                ] 
                zone [
                    #type "America/Indiana/Vincennes" 
                    exemplarCity [#draft "contributed" ! "Vinsens, Indijana"]
                ] 
                zone [
                    #type "America/Indianapolis" 
                    exemplarCity [#draft "contributed" ! "Indijanapolis"]
                ] 
                zone [
                    #type "America/Louisville" 
                    exemplarCity [#draft "contributed" ! "Luivil"]
                ] 
                zone [
                    #type "America/Indiana/Vevay" 
                    exemplarCity [#draft "contributed" ! "Vivi, Indijana"]
                ] 
                zone [
                    #type "America/St_Thomas" 
                    exemplarCity [#draft "contributed" ! "Sent Tomas"]
                ] 
                metazone [
                    #type "Afghanistan" 
                    long [
                        standard [#draft "contributed" ! "Avganistan vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Africa_Central" 
                    long [
                        standard [#draft "contributed" ! "Centralno-afričko vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Africa_Eastern" 
                    long [
                        standard [#draft "contributed" ! "Istočno-afričko vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Africa_Southern" 
                    long [
                        standard [#draft "contributed" ! "Južno-afričko vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Africa_Western" 
                    long [
                        generic [#draft "contributed" ! "Zapadno-afričko vrijeme"] 
                        standard [#draft "contributed" ! "Zapadno-afričko standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Zapadno-afričko ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Alaska" 
                    long [
                        standard [#draft "contributed" ! "Aljaska, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Aljaska, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Amazon" 
                    long [
                        generic [#draft "contributed" ! "Amazon vrijeme"] 
                        standard [#draft "contributed" ! "Amazon, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Amazon, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "America_Central" 
                    long [
                        generic [#draft "contributed" ! "Sjevernoameričko centralno vrijeme"] 
                        standard [#draft "contributed" ! "Sjevernoameričko centralno standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Sjevernoameričko centralno ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "America_Eastern" 
                    long [
                        generic [#draft "contributed" ! "Sjevernoameričko istočno vrijeme"] 
                        standard [#draft "contributed" ! "Sjevernoameričko istočno standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Sjevernoameričko istočno ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "America_Mountain" 
                    long [
                        generic [#draft "contributed" ! "Sjevernoameričko planinsko vrijeme"] 
                        standard [#draft "contributed" ! "Sjevernoameričko planinsko standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Sjevernoameričko planinsko ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "America_Pacific" 
                    long [
                        generic [#draft "contributed" ! "Sjevernoameričko pacifičko vrijeme"] 
                        standard [#draft "contributed" ! "Sjevernoameričko pacifičko standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Sjevernoameričko pacifičko letnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Apia" 
                    long [
                        generic [#draft "contributed" ! "Apija vrijeme"] 
                        standard [#draft "contributed" ! "Apija, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Apija, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Arabian" 
                    long [
                        generic [#draft "contributed" ! "Arabijsko vrijeme"] 
                        standard [#draft "contributed" ! "Arabijsko standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Arabijsko ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Argentina" 
                    long [
                        generic [#draft "contributed" ! "Argentina vrijeme"] 
                        standard [#draft "contributed" ! "Argentina, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Argentina, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Argentina_Western" 
                    long [
                        generic [#draft "contributed" ! "Zapadna Argentina vrijeme"] 
                        standard [#draft "contributed" ! "Zapadna Argentina, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Zapadna Argentina, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Armenia" 
                    long [
                        generic [#draft "contributed" ! "Jermenija vrijeme"] 
                        standard [#draft "contributed" ! "Jermenija, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Jermenija, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Atlantic" 
                    long [
                        generic [#draft "contributed" ! "Atlantsko vrijeme"] 
                        standard [#draft "contributed" ! "Atlantsko standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Atlantsko ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Australia_Central" 
                    long [
                        generic [#draft "contributed" ! "Australijsko centralno vrijeme"] 
                        standard [#draft "contributed" ! "Australijsko centralno standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Australijsko centralno ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Australia_CentralWestern" 
                    long [
                        generic [#draft "contributed" ! "Australijsko centralno zapadno vrijeme"] 
                        standard [#draft "contributed" ! "Australijsko centralno zapadno standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Australijsko centralno zapadno ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Australia_Eastern" 
                    long [
                        generic [#draft "contributed" ! "Australijsko istočno vrijeme"] 
                        standard [#draft "contributed" ! "Australijsko istočno standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Australijsko istočno ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Australia_Western" 
                    long [
                        generic [#draft "contributed" ! "Australijsko zapadno vrijeme"] 
                        standard [#draft "contributed" ! "Australijsko zapadno standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Australijsko zapadno ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Azerbaijan" 
                    long [
                        generic [#draft "contributed" ! "Azerbejdžan vrijeme"] 
                        standard [#draft "contributed" ! "Azerbejdžan, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Azerbejdžan, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Azores" 
                    long [
                        generic [#draft "contributed" ! "Azori vrijeme"] 
                        standard [#draft "contributed" ! "Azori, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Azori, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Bangladesh" 
                    long [
                        generic [#draft "contributed" ! "Bangladeš vrijeme"] 
                        standard [#draft "contributed" ! "Bangladeš, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Bangladeš, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Bhutan" 
                    long [
                        standard [#draft "contributed" ! "Butan vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Bolivia" 
                    long [
                        standard [#draft "contributed" ! "Bolivija vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Brasilia" 
                    long [
                        generic [#draft "contributed" ! "Brazilija vrijeme"] 
                        standard [#draft "contributed" ! "Brazilija, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Brazilija, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Brunei" 
                    long [
                        standard [#draft "contributed" ! "Brunej Darusalum vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Cape_Verde" 
                    long [
                        generic [#draft "contributed" ! "Zelenortska Ostrva vrijeme"] 
                        standard [#draft "contributed" ! "Zelenortska Ostrva, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Zelenortska Ostrva, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Chamorro" 
                    long [
                        standard [#draft "contributed" ! "Čamoro vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Chatham" 
                    long [
                        generic [#draft "contributed" ! "Čatam vrijeme"] 
                        standard [#draft "contributed" ! "Čatam, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Čatam, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Chile" 
                    long [
                        generic [#draft "contributed" ! "Čile vrijeme"] 
                        standard [#draft "contributed" ! "Čile, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Čile, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "China" 
                    long [
                        generic [#draft "contributed" ! "Kina vrijeme"] 
                        standard [#draft "contributed" ! "Kinesko standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Kina, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Choibalsan" 
                    long [
                        generic [#draft "contributed" ! "Čojbalsan vrijeme"] 
                        standard [#draft "contributed" ! "Čojbalsan, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Čojbalsan, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Christmas" 
                    long [
                        standard [#draft "contributed" ! "Božićno ostrvo vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Cocos" 
                    long [
                        standard [#draft "contributed" ! "Kokosova (Kiling) ostrva vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Colombia" 
                    long [
                        generic [#draft "contributed" ! "Kolumbija vrijeme"] 
                        standard [#draft "contributed" ! "Kolumbija, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Kolumbija, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Cook" 
                    long [
                        generic [#draft "contributed" ! "Kukova Ostrva vrijeme"] 
                        standard [#draft "contributed" ! "Kukova Ostrva, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Kukova Ostrva, poluljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Cuba" 
                    long [
                        standard [#draft "contributed" ! "Kuba, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Kuba, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Davis" 
                    long [
                        standard [#draft "contributed" ! "Dejvis vrijeme"]
                    ]
                ] 
                metazone [
                    #type "DumontDUrville" 
                    long [
                        standard [#draft "contributed" ! "Dimon d’Irvil vrijeme"]
                    ]
                ] 
                metazone [
                    #type "East_Timor" 
                    long [
                        standard [#draft "contributed" ! "Istočni Timor vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Easter" 
                    long [
                        generic [#draft "contributed" ! "Uskršnja ostrva vrijeme"] 
                        standard [#draft "contributed" ! "Uskršnja ostrva, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Uskršnja ostrva, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Ecuador" 
                    long [
                        standard [#draft "contributed" ! "Ekvador vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Europe_Central" 
                    long [
                        generic [#draft "contributed" ! "Srednjoevropsko vrijeme"] 
                        standard [#draft "contributed" ! "Srednjoevropsko standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Srednjoevropsko ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Europe_Eastern" 
                    long [
                        generic [#draft "contributed" ! "Istočnoevropsko vrijeme"] 
                        standard [#draft "contributed" ! "Istočnoevropsko standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Istočnoevropsko ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Europe_Western" 
                    long [
                        generic [#draft "contributed" ! "Zapadnoevropsko vrijeme"] 
                        standard [#draft "contributed" ! "Zapadnoevropsko standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Zapadnoevropsko ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Falkland" 
                    long [
                        generic [#draft "contributed" ! "Folklandska Ostrva vrijeme"] 
                        standard [#draft "contributed" ! "Folklandska Ostrva, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Folklandska Ostrva, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Fiji" 
                    long [
                        generic [#draft "contributed" ! "Fidži vrijeme"] 
                        standard [#draft "contributed" ! "Fidži, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Fidži, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "French_Guiana" 
                    long [
                        standard [#draft "contributed" ! "Francuska Gvajana vrijeme"]
                    ]
                ] 
                metazone [
                    #type "French_Southern" 
                    long [
                        standard [#draft "contributed" ! "Francusko južno i antarktičko vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Galapagos" 
                    long [
                        standard [#draft "contributed" ! "Galapagos vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Gambier" 
                    long [
                        standard [#draft "contributed" ! "Gambije vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Georgia" 
                    long [
                        generic [#draft "contributed" ! "Gruzija vrijeme"] 
                        standard [#draft "contributed" ! "Gruzija, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Gruzija, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Gilbert_Islands" 
                    long [
                        standard [#draft "contributed" ! "Gilbertova ostrva vrijeme"]
                    ]
                ] 
                metazone [
                    #type "GMT" 
                    long [
                        standard [#draft "contributed" ! "Srednje vrijeme po Griniču"]
                    ]
                ] 
                metazone [
                    #type "Greenland_Eastern" 
                    long [
                        standard [#draft "contributed" ! "Istočni Grenland, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Istočni Grenland, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Greenland_Western" 
                    long [
                        standard [#draft "contributed" ! "Zapadni Grenland, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Zapadni Grenland, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Gulf" 
                    long [
                        standard [#draft "contributed" ! "Zalivsko vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Guyana" 
                    long [
                        standard [#draft "contributed" ! "Gvajana vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Hawaii_Aleutian" 
                    long [
                        generic [#draft "contributed" ! "Havajsko-aleutsko vrijeme"] 
                        standard [#draft "contributed" ! "Havajsko-aleutsko standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Havajsko-aleutsko ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Hong_Kong" 
                    long [
                        generic [#draft "contributed" ! "Hong Kong vrijeme"] 
                        standard [#draft "contributed" ! "Hong Kong, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Hong Kong, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Hovd" 
                    long [
                        generic [#draft "contributed" ! "Hovd vrijeme"] 
                        standard [#draft "contributed" ! "Hovd, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Hovd, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "India" 
                    long [
                        standard [#draft "contributed" ! "Indijsko standardno vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Indian_Ocean" 
                    long [
                        standard [#draft "contributed" ! "Indijsko okeansko vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Indochina" 
                    long [
                        standard [#draft "contributed" ! "Indokina vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Indonesia_Central" 
                    long [
                        standard [#draft "contributed" ! "Centralno-indonezijsko vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Indonesia_Eastern" 
                    long [
                        standard [#draft "contributed" ! "Istočno-indonezijsko vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Indonesia_Western" 
                    long [
                        standard [#draft "contributed" ! "Zapadno-indonezijsko vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Iran" 
                    long [
                        generic [#draft "contributed" ! "Iran vrijeme"] 
                        standard [#draft "contributed" ! "Iran, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Iran, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Irkutsk" 
                    long [
                        generic [#draft "contributed" ! "Irkuck vrijeme"] 
                        standard [#draft "contributed" ! "Irkuck, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Irkuck, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Israel" 
                    long [
                        generic [#draft "contributed" ! "Izraelsko vrijeme"] 
                        standard [#draft "contributed" ! "Izraelsko standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Izraelsko ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Japan" 
                    long [
                        generic [#draft "contributed" ! "Japansko vrijeme"] 
                        standard [#draft "contributed" ! "Japansko standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Japansko ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Kazakhstan_Eastern" 
                    long [
                        standard [#draft "contributed" ! "Istočno-kazahstansko vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Kazakhstan_Western" 
                    long [
                        standard [#draft "contributed" ! "Zapadno-kazahstansko vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Korea" 
                    long [
                        generic [#draft "contributed" ! "Korejsko vrijeme"] 
                        standard [#draft "contributed" ! "Korejsko standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Korejsko ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Kosrae" 
                    long [
                        standard [#draft "contributed" ! "Košre vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Krasnoyarsk" 
                    long [
                        generic [#draft "contributed" ! "Krasnojarsk vrijeme"] 
                        standard [#draft "contributed" ! "Krasnojarsk, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Krasnojarsk, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Kyrgystan" 
                    long [
                        standard [#draft "contributed" ! "Kirgistan vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Line_Islands" 
                    long [
                        standard [#draft "contributed" ! "Linijska ostrva vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Lord_Howe" 
                    long [
                        generic [#draft "contributed" ! "Lord Hov vrijeme"] 
                        standard [#draft "contributed" ! "Lord Hov, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Lord Hov, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Macquarie" 
                    long [
                        standard [#draft "contributed" ! "ostrvo Makvori vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Magadan" 
                    long [
                        generic [#draft "contributed" ! "Magadan vrijeme"] 
                        standard [#draft "contributed" ! "Magadan, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Magadan, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Malaysia" 
                    long [
                        standard [#draft "contributed" ! "Malezija vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Maldives" 
                    long [
                        standard [#draft "contributed" ! "Maldivi vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Marquesas" 
                    long [
                        standard [#draft "contributed" ! "Markiz vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Marshall_Islands" 
                    long [
                        standard [#draft "contributed" ! "Maršalska Ostrva vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Mauritius" 
                    long [
                        generic [#draft "contributed" ! "Mauricijus vrijeme"] 
                        standard [#draft "contributed" ! "Mauricijus, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Mauricijus, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Mawson" 
                    long [
                        standard [#draft "contributed" ! "Moson vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Mexico_Northwest" 
                    long [
                        generic [#draft "contributed" ! "Sjeverozapadni Meksiko"] 
                        standard [#draft "contributed" ! "Sjeverozapadni Meksiko, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Sjeverozapadni Meksiko, letnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Mexico_Pacific" 
                    long [
                        standard [#draft "contributed" ! "Meksički Pacifik, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Meksički Pacifik, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Mongolia" 
                    long [
                        generic [#draft "contributed" ! "Ulan Bator vrijeme"] 
                        standard [#draft "contributed" ! "Ulan Bator, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Ulan Bator, ljetnje vrijeeme"]
                    ]
                ] 
                metazone [
                    #type "Moscow" 
                    long [
                        generic [#draft "contributed" ! "Moskva vrijeme"] 
                        standard [#draft "contributed" ! "Moskva, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Moskva, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Myanmar" 
                    long [
                        standard [#draft "contributed" ! "Mjanmar vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Nauru" 
                    long [
                        standard [#draft "contributed" ! "Nauru vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Nepal" 
                    long [
                        standard [#draft "contributed" ! "Nepal vrijeme"]
                    ]
                ] 
                metazone [
                    #type "New_Caledonia" 
                    long [
                        generic [#draft "contributed" ! "Nova Kaledonija vrijeme"] 
                        standard [#draft "contributed" ! "Nova Kaledonija, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Nova Kaledonija, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "New_Zealand" 
                    long [
                        generic [#draft "contributed" ! "Novi Zeland vrijeme"] 
                        standard [#draft "contributed" ! "Novi Zeland, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Novi Zeland, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Newfoundland" 
                    long [
                        standard [#draft "contributed" ! "Njufaundlend, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Njufaundlend, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Niue" 
                    long [
                        standard [#draft "contributed" ! "Nijue vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Norfolk" 
                    long [
                        generic [#draft "contributed" ! "ostrvo Norfolk vrijeme"] 
                        standard [#draft "contributed" ! "ostrvo Norfolk, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "ostrvo Norfolk, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Noronha" 
                    long [
                        generic [#draft "contributed" ! "Fernando de Noronja vrijeme"] 
                        standard [#draft "contributed" ! "Fernando de Noronja, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Fernando de Noronja, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Novosibirsk" 
                    long [
                        generic [#draft "contributed" ! "Novosibirsk vrijeme"] 
                        standard [#draft "contributed" ! "Novosibirsk, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Novosibirsk, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Omsk" 
                    long [
                        generic [#draft "contributed" ! "Omsk vrijeme"] 
                        standard [#draft "contributed" ! "Omsk, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Omsk, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Pakistan" 
                    long [
                        generic [#draft "contributed" ! "Pakistan vrijeme"] 
                        standard [#draft "contributed" ! "Pakistan, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Pakistan, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Palau" 
                    long [
                        standard [#draft "contributed" ! "Palau vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Papua_New_Guinea" 
                    long [
                        standard [#draft "contributed" ! "Papua Nova Gvineja vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Paraguay" 
                    long [
                        generic [#draft "contributed" ! "Paragvaj vrijeme"] 
                        standard [#draft "contributed" ! "Paragvaj, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Paragvaj, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Peru" 
                    long [
                        generic [#draft "contributed" ! "Peru vrijeme"] 
                        standard [#draft "contributed" ! "Peru, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Peru, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Philippines" 
                    long [
                        generic [#draft "contributed" ! "Filipini vrijeme"] 
                        standard [#draft "contributed" ! "Filipini, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Filipini, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Phoenix_Islands" 
                    long [
                        standard [#draft "contributed" ! "Feniks ostrva vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Pierre_Miquelon" 
                    long [
                        standard [#draft "contributed" ! "Sen Pjer i Mikelon, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Sen Pjer i Mikelon, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Pitcairn" 
                    long [
                        standard [#draft "contributed" ! "Pitkern vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Ponape" 
                    long [
                        standard [#draft "contributed" ! "Ponpej vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Pyongyang" 
                    long [
                        standard [#draft "contributed" ! "Pjongjanško vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Reunion" 
                    long [
                        standard [#draft "contributed" ! "Reunion vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Rothera" 
                    long [
                        standard [#draft "contributed" ! "Rotera vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Sakhalin" 
                    long [
                        generic [#draft "contributed" ! "Sahalin vrijeme"] 
                        standard [#draft "contributed" ! "Sahalin, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Sahalin, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Samoa" 
                    long [
                        generic [#draft "contributed" ! "Samoa vrijeme"] 
                        standard [#draft "contributed" ! "Samoa, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Samoa, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Seychelles" 
                    long [
                        standard [#draft "contributed" ! "Sejšeli vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Singapore" 
                    long [
                        standard [#draft "contributed" ! "Singapur, standardno vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Solomon" 
                    long [
                        standard [#draft "contributed" ! "Solomonska Ostrva vrijeme"]
                    ]
                ] 
                metazone [
                    #type "South_Georgia" 
                    long [
                        standard [#draft "contributed" ! "Južna Džordžija vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Suriname" 
                    long [
                        standard [#draft "contributed" ! "Surinam vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Syowa" 
                    long [
                        standard [#draft "contributed" ! "Šova vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Tahiti" 
                    long [
                        standard [#draft "contributed" ! "Tahiti vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Taipei" 
                    long [
                        generic [#draft "contributed" ! "Tajpej vrijeme"] 
                        standard [#draft "contributed" ! "Tajpej, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Tajpej, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Tajikistan" 
                    long [
                        standard [#draft "contributed" ! "Tadžikistan vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Tokelau" 
                    long [
                        standard [#draft "contributed" ! "Tokelau vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Tonga" 
                    long [
                        generic [#draft "contributed" ! "Tonga vrijeme"] 
                        standard [#draft "contributed" ! "Tonga, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Tonga, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Truk" 
                    long [
                        standard [#draft "contributed" ! "Čuk vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Turkmenistan" 
                    long [
                        generic [#draft "contributed" ! "Turkmenistan vrijeme"] 
                        standard [#draft "contributed" ! "Turkmenistan, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Turkmenistan, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Tuvalu" 
                    long [
                        standard [#draft "contributed" ! "Tuvalu vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Uruguay" 
                    long [
                        generic [#draft "contributed" ! "Urugvaj vrijeme"] 
                        standard [#draft "contributed" ! "Urugvaj, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Urugvaj, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Uzbekistan" 
                    long [
                        generic [#draft "contributed" ! "Uzbekistan vrijeme"] 
                        standard [#draft "contributed" ! "Uzbekistan, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Uzbekistan, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Vanuatu" 
                    long [
                        generic [#draft "contributed" ! "Vanuatu vrijeme"] 
                        standard [#draft "contributed" ! "Vanuatu, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Vanuatu, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Venezuela" 
                    long [
                        standard [#draft "contributed" ! "Venecuela vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Vladivostok" 
                    long [
                        generic [#draft "contributed" ! "Vladivostok vrijeme"] 
                        standard [#draft "contributed" ! "Vladivostok, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Vladivostok, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Volgograd" 
                    long [
                        generic [#draft "contributed" ! "Volgograd vrijeme"] 
                        standard [#draft "contributed" ! "Volgograd, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Volgograd, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Vostok" 
                    long [
                        standard [#draft "contributed" ! "Vostok vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Wake" 
                    long [
                        standard [#draft "contributed" ! "ostrvo Vejk vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Wallis" 
                    long [
                        standard [#draft "contributed" ! "ostrva Valis i Futuna vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Yakutsk" 
                    long [
                        generic [#draft "contributed" ! "Jakutsk vrijeme"] 
                        standard [#draft "contributed" ! "Jakutsk, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Jakutsk, ljetnje vrijeme"]
                    ]
                ] 
                metazone [
                    #type "Yekaterinburg" 
                    long [
                        generic [#draft "contributed" ! "Jekaterinburg vrijeme"] 
                        standard [#draft "contributed" ! "Jekaterinburg, standardno vrijeme"] 
                        daylight [#draft "contributed" ! "Jekaterinburg, ljetnje vrijeme"]
                    ]
                ]
            ]
        ] 
        numbers [
            currencies [
                currency [
                    #type "BAM" 
                    displayName [#draft "contributed" ! "Bosanskohercegovačka konvertibilna marka"] 
                    displayName [#count "one" #draft "contributed" ! "bosanskohercegovačka konvertibilna marka"] 
                    displayName [#count "few" #draft "contributed" ! "bosanskohercegovačke konvertibilne marke"] 
                    displayName [#count "other" #draft "contributed" ! "bosanskohercegovačkih konvertibilnih maraka"]
                ] 
                currency [
                    #type "BYN" 
                    displayName [#draft "contributed" ! "Bjeloruska rublja"] 
                    displayName [#count "one" #draft "contributed" ! "bjeloruska rublja"] 
                    displayName [#count "few" #draft "contributed" ! "bjeloruske rublje"] 
                    displayName [#count "other" #draft "contributed" ! "bjeloruskih rublji"]
                ] 
                currency [
                    #type "KPW" 
                    displayName [#draft "contributed" ! "Sjevernokorejski von"] 
                    displayName [#count "one" #draft "contributed" ! "sjevernokorejski von"] 
                    displayName [#count "few" #draft "contributed" ! "sjevernokorejska vona"] 
                    displayName [#count "other" #draft "contributed" ! "sjevernokorejskih vona"]
                ] 
                currency [
                    #type "NIO" 
                    displayName [! "Nikaragvanska zlatna kordoba"] 
                    displayName [#count "one" ! "nikaragvanska zlatna kordoba"] 
                    displayName [#count "few" ! "nikaragvanske zlatne kordobe"] 
                    displayName [#count "other" ! "nikaragvanskih zlatnih kordoba"]
                ]
            ]
        ] 
        units [
            unitLength [
                #type "long" 
                compoundUnit [
                    #type "1024p8" 
                    unitPrefixPattern [#draft "contributed" ! "jobi{0}"]
                ] 
                unit [
                    #type "duration-century" 
                    displayName [#draft "contributed" ! "vijekovi"] 
                    unitPattern [#count "one" #draft "contributed" ! "{0} vijek"] 
                    unitPattern [#count "few" #draft "contributed" ! "{0} vijeka"] 
                    unitPattern [#count "other" #draft "contributed" ! "{0} vijekova"]
                ] 
                unit [
                    #type "duration-month" 
                    displayName [#draft "contributed" ! "mjeseci"] 
                    unitPattern [#count "one" #draft "contributed" ! "{0} mjesec"] 
                    unitPattern [#count "few" #draft "contributed" ! "{0} mjeseca"] 
                    unitPattern [#count "other" #draft "contributed" ! "{0} mjeseci"] 
                    perUnitPattern [#draft "contributed" ! "{0} mjesečno"]
                ] 
                unit [
                    #type "duration-week" 
                    displayName [#draft "contributed" ! "nedjelje"] 
                    unitPattern [#count "one" #draft "contributed" ! "{0} nedjelja"] 
                    unitPattern [#count "few" #draft "contributed" ! "{0} nedjelje"] 
                    unitPattern [#count "other" #draft "contributed" ! "{0} nedjelja"] 
                    perUnitPattern [#draft "contributed" ! "{0} nedjeljno"]
                ] 
                unit [
                    #type "length-light-year" 
                    displayName [#draft "contributed" ! "svjetlosne godine"] 
                    unitPattern [#count "one" #draft "contributed" ! "{0} svjetlosna godina"] 
                    unitPattern [#count "few" #draft "contributed" ! "{0} svjetlosne godine"] 
                    unitPattern [#count "other" #draft "contributed" ! "{0} svjetlosnih godina"]
                ] 
                unit [
                    #type "mass-grain" 
                    displayName [#draft "contributed" ! "gran"] 
                    unitPattern [#count "one" #draft "contributed" ! "{0} gran"] 
                    unitPattern [#count "few" #draft "contributed" ! "{0} grana"] 
                    unitPattern [#count "other" #draft "contributed" ! "{0} granova"]
                ]
            ] 
            unitLength [
                #type "short" 
                unit [
                    #type "duration-month" 
                    displayName [#draft "contributed" ! "mjeseci"] 
                    unitPattern [#count "one" #draft "contributed" ! "{0} mjes."] 
                    unitPattern [#count "few" #draft "contributed" ! "{0} mjes."] 
                    unitPattern [#count "other" #draft "contributed" ! "{0} mjes."]
                ] 
                unit [
                    #type "length-light-year" 
                    displayName [#draft "contributed" ! "svjetlosne god."]
                ] 
                unit [
                    #type "mass-grain" 
                    displayName [#draft "contributed" ! "gran"] 
                    unitPattern [#count "one" #draft "contributed" ! "{0} gran"] 
                    unitPattern [#count "few" #draft "contributed" ! "{0} grana"] 
                    unitPattern [#count "other" #draft "contributed" ! "{0} granova"]
                ] 
                unit [
                    #type "volume-dessert-spoon" 
                    displayName [#draft "contributed" ! "dstspn"] 
                    unitPattern [#count "one" #draft "contributed" ! "{0} dstspn"] 
                    unitPattern [#count "few" #draft "contributed" ! "{0} dstspn"] 
                    unitPattern [#count "other" #draft "contributed" ! "{0} dstspn"]
                ]
            ] 
            unitLength [
                #type "narrow" 
                unit [
                    #type "volume-barrel" 
                    displayName [#draft "contributed" ! "bbl"] 
                    unitPattern [#count "one" #draft "contributed" ! "{0}bbl"] 
                    unitPattern [#count "few" #draft "contributed" ! "{0} bbl"] 
                    unitPattern [#count "other" #draft "contributed" ! "{0}bbl"]
                ] 
                unit [
                    #type "volume-dessert-spoon" 
                    displayName [#draft "contributed" ! "d. kaš."] 
                    unitPattern [#count "one" #draft "contributed" ! "{0} d. kaš."] 
                    unitPattern [#count "few" #draft "contributed" ! "{0} d. kaš."] 
                    unitPattern [#count "other" #draft "contributed" ! "{0} d. kaš."]
                ] 
                unit [
                    #type "volume-dessert-spoon-imperial" 
                    displayName [#draft "contributed" ! "i. d. k."] 
                    unitPattern [#count "one" #draft "contributed" ! "{0} i. d. k."] 
                    unitPattern [#count "few" #draft "contributed" ! "{0} i. d. k."] 
                    unitPattern [#count "other" #draft "contributed" ! "{0} i. d. k."]
                ]
            ]
        ] 
        characterLabels [
            characterLabel [#type "body" ! "tijelo"] 
            characterLabel [#type "bullets_stars" ! "Znakovi za nabrajanje/zvjezdice"] 
            characterLabel [#type "downwards_arrows" ! "Strelice nadolje"] 
            characterLabel [#type "downwards_upwards_arrows" ! "Strelice nadolje i nagore"] 
            characterLabel [#type "leftwards_arrows" ! "Strelice nalijevo"] 
            characterLabel [#type "leftwards_rightwards_arrows" ! "Strelice nalijevo i nadesno"] 
            characterLabel [#type "place" ! "mjesto"] 
            characterLabel [#type "travel_places" ! "Putovanja i mjesta"] 
            characterLabel [#type "weather" ! "vrijeme"]
        ] 
        typographicNames [
            styleName [#type "slnt" #subtype "-12" ! "nagnut ulijevo"] 
            styleName [#type "wght" #subtype "200" ! "ekstrasvijetao"] 
            styleName [#type "wght" #subtype "200" #alt "ultra" ! "ultrasvijetao"] 
            styleName [#type "wght" #subtype "300" ! "svijetao"] 
            styleName [#type "wght" #subtype "350" ! "polusvijetao"]
        ]
    ]

