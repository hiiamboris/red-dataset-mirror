
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "ar"] 
            territory [#type "MA"]
        ] 
        characters [
            exemplarCharacters [#type "auxiliary" ! {[\u200C\u200D\u200E\u200F پ چ ژ ڜ ڢ ڤ ڥ ٯ ڧ ڨ ک ڭ گ ݣ ی]}] 
            exemplarCharacters [#type "numbers" ! "[\u200E \- ‑ , . % ‰ + 0 1 2 3 4 5 6 7 8 9]"]
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
                                month [#type "4" ! "أبريل"] 
                                month [#type "5" ! "ماي"] 
                                month [#type "7" ! "يوليوز"] 
                                month [#type "8" ! "غشت"] 
                                month [#type "9" ! "شتنبر"] 
                                month [#type "11" ! "نونبر"] 
                                month [#type "12" ! "دجنبر"]
                            ] 
                            monthWidth [
                                #type "narrow" 
                                month [#type "4" ! "أ"] 
                                month [#type "5" ! "م"] 
                                month [#type "6" ! "ن"] 
                                month [#type "7" ! "ل"] 
                                month [#type "9" ! "ش"] 
                                month [#type "10" ! "ك"] 
                                month [#type "11" ! "ب"] 
                                month [#type "12" ! "د"]
                            ] 
                            monthWidth [
                                #type "wide" 
                                month [#type "4" ! "أبريل"] 
                                month [#type "5" ! "ماي"] 
                                month [#type "7" ! "يوليوز"] 
                                month [#type "8" ! "غشت"] 
                                month [#type "9" ! "شتنبر"] 
                                month [#type "11" ! "نونبر"] 
                                month [#type "12" ! "دجنبر"]
                            ]
                        ] 
                        monthContext [
                            #type "stand-alone" 
                            monthWidth [
                                #type "abbreviated" 
                                month [#type "5" ! "ماي"] 
                                month [#type "7" ! "يوليوز"] 
                                month [#type "8" ! "غشت"] 
                                month [#type "9" ! "شتنبر"] 
                                month [#type "11" ! "نونبر"] 
                                month [#type "12" ! "دجنبر"]
                            ] 
                            monthWidth [
                                #type "narrow" 
                                month [#type "4" ! "أ"] 
                                month [#type "5" ! "م"] 
                                month [#type "6" ! "ن"] 
                                month [#type "7" ! "ل"] 
                                month [#type "9" ! "ش"] 
                                month [#type "10" ! "ك"] 
                                month [#type "11" ! "ب"] 
                                month [#type "12" ! "د"]
                            ] 
                            monthWidth [
                                #type "wide" 
                                month [#type "4" ! "أبريل"] 
                                month [#type "5" ! "ماي"] 
                                month [#type "7" ! "يوليوز"] 
                                month [#type "8" ! "غشت"] 
                                month [#type "9" ! "شتنبر"] 
                                month [#type "11" ! "نونبر"] 
                                month [#type "12" ! "دجنبر"]
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
                ]
            ]
        ] 
        numbers [
            defaultNumberingSystem [! "latn"] 
            symbols [
                #numberSystem "latn" 
                decimal [! ","] 
                group [! "."]
            ]
        ]
    ]

