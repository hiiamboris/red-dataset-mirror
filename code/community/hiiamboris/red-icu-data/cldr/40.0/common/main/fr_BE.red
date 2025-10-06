
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "fr"] 
            territory [#type "BE"]
        ] 
        localeDisplayNames [
            languages [
                language [#type "frp" #draft "contributed" ! "franco-provençal"] 
                language [#type "goh" #draft "contributed" ! "ancien haut-allemand"] 
                language [#type "gu" #draft "contributed" ! "gujarati"] 
                language [#type "njo" #draft "contributed" ! "ao"]
            ] 
            territories [
                territory [#type "GS" #draft "contributed" ! "Îles Géorgie du Sud et Sandwich du Sud"]
            ]
        ] 
        dates [
            calendars [
                calendar [
                    #type "generic" 
                    dateFormats [
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "d/MM/yy GGGGG"] 
                                datetimeSkeleton [! "GGGGGyyMMd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        intervalFormats [
                            intervalFormatItem [
                                #id "h" 
                                greatestDifference [#id "h" #draft "unconfirmed" ! "h–h a"]
                            ] 
                            intervalFormatItem [
                                #id "H" 
                                greatestDifference [#id "H" #draft "unconfirmed" ! "HH–HH"]
                            ] 
                            intervalFormatItem [
                                #id "hm" 
                                greatestDifference [#id "m" #draft "unconfirmed" ! "h:mm–h:mm a"]
                            ] 
                            intervalFormatItem [
                                #id "Hm" 
                                greatestDifference [#id "m" #draft "unconfirmed" ! "HH:mm–HH:mm"]
                            ] 
                            intervalFormatItem [
                                #id "hmv" 
                                greatestDifference [#id "h" #draft "unconfirmed" ! "h:mm–h:mm a v"] 
                                greatestDifference [#id "m" #draft "unconfirmed" ! "h:mm–h:mm a v"]
                            ] 
                            intervalFormatItem [
                                #id "Hmv" 
                                greatestDifference [#id "H" #draft "unconfirmed" ! "HH:mm–HH:mm v"] 
                                greatestDifference [#id "m" #draft "unconfirmed" ! "HH:mm–HH:mm v"]
                            ] 
                            intervalFormatItem [
                                #id "hv" 
                                greatestDifference [#id "h" #draft "unconfirmed" ! "h–h a v"]
                            ] 
                            intervalFormatItem [
                                #id "Hv" 
                                greatestDifference [#id "H" #draft "unconfirmed" ! "HH–HH v"]
                            ]
                        ]
                    ]
                ] 
                calendar [
                    #type "gregorian" 
                    dateFormats [
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "d/MM/yy"] 
                                datetimeSkeleton [! "yyMMd"]
                            ]
                        ]
                    ] 
                    timeFormats [
                        timeFormatLength [
                            #type "full" 
                            timeFormat [
                                pattern [! "H 'h' mm 'min' ss 's' zzzz"] 
                                datetimeSkeleton [! "Hmmsszzzz"]
                            ]
                        ]
                    ]
                ]
            ]
        ]
    ]

