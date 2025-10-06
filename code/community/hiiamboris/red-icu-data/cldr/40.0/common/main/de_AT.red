
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "de"] 
            territory [#type "AT"]
        ] 
        localeDisplayNames [
            languages [
                language [#type "ar_001" #draft "contributed" ! "modernes Hocharabisch"] 
                language [#type "car" #draft "contributed" ! "karibische Sprache"] 
                language [#type "chb" #draft "contributed" ! "Chibcha-Sprache"] 
                language [#type "del" #draft "contributed" ! "Delawarisch"] 
                language [#type "fur" #draft "contributed" ! "Friulanisch"] 
                language [#type "ha" #draft "contributed" ! "Hausa"] 
                language [#type "haw" #draft "contributed" ! "Hawaiianisch"] 
                language [#type "hmn" #draft "contributed" ! "Miao-Sprache"] 
                language [#type "mus" #draft "contributed" ! "Muskogee-Sprache"] 
                language [#type "niu" #draft "contributed" ! "Niueanisch"] 
                language [#type "pag" #draft "contributed" ! "Pangasinensisch"] 
                language [#type "sh" #draft "contributed" ! "Serbokroatisch"] 
                language [#type "szl" #draft "contributed" ! "Schlesisch"]
            ] 
            territories [
                territory [#type "SJ" #draft "contributed" ! "Svalbard und Jan Mayen"]
            ] 
            measurementSystemNames [
                measurementSystemName [#type "metric" #draft "contributed" ! "Internationales Maßsystem (SI)"] 
                measurementSystemName [#type "UK" #draft "contributed" ! "Englisches Maßsystem"] 
                measurementSystemName [#type "US" #draft "contributed" ! "Angloamerikanisches Maßsystem"]
            ]
        ] 
        characters [
            exemplarCharacters [#type "index" ! {[A Ä B C D E F G H I J K L M N O Ö P Q R S T U Ü V W X Y Z]}] 
            exemplarCharacters [#type "numbers" ! "[  \- ‑ , % ‰ + 0 1 2 3 4 5 6 7 8 9]"]
        ] 
        dates [
            calendars [
                calendar [
                    #type "gregorian" 
                    months [
                        monthContext [
                            #type "format" 
                            monthWidth [
                                #type "abbreviated" 
                                month [#type "1" ! "Jän."] 
                                month [#type "2" ! "Feb."] 
                                month [#type "3" ! "März"] 
                                month [#type "4" ! "Apr."] 
                                month [#type "5" ! "Mai"] 
                                month [#type "6" ! "Juni"] 
                                month [#type "7" ! "Juli"] 
                                month [#type "8" ! "Aug."] 
                                month [#type "9" ! "Sep."] 
                                month [#type "10" ! "Okt."] 
                                month [#type "11" ! "Nov."] 
                                month [#type "12" ! "Dez."]
                            ] 
                            monthWidth [
                                #type "wide" 
                                month [#type "1" ! "Jänner"] 
                                month [#type "2" ! "Februar"] 
                                month [#type "3" ! "März"] 
                                month [#type "4" ! "April"] 
                                month [#type "5" ! "Mai"] 
                                month [#type "6" ! "Juni"] 
                                month [#type "7" ! "Juli"] 
                                month [#type "8" ! "August"] 
                                month [#type "9" ! "September"] 
                                month [#type "10" ! "Oktober"] 
                                month [#type "11" ! "November"] 
                                month [#type "12" ! "Dezember"]
                            ]
                        ] 
                        monthContext [
                            #type "stand-alone" 
                            monthWidth [
                                #type "abbreviated" 
                                month [#type "1" ! "Jän"] 
                                month [#type "2" ! "Feb"] 
                                month [#type "3" ! "Mär"] 
                                month [#type "4" ! "Apr"] 
                                month [#type "5" ! "Mai"] 
                                month [#type "6" ! "Jun"] 
                                month [#type "7" ! "Jul"] 
                                month [#type "8" ! "Aug"] 
                                month [#type "9" ! "Sep"] 
                                month [#type "10" ! "Okt"] 
                                month [#type "11" ! "Nov"] 
                                month [#type "12" ! "Dez"]
                            ] 
                            monthWidth [
                                #type "wide" 
                                month [#type "1" ! "Jänner"] 
                                month [#type "2" ! "Februar"] 
                                month [#type "3" ! "März"] 
                                month [#type "4" ! "April"] 
                                month [#type "5" ! "Mai"] 
                                month [#type "6" ! "Juni"] 
                                month [#type "7" ! "Juli"] 
                                month [#type "8" ! "August"] 
                                month [#type "9" ! "September"] 
                                month [#type "10" ! "Oktober"] 
                                month [#type "11" ! "November"] 
                                month [#type "12" ! "Dezember"]
                            ]
                        ]
                    ] 
                    dayPeriods [
                        dayPeriodContext [
                            #type "stand-alone" 
                            dayPeriodWidth [
                                #type "narrow" 
                                dayPeriod [#type "am" #draft "contributed" ! "vm."] 
                                dayPeriod [#type "pm" #draft "contributed" ! "nm."]
                            ]
                        ]
                    ]
                ]
            ]
        ] 
        numbers [
            symbols [
                #numberSystem "latn" 
                group [#draft "contributed" ! " "] 
                currencyGroup [! "."]
            ] 
            currencyFormats [
                #numberSystem "latn" 
                currencyFormatLength [
                    currencyFormat [
                        #type "standard" 
                        pattern [! "¤ #,##0.00"]
                    ]
                ]
            ]
        ]
    ]

