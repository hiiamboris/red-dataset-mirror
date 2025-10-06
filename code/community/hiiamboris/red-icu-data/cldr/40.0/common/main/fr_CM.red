
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "fr"] 
            territory [#type "CM"]
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
                                dayPeriod [#type "am" #draft "contributed" ! "mat."] 
                                dayPeriod [#type "pm" #draft "contributed" ! "soir"]
                            ] 
                            dayPeriodWidth [
                                #type "narrow" 
                                dayPeriod [#type "am" #draft "contributed" ! "mat."] 
                                dayPeriod [#type "pm" #draft "contributed" ! "soir"]
                            ] 
                            dayPeriodWidth [
                                #type "wide" 
                                dayPeriod [#type "am" #draft "contributed" ! "matin"] 
                                dayPeriod [#type "pm" #draft "contributed" ! "soir"]
                            ]
                        ] 
                        dayPeriodContext [
                            #type "stand-alone" 
                            dayPeriodWidth [
                                #type "abbreviated" 
                                dayPeriod [#type "am" #draft "contributed" ! "mat."] 
                                dayPeriod [#type "pm" #draft "contributed" ! "soir"]
                            ] 
                            dayPeriodWidth [
                                #type "narrow" 
                                dayPeriod [#type "am" #draft "contributed" ! "mat."] 
                                dayPeriod [#type "pm" #draft "contributed" ! "soir"]
                            ] 
                            dayPeriodWidth [
                                #type "wide" 
                                dayPeriod [#type "am" #draft "contributed" ! "matin"] 
                                dayPeriod [#type "pm" #draft "contributed" ! "soir"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "Ehm" #draft "contributed" ! "E h:mm"] 
                            dateFormatItem [#id "Ehms" #draft "contributed" ! "E h:mm:ss"] 
                            dateFormatItem [#id "h" #draft "contributed" ! "h"] 
                            dateFormatItem [#id "hm" #draft "contributed" ! "h:mm"] 
                            dateFormatItem [#id "hms" #draft "contributed" ! "h:mm:ss"] 
                            dateFormatItem [#id "hmsv" #draft "contributed" ! "h:mm:ss v"] 
                            dateFormatItem [#id "hmv" #draft "contributed" ! "h:mm v"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "h" 
                                greatestDifference [#id "a" #draft "contributed" ! "h – h"] 
                                greatestDifference [#id "h" #draft "contributed" ! "h – h"]
                            ] 
                            intervalFormatItem [
                                #id "hm" 
                                greatestDifference [#id "a" #draft "contributed" ! "h:mm – h:mm"] 
                                greatestDifference [#id "h" #draft "contributed" ! "h:mm – h:mm"] 
                                greatestDifference [#id "m" #draft "contributed" ! "h:mm – h:mm"]
                            ] 
                            intervalFormatItem [
                                #id "hmv" 
                                greatestDifference [#id "a" #draft "contributed" ! "h:mm – h:mm v"] 
                                greatestDifference [#id "h" #draft "contributed" ! "h:mm – h:mm v"] 
                                greatestDifference [#id "m" #draft "contributed" ! "h:mm – h:mm v"]
                            ] 
                            intervalFormatItem [
                                #id "hv" 
                                greatestDifference [#id "a" #draft "contributed" ! "h – h v"] 
                                greatestDifference [#id "h" #draft "contributed" ! "h – h v"]
                            ]
                        ]
                    ]
                ]
            ]
        ]
    ]

