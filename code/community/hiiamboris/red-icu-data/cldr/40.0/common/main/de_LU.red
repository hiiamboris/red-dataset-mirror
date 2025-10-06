
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "de"] 
            territory [#type "LU"]
        ] 
        dates [
            calendars [
                calendar [
                    #type "gregorian" 
                    dayPeriods [
                        dayPeriodContext [
                            #type "format" 
                            dayPeriodWidth [
                                #type "narrow" 
                                dayPeriod [#type "am" #draft "contributed" ! "vorm."] 
                                dayPeriod [#type "pm" #draft "contributed" ! "nachm."]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "h" #draft "contributed" ! "h a"]
                        ]
                    ]
                ]
            ]
        ] 
        numbers [
            currencies [
                currency [
                    #type "LUF" 
                    symbol [! "F"] 
                    decimal [! "."] 
                    group [! ","]
                ]
            ]
        ]
    ]

