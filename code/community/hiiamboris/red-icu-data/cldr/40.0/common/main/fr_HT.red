
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "fr"] 
            territory [#type "HT"]
        ] 
        dates [
            calendars [
                calendar [
                    #type "gregorian" 
                    dayPeriods [
                        dayPeriodContext [
                            #type "format" 
                            dayPeriodWidth [
                                #type "wide" 
                                dayPeriod [#type "midnight" #draft "contributed" ! "minuit"] 
                                dayPeriod [#type "noon" #draft "contributed" ! "midi"] 
                                dayPeriod [#type "morning1" #draft "contributed" ! "du matin"] 
                                dayPeriod [#type "afternoon1" #draft "contributed" ! "de l’après-midi"] 
                                dayPeriod [#type "evening1" #draft "contributed" ! "du soir"] 
                                dayPeriod [#type "night1" #draft "contributed" ! "de la nuit"]
                            ]
                        ]
                    ]
                ]
            ] 
            fields [
                field [
                    #type "day-short" 
                    displayName [#draft "contributed" ! "jr."]
                ] 
                field [
                    #type "day-narrow" 
                    displayName [#draft "contributed" ! "jr."]
                ] 
                field [
                    #type "sun-narrow" 
                    relative [#type "-1" #draft "contributed" ! "dim dernier"] 
                    relative [#type "0" #draft "contributed" ! "ce dim"] 
                    relative [#type "1" #draft "contributed" ! "dim prochain"]
                ] 
                field [
                    #type "mon-narrow" 
                    relative [#type "-1" #draft "contributed" ! "lun dernier"] 
                    relative [#type "0" #draft "contributed" ! "ce lun"] 
                    relative [#type "1" #draft "contributed" ! "lun prochain"]
                ] 
                field [
                    #type "tue-narrow" 
                    relative [#type "-1" #draft "contributed" ! "mar dernier"] 
                    relative [#type "0" #draft "contributed" ! "ce mar"] 
                    relative [#type "1" #draft "contributed" ! "mar prochain"]
                ] 
                field [
                    #type "wed-narrow" 
                    relative [#type "-1" #draft "contributed" ! "mer dernier"] 
                    relative [#type "0" #draft "contributed" ! "ce mer"] 
                    relative [#type "1" #draft "contributed" ! "mer prochain"]
                ] 
                field [
                    #type "thu-narrow" 
                    relative [#type "-1" #draft "contributed" ! "jeu dernier"] 
                    relative [#type "0" #draft "contributed" ! "ce jeu"] 
                    relative [#type "1" #draft "contributed" ! "jeu prochain"]
                ] 
                field [
                    #type "fri-narrow" 
                    relative [#type "-1" #draft "contributed" ! "ven dernier"] 
                    relative [#type "0" #draft "contributed" ! "ce ven"] 
                    relative [#type "1" #draft "contributed" ! "ven prochain"]
                ] 
                field [
                    #type "sat-narrow" 
                    relative [#type "-1" #draft "contributed" ! "sam dernier"] 
                    relative [#type "0" #draft "contributed" ! "ce sam"] 
                    relative [#type "1" #draft "contributed" ! "sam prochain"]
                ] 
                field [
                    #type "hour-short" 
                    displayName [#draft "contributed" ! "hr"]
                ] 
                field [
                    #type "hour-narrow" 
                    displayName [#draft "contributed" ! "hr"]
                ] 
                field [
                    #type "minute-short" 
                    displayName [#draft "contributed" ! "min."]
                ] 
                field [
                    #type "minute-narrow" 
                    displayName [#draft "contributed" ! "min."]
                ] 
                field [
                    #type "second-narrow" 
                    displayName [#draft "contributed" ! "sec."]
                ]
            ]
        ] 
        numbers [
            currencies [
                currency [
                    #type "HTG" 
                    symbol [! "G"]
                ]
            ]
        ] 
        units [
            unitLength [
                #type "long" 
                unit [
                    #type "area-hectare" 
                    displayName [#draft "contributed" ! "carreau"] 
                    unitPattern [#count "one" #draft "contributed" ! "{0}carreau"] 
                    unitPattern [#count "other" #draft "contributed" ! "{0}carreaux"]
                ] 
                unit [
                    #type "volume-cubic-meter" 
                    perUnitPattern [#draft "contributed" ! "{0} pour chaque metre cube"]
                ] 
                unit [
                    #type "volume-cubic-centimeter" 
                    perUnitPattern [#draft "contributed" ! "{0} pour chaque centimetre cube"]
                ]
            ] 
            unitLength [
                #type "short" 
                unit [
                    #type "duration-century" 
                    displayName [#draft "contributed" ! "sec"]
                ] 
                unit [
                    #type "mass-gram" 
                    unitPattern [#count "one" #draft "contributed" ! "{0}gr"] 
                    unitPattern [#count "other" #draft "contributed" ! "{0}gr"]
                ] 
                unit [
                    #type "mass-carat" 
                    displayName [#draft "contributed" ! "kr"] 
                    unitPattern [#count "one" #draft "contributed" ! "{0}kr"] 
                    unitPattern [#count "other" #draft "contributed" ! "{0}kr"]
                ]
            ] 
            unitLength [
                #type "narrow" 
                unit [
                    #type "mass-gram" 
                    displayName [#draft "contributed" ! "gr."]
                ]
            ]
        ]
    ]

