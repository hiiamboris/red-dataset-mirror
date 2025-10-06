
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "ar"] 
            territory [#type "AE"]
        ] 
        localeDisplayNames [
            territories [
                territory [#type "CI" #alt "variant" #draft "contributed" ! "ساحل العاج"] 
                territory [#type "TL" #alt "variant" #draft "contributed" ! "التيمور الشرقية"]
            ]
        ] 
        dates [
            calendars [
                calendar [
                    #type "gregorian" 
                    eras [
                        eraNames [
                            era [#type "0" #alt "variant" #draft "contributed" ! "قبل الميلاد"]
                        ] 
                        eraAbbr [
                            era [#type "0" #alt "variant" #draft "contributed" ! "ق.م"]
                        ]
                    ]
                ]
            ] 
            fields [
                field [
                    #type "year" 
                    relative [#type "-1" #draft "contributed" ! "السنة الماضية"] 
                    relative [#type "0" #draft "contributed" ! "هذه السنة"] 
                    relative [#type "1" #draft "contributed" ! "السنة التالية"]
                ]
            ]
        ] 
        numbers [
            defaultNumberingSystem [! "latn"] 
            currencies [
                currency [
                    #type "BND" 
                    symbol [#alt "narrow" #draft "contributed" ! "$"]
                ]
            ]
        ]
    ]

