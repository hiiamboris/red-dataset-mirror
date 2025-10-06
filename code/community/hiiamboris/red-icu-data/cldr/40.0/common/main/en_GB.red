
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "en"] 
            territory [#type "GB"]
        ] 
        localeDisplayNames [
            languages [
                language [#type "ar_001" ! "Modern Standard Arabic"] 
                language [#type "de_AT" ! "Austrian German"] 
                language [#type "de_CH" ! "Swiss High German"] 
                language [#type "en_AU" ! "Australian English"] 
                language [#type "en_CA" ! "Canadian English"] 
                language [#type "en_GB" ! "British English"] 
                language [#type "en_GB" #alt "short" ! "UK English"] 
                language [#type "en_US" ! "American English"] 
                language [#type "en_US" #alt "short" ! "US English"] 
                language [#type "es_419" ! "Latin American Spanish"] 
                language [#type "es_ES" ! "European Spanish"] 
                language [#type "es_MX" ! "Mexican Spanish"] 
                language [#type "fa_AF" ! "Dari"] 
                language [#type "fr_CA" ! "Canadian French"] 
                language [#type "fr_CH" ! "Swiss French"] 
                language [#type "nds_NL" ! "West Low German"] 
                language [#type "nl_BE" ! "Flemish"] 
                language [#type "pt_BR" ! "Brazilian Portuguese"] 
                language [#type "pt_PT" ! "European Portuguese"] 
                language [#type "ro_MD" ! "Moldavian"] 
                language [#type "sw_CD" ! "Congo Swahili"] 
                language [#type "zh_Hans" ! "Simplified Chinese"] 
                language [#type "zh_Hans" #alt "long" ! "Simplified Mandarin Chinese"] 
                language [#type "zh_Hant" ! "Traditional Chinese"] 
                language [#type "zh_Hant" #alt "long" ! "Traditional Mandarin Chinese"]
            ] 
            territories [
                territory [#type "BL" ! "St Barthélemy"] 
                territory [#type "KN" ! "St Kitts &amp; Nevis"] 
                territory [#type "LC" ! "St Lucia"] 
                territory [#type "MF" ! "St Martin"] 
                territory [#type "PM" ! "St Pierre &amp; Miquelon"] 
                territory [#type "SH" ! "St Helena"] 
                territory [#type "VC" ! "St Vincent &amp; the Grenadines"]
            ]
        ] 
        dates [
            calendars [
                calendar [
                    #type "generic" 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "MEd" ! "E dd/MM"] 
                            dateFormatItem [#id "MMMEd" ! "E d MMM"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" ! "dd/MM–dd/MM"] 
                                greatestDifference [#id "M" ! "dd/MM–dd/MM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" ! "E d MMM – E d MMM"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" ! "E, d MMM – E, d MMM y G"]
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
                                #type "narrow" 
                                month [#type "1" ! "J"] 
                                month [#type "2" ! "F"] 
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
                        ] 
                        monthContext [
                            #type "stand-alone" 
                            monthWidth [
                                #type "abbreviated" 
                                month [#type "1" ! "Jan"] 
                                month [#type "2" ! "Feb"] 
                                month [#type "3" ! "Mar"] 
                                month [#type "4" ! "Apr"] 
                                month [#type "5" ! "May"] 
                                month [#type "6" ! "Jun"] 
                                month [#type "7" ! "Jul"] 
                                month [#type "8" ! "Aug"] 
                                month [#type "9" ! "Sept"] 
                                month [#type "10" ! "Oct"] 
                                month [#type "11" ! "Nov"] 
                                month [#type "12" ! "Dec"]
                            ] 
                            monthWidth [
                                #type "wide" 
                                month [#type "1" ! "January"] 
                                month [#type "2" ! "February"] 
                                month [#type "3" ! "March"] 
                                month [#type "4" ! "April"] 
                                month [#type "5" ! "May"] 
                                month [#type "6" ! "June"] 
                                month [#type "7" ! "July"] 
                                month [#type "8" ! "August"] 
                                month [#type "9" ! "September"] 
                                month [#type "10" ! "October"] 
                                month [#type "11" ! "November"] 
                                month [#type "12" ! "December"]
                            ]
                        ]
                    ] 
                    days [
                        dayContext [
                            #type "format" 
                            dayWidth [
                                #type "narrow" 
                                day [#type "sun" ! "S"] 
                                day [#type "mon" ! "M"] 
                                day [#type "tue" ! "T"] 
                                day [#type "wed" ! "W"] 
                                day [#type "thu" ! "T"] 
                                day [#type "fri" ! "F"] 
                                day [#type "sat" ! "S"]
                            ]
                        ] 
                        dayContext [
                            #type "stand-alone" 
                            dayWidth [
                                #type "abbreviated" 
                                day [#type "sun" ! "Sun"] 
                                day [#type "mon" ! "Mon"] 
                                day [#type "tue" ! "Tue"] 
                                day [#type "wed" ! "Wed"] 
                                day [#type "thu" ! "Thu"] 
                                day [#type "fri" ! "Fri"] 
                                day [#type "sat" ! "Sat"]
                            ] 
                            dayWidth [
                                #type "short" 
                                day [#type "sun" ! "Su"] 
                                day [#type "mon" ! "Mo"] 
                                day [#type "tue" ! "Tu"] 
                                day [#type "wed" ! "We"] 
                                day [#type "thu" ! "Th"] 
                                day [#type "fri" ! "Fr"] 
                                day [#type "sat" ! "Sa"]
                            ] 
                            dayWidth [
                                #type "wide" 
                                day [#type "sun" ! "Sunday"] 
                                day [#type "mon" ! "Monday"] 
                                day [#type "tue" ! "Tuesday"] 
                                day [#type "wed" ! "Wednesday"] 
                                day [#type "thu" ! "Thursday"] 
                                day [#type "fri" ! "Friday"] 
                                day [#type "sat" ! "Saturday"]
                            ]
                        ]
                    ] 
                    quarters [
                        quarterContext [
                            #type "format" 
                            quarterWidth [
                                #type "narrow" 
                                quarter [#type "1" ! "1"] 
                                quarter [#type "2" ! "2"] 
                                quarter [#type "3" ! "3"] 
                                quarter [#type "4" ! "4"]
                            ]
                        ] 
                        quarterContext [
                            #type "stand-alone" 
                            quarterWidth [
                                #type "abbreviated" 
                                quarter [#type "1" ! "Q1"] 
                                quarter [#type "2" ! "Q2"] 
                                quarter [#type "3" ! "Q3"] 
                                quarter [#type "4" ! "Q4"]
                            ] 
                            quarterWidth [
                                #type "wide" 
                                quarter [#type "1" ! "1st quarter"] 
                                quarter [#type "2" ! "2nd quarter"] 
                                quarter [#type "3" ! "3rd quarter"] 
                                quarter [#type "4" ! "4th quarter"]
                            ]
                        ]
                    ] 
                    dayPeriods [
                        dayPeriodContext [
                            #type "stand-alone" 
                            dayPeriodWidth [
                                #type "narrow" 
                                dayPeriod [#type "midnight" ! "midnight"] 
                                dayPeriod [#type "noon" ! "noon"]
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
                                pattern [! "{1} 'at' {0}"]
                            ]
                        ] 
                        dateTimeFormatLength [
                            #type "long" 
                            dateTimeFormat [
                                pattern [! "{1} 'at' {0}"]
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
                            dateFormatItem [#id "EBhm" ! "E h:mm B"] 
                            dateFormatItem [#id "EBhms" ! "E h:mm:ss B"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" ! "E d MMM – E d MMM"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" ! "E, d MMM – E, d MMM y"]
                            ]
                        ]
                    ]
                ]
            ] 
            fields [
                field [
                    #type "year-narrow" 
                    displayName [! "yr"]
                ] 
                field [
                    #type "day-narrow" 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} day"] 
                        relativeTimePattern [#count "other" ! "in {0} days"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} day ago"] 
                        relativeTimePattern [#count "other" ! "{0} days ago"]
                    ]
                ] 
                field [
                    #type "hour-narrow" 
                    displayName [! "hr"]
                ] 
                field [
                    #type "second-narrow" 
                    displayName [! "sec"]
                ]
            ] 
            timeZoneNames [
                gmtZeroFormat [! "GMT"] 
                zone [
                    #type "Europe/Andorra" 
                    exemplarCity [! "Andorra"]
                ] 
                zone [
                    #type "Asia/Dubai" 
                    exemplarCity [! "Dubai"]
                ] 
                zone [
                    #type "Asia/Kabul" 
                    exemplarCity [! "Kabul"]
                ] 
                zone [
                    #type "America/Antigua" 
                    exemplarCity [! "Antigua"]
                ] 
                zone [
                    #type "America/Anguilla" 
                    exemplarCity [! "Anguilla"]
                ] 
                zone [
                    #type "Europe/Tirane" 
                    exemplarCity [! "Tirane"]
                ] 
                zone [
                    #type "Asia/Yerevan" 
                    exemplarCity [! "Yerevan"]
                ] 
                zone [
                    #type "Africa/Luanda" 
                    exemplarCity [! "Luanda"]
                ] 
                zone [
                    #type "Antarctica/Rothera" 
                    exemplarCity [! "Rothera"]
                ] 
                zone [
                    #type "Antarctica/Palmer" 
                    exemplarCity [! "Palmer"]
                ] 
                zone [
                    #type "Antarctica/Troll" 
                    exemplarCity [! "Troll"]
                ] 
                zone [
                    #type "Antarctica/Syowa" 
                    exemplarCity [! "Syowa"]
                ] 
                zone [
                    #type "Antarctica/Mawson" 
                    exemplarCity [! "Mawson"]
                ] 
                zone [
                    #type "Antarctica/Davis" 
                    exemplarCity [! "Davis"]
                ] 
                zone [
                    #type "Antarctica/Vostok" 
                    exemplarCity [! "Vostok"]
                ] 
                zone [
                    #type "Antarctica/Casey" 
                    exemplarCity [! "Casey"]
                ] 
                zone [
                    #type "Antarctica/McMurdo" 
                    exemplarCity [! "McMurdo"]
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
                    #type "Pacific/Pago_Pago" 
                    exemplarCity [! "Pago Pago"]
                ] 
                zone [
                    #type "Europe/Vienna" 
                    exemplarCity [! "Vienna"]
                ] 
                zone [
                    #type "Australia/Perth" 
                    exemplarCity [! "Perth"]
                ] 
                zone [
                    #type "Australia/Eucla" 
                    exemplarCity [! "Eucla"]
                ] 
                zone [
                    #type "Australia/Darwin" 
                    exemplarCity [! "Darwin"]
                ] 
                zone [
                    #type "Australia/Adelaide" 
                    exemplarCity [! "Adelaide"]
                ] 
                zone [
                    #type "Australia/Broken_Hill" 
                    exemplarCity [! "Broken Hill"]
                ] 
                zone [
                    #type "Australia/Melbourne" 
                    exemplarCity [! "Melbourne"]
                ] 
                zone [
                    #type "Australia/Currie" 
                    exemplarCity [! "Currie"]
                ] 
                zone [
                    #type "Australia/Hobart" 
                    exemplarCity [! "Hobart"]
                ] 
                zone [
                    #type "Australia/Lindeman" 
                    exemplarCity [! "Lindeman"]
                ] 
                zone [
                    #type "Australia/Sydney" 
                    exemplarCity [! "Sydney"]
                ] 
                zone [
                    #type "Australia/Brisbane" 
                    exemplarCity [! "Brisbane"]
                ] 
                zone [
                    #type "Antarctica/Macquarie" 
                    exemplarCity [! "Macquarie"]
                ] 
                zone [
                    #type "Australia/Lord_Howe" 
                    exemplarCity [! "Lord Howe"]
                ] 
                zone [
                    #type "America/Aruba" 
                    exemplarCity [! "Aruba"]
                ] 
                zone [
                    #type "Europe/Mariehamn" 
                    exemplarCity [! "Mariehamn"]
                ] 
                zone [
                    #type "Asia/Baku" 
                    exemplarCity [! "Baku"]
                ] 
                zone [
                    #type "Europe/Sarajevo" 
                    exemplarCity [! "Sarajevo"]
                ] 
                zone [
                    #type "America/Barbados" 
                    exemplarCity [! "Barbados"]
                ] 
                zone [
                    #type "Asia/Dhaka" 
                    exemplarCity [! "Dhaka"]
                ] 
                zone [
                    #type "Europe/Brussels" 
                    exemplarCity [! "Brussels"]
                ] 
                zone [
                    #type "Africa/Ouagadougou" 
                    exemplarCity [! "Ouagadougou"]
                ] 
                zone [
                    #type "Europe/Sofia" 
                    exemplarCity [! "Sofia"]
                ] 
                zone [
                    #type "Asia/Bahrain" 
                    exemplarCity [! "Bahrain"]
                ] 
                zone [
                    #type "Africa/Bujumbura" 
                    exemplarCity [! "Bujumbura"]
                ] 
                zone [
                    #type "Africa/Porto-Novo" 
                    exemplarCity [! "Porto-Novo"]
                ] 
                zone [
                    #type "Atlantic/Bermuda" 
                    exemplarCity [! "Bermuda"]
                ] 
                zone [
                    #type "Asia/Brunei" 
                    exemplarCity [! "Brunei"]
                ] 
                zone [
                    #type "America/La_Paz" 
                    exemplarCity [! "La Paz"]
                ] 
                zone [
                    #type "America/Kralendijk" 
                    exemplarCity [! "Kralendijk"]
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
                    #type "America/Nassau" 
                    exemplarCity [! "Nassau"]
                ] 
                zone [
                    #type "Asia/Thimphu" 
                    exemplarCity [! "Thimphu"]
                ] 
                zone [
                    #type "Africa/Gaborone" 
                    exemplarCity [! "Gaborone"]
                ] 
                zone [
                    #type "Europe/Minsk" 
                    exemplarCity [! "Minsk"]
                ] 
                zone [
                    #type "America/Belize" 
                    exemplarCity [! "Belize"]
                ] 
                zone [
                    #type "America/Dawson" 
                    exemplarCity [! "Dawson"]
                ] 
                zone [
                    #type "America/Whitehorse" 
                    exemplarCity [! "Whitehorse"]
                ] 
                zone [
                    #type "America/Inuvik" 
                    exemplarCity [! "Inuvik"]
                ] 
                zone [
                    #type "America/Vancouver" 
                    exemplarCity [! "Vancouver"]
                ] 
                zone [
                    #type "America/Dawson_Creek" 
                    exemplarCity [! "Dawson Creek"]
                ] 
                zone [
                    #type "America/Creston" 
                    exemplarCity [! "Creston"]
                ] 
                zone [
                    #type "America/Yellowknife" 
                    exemplarCity [! "Yellowknife"]
                ] 
                zone [
                    #type "America/Edmonton" 
                    exemplarCity [! "Edmonton"]
                ] 
                zone [
                    #type "America/Swift_Current" 
                    exemplarCity [! "Swift Current"]
                ] 
                zone [
                    #type "America/Cambridge_Bay" 
                    exemplarCity [! "Cambridge Bay"]
                ] 
                zone [
                    #type "America/Regina" 
                    exemplarCity [! "Regina"]
                ] 
                zone [
                    #type "America/Winnipeg" 
                    exemplarCity [! "Winnipeg"]
                ] 
                zone [
                    #type "America/Resolute" 
                    exemplarCity [! "Resolute"]
                ] 
                zone [
                    #type "America/Rainy_River" 
                    exemplarCity [! "Rainy River"]
                ] 
                zone [
                    #type "America/Rankin_Inlet" 
                    exemplarCity [! "Rankin Inlet"]
                ] 
                zone [
                    #type "America/Coral_Harbour" 
                    exemplarCity [! "Atikokan"]
                ] 
                zone [
                    #type "America/Thunder_Bay" 
                    exemplarCity [! "Thunder Bay"]
                ] 
                zone [
                    #type "America/Nipigon" 
                    exemplarCity [! "Nipigon"]
                ] 
                zone [
                    #type "America/Toronto" 
                    exemplarCity [! "Toronto"]
                ] 
                zone [
                    #type "America/Iqaluit" 
                    exemplarCity [! "Iqaluit"]
                ] 
                zone [
                    #type "America/Pangnirtung" 
                    exemplarCity [! "Pangnirtung"]
                ] 
                zone [
                    #type "America/Moncton" 
                    exemplarCity [! "Moncton"]
                ] 
                zone [
                    #type "America/Halifax" 
                    exemplarCity [! "Halifax"]
                ] 
                zone [
                    #type "America/Goose_Bay" 
                    exemplarCity [! "Goose Bay"]
                ] 
                zone [
                    #type "America/Glace_Bay" 
                    exemplarCity [! "Glace Bay"]
                ] 
                zone [
                    #type "America/Blanc-Sablon" 
                    exemplarCity [! "Blanc-Sablon"]
                ] 
                zone [
                    #type "Indian/Cocos" 
                    exemplarCity [! "Cocos"]
                ] 
                zone [
                    #type "Africa/Kinshasa" 
                    exemplarCity [! "Kinshasa"]
                ] 
                zone [
                    #type "Africa/Lubumbashi" 
                    exemplarCity [! "Lubumbashi"]
                ] 
                zone [
                    #type "Africa/Bangui" 
                    exemplarCity [! "Bangui"]
                ] 
                zone [
                    #type "Africa/Brazzaville" 
                    exemplarCity [! "Brazzaville"]
                ] 
                zone [
                    #type "Europe/Zurich" 
                    exemplarCity [! "Zurich"]
                ] 
                zone [
                    #type "Africa/Abidjan" 
                    exemplarCity [! "Abidjan"]
                ] 
                zone [
                    #type "Pacific/Rarotonga" 
                    exemplarCity [! "Rarotonga"]
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
                    #type "Africa/Douala" 
                    exemplarCity [! "Douala"]
                ] 
                zone [
                    #type "Asia/Urumqi" 
                    exemplarCity [! "Urumqi"]
                ] 
                zone [
                    #type "Asia/Shanghai" 
                    exemplarCity [! "Shanghai"]
                ] 
                zone [
                    #type "America/Bogota" 
                    exemplarCity [! "Bogota"]
                ] 
                zone [
                    #type "America/Costa_Rica" 
                    exemplarCity [! "Costa Rica"]
                ] 
                zone [
                    #type "America/Havana" 
                    exemplarCity [! "Havana"]
                ] 
                zone [
                    #type "Atlantic/Cape_Verde" 
                    exemplarCity [! "Cape Verde"]
                ] 
                zone [
                    #type "Indian/Christmas" 
                    exemplarCity [! "Christmas"]
                ] 
                zone [
                    #type "Asia/Nicosia" 
                    exemplarCity [! "Nicosia"]
                ] 
                zone [
                    #type "Europe/Prague" 
                    exemplarCity [! "Prague"]
                ] 
                zone [
                    #type "Europe/Busingen" 
                    exemplarCity [! "Busingen"]
                ] 
                zone [
                    #type "Europe/Berlin" 
                    exemplarCity [! "Berlin"]
                ] 
                zone [
                    #type "Africa/Djibouti" 
                    exemplarCity [! "Djibouti"]
                ] 
                zone [
                    #type "Europe/Copenhagen" 
                    exemplarCity [! "Copenhagen"]
                ] 
                zone [
                    #type "America/Dominica" 
                    exemplarCity [! "Dominica"]
                ] 
                zone [
                    #type "America/Santo_Domingo" 
                    exemplarCity [! "Santo Domingo"]
                ] 
                zone [
                    #type "Africa/Algiers" 
                    exemplarCity [! "Algiers"]
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
                    #type "Europe/Tallinn" 
                    exemplarCity [! "Tallinn"]
                ] 
                zone [
                    #type "Africa/Cairo" 
                    exemplarCity [! "Cairo"]
                ] 
                zone [
                    #type "Africa/El_Aaiun" 
                    exemplarCity [! "El Aaiun"]
                ] 
                zone [
                    #type "Africa/Asmera" 
                    exemplarCity [! "Asmara"]
                ] 
                zone [
                    #type "Atlantic/Canary" 
                    exemplarCity [! "Canary"]
                ] 
                zone [
                    #type "Africa/Ceuta" 
                    exemplarCity [! "Ceuta"]
                ] 
                zone [
                    #type "Europe/Madrid" 
                    exemplarCity [! "Madrid"]
                ] 
                zone [
                    #type "Africa/Addis_Ababa" 
                    exemplarCity [! "Addis Ababa"]
                ] 
                zone [
                    #type "Europe/Helsinki" 
                    exemplarCity [! "Helsinki"]
                ] 
                zone [
                    #type "Pacific/Fiji" 
                    exemplarCity [! "Fiji"]
                ] 
                zone [
                    #type "Atlantic/Stanley" 
                    exemplarCity [! "Stanley"]
                ] 
                zone [
                    #type "Pacific/Truk" 
                    exemplarCity [! "Chuuk"]
                ] 
                zone [
                    #type "Pacific/Ponape" 
                    exemplarCity [! "Pohnpei"]
                ] 
                zone [
                    #type "Pacific/Kosrae" 
                    exemplarCity [! "Kosrae"]
                ] 
                zone [
                    #type "Atlantic/Faeroe" 
                    exemplarCity [! "Faroe"]
                ] 
                zone [
                    #type "Europe/Paris" 
                    exemplarCity [! "Paris"]
                ] 
                zone [
                    #type "Africa/Libreville" 
                    exemplarCity [! "Libreville"]
                ] 
                zone [
                    #type "Europe/London" 
                    short [
                        daylight [! "BST"]
                    ] 
                    exemplarCity [! "London"]
                ] 
                zone [
                    #type "America/Grenada" 
                    exemplarCity [! "Grenada"]
                ] 
                zone [
                    #type "Asia/Tbilisi" 
                    exemplarCity [! "Tbilisi"]
                ] 
                zone [
                    #type "America/Cayenne" 
                    exemplarCity [! "Cayenne"]
                ] 
                zone [
                    #type "Europe/Guernsey" 
                    exemplarCity [! "Guernsey"]
                ] 
                zone [
                    #type "Africa/Accra" 
                    exemplarCity [! "Accra"]
                ] 
                zone [
                    #type "Europe/Gibraltar" 
                    exemplarCity [! "Gibraltar"]
                ] 
                zone [
                    #type "America/Thule" 
                    exemplarCity [! "Thule"]
                ] 
                zone [
                    #type "America/Godthab" 
                    exemplarCity [! "Nuuk"]
                ] 
                zone [
                    #type "America/Scoresbysund" 
                    exemplarCity [! "Ittoqqortoormiit"]
                ] 
                zone [
                    #type "America/Danmarkshavn" 
                    exemplarCity [! "Danmarkshavn"]
                ] 
                zone [
                    #type "Africa/Banjul" 
                    exemplarCity [! "Banjul"]
                ] 
                zone [
                    #type "Africa/Conakry" 
                    exemplarCity [! "Conakry"]
                ] 
                zone [
                    #type "America/Guadeloupe" 
                    exemplarCity [! "Guadeloupe"]
                ] 
                zone [
                    #type "Africa/Malabo" 
                    exemplarCity [! "Malabo"]
                ] 
                zone [
                    #type "Europe/Athens" 
                    exemplarCity [! "Athens"]
                ] 
                zone [
                    #type "Atlantic/South_Georgia" 
                    exemplarCity [! "South Georgia"]
                ] 
                zone [
                    #type "America/Guatemala" 
                    exemplarCity [! "Guatemala"]
                ] 
                zone [
                    #type "Pacific/Guam" 
                    exemplarCity [! "Guam"]
                ] 
                zone [
                    #type "Africa/Bissau" 
                    exemplarCity [! "Bissau"]
                ] 
                zone [
                    #type "America/Guyana" 
                    exemplarCity [! "Guyana"]
                ] 
                zone [
                    #type "Asia/Hong_Kong" 
                    exemplarCity [! "Hong Kong"]
                ] 
                zone [
                    #type "America/Tegucigalpa" 
                    exemplarCity [! "Tegucigalpa"]
                ] 
                zone [
                    #type "Europe/Zagreb" 
                    exemplarCity [! "Zagreb"]
                ] 
                zone [
                    #type "America/Port-au-Prince" 
                    exemplarCity [! "Port-au-Prince"]
                ] 
                zone [
                    #type "Europe/Budapest" 
                    exemplarCity [! "Budapest"]
                ] 
                zone [
                    #type "Asia/Jakarta" 
                    exemplarCity [! "Jakarta"]
                ] 
                zone [
                    #type "Asia/Pontianak" 
                    exemplarCity [! "Pontianak"]
                ] 
                zone [
                    #type "Asia/Makassar" 
                    exemplarCity [! "Makassar"]
                ] 
                zone [
                    #type "Asia/Jayapura" 
                    exemplarCity [! "Jayapura"]
                ] 
                zone [
                    #type "Europe/Dublin" 
                    exemplarCity [! "Dublin"]
                ] 
                zone [
                    #type "Asia/Jerusalem" 
                    exemplarCity [! "Jerusalem"]
                ] 
                zone [
                    #type "Europe/Isle_of_Man" 
                    exemplarCity [! "Isle of Man"]
                ] 
                zone [
                    #type "Asia/Calcutta" 
                    exemplarCity [! "Kolkata"]
                ] 
                zone [
                    #type "Indian/Chagos" 
                    exemplarCity [! "Chagos"]
                ] 
                zone [
                    #type "Asia/Baghdad" 
                    exemplarCity [! "Baghdad"]
                ] 
                zone [
                    #type "Asia/Tehran" 
                    exemplarCity [! "Tehran"]
                ] 
                zone [
                    #type "Atlantic/Reykjavik" 
                    exemplarCity [! "Reykjavik"]
                ] 
                zone [
                    #type "Europe/Rome" 
                    exemplarCity [! "Rome"]
                ] 
                zone [
                    #type "Europe/Jersey" 
                    exemplarCity [! "Jersey"]
                ] 
                zone [
                    #type "America/Jamaica" 
                    exemplarCity [! "Jamaica"]
                ] 
                zone [
                    #type "Asia/Amman" 
                    exemplarCity [! "Amman"]
                ] 
                zone [
                    #type "Asia/Tokyo" 
                    exemplarCity [! "Tokyo"]
                ] 
                zone [
                    #type "Africa/Nairobi" 
                    exemplarCity [! "Nairobi"]
                ] 
                zone [
                    #type "Asia/Bishkek" 
                    exemplarCity [! "Bishkek"]
                ] 
                zone [
                    #type "Asia/Phnom_Penh" 
                    exemplarCity [! "Phnom Penh"]
                ] 
                zone [
                    #type "Pacific/Enderbury" 
                    exemplarCity [! "Enderbury"]
                ] 
                zone [
                    #type "Pacific/Kiritimati" 
                    exemplarCity [! "Kiritimati"]
                ] 
                zone [
                    #type "Pacific/Tarawa" 
                    exemplarCity [! "Tarawa"]
                ] 
                zone [
                    #type "Indian/Comoro" 
                    exemplarCity [! "Comoro"]
                ] 
                zone [
                    #type "Asia/Pyongyang" 
                    exemplarCity [! "Pyongyang"]
                ] 
                zone [
                    #type "Asia/Seoul" 
                    exemplarCity [! "Seoul"]
                ] 
                zone [
                    #type "Asia/Kuwait" 
                    exemplarCity [! "Kuwait"]
                ] 
                zone [
                    #type "America/Cayman" 
                    exemplarCity [! "Cayman"]
                ] 
                zone [
                    #type "Asia/Oral" 
                    exemplarCity [! "Oral"]
                ] 
                zone [
                    #type "Asia/Aqtobe" 
                    exemplarCity [! "Aqtobe"]
                ] 
                zone [
                    #type "Asia/Qyzylorda" 
                    exemplarCity [! "Qyzylorda"]
                ] 
                zone [
                    #type "Asia/Almaty" 
                    exemplarCity [! "Almaty"]
                ] 
                zone [
                    #type "Asia/Vientiane" 
                    exemplarCity [! "Vientiane"]
                ] 
                zone [
                    #type "Asia/Beirut" 
                    exemplarCity [! "Beirut"]
                ] 
                zone [
                    #type "Europe/Vaduz" 
                    exemplarCity [! "Vaduz"]
                ] 
                zone [
                    #type "Asia/Colombo" 
                    exemplarCity [! "Colombo"]
                ] 
                zone [
                    #type "Africa/Monrovia" 
                    exemplarCity [! "Monrovia"]
                ] 
                zone [
                    #type "Africa/Maseru" 
                    exemplarCity [! "Maseru"]
                ] 
                zone [
                    #type "Europe/Vilnius" 
                    exemplarCity [! "Vilnius"]
                ] 
                zone [
                    #type "Europe/Luxembourg" 
                    exemplarCity [! "Luxembourg"]
                ] 
                zone [
                    #type "Europe/Riga" 
                    exemplarCity [! "Riga"]
                ] 
                zone [
                    #type "Africa/Tripoli" 
                    exemplarCity [! "Tripoli"]
                ] 
                zone [
                    #type "Africa/Casablanca" 
                    exemplarCity [! "Casablanca"]
                ] 
                zone [
                    #type "Europe/Monaco" 
                    exemplarCity [! "Monaco"]
                ] 
                zone [
                    #type "Europe/Chisinau" 
                    exemplarCity [! "Chisinau"]
                ] 
                zone [
                    #type "Europe/Podgorica" 
                    exemplarCity [! "Podgorica"]
                ] 
                zone [
                    #type "America/Marigot" 
                    exemplarCity [! "Marigot"]
                ] 
                zone [
                    #type "Indian/Antananarivo" 
                    exemplarCity [! "Antananarivo"]
                ] 
                zone [
                    #type "Pacific/Kwajalein" 
                    exemplarCity [! "Kwajalein"]
                ] 
                zone [
                    #type "Pacific/Majuro" 
                    exemplarCity [! "Majuro"]
                ] 
                zone [
                    #type "Europe/Skopje" 
                    exemplarCity [! "Skopje"]
                ] 
                zone [
                    #type "Africa/Bamako" 
                    exemplarCity [! "Bamako"]
                ] 
                zone [
                    #type "Asia/Hovd" 
                    exemplarCity [! "Hovd"]
                ] 
                zone [
                    #type "Asia/Ulaanbaatar" 
                    exemplarCity [! "Ulaanbaatar"]
                ] 
                zone [
                    #type "Asia/Choibalsan" 
                    exemplarCity [! "Choibalsan"]
                ] 
                zone [
                    #type "Pacific/Saipan" 
                    exemplarCity [! "Saipan"]
                ] 
                zone [
                    #type "America/Martinique" 
                    exemplarCity [! "Martinique"]
                ] 
                zone [
                    #type "Africa/Nouakchott" 
                    exemplarCity [! "Nouakchott"]
                ] 
                zone [
                    #type "America/Montserrat" 
                    exemplarCity [! "Montserrat"]
                ] 
                zone [
                    #type "Europe/Malta" 
                    exemplarCity [! "Malta"]
                ] 
                zone [
                    #type "Indian/Mauritius" 
                    exemplarCity [! "Mauritius"]
                ] 
                zone [
                    #type "Indian/Maldives" 
                    exemplarCity [! "Maldives"]
                ] 
                zone [
                    #type "Africa/Blantyre" 
                    exemplarCity [! "Blantyre"]
                ] 
                zone [
                    #type "America/Tijuana" 
                    exemplarCity [! "Tijuana"]
                ] 
                zone [
                    #type "America/Hermosillo" 
                    exemplarCity [! "Hermosillo"]
                ] 
                zone [
                    #type "America/Mazatlan" 
                    exemplarCity [! "Mazatlan"]
                ] 
                zone [
                    #type "America/Chihuahua" 
                    exemplarCity [! "Chihuahua"]
                ] 
                zone [
                    #type "America/Bahia_Banderas" 
                    exemplarCity [! "Bahia Banderas"]
                ] 
                zone [
                    #type "America/Ojinaga" 
                    exemplarCity [! "Ojinaga"]
                ] 
                zone [
                    #type "America/Monterrey" 
                    exemplarCity [! "Monterrey"]
                ] 
                zone [
                    #type "America/Mexico_City" 
                    exemplarCity [! "Mexico City"]
                ] 
                zone [
                    #type "America/Matamoros" 
                    exemplarCity [! "Matamoros"]
                ] 
                zone [
                    #type "America/Merida" 
                    exemplarCity [! "Merida"]
                ] 
                zone [
                    #type "America/Cancun" 
                    exemplarCity [! "Cancun"]
                ] 
                zone [
                    #type "Asia/Kuala_Lumpur" 
                    exemplarCity [! "Kuala Lumpur"]
                ] 
                zone [
                    #type "Asia/Kuching" 
                    exemplarCity [! "Kuching"]
                ] 
                zone [
                    #type "Africa/Maputo" 
                    exemplarCity [! "Maputo"]
                ] 
                zone [
                    #type "Africa/Windhoek" 
                    exemplarCity [! "Windhoek"]
                ] 
                zone [
                    #type "Pacific/Noumea" 
                    exemplarCity [! "Noumea"]
                ] 
                zone [
                    #type "Africa/Niamey" 
                    exemplarCity [! "Niamey"]
                ] 
                zone [
                    #type "Pacific/Norfolk" 
                    exemplarCity [! "Norfolk"]
                ] 
                zone [
                    #type "Africa/Lagos" 
                    exemplarCity [! "Lagos"]
                ] 
                zone [
                    #type "America/Managua" 
                    exemplarCity [! "Managua"]
                ] 
                zone [
                    #type "Europe/Amsterdam" 
                    exemplarCity [! "Amsterdam"]
                ] 
                zone [
                    #type "Europe/Oslo" 
                    exemplarCity [! "Oslo"]
                ] 
                zone [
                    #type "Asia/Katmandu" 
                    exemplarCity [! "Kathmandu"]
                ] 
                zone [
                    #type "Pacific/Nauru" 
                    exemplarCity [! "Nauru"]
                ] 
                zone [
                    #type "Pacific/Niue" 
                    exemplarCity [! "Niue"]
                ] 
                zone [
                    #type "Pacific/Chatham" 
                    exemplarCity [! "Chatham"]
                ] 
                zone [
                    #type "Pacific/Auckland" 
                    exemplarCity [! "Auckland"]
                ] 
                zone [
                    #type "Asia/Muscat" 
                    exemplarCity [! "Muscat"]
                ] 
                zone [
                    #type "America/Panama" 
                    exemplarCity [! "Panama"]
                ] 
                zone [
                    #type "America/Lima" 
                    exemplarCity [! "Lima"]
                ] 
                zone [
                    #type "Pacific/Tahiti" 
                    exemplarCity [! "Tahiti"]
                ] 
                zone [
                    #type "Pacific/Marquesas" 
                    exemplarCity [! "Marquesas"]
                ] 
                zone [
                    #type "Pacific/Gambier" 
                    exemplarCity [! "Gambier"]
                ] 
                zone [
                    #type "Pacific/Port_Moresby" 
                    exemplarCity [! "Port Moresby"]
                ] 
                zone [
                    #type "Asia/Manila" 
                    exemplarCity [! "Manila"]
                ] 
                zone [
                    #type "Asia/Karachi" 
                    exemplarCity [! "Karachi"]
                ] 
                zone [
                    #type "Europe/Warsaw" 
                    exemplarCity [! "Warsaw"]
                ] 
                zone [
                    #type "America/Miquelon" 
                    exemplarCity [! "Miquelon"]
                ] 
                zone [
                    #type "Pacific/Pitcairn" 
                    exemplarCity [! "Pitcairn"]
                ] 
                zone [
                    #type "America/Puerto_Rico" 
                    exemplarCity [! "Puerto Rico"]
                ] 
                zone [
                    #type "Asia/Gaza" 
                    exemplarCity [! "Gaza"]
                ] 
                zone [
                    #type "Asia/Hebron" 
                    exemplarCity [! "Hebron"]
                ] 
                zone [
                    #type "Atlantic/Azores" 
                    exemplarCity [! "Azores"]
                ] 
                zone [
                    #type "Atlantic/Madeira" 
                    exemplarCity [! "Madeira"]
                ] 
                zone [
                    #type "Europe/Lisbon" 
                    exemplarCity [! "Lisbon"]
                ] 
                zone [
                    #type "Pacific/Palau" 
                    exemplarCity [! "Palau"]
                ] 
                zone [
                    #type "Asia/Qatar" 
                    exemplarCity [! "Qatar"]
                ] 
                zone [
                    #type "Europe/Bucharest" 
                    exemplarCity [! "Bucharest"]
                ] 
                zone [
                    #type "Europe/Belgrade" 
                    exemplarCity [! "Belgrade"]
                ] 
                zone [
                    #type "Europe/Kaliningrad" 
                    exemplarCity [! "Kaliningrad"]
                ] 
                zone [
                    #type "Europe/Moscow" 
                    exemplarCity [! "Moscow"]
                ] 
                zone [
                    #type "Europe/Volgograd" 
                    exemplarCity [! "Volgograd"]
                ] 
                zone [
                    #type "Europe/Samara" 
                    exemplarCity [! "Samara"]
                ] 
                zone [
                    #type "Asia/Yekaterinburg" 
                    exemplarCity [! "Yekaterinburg"]
                ] 
                zone [
                    #type "Asia/Omsk" 
                    exemplarCity [! "Omsk"]
                ] 
                zone [
                    #type "Asia/Novosibirsk" 
                    exemplarCity [! "Novosibirsk"]
                ] 
                zone [
                    #type "Asia/Novokuznetsk" 
                    exemplarCity [! "Novokuznetsk"]
                ] 
                zone [
                    #type "Asia/Krasnoyarsk" 
                    exemplarCity [! "Krasnoyarsk"]
                ] 
                zone [
                    #type "Asia/Irkutsk" 
                    exemplarCity [! "Irkutsk"]
                ] 
                zone [
                    #type "Asia/Yakutsk" 
                    exemplarCity [! "Yakutsk"]
                ] 
                zone [
                    #type "Asia/Vladivostok" 
                    exemplarCity [! "Vladivostok"]
                ] 
                zone [
                    #type "Asia/Khandyga" 
                    exemplarCity [! "Khandyga"]
                ] 
                zone [
                    #type "Asia/Sakhalin" 
                    exemplarCity [! "Sakhalin"]
                ] 
                zone [
                    #type "Asia/Ust-Nera" 
                    exemplarCity [! "Ust-Nera"]
                ] 
                zone [
                    #type "Asia/Magadan" 
                    exemplarCity [! "Magadan"]
                ] 
                zone [
                    #type "Asia/Kamchatka" 
                    exemplarCity [! "Kamchatka"]
                ] 
                zone [
                    #type "Asia/Anadyr" 
                    exemplarCity [! "Anadyr"]
                ] 
                zone [
                    #type "Africa/Kigali" 
                    exemplarCity [! "Kigali"]
                ] 
                zone [
                    #type "Asia/Riyadh" 
                    exemplarCity [! "Riyadh"]
                ] 
                zone [
                    #type "Pacific/Guadalcanal" 
                    exemplarCity [! "Guadalcanal"]
                ] 
                zone [
                    #type "Indian/Mahe" 
                    exemplarCity [! "Mahe"]
                ] 
                zone [
                    #type "Africa/Khartoum" 
                    exemplarCity [! "Khartoum"]
                ] 
                zone [
                    #type "Europe/Stockholm" 
                    exemplarCity [! "Stockholm"]
                ] 
                zone [
                    #type "Asia/Singapore" 
                    exemplarCity [! "Singapore"]
                ] 
                zone [
                    #type "Europe/Ljubljana" 
                    exemplarCity [! "Ljubljana"]
                ] 
                zone [
                    #type "Arctic/Longyearbyen" 
                    exemplarCity [! "Longyearbyen"]
                ] 
                zone [
                    #type "Europe/Bratislava" 
                    exemplarCity [! "Bratislava"]
                ] 
                zone [
                    #type "Africa/Freetown" 
                    exemplarCity [! "Freetown"]
                ] 
                zone [
                    #type "Europe/San_Marino" 
                    exemplarCity [! "San Marino"]
                ] 
                zone [
                    #type "Africa/Dakar" 
                    exemplarCity [! "Dakar"]
                ] 
                zone [
                    #type "Africa/Mogadishu" 
                    exemplarCity [! "Mogadishu"]
                ] 
                zone [
                    #type "America/Paramaribo" 
                    exemplarCity [! "Paramaribo"]
                ] 
                zone [
                    #type "Africa/Juba" 
                    exemplarCity [! "Juba"]
                ] 
                zone [
                    #type "America/El_Salvador" 
                    exemplarCity [! "El Salvador"]
                ] 
                zone [
                    #type "America/Lower_Princes" 
                    exemplarCity [! "Lower Prince’s Quarter"]
                ] 
                zone [
                    #type "Asia/Damascus" 
                    exemplarCity [! "Damascus"]
                ] 
                zone [
                    #type "Africa/Mbabane" 
                    exemplarCity [! "Mbabane"]
                ] 
                zone [
                    #type "America/Grand_Turk" 
                    exemplarCity [! "Grand Turk"]
                ] 
                zone [
                    #type "Africa/Ndjamena" 
                    exemplarCity [! "Ndjamena"]
                ] 
                zone [
                    #type "Indian/Kerguelen" 
                    exemplarCity [! "Kerguelen"]
                ] 
                zone [
                    #type "Africa/Lome" 
                    exemplarCity [! "Lome"]
                ] 
                zone [
                    #type "Asia/Bangkok" 
                    exemplarCity [! "Bangkok"]
                ] 
                zone [
                    #type "Asia/Dushanbe" 
                    exemplarCity [! "Dushanbe"]
                ] 
                zone [
                    #type "Pacific/Fakaofo" 
                    exemplarCity [! "Fakaofo"]
                ] 
                zone [
                    #type "Asia/Dili" 
                    exemplarCity [! "Dili"]
                ] 
                zone [
                    #type "Asia/Ashgabat" 
                    exemplarCity [! "Ashgabat"]
                ] 
                zone [
                    #type "Africa/Tunis" 
                    exemplarCity [! "Tunis"]
                ] 
                zone [
                    #type "Pacific/Tongatapu" 
                    exemplarCity [! "Tongatapu"]
                ] 
                zone [
                    #type "Europe/Istanbul" 
                    exemplarCity [! "Istanbul"]
                ] 
                zone [
                    #type "America/Port_of_Spain" 
                    exemplarCity [! "Port of Spain"]
                ] 
                zone [
                    #type "Pacific/Funafuti" 
                    exemplarCity [! "Funafuti"]
                ] 
                zone [
                    #type "Asia/Taipei" 
                    exemplarCity [! "Taipei"]
                ] 
                zone [
                    #type "Africa/Dar_es_Salaam" 
                    exemplarCity [! "Dar es Salaam"]
                ] 
                zone [
                    #type "Europe/Simferopol" 
                    exemplarCity [! "Simferopol"]
                ] 
                zone [
                    #type "Europe/Zaporozhye" 
                    exemplarCity [! "Zaporozhye"]
                ] 
                zone [
                    #type "Africa/Kampala" 
                    exemplarCity [! "Kampala"]
                ] 
                zone [
                    #type "Pacific/Midway" 
                    exemplarCity [! "Midway"]
                ] 
                zone [
                    #type "Pacific/Wake" 
                    exemplarCity [! "Wake"]
                ] 
                zone [
                    #type "America/Adak" 
                    exemplarCity [! "Adak"]
                ] 
                zone [
                    #type "America/Nome" 
                    exemplarCity [! "Nome"]
                ] 
                zone [
                    #type "America/Anchorage" 
                    exemplarCity [! "Anchorage"]
                ] 
                zone [
                    #type "America/Yakutat" 
                    exemplarCity [! "Yakutat"]
                ] 
                zone [
                    #type "America/Sitka" 
                    exemplarCity [! "Sitka"]
                ] 
                zone [
                    #type "America/Juneau" 
                    exemplarCity [! "Juneau"]
                ] 
                zone [
                    #type "America/Metlakatla" 
                    exemplarCity [! "Metlakatla"]
                ] 
                zone [
                    #type "America/Los_Angeles" 
                    exemplarCity [! "Los Angeles"]
                ] 
                zone [
                    #type "America/Boise" 
                    exemplarCity [! "Boise"]
                ] 
                zone [
                    #type "America/Phoenix" 
                    exemplarCity [! "Phoenix"]
                ] 
                zone [
                    #type "America/Denver" 
                    exemplarCity [! "Denver"]
                ] 
                zone [
                    #type "America/North_Dakota/Beulah" 
                    exemplarCity [! "Beulah, North Dakota"]
                ] 
                zone [
                    #type "America/North_Dakota/New_Salem" 
                    exemplarCity [! "New Salem, North Dakota"]
                ] 
                zone [
                    #type "America/North_Dakota/Center" 
                    exemplarCity [! "Center, North Dakota"]
                ] 
                zone [
                    #type "America/Chicago" 
                    exemplarCity [! "Chicago"]
                ] 
                zone [
                    #type "America/Menominee" 
                    exemplarCity [! "Menominee"]
                ] 
                zone [
                    #type "America/Indiana/Vincennes" 
                    exemplarCity [! "Vincennes, Indiana"]
                ] 
                zone [
                    #type "America/Indiana/Petersburg" 
                    exemplarCity [! "Petersburg, Indiana"]
                ] 
                zone [
                    #type "America/Indiana/Tell_City" 
                    exemplarCity [! "Tell City, Indiana"]
                ] 
                zone [
                    #type "America/Indiana/Knox" 
                    exemplarCity [! "Knox, Indiana"]
                ] 
                zone [
                    #type "America/Indiana/Winamac" 
                    exemplarCity [! "Winamac, Indiana"]
                ] 
                zone [
                    #type "America/Indiana/Marengo" 
                    exemplarCity [! "Marengo, Indiana"]
                ] 
                zone [
                    #type "America/Indianapolis" 
                    exemplarCity [! "Indianapolis"]
                ] 
                zone [
                    #type "America/Louisville" 
                    exemplarCity [! "Louisville"]
                ] 
                zone [
                    #type "America/Indiana/Vevay" 
                    exemplarCity [! "Vevay, Indiana"]
                ] 
                zone [
                    #type "America/Kentucky/Monticello" 
                    exemplarCity [! "Monticello, Kentucky"]
                ] 
                zone [
                    #type "America/Detroit" 
                    exemplarCity [! "Detroit"]
                ] 
                zone [
                    #type "America/New_York" 
                    exemplarCity [! "New York"]
                ] 
                zone [
                    #type "America/Montevideo" 
                    exemplarCity [! "Montevideo"]
                ] 
                zone [
                    #type "Asia/Samarkand" 
                    exemplarCity [! "Samarkand"]
                ] 
                zone [
                    #type "Asia/Tashkent" 
                    exemplarCity [! "Tashkent"]
                ] 
                zone [
                    #type "Europe/Vatican" 
                    exemplarCity [! "Vatican"]
                ] 
                zone [
                    #type "America/Caracas" 
                    exemplarCity [! "Caracas"]
                ] 
                zone [
                    #type "America/Tortola" 
                    exemplarCity [! "Tortola"]
                ] 
                zone [
                    #type "Pacific/Efate" 
                    exemplarCity [! "Efate"]
                ] 
                zone [
                    #type "Pacific/Wallis" 
                    exemplarCity [! "Wallis"]
                ] 
                zone [
                    #type "Pacific/Apia" 
                    exemplarCity [! "Apia"]
                ] 
                zone [
                    #type "Asia/Aden" 
                    exemplarCity [! "Aden"]
                ] 
                zone [
                    #type "Africa/Johannesburg" 
                    exemplarCity [! "Johannesburg"]
                ] 
                zone [
                    #type "Africa/Lusaka" 
                    exemplarCity [! "Lusaka"]
                ] 
                zone [
                    #type "Africa/Harare" 
                    exemplarCity [! "Harare"]
                ] 
                metazone [
                    #type "Europe_Central" 
                    short [
                        generic [! "CET"] 
                        standard [! "CET"] 
                        daylight [! "CEST"]
                    ]
                ] 
                metazone [
                    #type "Europe_Eastern" 
                    short [
                        generic [! "EET"] 
                        standard [! "EET"] 
                        daylight [! "EEST"]
                    ]
                ] 
                metazone [
                    #type "Europe_Western" 
                    short [
                        generic [! "WET"] 
                        standard [! "WET"] 
                        daylight [! "WEST"]
                    ]
                ]
            ]
        ] 
        numbers [
            minimumGroupingDigits [#draft "contributed" ! "1"] 
            miscPatterns [
                #numberSystem "latn" 
                pattern [#type "range" ! "{0}–{1}"]
            ]
        ] 
        units [
            unitLength [
                #type "long" 
                unit [
                    #type "concentr-karat" 
                    displayName [! "carats"]
                ] 
                unit [
                    #type "volume-fluid-ounce-imperial" 
                    displayName [! "fluid ounces"] 
                    unitPattern [#count "one" ! "{0} fluid ounce"] 
                    unitPattern [#count "other" ! "{0} fluid ounces"]
                ]
            ] 
            unitLength [
                #type "short" 
                unit [
                    #type "volume-fluid-ounce-imperial" 
                    displayName [! "fl oz"] 
                    unitPattern [#count "one" ! "{0} fl oz"] 
                    unitPattern [#count "other" ! "{0} fl oz"]
                ] 
                unit [
                    #type "volume-jigger" 
                    unitPattern [#count "one" ! "{0} jigger"] 
                    unitPattern [#count "other" ! "{0} jiggers"]
                ]
            ] 
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
    ]

