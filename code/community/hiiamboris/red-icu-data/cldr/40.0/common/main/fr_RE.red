
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "fr"] 
            territory [#type "RE"]
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
                                dayPeriod [#type "midnight" #draft "contributed" ! "min."] 
                                dayPeriod [#type "noon" #draft "contributed" ! "midi"] 
                                dayPeriod [#type "morning1" #draft "contributed" ! "mat."] 
                                dayPeriod [#type "afternoon1" #draft "contributed" ! "ap.m."] 
                                dayPeriod [#type "evening1" #draft "contributed" ! "soir"] 
                                dayPeriod [#type "night1" #draft "contributed" ! "nuit"]
                            ]
                        ] 
                        dayPeriodContext [
                            #type "stand-alone" 
                            dayPeriodWidth [
                                #type "abbreviated" 
                                dayPeriod [#type "midnight" #draft "contributed" ! "min."]
                            ] 
                            dayPeriodWidth [
                                #type "narrow" 
                                dayPeriod [#type "midnight" #draft "contributed" ! "min."]
                            ]
                        ]
                    ]
                ]
            ]
        ] 
        numbers [
            miscPatterns [
                #numberSystem "latn" 
                pattern [#type "atLeast" #draft "contributed" ! "au moins {0}"]
            ]
        ]
    ]

