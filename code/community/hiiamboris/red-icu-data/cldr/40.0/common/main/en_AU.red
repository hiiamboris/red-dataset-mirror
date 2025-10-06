
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "en"] 
            territory [#type "AU"]
        ] 
        localeDisplayNames [
            languages [
                language [#type "ar_001" ! "Modern Standard Arabic"] 
                language [#type "bn" ! "Bengali"] 
                language [#type "ckb" #alt "menu" ! "Kurdish (Central)"] 
                language [#type "ckb" #alt "variant" ! "Kurdish (Sorani)"] 
                language [#type "de_AT" ! "Austrian German"] 
                language [#type "de_CH" ! "Swiss High German"] 
                language [#type "en_AU" ! "Australian English"] 
                language [#type "en_CA" ! "Canadian English"] 
                language [#type "en_GB" ! "British English"] 
                language [#type "en_GB" #alt "short" ! "UK English"] 
                language [#type "en_US" ! "United States English"] 
                language [#type "en_US" #alt "short" ! "US English"] 
                language [#type "es_419" ! "Latin American Spanish"] 
                language [#type "es_ES" ! "European Spanish"] 
                language [#type "es_MX" ! "Mexican Spanish"] 
                language [#type "fr_CA" ! "Canadian French"] 
                language [#type "fr_CH" ! "Swiss French"] 
                language [#type "pt_BR" ! "Brazilian Portuguese"] 
                language [#type "pt_PT" ! "European Portuguese"] 
                language [#type "ro_MD" ! "Moldovan"] 
                language [#type "sr_ME" ! "Montenegrin"] 
                language [#type "zh_Hans" ! "Simplified Chinese"] 
                language [#type "zh_Hant" ! "Traditional Chinese"]
            ] 
            scripts [
                script [#type "Beng" ! "Bengali"]
            ] 
            territories [
                territory [#type "001" ! "World"]
            ] 
            variants [
                variant [#type "SIMPLE" ! "SIMPLE"]
            ] 
            keys [
                key [#type "colCaseFirst" ! "Upper case / Lower case Ordering"] 
                key [#type "x" ! "Private Use"] 
                key [#type "x0" ! "Private Use Transform"]
            ] 
            types [
                type [#key "calendar" #type "dangi" ! "Korean Calendar"] 
                type [#key "calendar" #type "ethiopic" ! "Ethiopian Calendar"]
            ]
        ] 
        dates [
            calendars [
                calendar [
                    #type "chinese" 
                    months [
                        monthContext [
                            #type "format" 
                            monthWidth [
                                #type "narrow" 
                                month [#type "1" ! "1"] 
                                month [#type "2" ! "2"] 
                                month [#type "3" ! "3"] 
                                month [#type "4" ! "4"] 
                                month [#type "5" ! "5"] 
                                month [#type "6" ! "6"] 
                                month [#type "7" ! "7"] 
                                month [#type "8" ! "8"] 
                                month [#type "9" ! "9"] 
                                month [#type "10" ! "10"] 
                                month [#type "11" ! "11"] 
                                month [#type "12" ! "12"]
                            ]
                        ] 
                        monthContext [
                            #type "stand-alone" 
                            monthWidth [
                                #type "abbreviated" 
                                month [#type "1" ! "Mo1"] 
                                month [#type "2" ! "Mo2"] 
                                month [#type "3" ! "Mo3"] 
                                month [#type "4" ! "Mo4"] 
                                month [#type "5" ! "Mo5"] 
                                month [#type "6" ! "Mo6"] 
                                month [#type "7" ! "Mo7"] 
                                month [#type "8" ! "Mo8"] 
                                month [#type "9" ! "Mo9"] 
                                month [#type "10" ! "Mo10"] 
                                month [#type "11" ! "Mo11"] 
                                month [#type "12" ! "Mo12"]
                            ] 
                            monthWidth [
                                #type "narrow" 
                                month [#type "1" ! "1"] 
                                month [#type "2" ! "2"] 
                                month [#type "3" ! "3"] 
                                month [#type "4" ! "4"] 
                                month [#type "5" ! "5"] 
                                month [#type "6" ! "6"] 
                                month [#type "7" ! "7"] 
                                month [#type "8" ! "8"] 
                                month [#type "9" ! "9"] 
                                month [#type "10" ! "10"] 
                                month [#type "11" ! "11"] 
                                month [#type "12" ! "12"]
                            ] 
                            monthWidth [
                                #type "wide" 
                                month [#type "1" ! "First Month"] 
                                month [#type "2" ! "Second Month"] 
                                month [#type "3" ! "Third Month"] 
                                month [#type "4" ! "Fourth Month"] 
                                month [#type "5" ! "Fifth Month"] 
                                month [#type "6" ! "Sixth Month"] 
                                month [#type "7" ! "Seventh Month"] 
                                month [#type "8" ! "Eighth Month"] 
                                month [#type "9" ! "Ninth Month"] 
                                month [#type "10" ! "Tenth Month"] 
                                month [#type "11" ! "Eleventh Month"] 
                                month [#type "12" ! "Twelfth Month"]
                            ]
                        ]
                    ]
                ] 
                calendar [
                    #type "generic" 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "yMd" ! "dd/MM/y"] 
                            dateFormatItem [#id "yMEd" ! "E, dd/MM/y"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "GyMEd" 
                                greatestDifference [#id "d" ! "E dd/MM/y – E dd/MM/y GGGGG"] 
                                greatestDifference [#id "G" ! "E dd/MM/y GGGGG – E dd/MM/y GGGGG"] 
                                greatestDifference [#id "M" ! "E dd/MM/y – E dd/MM/y GGGGG"] 
                                greatestDifference [#id "y" ! "E dd/MM/y – E dd/MM/y GGGGG"]
                            ] 
                            intervalFormatItem [
                                #id "GyMMMEd" 
                                greatestDifference [#id "d" ! "E d MMM – E d MMM y G"] 
                                greatestDifference [#id "G" ! "E d MMM y G – E d MMM y G"] 
                                greatestDifference [#id "M" ! "E d MMM – E d MMM y G"] 
                                greatestDifference [#id "y" ! "E d MMM y – E d MMM y G"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" ! "E, d/M – E, d/M"] 
                                greatestDifference [#id "M" ! "E, d/M – E, d/M"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" ! "E, d MMM – E, d MMM"] 
                                greatestDifference [#id "M" ! "E, d MMM – E, d MMM"]
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
                                #type "abbreviated" 
                                month [#type "1" ! "Jan"] 
                                month [#type "2" ! "Feb"] 
                                month [#type "3" ! "Mar"] 
                                month [#type "4" ! "Apr"] 
                                month [#type "5" ! "May"] 
                                month [#type "6" ! "June"] 
                                month [#type "7" ! "July"] 
                                month [#type "8" ! "Aug"] 
                                month [#type "9" ! "Sept"] 
                                month [#type "10" ! "Oct"] 
                                month [#type "11" ! "Nov"] 
                                month [#type "12" ! "Dec"]
                            ] 
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
                                month [#type "9" ! "Sep"] 
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
                                day [#type "sun" ! "Su."] 
                                day [#type "mon" ! "M."] 
                                day [#type "tue" ! "Tu."] 
                                day [#type "wed" ! "W."] 
                                day [#type "thu" ! "Th."] 
                                day [#type "fri" ! "F."] 
                                day [#type "sat" ! "Sa."]
                            ] 
                            dayWidth [
                                #type "short" 
                                day [#type "sun" ! "Su"] 
                                day [#type "mon" ! "Mon"] 
                                day [#type "tue" ! "Tu"] 
                                day [#type "wed" ! "Wed"] 
                                day [#type "thu" ! "Th"] 
                                day [#type "fri" ! "Fri"] 
                                day [#type "sat" ! "Sat"]
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
                                #type "narrow" 
                                day [#type "sun" ! "Su."] 
                                day [#type "mon" ! "M."] 
                                day [#type "tue" ! "Tu."] 
                                day [#type "wed" ! "W."] 
                                day [#type "thu" ! "Th."] 
                                day [#type "fri" ! "F."] 
                                day [#type "sat" ! "Sa."]
                            ] 
                            dayWidth [
                                #type "short" 
                                day [#type "sun" ! "Su"] 
                                day [#type "mon" ! "Mon"] 
                                day [#type "tue" ! "Tu"] 
                                day [#type "wed" ! "Wed"] 
                                day [#type "thu" ! "Th"] 
                                day [#type "fri" ! "Fri"] 
                                day [#type "sat" ! "Sat"]
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
                            #type "format" 
                            dayPeriodWidth [
                                #type "abbreviated" 
                                dayPeriod [#type "midnight" ! "midnight"] 
                                dayPeriod [#type "noon" ! "midday"] 
                                dayPeriod [#type "morning1" ! "morning"] 
                                dayPeriod [#type "afternoon1" ! "afternoon"] 
                                dayPeriod [#type "evening1" ! "evening"] 
                                dayPeriod [#type "night1" ! "night"]
                            ] 
                            dayPeriodWidth [
                                #type "narrow" 
                                dayPeriod [#type "midnight" ! "midnight"] 
                                dayPeriod [#type "am" ! "am"] 
                                dayPeriod [#type "noon" ! "midday"] 
                                dayPeriod [#type "pm" ! "pm"] 
                                dayPeriod [#type "morning1" ! "morning"] 
                                dayPeriod [#type "afternoon1" ! "afternoon"] 
                                dayPeriod [#type "evening1" ! "evening"] 
                                dayPeriod [#type "night1" ! "night"]
                            ] 
                            dayPeriodWidth [
                                #type "wide" 
                                dayPeriod [#type "midnight" ! "midnight"] 
                                dayPeriod [#type "noon" ! "midday"] 
                                dayPeriod [#type "morning1" ! "in the morning"] 
                                dayPeriod [#type "afternoon1" ! "in the afternoon"] 
                                dayPeriod [#type "evening1" ! "in the evening"] 
                                dayPeriod [#type "night1" ! "at night"]
                            ]
                        ] 
                        dayPeriodContext [
                            #type "stand-alone" 
                            dayPeriodWidth [
                                #type "abbreviated" 
                                dayPeriod [#type "noon" ! "midday"]
                            ] 
                            dayPeriodWidth [
                                #type "narrow" 
                                dayPeriod [#type "midnight" ! "midnight"] 
                                dayPeriod [#type "am" ! "am"] 
                                dayPeriod [#type "noon" ! "midday"] 
                                dayPeriod [#type "pm" ! "pm"] 
                                dayPeriod [#type "morning1" ! "morning"] 
                                dayPeriod [#type "afternoon1" ! "afternoon"] 
                                dayPeriod [#type "evening1" ! "evening"] 
                                dayPeriod [#type "night1" ! "night"]
                            ] 
                            dayPeriodWidth [
                                #type "wide" 
                                dayPeriod [#type "noon" ! "midday"]
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
                            ]
                        ] 
                        timeFormatLength [
                            #type "long" 
                            timeFormat [
                                pattern [! "h:mm:ss a z"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "medium" 
                            timeFormat [
                                pattern [! "h:mm:ss a"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "short" 
                            timeFormat [
                                pattern [! "h:mm a"]
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
                            dateFormatItem [#id "Md" ! "d/M"] 
                            dateFormatItem [#id "MEd" ! "E, d/M"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "GyMd" 
                                greatestDifference [#id "d" ! "d/M/y – d/M/y GGGGG"] 
                                greatestDifference [#id "G" ! "d/M/y GGGGG – d/M/y GGGGG"] 
                                greatestDifference [#id "M" ! "d/M/y – d/M/y GGGGG"] 
                                greatestDifference [#id "y" ! "d/M/y – d/M/y GGGGG"]
                            ] 
                            intervalFormatItem [
                                #id "GyMEd" 
                                greatestDifference [#id "d" ! "E, d/M/y – E, d/M/y GGGGG"] 
                                greatestDifference [#id "G" ! "E, d/M/y GGGGG – E, d/M/y GGGGG"] 
                                greatestDifference [#id "M" ! "E, d/M/y – E, d/M/y GGGGG"] 
                                greatestDifference [#id "y" ! "E, d/M/y – E, d/M/y GGGGG"]
                            ] 
                            intervalFormatItem [
                                #id "GyMMMd" 
                                greatestDifference [#id "d" ! "d – d MMM, y G"] 
                                greatestDifference [#id "G" ! "d MMM, y G – d MMM, y G"] 
                                greatestDifference [#id "M" ! "d MMM – d MMM, y G"] 
                                greatestDifference [#id "y" ! "d MMM, y – d MMM, y G"]
                            ] 
                            intervalFormatItem [
                                #id "GyMMMEd" 
                                greatestDifference [#id "d" ! "E, d MMM – E, d MMM, y G"] 
                                greatestDifference [#id "G" ! "E, d MMM, y G – E, d MMM, y G"] 
                                greatestDifference [#id "M" ! "E, d MMM – E, d MMM, y G"] 
                                greatestDifference [#id "y" ! "E, d MMM, y – E, d MMM, y G"]
                            ] 
                            intervalFormatItem [
                                #id "MMMd" 
                                greatestDifference [#id "d" ! "d – d MMM"]
                            ]
                        ]
                    ]
                ] 
                calendar [
                    #type "indian" 
                    months [
                        monthContext [
                            #type "format" 
                            monthWidth [
                                #type "abbreviated" 
                                month [#type "1" ! "Chaitra"] 
                                month [#type "2" ! "Vaisakha"] 
                                month [#type "3" ! "Jyaistha"] 
                                month [#type "4" ! "Asadha"] 
                                month [#type "5" ! "Sravana"] 
                                month [#type "6" ! "Bhadra"] 
                                month [#type "7" ! "Asvina"] 
                                month [#type "8" ! "Kartika"] 
                                month [#type "9" ! "Agrahayana"] 
                                month [#type "10" ! "Pausa"] 
                                month [#type "11" ! "Magha"] 
                                month [#type "12" ! "Phalguna"]
                            ] 
                            monthWidth [
                                #type "narrow" 
                                month [#type "1" ! "1"] 
                                month [#type "2" ! "2"] 
                                month [#type "3" ! "3"] 
                                month [#type "4" ! "4"] 
                                month [#type "5" ! "5"] 
                                month [#type "6" ! "6"] 
                                month [#type "7" ! "7"] 
                                month [#type "8" ! "8"] 
                                month [#type "9" ! "9"] 
                                month [#type "10" ! "10"] 
                                month [#type "11" ! "11"] 
                                month [#type "12" ! "12"]
                            ] 
                            monthWidth [
                                #type "wide" 
                                month [#type "1" ! "Chaitra"] 
                                month [#type "2" ! "Vaisakha"] 
                                month [#type "3" ! "Jyaistha"] 
                                month [#type "4" ! "Asadha"] 
                                month [#type "5" ! "Sravana"] 
                                month [#type "6" ! "Bhadra"] 
                                month [#type "7" ! "Asvina"] 
                                month [#type "8" ! "Kartika"] 
                                month [#type "9" ! "Agrahayana"] 
                                month [#type "10" ! "Pausa"] 
                                month [#type "11" ! "Magha"] 
                                month [#type "12" ! "Phalguna"]
                            ]
                        ] 
                        monthContext [
                            #type "stand-alone" 
                            monthWidth [
                                #type "abbreviated" 
                                month [#type "1" ! "Chaitra"] 
                                month [#type "2" ! "Vaisakha"] 
                                month [#type "3" ! "Jyaistha"] 
                                month [#type "4" ! "Asadha"] 
                                month [#type "5" ! "Sravana"] 
                                month [#type "6" ! "Bhadra"] 
                                month [#type "7" ! "Asvina"] 
                                month [#type "8" ! "Kartika"] 
                                month [#type "9" ! "Agrahayana"] 
                                month [#type "10" ! "Pausa"] 
                                month [#type "11" ! "Magha"] 
                                month [#type "12" ! "Phalguna"]
                            ] 
                            monthWidth [
                                #type "narrow" 
                                month [#type "1" ! "1"] 
                                month [#type "2" ! "2"] 
                                month [#type "3" ! "3"] 
                                month [#type "4" ! "4"] 
                                month [#type "5" ! "5"] 
                                month [#type "6" ! "6"] 
                                month [#type "7" ! "7"] 
                                month [#type "8" ! "8"] 
                                month [#type "9" ! "9"] 
                                month [#type "10" ! "10"] 
                                month [#type "11" ! "11"] 
                                month [#type "12" ! "12"]
                            ] 
                            monthWidth [
                                #type "wide" 
                                month [#type "1" ! "Chaitra"] 
                                month [#type "2" ! "Vaisakha"] 
                                month [#type "3" ! "Jyaistha"] 
                                month [#type "4" ! "Asadha"] 
                                month [#type "5" ! "Sravana"] 
                                month [#type "6" ! "Bhadra"] 
                                month [#type "7" ! "Asvina"] 
                                month [#type "8" ! "Kartika"] 
                                month [#type "9" ! "Agrahayana"] 
                                month [#type "10" ! "Pausa"] 
                                month [#type "11" ! "Magha"] 
                                month [#type "12" ! "Phalguna"]
                            ]
                        ]
                    ]
                ] 
                calendar [
                    #type "islamic" 
                    months [
                        monthContext [
                            #type "format" 
                            monthWidth [
                                #type "abbreviated" 
                                month [#type "1" ! "Muh."] 
                                month [#type "2" ! "Saf."] 
                                month [#type "3" ! "Rab. I"] 
                                month [#type "4" ! "Rab. II"] 
                                month [#type "5" ! "Jum. I"] 
                                month [#type "6" ! "Jum. II"] 
                                month [#type "7" ! "Raj."] 
                                month [#type "8" ! "Sha."] 
                                month [#type "9" ! "Ram."] 
                                month [#type "10" ! "Shaw."] 
                                month [#type "11" ! "Dhuʻl-Q."] 
                                month [#type "12" ! "Dhuʻl-H."]
                            ] 
                            monthWidth [
                                #type "narrow" 
                                month [#type "1" ! "1"] 
                                month [#type "2" ! "2"] 
                                month [#type "3" ! "3"] 
                                month [#type "4" ! "4"] 
                                month [#type "5" ! "5"] 
                                month [#type "6" ! "6"] 
                                month [#type "7" ! "7"] 
                                month [#type "8" ! "8"] 
                                month [#type "9" ! "9"] 
                                month [#type "10" ! "10"] 
                                month [#type "11" ! "11"] 
                                month [#type "12" ! "12"]
                            ] 
                            monthWidth [
                                #type "wide" 
                                month [#type "1" ! "Muharram"] 
                                month [#type "2" ! "Safar"] 
                                month [#type "3" ! "Rabiʻ I"] 
                                month [#type "4" ! "Rabiʻ II"] 
                                month [#type "5" ! "Jumada I"] 
                                month [#type "6" ! "Jumada II"] 
                                month [#type "7" ! "Rajab"] 
                                month [#type "8" ! "Shaʻban"] 
                                month [#type "9" ! "Ramadan"] 
                                month [#type "10" ! "Shawwal"] 
                                month [#type "11" ! "Dhuʻl-Qiʻdah"] 
                                month [#type "12" ! "Dhuʻl-Hijjah"]
                            ]
                        ] 
                        monthContext [
                            #type "stand-alone" 
                            monthWidth [
                                #type "abbreviated" 
                                month [#type "1" ! "Muh."] 
                                month [#type "2" ! "Saf."] 
                                month [#type "3" ! "Rab. I"] 
                                month [#type "4" ! "Rab. II"] 
                                month [#type "5" ! "Jum. I"] 
                                month [#type "6" ! "Jum. II"] 
                                month [#type "7" ! "Raj."] 
                                month [#type "8" ! "Sha."] 
                                month [#type "9" ! "Ram."] 
                                month [#type "10" ! "Shaw."] 
                                month [#type "11" ! "Dhuʻl-Q."] 
                                month [#type "12" ! "Dhuʻl-H."]
                            ] 
                            monthWidth [
                                #type "narrow" 
                                month [#type "1" ! "1"] 
                                month [#type "2" ! "2"] 
                                month [#type "3" ! "3"] 
                                month [#type "4" ! "4"] 
                                month [#type "5" ! "5"] 
                                month [#type "6" ! "6"] 
                                month [#type "7" ! "7"] 
                                month [#type "8" ! "8"] 
                                month [#type "9" ! "9"] 
                                month [#type "10" ! "10"] 
                                month [#type "11" ! "11"] 
                                month [#type "12" ! "12"]
                            ] 
                            monthWidth [
                                #type "wide" 
                                month [#type "1" ! "Muharram"] 
                                month [#type "2" ! "Safar"] 
                                month [#type "3" ! "Rabiʻ I"] 
                                month [#type "4" ! "Rabiʻ II"] 
                                month [#type "5" ! "Jumada I"] 
                                month [#type "6" ! "Jumada II"] 
                                month [#type "7" ! "Rajab"] 
                                month [#type "8" ! "Shaʻban"] 
                                month [#type "9" ! "Ramadan"] 
                                month [#type "10" ! "Shawwal"] 
                                month [#type "11" ! "Dhuʻl-Qiʻdah"] 
                                month [#type "12" ! "Dhuʻl-Hijjah"]
                            ]
                        ]
                    ] 
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
                                pattern [! "dd/MM/y GGGGG"] 
                                datetimeSkeleton [! "GGGGGyMMdd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "d" ! "d"] 
                            dateFormatItem [#id "E" ! "ccc"] 
                            dateFormatItem [#id "Ed" ! "E d"] 
                            dateFormatItem [#id "Gy" ! "y G"] 
                            dateFormatItem [#id "GyMMM" ! "MMM y G"] 
                            dateFormatItem [#id "GyMMMd" ! "d MMM y G"] 
                            dateFormatItem [#id "GyMMMEd" ! "E, d MMM y G"] 
                            dateFormatItem [#id "M" ! "LL"] 
                            dateFormatItem [#id "Md" ! "dd/MM"] 
                            dateFormatItem [#id "MMM" ! "LLL"] 
                            dateFormatItem [#id "MMMd" ! "d MMM"] 
                            dateFormatItem [#id "MMMEd" ! "E, d MMM"] 
                            dateFormatItem [#id "MMMMd" ! "d MMMM"] 
                            dateFormatItem [#id "y" ! "y G"] 
                            dateFormatItem [#id "yMd" ! "dd/MM/y"] 
                            dateFormatItem [#id "yMEd" ! "E, dd/MM/y"] 
                            dateFormatItem [#id "yyyy" ! "y G"] 
                            dateFormatItem [#id "yyyyM" ! "MM/y GGGGG"] 
                            dateFormatItem [#id "yyyyMd" ! "dd/MM/y GGGGG"] 
                            dateFormatItem [#id "yyyyMEd" ! "E, dd/MM/y GGGGG"] 
                            dateFormatItem [#id "yyyyMMM" ! "MMM y G"] 
                            dateFormatItem [#id "yyyyMMMd" ! "d MMM y G"] 
                            dateFormatItem [#id "yyyyMMMEd" ! "E, d MMM y G"] 
                            dateFormatItem [#id "yyyyMMMM" ! "MMMM y G"] 
                            dateFormatItem [#id "yyyyQQQ" ! "QQQ y G"] 
                            dateFormatItem [#id "yyyyQQQQ" ! "QQQQ y G"]
                        ]
                    ]
                ]
            ] 
            fields [
                field [
                    #type "year-short" 
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
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} qtr"] 
                        relativeTimePattern [#count "other" ! "in {0} qtrs"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "in {0} qtr ago"] 
                        relativeTimePattern [#count "other" ! "{0} qtrs ago"]
                    ]
                ] 
                field [
                    #type "month-short" 
                    displayName [! "mo."] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} mo."] 
                        relativeTimePattern [#count "other" ! "in {0} mo."]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} mo. ago"] 
                        relativeTimePattern [#count "other" ! "{0} mo. ago"]
                    ]
                ] 
                field [
                    #type "month-narrow" 
                    displayName [! "mo."] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} mo."] 
                        relativeTimePattern [#count "other" ! "in {0} mo."]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} mo. ago"] 
                        relativeTimePattern [#count "other" ! "{0} mo. ago"]
                    ]
                ] 
                field [
                    #type "week-short" 
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
                    displayName [! "wk of mo."]
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
                    #type "weekdayOfMonth-short" 
                    displayName [! "wkday of mo."]
                ] 
                field [
                    #type "sun-short" 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} Sun."] 
                        relativeTimePattern [#count "other" ! "in {0} Sun."]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} Sun. ago"] 
                        relativeTimePattern [#count "other" ! "{0} Sun. ago"]
                    ]
                ] 
                field [
                    #type "mon-short" 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} Mon."] 
                        relativeTimePattern [#count "other" ! "in {0} Mon."]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} Mon. ago"] 
                        relativeTimePattern [#count "other" ! "{0} Mon. ago"]
                    ]
                ] 
                field [
                    #type "tue-short" 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} Tue."] 
                        relativeTimePattern [#count "other" ! "in {0} Tue."]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} Tue. ago"] 
                        relativeTimePattern [#count "other" ! "{0} Tue. ago"]
                    ]
                ] 
                field [
                    #type "wed-short" 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} Wed."] 
                        relativeTimePattern [#count "other" ! "in {0} Wed."]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} Wed. ago"] 
                        relativeTimePattern [#count "other" ! "{0} Wed. ago"]
                    ]
                ] 
                field [
                    #type "thu-short" 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} Thu."] 
                        relativeTimePattern [#count "other" ! "in {0} Thu."]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} Thu. ago"] 
                        relativeTimePattern [#count "other" ! "{0} Thu. ago"]
                    ]
                ] 
                field [
                    #type "fri-short" 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} Fri."] 
                        relativeTimePattern [#count "other" ! "in {0} Fri."]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} Fri. ago"] 
                        relativeTimePattern [#count "other" ! "{0} Fri. ago"]
                    ]
                ] 
                field [
                    #type "sat-short" 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} Sat."] 
                        relativeTimePattern [#count "other" ! "in {0} Sat."]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} Sat. ago"] 
                        relativeTimePattern [#count "other" ! "{0} Sat. ago"]
                    ]
                ] 
                field [
                    #type "hour-short" 
                    displayName [! "h"] 
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
                    displayName [! "h"] 
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
                    displayName [! "min."] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} min."] 
                        relativeTimePattern [#count "other" ! "in {0} mins"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} min. ago"] 
                        relativeTimePattern [#count "other" ! "{0} mins ago"]
                    ]
                ] 
                field [
                    #type "minute-narrow" 
                    displayName [! "min."] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} min."] 
                        relativeTimePattern [#count "other" ! "in {0} mins"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} min. ago"] 
                        relativeTimePattern [#count "other" ! "{0} mins ago"]
                    ]
                ] 
                field [
                    #type "second-short" 
                    displayName [! "sec."] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} sec."] 
                        relativeTimePattern [#count "other" ! "in {0} secs"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} sec. ago"] 
                        relativeTimePattern [#count "other" ! "{0} secs ago"]
                    ]
                ] 
                field [
                    #type "second-narrow" 
                    displayName [! "sec."] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "in {0} sec."] 
                        relativeTimePattern [#count "other" ! "in {0} secs"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} sec. ago"] 
                        relativeTimePattern [#count "other" ! "{0} secs ago"]
                    ]
                ]
            ] 
            timeZoneNames [
                gmtZeroFormat [! "GMT"] 
                zone [
                    #type "Pacific/Johnston" 
                    exemplarCity [! "Johnston"]
                ] 
                metazone [
                    #type "Africa_Eastern" 
                    long [
                        standard [! "Eastern Africa Time"]
                    ]
                ] 
                metazone [
                    #type "Arabian" 
                    long [
                        generic [! "Arabia Time"] 
                        standard [! "Arabia Standard Time"] 
                        daylight [! "Arabia Daylight Time"]
                    ]
                ] 
                metazone [
                    #type "Australia_Central" 
                    long [
                        generic [! "Australian Central Time"] 
                        standard [! "Australian Central Standard Time"] 
                        daylight [! "Australian Central Daylight Time"]
                    ] 
                    short [
                        generic [! "ACT"] 
                        standard [! "ACST"] 
                        daylight [! "ACDT"]
                    ]
                ] 
                metazone [
                    #type "Australia_CentralWestern" 
                    short [
                        generic [! "ACWT"] 
                        standard [! "ACWST"] 
                        daylight [! "ACWDT"]
                    ]
                ] 
                metazone [
                    #type "Australia_Eastern" 
                    long [
                        generic [! "Australian Eastern Time"] 
                        standard [! "Australian Eastern Standard Time"] 
                        daylight [! "Australian Eastern Daylight Time"]
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
                        generic [! "Australian Western Time"] 
                        standard [! "Australian Western Standard Time"] 
                        daylight [! "Australian Western Daylight Time"]
                    ] 
                    short [
                        generic [! "AWT"] 
                        standard [! "AWST"] 
                        daylight [! "AWDT"]
                    ]
                ] 
                metazone [
                    #type "China" 
                    long [
                        generic [! "China Time"] 
                        standard [! "China Standard Time"] 
                        daylight [! "China Summer Time"]
                    ]
                ] 
                metazone [
                    #type "Cook" 
                    long [
                        generic [! "Cook Island Time"] 
                        standard [! "Cook Island Standard Time"] 
                        daylight [! "Cook Island Summer Time"]
                    ]
                ] 
                metazone [
                    #type "Japan" 
                    long [
                        generic [! "Japan Time"] 
                        standard [! "Japan Standard Time"] 
                        daylight [! "Japan Summer Time"]
                    ]
                ] 
                metazone [
                    #type "Korea" 
                    long [
                        generic [! "Korea Time"] 
                        standard [! "Korean Standard Time"] 
                        daylight [! "Korean Summer Time"]
                    ]
                ] 
                metazone [
                    #type "Lord_Howe" 
                    short [
                        generic [! "LHT"] 
                        standard [! "LHST"] 
                        daylight [! "LHDT"]
                    ]
                ] 
                metazone [
                    #type "Moscow" 
                    long [
                        generic [! "Moscow Time"] 
                        standard [! "Moscow Standard Time"] 
                        daylight [! "Moscow Daylight Time"]
                    ]
                ] 
                metazone [
                    #type "New_Zealand" 
                    short [
                        generic [! "NZT"] 
                        standard [! "NZST"] 
                        daylight [! "NZDT"]
                    ]
                ] 
                metazone [
                    #type "Samoa" 
                    long [
                        generic [! "Samoa Time"] 
                        standard [! "Samoa Standard Time"] 
                        daylight [! "Samoa Summer Time"]
                    ]
                ] 
                metazone [
                    #type "Taipei" 
                    long [
                        generic [! "Taipei Time"] 
                        standard [! "Taipei Standard Time"] 
                        daylight [! "Taipei Summer Time"]
                    ]
                ]
            ]
        ] 
        numbers [
            symbols [
                #numberSystem "latn" 
                exponential [! "e"]
            ] 
            currencies [
                currency [
                    #type "AED" 
                    symbol [! "AED"]
                ] 
                currency [
                    #type "AFN" 
                    displayName [#count "one" ! "Afghan Afghani"] 
                    displayName [#count "other" ! "Afghan Afghanis"] 
                    symbol [! "AFN"]
                ] 
                currency [
                    #type "ALL" 
                    symbol [! "ALL"]
                ] 
                currency [
                    #type "AMD" 
                    symbol [! "AMD"]
                ] 
                currency [
                    #type "AOA" 
                    symbol [! "AOA"]
                ] 
                currency [
                    #type "ARS" 
                    symbol [! "ARS"] 
                    symbol [#alt "narrow" ! "$"]
                ] 
                currency [
                    #type "AUD" 
                    symbol [! "$"] 
                    symbol [#alt "narrow" ! "$"]
                ] 
                currency [
                    #type "AZN" 
                    symbol [! "AZN"]
                ] 
                currency [
                    #type "BAM" 
                    displayName [! "Bosnia-Herzegovina Convertible Marka"] 
                    displayName [#count "one" ! "Bosnia-Herzegovina convertible marka"] 
                    displayName [#count "other" ! "Bosnia-Herzegovina convertible marka"] 
                    symbol [! "BAM"]
                ] 
                currency [
                    #type "BBD" 
                    displayName [! "Barbados Dollar"] 
                    displayName [#count "one" ! "Barbados dollar"] 
                    displayName [#count "other" ! "Barbados dollars"]
                ] 
                currency [
                    #type "BDT" 
                    symbol [! "BDT"] 
                    symbol [#alt "narrow" ! "Tk"]
                ] 
                currency [
                    #type "BGN" 
                    symbol [! "BGN"]
                ] 
                currency [
                    #type "BHD" 
                    symbol [! "BHD"]
                ] 
                currency [
                    #type "BIF" 
                    symbol [! "BIF"]
                ] 
                currency [
                    #type "BMD" 
                    displayName [! "Bermuda Dollar"] 
                    displayName [#count "one" ! "Bermuda dollar"] 
                    displayName [#count "other" ! "Bermuda dollars"]
                ] 
                currency [
                    #type "BND" 
                    symbol [! "BND"] 
                    symbol [#alt "narrow" ! "$"]
                ] 
                currency [
                    #type "BOB" 
                    displayName [! "Boliviano"] 
                    displayName [#count "one" ! "boliviano"] 
                    displayName [#count "other" ! "bolivianos"] 
                    symbol [! "BOB"]
                ] 
                currency [
                    #type "BRL" 
                    symbol [! "BRL"] 
                    symbol [#alt "narrow" ! "R$"]
                ] 
                currency [
                    #type "BTN" 
                    symbol [! "BTN"]
                ] 
                currency [
                    #type "BWP" 
                    symbol [! "BWP"]
                ] 
                currency [
                    #type "CAD" 
                    symbol [! "CAD"]
                ] 
                currency [
                    #type "CDF" 
                    symbol [! "CDF"]
                ] 
                currency [
                    #type "CHF" 
                    symbol [! "CHF"]
                ] 
                currency [
                    #type "CLP" 
                    symbol [! "CLP"] 
                    symbol [#alt "narrow" ! "$"]
                ] 
                currency [
                    #type "CNH" 
                    displayName [! "CNH"] 
                    displayName [#count "one" ! "CNH"] 
                    displayName [#count "other" ! "CNH"]
                ] 
                currency [
                    #type "CNY" 
                    symbol [! "CNY"] 
                    symbol [#alt "narrow" ! "¥"]
                ] 
                currency [
                    #type "COP" 
                    symbol [! "COP"] 
                    symbol [#alt "narrow" ! "$"]
                ] 
                currency [
                    #type "CUP" 
                    symbol [#alt "narrow" ! "₱"]
                ] 
                currency [
                    #type "CVE" 
                    symbol [! "CVE"]
                ] 
                currency [
                    #type "CZK" 
                    symbol [! "CZK"]
                ] 
                currency [
                    #type "DJF" 
                    symbol [! "DJF"]
                ] 
                currency [
                    #type "DZD" 
                    symbol [! "DZD"]
                ] 
                currency [
                    #type "EGP" 
                    symbol [! "EGP"] 
                    symbol [#alt "narrow" ! "£"]
                ] 
                currency [
                    #type "ERN" 
                    symbol [! "ERN"]
                ] 
                currency [
                    #type "ETB" 
                    displayName [#count "one" ! "Ethiopian birr"] 
                    displayName [#count "other" ! "Ethiopian birrs"] 
                    symbol [! "ETB"]
                ] 
                currency [
                    #type "EUR" 
                    displayName [#count "one" ! "euro"] 
                    displayName [#count "other" ! "euro"] 
                    symbol [! "EUR"] 
                    symbol [#alt "narrow" ! "€"]
                ] 
                currency [
                    #type "FJD" 
                    symbol [! "FJD"] 
                    symbol [#alt "narrow" ! "$"]
                ] 
                currency [
                    #type "FKP" 
                    symbol [! "FKP"]
                ] 
                currency [
                    #type "GBP" 
                    symbol [! "GBP"]
                ] 
                currency [
                    #type "GEL" 
                    displayName [#count "one" ! "Georgian lari"] 
                    displayName [#count "other" ! "Georgian lari"] 
                    symbol [! "GEL"]
                ] 
                currency [
                    #type "GHS" 
                    symbol [! "GHS"]
                ] 
                currency [
                    #type "GIP" 
                    symbol [! "GIP"] 
                    symbol [#alt "narrow" ! "£"]
                ] 
                currency [
                    #type "GMD" 
                    symbol [! "GMD"]
                ] 
                currency [
                    #type "GNF" 
                    symbol [! "GNF"]
                ] 
                currency [
                    #type "GYD" 
                    symbol [! "GYD"] 
                    symbol [#alt "narrow" ! "$"]
                ] 
                currency [
                    #type "HKD" 
                    symbol [! "HKD"] 
                    symbol [#alt "narrow" ! "$"]
                ] 
                currency [
                    #type "HRK" 
                    symbol [! "HRK"]
                ] 
                currency [
                    #type "HUF" 
                    symbol [! "HUF"]
                ] 
                currency [
                    #type "IDR" 
                    symbol [! "IDR"]
                ] 
                currency [
                    #type "ILS" 
                    displayName [! "Israeli Shekel"] 
                    displayName [#count "one" ! "Israeli shekel"] 
                    displayName [#count "other" ! "Israeli sheckles"] 
                    symbol [! "ILS"]
                ] 
                currency [
                    #type "INR" 
                    symbol [! "INR"] 
                    symbol [#alt "narrow" ! "₹"]
                ] 
                currency [
                    #type "IQD" 
                    symbol [! "IQD"]
                ] 
                currency [
                    #type "IRR" 
                    symbol [! "IRR"]
                ] 
                currency [
                    #type "ISK" 
                    symbol [! "ISK"] 
                    symbol [#alt "narrow" ! "Kr"]
                ] 
                currency [
                    #type "JOD" 
                    symbol [! "JOD"]
                ] 
                currency [
                    #type "JPY" 
                    symbol [! "JPY"] 
                    symbol [#alt "narrow" ! "¥"]
                ] 
                currency [
                    #type "KES" 
                    symbol [! "KES"]
                ] 
                currency [
                    #type "KGS" 
                    symbol [! "KGS"]
                ] 
                currency [
                    #type "KHR" 
                    symbol [! "KHR"] 
                    symbol [#alt "narrow" ! "៛"]
                ] 
                currency [
                    #type "KMF" 
                    symbol [! "KMF"]
                ] 
                currency [
                    #type "KPW" 
                    symbol [! "KPW"]
                ] 
                currency [
                    #type "KRW" 
                    symbol [! "KRW"] 
                    symbol [#alt "narrow" ! "₩"]
                ] 
                currency [
                    #type "KWD" 
                    symbol [! "KWD"]
                ] 
                currency [
                    #type "KZT" 
                    displayName [#count "one" ! "Kazakhstani tenge"] 
                    displayName [#count "other" ! "Kazakhstani tenge"] 
                    symbol [! "KZT"]
                ] 
                currency [
                    #type "LAK" 
                    displayName [#count "one" ! "Laotian kip"] 
                    displayName [#count "other" ! "Laotian kip"] 
                    symbol [! "LAK"] 
                    symbol [#alt "narrow" ! "₭"]
                ] 
                currency [
                    #type "LBP" 
                    symbol [! "LBP"]
                ] 
                currency [
                    #type "LKR" 
                    symbol [! "LKR"]
                ] 
                currency [
                    #type "LRD" 
                    symbol [! "LRD"] 
                    symbol [#alt "narrow" ! "$"]
                ] 
                currency [
                    #type "LSL" 
                    displayName [#count "one" ! "Lesotho loti"] 
                    displayName [#count "other" ! "Lesotho lotis"] 
                    symbol [! "LSL"]
                ] 
                currency [
                    #type "LYD" 
                    symbol [! "LYD"]
                ] 
                currency [
                    #type "MAD" 
                    symbol [! "MAD"]
                ] 
                currency [
                    #type "MDL" 
                    symbol [! "MDL"]
                ] 
                currency [
                    #type "MGA" 
                    symbol [! "MGA"]
                ] 
                currency [
                    #type "MKD" 
                    displayName [#count "one" ! "Macedonian denar"] 
                    displayName [#count "other" ! "Macedonian denar"] 
                    symbol [! "MKD"]
                ] 
                currency [
                    #type "MMK" 
                    symbol [! "MMK"]
                ] 
                currency [
                    #type "MNT" 
                    symbol [! "MNT"] 
                    symbol [#alt "narrow" ! "₮"]
                ] 
                currency [
                    #type "MOP" 
                    symbol [! "MOP"]
                ] 
                currency [
                    #type "MRO" 
                    symbol [#draft "contributed" ! "MRO"]
                ] 
                currency [
                    #type "MUR" 
                    symbol [! "MUR"]
                ] 
                currency [
                    #type "MVR" 
                    displayName [#count "one" ! "Maldivian rufiyaa"] 
                    displayName [#count "other" ! "Maldivian rufiyaas"] 
                    symbol [! "MVR"]
                ] 
                currency [
                    #type "MWK" 
                    symbol [! "MWK"]
                ] 
                currency [
                    #type "MXN" 
                    symbol [! "MXN"]
                ] 
                currency [
                    #type "MYR" 
                    symbol [! "MYR"]
                ] 
                currency [
                    #type "MZN" 
                    symbol [! "MZN"]
                ] 
                currency [
                    #type "NAD" 
                    symbol [! "NAD"]
                ] 
                currency [
                    #type "NGN" 
                    symbol [! "NGN"] 
                    symbol [#alt "narrow" ! "₦"]
                ] 
                currency [
                    #type "NOK" 
                    symbol [! "NOK"]
                ] 
                currency [
                    #type "NPR" 
                    symbol [! "NPR"]
                ] 
                currency [
                    #type "NZD" 
                    symbol [! "NZD"] 
                    symbol [#alt "narrow" ! "$"]
                ] 
                currency [
                    #type "OMR" 
                    symbol [! "OMR"]
                ] 
                currency [
                    #type "PEN" 
                    symbol [! "PEN"]
                ] 
                currency [
                    #type "PGK" 
                    displayName [#count "one" ! "Papua New Guinean kina"] 
                    displayName [#count "other" ! "Papua New Guinean kinas"] 
                    symbol [! "PGK"]
                ] 
                currency [
                    #type "PHP" 
                    symbol [! "PHP"] 
                    symbol [#alt "narrow" ! "₱"]
                ] 
                currency [
                    #type "PLN" 
                    symbol [! "PLN"]
                ] 
                currency [
                    #type "PYG" 
                    symbol [! "PYG"] 
                    symbol [#alt "narrow" ! "Gs"]
                ] 
                currency [
                    #type "QAR" 
                    displayName [! "Qatari Riyal"] 
                    displayName [#count "one" ! "Qatari riyal"] 
                    displayName [#count "other" ! "Quatari riyals"] 
                    symbol [! "QAR"]
                ] 
                currency [
                    #type "RON" 
                    symbol [! "RON"]
                ] 
                currency [
                    #type "RSD" 
                    symbol [! "RSD"]
                ] 
                currency [
                    #type "RUB" 
                    symbol [! "RUB"]
                ] 
                currency [
                    #type "RWF" 
                    symbol [! "RWF"]
                ] 
                currency [
                    #type "SAR" 
                    symbol [! "SAR"]
                ] 
                currency [
                    #type "SBD" 
                    symbol [! "SBD"] 
                    symbol [#alt "narrow" ! "$"]
                ] 
                currency [
                    #type "SCR" 
                    symbol [! "Rs"]
                ] 
                currency [
                    #type "SDG" 
                    symbol [! "SDG"]
                ] 
                currency [
                    #type "SEK" 
                    symbol [! "SEK"] 
                    symbol [#alt "narrow" ! "Kr"]
                ] 
                currency [
                    #type "SGD" 
                    symbol [! "SGD"] 
                    symbol [#alt "narrow" ! "$"]
                ] 
                currency [
                    #type "SHP" 
                    symbol [! "SHP"]
                ] 
                currency [
                    #type "SLL" 
                    symbol [! "SLL"]
                ] 
                currency [
                    #type "SOS" 
                    symbol [! "SOS"]
                ] 
                currency [
                    #type "SRD" 
                    displayName [! "Suriname Dollar"] 
                    displayName [#count "one" ! "Suriname dollar"] 
                    displayName [#count "other" ! "Suriname dollars"] 
                    symbol [! "SRD"] 
                    symbol [#alt "narrow" ! "$"]
                ] 
                currency [
                    #type "SSP" 
                    symbol [! "SSP"] 
                    symbol [#alt "narrow" ! "£"]
                ] 
                currency [
                    #type "SYP" 
                    symbol [! "SYP"]
                ] 
                currency [
                    #type "SZL" 
                    symbol [! "SZL"]
                ] 
                currency [
                    #type "THB" 
                    symbol [#alt "narrow" ! "฿"]
                ] 
                currency [
                    #type "TJS" 
                    symbol [! "TJS"]
                ] 
                currency [
                    #type "TMT" 
                    symbol [! "TMT"]
                ] 
                currency [
                    #type "TND" 
                    symbol [! "TND"]
                ] 
                currency [
                    #type "TOP" 
                    symbol [! "TOP"]
                ] 
                currency [
                    #type "TRY" 
                    displayName [#count "one" ! "Turkish lira"] 
                    displayName [#count "other" ! "Turkish lire"] 
                    symbol [! "TRY"]
                ] 
                currency [
                    #type "TWD" 
                    symbol [! "TWD"]
                ] 
                currency [
                    #type "TZS" 
                    symbol [! "TZS"]
                ] 
                currency [
                    #type "UAH" 
                    symbol [! "UAH"] 
                    symbol [#alt "narrow" ! "₴"]
                ] 
                currency [
                    #type "UGX" 
                    symbol [! "UGX"]
                ] 
                currency [
                    #type "USD" 
                    symbol [! "USD"]
                ] 
                currency [
                    #type "UYU" 
                    displayName [! "Peso Uruguayo"] 
                    symbol [! "UYU"] 
                    symbol [#alt "narrow" ! "$U"]
                ] 
                currency [
                    #type "UZS" 
                    displayName [#count "one" ! "Uzbekistani som"] 
                    displayName [#count "other" ! "Uzbekistani soms"] 
                    symbol [! "UZS"]
                ] 
                currency [
                    #type "VEF" 
                    displayName [#count "one" ! "Venezuelan bolívar"] 
                    displayName [#count "other" ! "Venezuelan bolívars"] 
                    symbol [#draft "contributed" ! "VEF"]
                ] 
                currency [
                    #type "VES" 
                    displayName [! "VES"] 
                    displayName [#count "one" ! "VES"] 
                    displayName [#count "other" ! "VES"]
                ] 
                currency [
                    #type "VND" 
                    displayName [#count "one" ! "Vietnamese dong"] 
                    displayName [#count "other" ! "Vietnamese dongs"] 
                    symbol [! "VND"] 
                    symbol [#alt "narrow" ! "₫"]
                ] 
                currency [
                    #type "VUV" 
                    displayName [#count "one" ! "Vanuatu vatu"] 
                    displayName [#count "other" ! "Vanuatu vatus"] 
                    symbol [! "VUV"]
                ] 
                currency [
                    #type "WST" 
                    displayName [#count "one" ! "Samoan tala"] 
                    displayName [#count "other" ! "Samoan talas"] 
                    symbol [! "WST"]
                ] 
                currency [
                    #type "XAF" 
                    symbol [! "XAF"]
                ] 
                currency [
                    #type "XCD" 
                    symbol [! "XCD"]
                ] 
                currency [
                    #type "XOF" 
                    symbol [! "XOF"]
                ] 
                currency [
                    #type "XPF" 
                    symbol [! "CFP"]
                ] 
                currency [
                    #type "YER" 
                    symbol [! "YER"]
                ] 
                currency [
                    #type "ZAR" 
                    symbol [! "ZAR"]
                ] 
                currency [
                    #type "ZMW" 
                    symbol [! "ZMW"]
                ]
            ] 
            miscPatterns [
                #numberSystem "latn" 
                pattern [#type "range" ! "{0}–{1}"]
            ]
        ] 
        units [
            unitLength [
                #type "long" 
                unit [
                    #type "concentr-permille" 
                    displayName [! "per mill"] 
                    unitPattern [#count "one" ! "{0} per mill"] 
                    unitPattern [#count "other" ! "{0} per mill"]
                ] 
                unit [
                    #type "energy-kilowatt-hour" 
                    displayName [! "kilowatt hours"] 
                    unitPattern [#count "one" ! "{0} kilowatt hour"] 
                    unitPattern [#count "other" ! "{0} kilowatt hours"]
                ] 
                unit [
                    #type "length-kilometer" 
                    displayName [! "kilometre"]
                ] 
                unit [
                    #type "length-micrometer" 
                    displayName [! "micrometres"]
                ] 
                unit [
                    #type "mass-metric-ton" 
                    unitPattern [#count "one" ! "tonne"] 
                    unitPattern [#count "other" ! "{0} tonnes"]
                ] 
                unit [
                    #type "pressure-pound-force-per-square-inch" 
                    displayName [! "pounds per square inch"] 
                    unitPattern [#count "one" ! "{0} pound per square inch"] 
                    unitPattern [#count "other" ! "{0} pounds per square inch"]
                ] 
                unit [
                    #type "temperature-generic" 
                    displayName [! "degrees"]
                ] 
                unit [
                    #type "volume-fluid-ounce" 
                    displayName [! "fluid ounces"] 
                    unitPattern [#count "one" ! "{0} fluid ounce"] 
                    unitPattern [#count "other" ! "{0} fluid ounces"]
                ]
            ] 
            unitLength [
                #type "short" 
                unit [
                    #type "angle-degree" 
                    unitPattern [#count "one" ! "{0} deg."] 
                    unitPattern [#count "other" ! "{0} deg."]
                ] 
                unit [
                    #type "angle-arc-minute" 
                    displayName [! "arcmin."] 
                    unitPattern [#count "one" ! "{0} arcmin."] 
                    unitPattern [#count "other" ! "{0} arcmin."]
                ] 
                unit [
                    #type "angle-arc-second" 
                    displayName [! "arcsec."] 
                    unitPattern [#count "one" ! "{0} arcsec."] 
                    unitPattern [#count "other" ! "{0} arcsec."]
                ] 
                unit [
                    #type "concentr-milligram-ofglucose-per-deciliter" 
                    displayName [! "mg/dL"] 
                    unitPattern [#count "one" ! "{0} mg/dL"] 
                    unitPattern [#count "other" ! "{0} mg/dL"]
                ] 
                unit [
                    #type "concentr-millimole-per-liter" 
                    unitPattern [#count "one" ! "{0} mmol/L"] 
                    unitPattern [#count "other" ! "{0} mmol/L"]
                ] 
                unit [
                    #type "concentr-permille" 
                    displayName [! "per mill"]
                ] 
                unit [
                    #type "consumption-liter-per-kilometer" 
                    unitPattern [#count "one" ! "{0} L/km"] 
                    unitPattern [#count "other" ! "{0} L/km"]
                ] 
                unit [
                    #type "consumption-liter-per-100-kilometer" 
                    displayName [! "L/100 km"] 
                    unitPattern [#count "one" ! "{0} L/100 km"] 
                    unitPattern [#count "other" ! "{0} L/100 km"]
                ] 
                unit [
                    #type "consumption-mile-per-gallon" 
                    displayName [! "miles/gal. US"] 
                    unitPattern [#count "one" ! "{0} m.p.g. US"] 
                    unitPattern [#count "other" ! "{0} m.p.g. US"]
                ] 
                unit [
                    #type "consumption-mile-per-gallon-imperial" 
                    displayName [! "miles/gal."] 
                    unitPattern [#count "one" ! "{0} m.p.g."] 
                    unitPattern [#count "other" ! "{0} m.p.g."]
                ] 
                unit [
                    #type "duration-century" 
                    displayName [! "C."] 
                    unitPattern [#count "one" ! "{0} C."] 
                    unitPattern [#count "other" ! "{0} C."]
                ] 
                unit [
                    #type "duration-minute" 
                    displayName [! "min."] 
                    unitPattern [#count "one" ! "{0} min."] 
                    unitPattern [#count "other" ! "{0} mins"] 
                    perUnitPattern [! "{0}/min."]
                ] 
                unit [
                    #type "duration-second" 
                    displayName [! "sec."] 
                    unitPattern [#count "one" ! "{0} sec."] 
                    unitPattern [#count "other" ! "{0} secs"] 
                    perUnitPattern [! "{0} ps."]
                ] 
                unit [
                    #type "duration-millisecond" 
                    displayName [! "millisec."]
                ] 
                unit [
                    #type "duration-microsecond" 
                    displayName [! "μsec."]
                ] 
                unit [
                    #type "duration-nanosecond" 
                    displayName [! "nanosec."]
                ] 
                unit [
                    #type "energy-kilocalorie" 
                    displayName [! "Cal"] 
                    unitPattern [#count "one" ! "{0} Cal"] 
                    unitPattern [#count "other" ! "{0} Cal"]
                ] 
                unit [
                    #type "energy-kilowatt-hour" 
                    displayName [! "kWh"]
                ] 
                unit [
                    #type "length-light-year" 
                    unitPattern [#count "one" ! "{0} l.y."] 
                    unitPattern [#count "other" ! "{0} l.y."]
                ] 
                unit [
                    #type "length-astronomical-unit" 
                    displayName [! "AU"] 
                    unitPattern [#count "one" ! "{0} AU"] 
                    unitPattern [#count "other" ! "{0} AU"]
                ] 
                unit [
                    #type "mass-carat" 
                    unitPattern [#count "one" ! "{0} CM"] 
                    unitPattern [#count "other" ! "{0} CM"]
                ] 
                unit [
                    #type "pressure-millimeter-ofhg" 
                    displayName [! "mm Hg"] 
                    unitPattern [#count "one" ! "{0} mm Hg"] 
                    unitPattern [#count "other" ! "{0} mm Hg"]
                ] 
                unit [
                    #type "pressure-inch-ofhg" 
                    displayName [! "in Hg"]
                ] 
                unit [
                    #type "pressure-millibar" 
                    displayName [! "mb"] 
                    unitPattern [#count "one" ! "{0} mb"] 
                    unitPattern [#count "other" ! "{0} mb"]
                ] 
                unit [
                    #type "speed-meter-per-second" 
                    displayName [! "metres/sec."] 
                    unitPattern [#count "one" ! "{0} m/s."] 
                    unitPattern [#count "other" ! "{0} m/s."]
                ] 
                unit [
                    #type "temperature-generic" 
                    displayName [! "deg."] 
                    unitPattern [#count "one" ! "{0}°"] 
                    unitPattern [#count "other" ! "{0}°"]
                ] 
                unit [
                    #type "volume-megaliter" 
                    displayName [! "ML"] 
                    unitPattern [#count "one" ! "{0} ML"] 
                    unitPattern [#count "other" ! "{0} ML"]
                ] 
                unit [
                    #type "volume-hectoliter" 
                    displayName [! "hL"] 
                    unitPattern [#count "one" ! "{0} hL"] 
                    unitPattern [#count "other" ! "{0} hL"]
                ] 
                unit [
                    #type "volume-liter" 
                    unitPattern [#count "one" ! "{0} L"] 
                    unitPattern [#count "other" ! "{0} L"] 
                    perUnitPattern [! "{0}/L"]
                ] 
                unit [
                    #type "volume-deciliter" 
                    displayName [! "dL"] 
                    unitPattern [#count "one" ! "{0} dL"] 
                    unitPattern [#count "other" ! "{0} dL"]
                ] 
                unit [
                    #type "volume-centiliter" 
                    displayName [! "cL"] 
                    unitPattern [#count "one" ! "{0} cL"] 
                    unitPattern [#count "other" ! "{0} cL"]
                ] 
                unit [
                    #type "volume-milliliter" 
                    displayName [! "mL"] 
                    unitPattern [#count "one" ! "{0} mL"] 
                    unitPattern [#count "other" ! "{0} mL"]
                ] 
                unit [
                    #type "volume-bushel" 
                    unitPattern [#count "one" ! "{0} bus."] 
                    unitPattern [#count "other" ! "{0} bus."]
                ] 
                unit [
                    #type "volume-gallon" 
                    displayName [! "US gal."] 
                    unitPattern [#count "one" ! "{0} gal. US"] 
                    unitPattern [#count "other" ! "{0} gal. US"] 
                    perUnitPattern [! "{0}/gal. US"]
                ] 
                unit [
                    #type "volume-gallon-imperial" 
                    displayName [! "gal."] 
                    unitPattern [#count "one" ! "{0} gal."] 
                    unitPattern [#count "other" ! "{0} gal."] 
                    perUnitPattern [! "{0}/gal."]
                ] 
                unit [
                    #type "volume-fluid-ounce" 
                    displayName [! "fl oz"] 
                    unitPattern [#count "one" ! "{0} fl oz"] 
                    unitPattern [#count "other" ! "{0} fl oz"]
                ]
            ] 
            unitLength [
                #type "narrow" 
                compoundUnit [
                    #type "per" 
                    compoundUnitPattern [! "{0}/{1}"]
                ] 
                unit [
                    #type "concentr-milligram-ofglucose-per-deciliter" 
                    displayName [! "mg/dL"] 
                    unitPattern [#count "one" ! "{0}mg/dL"] 
                    unitPattern [#count "other" ! "{0}mg/dL"]
                ] 
                unit [
                    #type "concentr-millimole-per-liter" 
                    displayName [! "mmol/L"] 
                    unitPattern [#count "one" ! "{0}mmol/L"] 
                    unitPattern [#count "other" ! "{0}mmol/L"]
                ] 
                unit [
                    #type "consumption-liter-per-kilometer" 
                    displayName [! "L/km"] 
                    unitPattern [#count "one" ! "{0}L/km"] 
                    unitPattern [#count "other" ! "{0}L/km"]
                ] 
                unit [
                    #type "consumption-liter-per-100-kilometer" 
                    displayName [! "L/100km"] 
                    unitPattern [#count "one" ! "{0}L/100km"] 
                    unitPattern [#count "other" ! "{0}L/100km"]
                ] 
                unit [
                    #type "duration-century" 
                    displayName [! "C."] 
                    unitPattern [#count "one" ! "{0}C."] 
                    unitPattern [#count "other" ! "{0}C."]
                ] 
                unit [
                    #type "duration-minute" 
                    displayName [! "min."] 
                    unitPattern [#count "one" ! "{0}min."] 
                    unitPattern [#count "other" ! "{0}min."]
                ] 
                unit [
                    #type "duration-second" 
                    displayName [! "sec."] 
                    unitPattern [#count "one" ! "{0}s."] 
                    unitPattern [#count "other" ! "{0}s."]
                ] 
                unit [
                    #type "duration-millisecond" 
                    displayName [! "msec."]
                ] 
                unit [
                    #type "duration-microsecond" 
                    displayName [! "μsec."]
                ] 
                unit [
                    #type "speed-kilometer-per-hour" 
                    unitPattern [#count "one" ! "{0} km/h"] 
                    unitPattern [#count "other" ! "{0} km/h"]
                ] 
                unit [
                    #type "temperature-generic" 
                    displayName [! "°"]
                ] 
                unit [
                    #type "temperature-celsius" 
                    unitPattern [#count "one" ! "{0}°C"] 
                    unitPattern [#count "other" ! "{0}°C"]
                ] 
                unit [
                    #type "volume-megaliter" 
                    displayName [! "ML"] 
                    unitPattern [#count "one" ! "{0}ML"] 
                    unitPattern [#count "other" ! "{0}ML"]
                ] 
                unit [
                    #type "volume-hectoliter" 
                    displayName [! "hL"] 
                    unitPattern [#count "one" ! "{0}hL"] 
                    unitPattern [#count "other" ! "{0}hL"]
                ] 
                unit [
                    #type "volume-liter" 
                    unitPattern [#count "one" ! "{0}L"] 
                    unitPattern [#count "other" ! "{0}L"] 
                    perUnitPattern [! "{0}/L"]
                ] 
                unit [
                    #type "volume-deciliter" 
                    displayName [! "dL"] 
                    unitPattern [#count "one" ! "{0}dL"] 
                    unitPattern [#count "other" ! "{0}dL"]
                ] 
                unit [
                    #type "volume-centiliter" 
                    displayName [! "cL"] 
                    unitPattern [#count "one" ! "{0}cL"] 
                    unitPattern [#count "other" ! "{0}cL"]
                ] 
                unit [
                    #type "volume-milliliter" 
                    displayName [! "mL"] 
                    unitPattern [#count "one" ! "{0}mL"] 
                    unitPattern [#count "other" ! "{0}mL"]
                ] 
                unit [
                    #type "volume-bushel" 
                    unitPattern [#count "one" ! "{0} bus."] 
                    unitPattern [#count "other" ! "{0} bus."]
                ] 
                unit [
                    #type "volume-gallon" 
                    displayName [! "gal. US"] 
                    unitPattern [#count "one" ! "{0}gal. US"] 
                    unitPattern [#count "other" ! "{0}gal. US"] 
                    perUnitPattern [! "{0}/gal. US"]
                ] 
                unit [
                    #type "volume-gallon-imperial" 
                    displayName [! "gal."] 
                    unitPattern [#count "one" ! "{0}gal."] 
                    unitPattern [#count "other" ! "{0}gal."] 
                    perUnitPattern [! "{0}/gal."]
                ] 
                unit [
                    #type "volume-quart" 
                    displayName [! "qt US"] 
                    unitPattern [#count "one" ! "{0}qt US"] 
                    unitPattern [#count "other" ! "{0}qt US"]
                ] 
                unit [
                    #type "volume-fluid-ounce-imperial" 
                    displayName [! "Imp. fl oz"]
                ] 
                unit [
                    #type "volume-dessert-spoon" 
                    displayName [! "dsp US"] 
                    unitPattern [#count "one" ! "{0}dsp US"] 
                    unitPattern [#count "other" ! "{0}dsp US"]
                ] 
                unit [
                    #type "volume-dessert-spoon-imperial" 
                    displayName [! "dsp Imp."] 
                    unitPattern [#count "one" ! "{0}dsp-Imp."] 
                    unitPattern [#count "other" ! "{0}dsp-Imp."]
                ] 
                unit [
                    #type "volume-quart-imperial" 
                    displayName [! "qt Imp."]
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
        characterLabels [
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
            styleName [#type "slnt" #subtype "24" ! "extra slanted"] 
            styleName [#type "wdth" #subtype "50" ! "ultra condensed"] 
            styleName [#type "wdth" #subtype "50" #alt "compressed" ! "ultra compressed"] 
            styleName [#type "wdth" #subtype "50" #alt "narrow" ! "ultra narrow"] 
            styleName [#type "wdth" #subtype "62.5" ! "extra condensed"] 
            styleName [#type "wdth" #subtype "62.5" #alt "compressed" ! "extra compressed"] 
            styleName [#type "wdth" #subtype "62.5" #alt "narrow" ! "extra narrow"] 
            styleName [#type "wdth" #subtype "150" ! "extra expanded"] 
            styleName [#type "wdth" #subtype "150" #alt "extended" ! "extra extended"] 
            styleName [#type "wdth" #subtype "150" #alt "wide" ! "extra wide"] 
            styleName [#type "wdth" #subtype "200" ! "ultra expanded"] 
            styleName [#type "wdth" #subtype "200" #alt "extended" ! "ultra extended"] 
            styleName [#type "wdth" #subtype "200" #alt "wide" ! "ultra wide"] 
            styleName [#type "wght" #subtype "200" ! "extra light"] 
            styleName [#type "wght" #subtype "200" #alt "ultra" ! "ultra light"] 
            styleName [#type "wght" #subtype "800" ! "extra bold"] 
            styleName [#type "wght" #subtype "950" ! "extra black"] 
            styleName [#type "wght" #subtype "950" #alt "ultrablack" ! "ultra black"] 
            styleName [#type "wght" #subtype "950" #alt "ultraheavy" ! "ultra heavy"]
        ]
    ]

