
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "mai"]
        ] 
        localeDisplayNames [
            languages [
                language [#type "de" ! "जर्मन"] 
                language [#type "de_AT" ! "ऑस्ट्रियाई जर्मन"] 
                language [#type "de_CH" ! "स्विस उच्च जर्मन"] 
                language [#type "en" ! "अंग्रेज़ी"] 
                language [#type "en_AU" ! "ऑस्ट्रेलियाई अंग्रेज़ी"] 
                language [#type "en_CA" ! "कनाडाई अंग्रेज़ी"] 
                language [#type "en_GB" ! "ब्रिटिश अंग्रेज़ी"] 
                language [#type "en_GB" #alt "short" ! "यू॰के॰ अंग्रेज़ी"] 
                language [#type "en_US" ! "अमेरिकी अंग्रेज़ी"] 
                language [#type "en_US" #alt "short" ! "अमेरिकी अंग्रेज़ी"] 
                language [#type "es" ! "स्पेनिश"] 
                language [#type "es_419" ! "लैटिन अमेरिकी स्पेनिश"] 
                language [#type "es_ES" ! "यूरोपीय स्पेनिश"] 
                language [#type "es_MX" ! "मैक्सिकन स्पेनिश"] 
                language [#type "fr" ! "फ़्रेंच"] 
                language [#type "fr_CA" ! "कनाडाई फ़्रेंच"] 
                language [#type "fr_CH" ! "स्विस फ़्रेंच"] 
                language [#type "it" ! "इतालवी"] 
                language [#type "ja" ! "जापानी"] 
                language [#type "mai" ! "मैथिली"] 
                language [#type "pt" ! "पुर्तगाली"] 
                language [#type "pt_BR" ! "ब्राज़ीली पुर्तगाली"] 
                language [#type "pt_PT" ! "यूरोपीय पुर्तगाली"] 
                language [#type "ru" ! "रूसी"] 
                language [#type "und" ! "अज्ञात भाषा"] 
                language [#type "zh" ! "चीनी"] 
                language [#type "zh" #alt "menu" ! "चीनी, मैंडेरिन"] 
                language [#type "zh_Hans" ! "सरलीकृत चीनी"] 
                language [#type "zh_Hans" #alt "long" ! "सरलीकृत मैंडेरिन चीनी"] 
                language [#type "zh_Hant" ! "पारंपरिक चीनी"] 
                language [#type "zh_Hant" #alt "long" ! "पारंपरिक मैंडेरिन चीनी"]
            ] 
            scripts [
                script [#type "Arab" ! "अरबी"] 
                script [#type "Cyrl" ! "सिरिलिक"] 
                script [#type "Deva" ! "देवनागरी"] 
                script [#type "Hans" ! "सरलीकृत"] 
                script [#type "Hans" #alt "stand-alone" ! "सरलीकृत हान"] 
                script [#type "Hant" ! "पारंपरिक"] 
                script [#type "Hant" #alt "stand-alone" ! "पारंपरिक हान"] 
                script [#type "Latn" ! "लैटिन"] 
                script [#type "Zxxx" ! "अलिखित"] 
                script [#type "Zzzz" ! "अज्ञात लिपि"]
            ] 
            territories [
                territory [#type "BR" ! "ब्राज़ील"] 
                territory [#type "CN" ! "चीन"] 
                territory [#type "DE" ! "जर्मनी"] 
                territory [#type "FR" ! "फ़्रांस"] 
                territory [#type "GB" ! "यूनाइटेड किंगडम"] 
                territory [#type "IN" ! "भारत"] 
                territory [#type "IT" ! "इटली"] 
                territory [#type "JP" ! "जापान"] 
                territory [#type "RU" ! "रूस"] 
                territory [#type "US" ! "संयुक्त राज्य"] 
                territory [#type "ZZ" ! "अज्ञात क्षेत्र"]
            ] 
            types [
                type [#key "calendar" #type "gregorian" ! "ग्रेगोरियन कैलेंडर"] 
                type [#key "collation" #type "standard" ! "मानक सॉर्ट क्रम"] 
                type [#key "numbers" #type "deva" ! "देवनागरी अंक"] 
                type [#key "numbers" #type "latn" ! "पश्चिमी अंक"]
            ] 
            measurementSystemNames [
                measurementSystemName [#type "metric" ! "मीट्रिक"] 
                measurementSystemName [#type "UK" ! "यूके"] 
                measurementSystemName [#type "US" ! "यूएस"]
            ] 
            codePatterns [
                codePattern [#type "language" ! "भाषा: {0}"] 
                codePattern [#type "script" ! "लिपि: {0}"] 
                codePattern [#type "territory" ! "क्षेत्र: {0}"]
            ]
        ] 
        characters [
            exemplarCharacters [! {[\u093C \u0902 ः क {क\u094Dष} ख ग घ च छ ज {ज\u094Dञ} झ ञ ट ठ ड {ड\u0902} ढ ण त {त\u094Dर} थ द ध न प फ ब भ म य र ल व श {श\u094Dर} ष स ह ा ि ी \u0941 \u0942 \u0947 \u0948 ो ौ]}] 
            exemplarCharacters [#type "auxiliary" ! "[अ {अ\u0902} {अः} आ इ ई उ ऊ ऋ ऌ ॡ ए ऐ ओ औ]"] 
            exemplarCharacters [#type "index" ! {[\u093C अ {अ\u0902} {अः} आ इ ई उ ऊ ऋ ऌ ॡ ए ऐ ओ औ क {क\u094Dष} ख ग घ च छ ज {ज\u094Dञ} झ ञ ट ठ ड {ड\u0902} ढ ण त {त\u094Dर} थ द ध न प फ ब भ म य र ल व श {श\u094Dर} ष स ह]}] 
            exemplarCharacters [#type "punctuation" ! {[_ \- ‑ – — , ; \: ! ? . … ' ‘ ’ &quot; “ ” ( ) \[ \] \{ \} § @ * / \\ \&amp; # ′ ″ ` + | ~]}]
        ] 
        dates [
            calendars [
                calendar [
                    #type "generic" 
                    dateFormats [
                        dateFormatLength [
                            #type "full" 
                            dateFormat [
                                pattern [! "G EEEE, d MMMM y"] 
                                datetimeSkeleton [! "GyMMMMEEEEd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "long" 
                            dateFormat [
                                pattern [! "G d MMMM y"] 
                                datetimeSkeleton [! "GyMMMMd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "medium" 
                            dateFormat [
                                pattern [! "G d MMM y"] 
                                datetimeSkeleton [! "GyMMMd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "G d/M/y"] 
                                datetimeSkeleton [! "GyMd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        dateTimeFormatLength [
                            #type "full" 
                            dateTimeFormat [
                                pattern [! "{1} के {0}"]
                            ]
                        ] 
                        dateTimeFormatLength [
                            #type "long" 
                            dateTimeFormat [
                                pattern [! "{1} के {0}"]
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
                    ]
                ] 
                calendar [
                    #type "gregorian" 
                    months [
                        monthContext [
                            #type "format" 
                            monthWidth [
                                #type "abbreviated" 
                                month [#type "1" ! "जन॰"] 
                                month [#type "2" ! "फ़र॰"] 
                                month [#type "3" ! "मार्च"] 
                                month [#type "4" ! "अप्रैल"] 
                                month [#type "5" ! "मई"] 
                                month [#type "6" ! "जून"] 
                                month [#type "7" ! "जुल॰"] 
                                month [#type "8" ! "अग॰"] 
                                month [#type "9" ! "सित॰"] 
                                month [#type "10" ! "अक्तू॰"] 
                                month [#type "11" ! "नव॰"] 
                                month [#type "12" ! "दिस॰"]
                            ] 
                            monthWidth [
                                #type "narrow" 
                                month [#type "1" ! "ज"] 
                                month [#type "2" ! "फ"] 
                                month [#type "3" ! "मा"] 
                                month [#type "4" ! "अ"] 
                                month [#type "5" ! "म"] 
                                month [#type "6" ! "जू"] 
                                month [#type "7" ! "जु"] 
                                month [#type "8" ! "अ"] 
                                month [#type "9" ! "सि"] 
                                month [#type "10" ! "अ"] 
                                month [#type "11" ! "न"] 
                                month [#type "12" ! "दि"]
                            ] 
                            monthWidth [
                                #type "wide" 
                                month [#type "1" ! "जनवरी"] 
                                month [#type "2" ! "फरवरी"] 
                                month [#type "3" ! "मार्च"] 
                                month [#type "4" ! "अप्रैल"] 
                                month [#type "5" ! "मई"] 
                                month [#type "6" ! "जून"] 
                                month [#type "7" ! "जुलाई"] 
                                month [#type "8" ! "अगस्त"] 
                                month [#type "9" ! "सितंबर"] 
                                month [#type "10" ! "अक्तूबर"] 
                                month [#type "11" ! "नवंबर"] 
                                month [#type "12" ! "दिसंबर"]
                            ]
                        ] 
                        monthContext [
                            #type "stand-alone" 
                            monthWidth [
                                #type "abbreviated" 
                                month [#type "1" ! "जन॰"] 
                                month [#type "2" ! "फर॰"] 
                                month [#type "3" ! "मार्च"] 
                                month [#type "4" ! "अप्रैल"] 
                                month [#type "5" ! "मई"] 
                                month [#type "6" ! "जून"] 
                                month [#type "7" ! "जुल॰"] 
                                month [#type "8" ! "अग॰"] 
                                month [#type "9" ! "सित॰"] 
                                month [#type "10" ! "अक्तू॰"] 
                                month [#type "11" ! "नव॰"] 
                                month [#type "12" ! "दिस॰"]
                            ] 
                            monthWidth [
                                #type "narrow" 
                                month [#type "1" ! "ज"] 
                                month [#type "2" ! "फ"] 
                                month [#type "3" ! "मा"] 
                                month [#type "4" ! "अ"] 
                                month [#type "5" ! "म"] 
                                month [#type "6" ! "जू"] 
                                month [#type "7" ! "जु"] 
                                month [#type "8" ! "अ"] 
                                month [#type "9" ! "सि"] 
                                month [#type "10" ! "अ"] 
                                month [#type "11" ! "न"] 
                                month [#type "12" ! "दि"]
                            ] 
                            monthWidth [
                                #type "wide" 
                                month [#type "1" ! "जनवरी"] 
                                month [#type "2" ! "फरवरी"] 
                                month [#type "3" ! "मार्च"] 
                                month [#type "4" ! "अप्रैल"] 
                                month [#type "5" ! "मई"] 
                                month [#type "6" ! "जून"] 
                                month [#type "7" ! "जुलाई"] 
                                month [#type "8" ! "अगस्त"] 
                                month [#type "9" ! "सितंबर"] 
                                month [#type "10" ! "अक्टूबर"] 
                                month [#type "11" ! "नवंबर"] 
                                month [#type "12" ! "दिसंबर"]
                            ]
                        ]
                    ] 
                    days [
                        dayContext [
                            #type "format" 
                            dayWidth [
                                #type "abbreviated" 
                                day [#type "sun" ! "रवि"] 
                                day [#type "mon" ! "सोम"] 
                                day [#type "tue" ! "मंगल"] 
                                day [#type "wed" ! "बुध"] 
                                day [#type "thu" ! "गुरु"] 
                                day [#type "fri" ! "शुक्र"] 
                                day [#type "sat" ! "शनि"]
                            ] 
                            dayWidth [
                                #type "narrow" 
                                day [#type "sun" ! "र"] 
                                day [#type "mon" ! "सो"] 
                                day [#type "tue" ! "मं"] 
                                day [#type "wed" ! "बु"] 
                                day [#type "thu" ! "गु"] 
                                day [#type "fri" ! "शु"] 
                                day [#type "sat" ! "श"]
                            ] 
                            dayWidth [
                                #type "wide" 
                                day [#type "sun" ! "रवि दिन"] 
                                day [#type "mon" ! "सोम दिन"] 
                                day [#type "tue" ! "मंगल दिन"] 
                                day [#type "wed" ! "बुध दिन"] 
                                day [#type "thu" ! "बृहस्पति दिन"] 
                                day [#type "fri" ! "शुक्र दिन"] 
                                day [#type "sat" ! "शनि दिन"]
                            ]
                        ] 
                        dayContext [
                            #type "stand-alone" 
                            dayWidth [
                                #type "abbreviated" 
                                day [#type "sun" ! "रवि"] 
                                day [#type "mon" ! "सोम"] 
                                day [#type "tue" ! "मंगल"] 
                                day [#type "wed" ! "बुध"] 
                                day [#type "thu" ! "गुरु"] 
                                day [#type "fri" ! "शुक्र"] 
                                day [#type "sat" ! "शनि"]
                            ] 
                            dayWidth [
                                #type "narrow" 
                                day [#type "sun" ! "र"] 
                                day [#type "mon" ! "सो"] 
                                day [#type "tue" ! "मं"] 
                                day [#type "wed" ! "बु"] 
                                day [#type "thu" ! "गु"] 
                                day [#type "fri" ! "शु"] 
                                day [#type "sat" ! "श"]
                            ] 
                            dayWidth [
                                #type "wide" 
                                day [#type "sun" ! "रवि दिन"] 
                                day [#type "mon" ! "सोम दिन"] 
                                day [#type "tue" ! "मंगल दिन"] 
                                day [#type "wed" ! "बुध दिन"] 
                                day [#type "thu" ! "बृहस्पति दिन"] 
                                day [#type "fri" ! "शुक्र दिन"] 
                                day [#type "sat" ! "शनि दिन"]
                            ]
                        ]
                    ] 
                    quarters [
                        quarterContext [
                            #type "format" 
                            quarterWidth [
                                #type "abbreviated" 
                                quarter [#type "1" ! "ति1"] 
                                quarter [#type "2" ! "ति2"] 
                                quarter [#type "3" ! "ति3"] 
                                quarter [#type "4" ! "ति4"]
                            ] 
                            quarterWidth [
                                #type "wide" 
                                quarter [#type "1" ! "पहिल तिमाही"] 
                                quarter [#type "2" ! "दोसर तिमाही"] 
                                quarter [#type "3" ! "तेसर तिमाही"] 
                                quarter [#type "4" ! "चारिम तिमाही"]
                            ]
                        ] 
                        quarterContext [
                            #type "stand-alone" 
                            quarterWidth [
                                #type "abbreviated" 
                                quarter [#type "1" ! "ति1"] 
                                quarter [#type "2" ! "ति2"] 
                                quarter [#type "3" ! "ति3"] 
                                quarter [#type "4" ! "ति4"]
                            ] 
                            quarterWidth [
                                #type "wide" 
                                quarter [#type "1" ! "पहिल तिमाही"] 
                                quarter [#type "2" ! "दोसर तिमाही"] 
                                quarter [#type "3" ! "तेसर तिमाही"] 
                                quarter [#type "4" ! "चारिम तिमाही"]
                            ]
                        ]
                    ] 
                    dayPeriods [
                        dayPeriodContext [
                            #type "format" 
                            dayPeriodWidth [
                                #type "wide" 
                                dayPeriod [#type "am" ! "भोर"] 
                                dayPeriod [#type "pm" ! "सांझ"]
                            ]
                        ]
                    ] 
                    eras [
                        eraAbbr [
                            era [#type "0" ! "ईसा-पूर्व"] 
                            era [#type "0" #alt "variant" ! "ईसवी पूर्व"] 
                            era [#type "1" ! "ईसवी"]
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
                                pattern [! "{1} के {0}"]
                            ]
                        ] 
                        dateTimeFormatLength [
                            #type "long" 
                            dateTimeFormat [
                                pattern [! "{1} के {0}"]
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
                            dateFormatItem [#id "Bh" ! "B h"] 
                            dateFormatItem [#id "Bhm" ! "B h:mm"] 
                            dateFormatItem [#id "Bhms" ! "B h:mm:ss"] 
                            dateFormatItem [#id "EBhm" ! "E B h:mm"] 
                            dateFormatItem [#id "EBhms" ! "E B h:mm:ss"] 
                            dateFormatItem [#id "Ed" ! "E d"] 
                            dateFormatItem [#id "Gy" ! "y G"] 
                            dateFormatItem [#id "GyMd" ! "dd-MM-y"] 
                            dateFormatItem [#id "GyMMM" ! "MMM G y"] 
                            dateFormatItem [#id "GyMMMd" ! "d MMM y G"] 
                            dateFormatItem [#id "GyMMMEd" ! "E, MMM d, y G"] 
                            dateFormatItem [#id "Md" ! "d/M"] 
                            dateFormatItem [#id "MEd" ! "E, d/M"] 
                            dateFormatItem [#id "MMMd" ! "d MMM"] 
                            dateFormatItem [#id "MMMEd" ! "E, d MMM"] 
                            dateFormatItem [#id "MMMMd" ! "d MMMM"] 
                            dateFormatItem [#id "yM" ! "M/y"] 
                            dateFormatItem [#id "yMd" ! "d/M/y"] 
                            dateFormatItem [#id "yMEd" ! "E, d/M/y"] 
                            dateFormatItem [#id "yMMM" ! "MMM y"] 
                            dateFormatItem [#id "yMMMd" ! "d MMM y"] 
                            dateFormatItem [#id "yMMMEd" ! "E, d MMM y"] 
                            dateFormatItem [#id "yMMMM" ! "MMMM y"] 
                            dateFormatItem [#id "yQQQ" ! "QQQ y"] 
                            dateFormatItem [#id "yQQQQ" ! "QQQQ y"]
                        ]
                    ]
                ]
            ] 
            fields [
                field [
                    #type "era" 
                    displayName [! "युग"]
                ] 
                field [
                    #type "year" 
                    displayName [! "वर्ष"]
                ] 
                field [
                    #type "year-short" 
                    displayName [! "वर्ष"]
                ] 
                field [
                    #type "year-narrow" 
                    displayName [! "वर्ष"]
                ] 
                field [
                    #type "quarter" 
                    displayName [! "तिमाही"]
                ] 
                field [
                    #type "quarter-short" 
                    displayName [! "तिमाही"]
                ] 
                field [
                    #type "quarter-narrow" 
                    displayName [! "तिमाही"]
                ] 
                field [
                    #type "month" 
                    displayName [! "महीना"]
                ] 
                field [
                    #type "month-short" 
                    displayName [! "मास"]
                ] 
                field [
                    #type "month-narrow" 
                    displayName [! "मास"]
                ] 
                field [
                    #type "week" 
                    displayName [! "सप्ताह"]
                ] 
                field [
                    #type "week-short" 
                    displayName [! "सप्ताह"]
                ] 
                field [
                    #type "week-narrow" 
                    displayName [! "सप्ताह"]
                ] 
                field [
                    #type "day" 
                    displayName [! "दिन"] 
                    relative [#type "-1" ! "काल्हिक दिन"] 
                    relative [#type "0" ! "आजुक दिन"] 
                    relative [#type "1" ! "काल्हिक दिन"]
                ] 
                field [
                    #type "day-short" 
                    displayName [! "दिन"] 
                    relative [#type "-1" ! "बीतल काल्हि"] 
                    relative [#type "0" ! "आजुक दिन"] 
                    relative [#type "1" ! "आबय वला काल्हि"]
                ] 
                field [
                    #type "day-narrow" 
                    displayName [! "दिन"] 
                    relative [#type "-1" ! "बीतल काल्हि"] 
                    relative [#type "0" ! "आजुक दिन"] 
                    relative [#type "1" ! "आबय वला काल्हि"]
                ] 
                field [
                    #type "weekday" 
                    displayName [! "सप्ताहक दिन"]
                ] 
                field [
                    #type "dayperiod" 
                    displayName [! "पूर्वाह्न/अपराह्न"]
                ] 
                field [
                    #type "hour" 
                    displayName [! "घंटा"]
                ] 
                field [
                    #type "minute" 
                    displayName [! "मिनट"]
                ] 
                field [
                    #type "second" 
                    displayName [! "सेकंड"]
                ] 
                field [
                    #type "zone" 
                    displayName [! "समय क्षेत्र"]
                ]
            ] 
            timeZoneNames [
                regionFormat [! "{0} समय"] 
                regionFormat [#type "daylight" ! "{0} डेलाइट समय"] 
                regionFormat [#type "standard" ! "{0} मानक समय"] 
                zone [
                    #type "Etc/UTC" 
                    long [
                        standard [! "समन्वित वैश्विक समय"]
                    ]
                ] 
                zone [
                    #type "Etc/Unknown" 
                    exemplarCity [! "अज्ञात शहर"]
                ] 
                metazone [
                    #type "America_Central" 
                    long [
                        generic [! "उत्तरी अमेरिकी केंद्रीय समय"] 
                        standard [! "उत्तरी अमेरिकी केंद्रीय मानक समय"] 
                        daylight [! "उत्तरी अमेरिकी केंद्रीय डेलाइट समय"]
                    ]
                ] 
                metazone [
                    #type "America_Eastern" 
                    long [
                        generic [! "उत्तरी अमेरिकी पूर्वी समय"] 
                        standard [! "उत्तरी अमेरिकी पूर्वी मानक समय"] 
                        daylight [! "उत्तरी अमेरिकी पूर्वी डेलाइट समय"]
                    ]
                ] 
                metazone [
                    #type "America_Mountain" 
                    long [
                        generic [! "उत्तरी अमेरिकी माउंटेन समय"] 
                        standard [! "उत्तरी अमेरिकी माउंटेन मानक समय"] 
                        daylight [! "उत्तरी अमेरिकी माउंटेन डेलाइट समय"]
                    ]
                ] 
                metazone [
                    #type "America_Pacific" 
                    long [
                        generic [! "उत्तरी अमेरिकी प्रशांत समय"] 
                        standard [! "उत्तरी अमेरिकी प्रशांत मानक समय"] 
                        daylight [! "उत्तरी अमेरिकी प्रशांत डेलाइट समय"]
                    ]
                ] 
                metazone [
                    #type "Atlantic" 
                    long [
                        generic [! "अटलांटिक समय"] 
                        standard [! "अटलांटिक मानक समय"] 
                        daylight [! "अटलांटिक डेलाइट समय"]
                    ]
                ] 
                metazone [
                    #type "Europe_Central" 
                    long [
                        generic [! "मध्य यूरोपीय समय"] 
                        standard [! "मध्य यूरोपीय मानक समय"] 
                        daylight [! "मध्‍य यूरोपीय ग्रीष्‍मकालीन समय"]
                    ]
                ] 
                metazone [
                    #type "Europe_Eastern" 
                    long [
                        generic [! "पूर्वी यूरोपीय समय"] 
                        standard [! "पूर्वी यूरोपीय मानक समय"] 
                        daylight [! "पूर्वी यूरोपीय ग्रीष्मकालीन समय"]
                    ]
                ] 
                metazone [
                    #type "Europe_Western" 
                    long [
                        generic [! "पश्चिमी यूरोपीय समय"] 
                        standard [! "पश्चिमी यूरोपीय मानक समय"] 
                        daylight [! "पश्चिमी यूरोपीय ग्रीष्‍मकालीन समय"]
                    ]
                ] 
                metazone [
                    #type "GMT" 
                    long [
                        standard [! "ग्रीनविच मीन टाइम"]
                    ]
                ]
            ]
        ] 
        numbers [
            otherNumberingSystems [
                native [#draft "contributed" ! "deva"]
            ] 
            scientificFormats [
                #numberSystem "latn" 
                scientificFormatLength [
                    scientificFormat [
                        pattern [! "[#E0]"]
                    ]
                ]
            ] 
            currencies [
                currency [
                    #type "BRL" 
                    displayName [! "ब्राज़ीली रियाल"] 
                    displayName [#count "other" ! "ब्राज़ीली रियाल"]
                ] 
                currency [
                    #type "CNY" 
                    displayName [! "चीनी युआन"] 
                    displayName [#count "other" ! "चीनी युआन"]
                ] 
                currency [
                    #type "EUR" 
                    displayName [! "यूरो"] 
                    displayName [#count "other" ! "यूरो"]
                ] 
                currency [
                    #type "GBP" 
                    displayName [! "ब्रिटिश पाउंड स्टर्लिंग"] 
                    displayName [#count "other" ! "ब्रिटिश पाउंड स्टर्लिंग"]
                ] 
                currency [
                    #type "INR" 
                    displayName [! "भारतीय रुपया"] 
                    displayName [#count "other" ! "भारतीय रुपया"] 
                    symbol [#draft "contributed" ! "₹"] 
                    symbol [#alt "narrow" #draft "contributed" ! "₹"]
                ] 
                currency [
                    #type "JPY" 
                    displayName [! "जापानी येन"] 
                    displayName [#count "other" ! "जापानी येन"]
                ] 
                currency [
                    #type "RUB" 
                    displayName [! "रूसी रूबल"] 
                    displayName [#count "other" ! "रूसी रूबल"]
                ] 
                currency [
                    #type "USD" 
                    displayName [! "यूएस डॉलर"] 
                    displayName [#count "other" ! "यूएस डॉलर"] 
                    symbol [#draft "contributed" ! "$"] 
                    symbol [#alt "narrow" #draft "contributed" ! "$"]
                ] 
                currency [
                    #type "XXX" 
                    displayName [! "अज्ञात मुद्रा"] 
                    displayName [#count "other" ! "(अज्ञात मुद्रा)"]
                ]
            ]
        ] 
        listPatterns [
            listPattern [
                listPatternPart [#type "end" ! "{0}, और {1}"] 
                listPatternPart [#type "2" ! "{0} और {1}"]
            ]
        ] 
        posix [
            messages [
                yesstr [! "हं"] 
                nostr [! "नहि"]
            ]
        ]
    ]

