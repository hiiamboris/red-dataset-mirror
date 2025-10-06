
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "fr"] 
            territory [#type "ML"]
        ] 
        dates [
            calendars [
                calendar [
                    #type "gregorian" 
                    quarters [
                        quarterContext [
                            #type "format" 
                            quarterWidth [
                                #type "wide" 
                                quarter [#type "1" #draft "contributed" ! "le 1er trimestre"] 
                                quarter [#type "2" #draft "contributed" ! "le 2ème trimestre"] 
                                quarter [#type "3" #draft "contributed" ! "le 3ème trimestre"] 
                                quarter [#type "4" #draft "contributed" ! "le 4ème trimestre"]
                            ]
                        ] 
                        quarterContext [
                            #type "stand-alone" 
                            quarterWidth [
                                #type "wide" 
                                quarter [#type "1" #draft "contributed" ! "1er trimestre"] 
                                quarter [#type "2" #draft "contributed" ! "2ème trimestre"] 
                                quarter [#type "3" #draft "contributed" ! "3ème trimestre"] 
                                quarter [#type "4" #draft "contributed" ! "4ème trimestre"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        dateTimeFormatLength [
                            #type "medium" 
                            dateTimeFormat [
                                pattern [#draft "contributed" ! "{1}, {0}"]
                            ]
                        ] 
                        dateTimeFormatLength [
                            #type "short" 
                            dateTimeFormat [
                                pattern [#draft "contributed" ! "{1}, {0}"]
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

