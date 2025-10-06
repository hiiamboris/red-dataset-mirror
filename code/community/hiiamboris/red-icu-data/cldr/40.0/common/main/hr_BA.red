
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "hr"] 
            territory [#type "BA"]
        ] 
        dates [
            calendars [
                calendar [
                    #type "gregorian" 
                    days [
                        dayContext [
                            #type "stand-alone" 
                            dayWidth [
                                #type "narrow" 
                                day [#type "sun" #draft "contributed" ! "N"] 
                                day [#type "mon" #draft "contributed" ! "P"] 
                                day [#type "tue" #draft "contributed" ! "U"] 
                                day [#type "wed" #draft "contributed" ! "S"] 
                                day [#type "thu" #draft "contributed" ! "Č"] 
                                day [#type "fri" #draft "contributed" ! "P"] 
                                day [#type "sat" #draft "contributed" ! "S"]
                            ]
                        ]
                    ] 
                    quarters [
                        quarterContext [
                            #type "format" 
                            quarterWidth [
                                #type "abbreviated" 
                                quarter [#type "1" #draft "contributed" ! "1. kv."] 
                                quarter [#type "2" #draft "contributed" ! "2. kv."] 
                                quarter [#type "3" #draft "contributed" ! "3. kv."] 
                                quarter [#type "4" #draft "contributed" ! "4. kv."]
                            ]
                        ]
                    ] 
                    dateFormats [
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [#draft "contributed" ! "d. M. yy."] 
                                datetimeSkeleton [#draft "contributed" ! "yyMd"]
                            ]
                        ]
                    ]
                ]
            ]
        ] 
        numbers [
            currencies [
                currency [
                    #type "BAM" 
                    symbol [! "KM"]
                ]
            ]
        ]
    ]

