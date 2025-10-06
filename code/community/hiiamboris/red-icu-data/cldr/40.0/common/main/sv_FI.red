
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "sv"] 
            territory [#type "FI"]
        ] 
        localeDisplayNames [
            scripts [
                script [#type "Arab" #alt "variant" #draft "contributed" ! "persisk-arabiska"]
            ] 
            keys [
                key [#type "timezone" #draft "contributed" ! "tidszon"]
            ] 
            types [
                type [#key "collation" #type "big5han" #draft "unconfirmed" ! "kinesiska i big5-sorteringsordning"] 
                type [#key "collation" #type "gb2312han" #draft "unconfirmed" ! "kinesiska i gb2312-sorteringsordning"] 
                type [#key "collation" #type "pinyin" #draft "unconfirmed" ! "kinesiska i pinyin-sorteringsordning"] 
                type [#key "collation" #type "stroke" #draft "unconfirmed" ! "kinesiska i strecksorteringsordning"]
            ]
        ] 
        dates [
            calendars [
                calendar [
                    #type "gregorian" 
                    quarters [
                        quarterContext [
                            #type "format" 
                            quarterWidth [
                                #type "abbreviated" 
                                quarter [#type "1" #draft "contributed" ! "Q1"] 
                                quarter [#type "2" #draft "contributed" ! "Q2"] 
                                quarter [#type "3" #draft "contributed" ! "Q3"] 
                                quarter [#type "4" #draft "contributed" ! "Q4"]
                            ]
                        ] 
                        quarterContext [
                            #type "stand-alone" 
                            quarterWidth [
                                #type "abbreviated" 
                                quarter [#type "1" #draft "contributed" ! "Q1"] 
                                quarter [#type "2" #draft "contributed" ! "Q2"] 
                                quarter [#type "3" #draft "contributed" ! "Q3"] 
                                quarter [#type "4" #draft "contributed" ! "Q4"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "Bhm" ! "h.mm B"] 
                            dateFormatItem [#id "Bhms" ! "h.mm.ss B"] 
                            dateFormatItem [#id "EBhm" ! "E h.mm B"] 
                            dateFormatItem [#id "EBhms" ! "E h.mm.ss B"] 
                            dateFormatItem [#id "Ehm" ! "E h.mm a"] 
                            dateFormatItem [#id "EHm" ! "E HH.mm"] 
                            dateFormatItem [#id "Ehms" ! "E h.mm.ss a"] 
                            dateFormatItem [#id "EHms" ! "E HH.mm.ss"] 
                            dateFormatItem [#id "hm" ! "h.mm a"] 
                            dateFormatItem [#id "Hm" ! "HH.mm"] 
                            dateFormatItem [#id "hms" ! "h.mm.ss a"] 
                            dateFormatItem [#id "Hms" ! "HH.mm.ss"] 
                            dateFormatItem [#id "hmsv" ! "h.mm.ss a v"] 
                            dateFormatItem [#id "Hmsv" ! "HH.mm.ss v"] 
                            dateFormatItem [#id "hmv" ! "h.mm a v"] 
                            dateFormatItem [#id "Hmv" ! "HH.mm v"] 
                            dateFormatItem [#id "Md" ! "d.M"] 
                            dateFormatItem [#id "MEd" ! "E d.M"] 
                            dateFormatItem [#id "MMd" ! "d.M"] 
                            dateFormatItem [#id "MMdd" ! "dd.MM"] 
                            dateFormatItem [#id "ms" ! "mm.ss"]
                        ]
                    ]
                ]
            ]
        ] 
        numbers [
            symbols [
                #numberSystem "latn" 
                timeSeparator [#draft "contributed" ! "."] 
                timeSeparator [#alt "variant" ! ":"]
            ]
        ] 
        units [
            unitLength [
                #type "narrow" 
                unit [
                    #type "speed-kilometer-per-hour" 
                    unitPattern [#count "one" #draft "contributed" ! "{0} km/h"] 
                    unitPattern [#count "other" #draft "contributed" ! "{0} km/h"]
                ]
            ]
        ]
    ]

