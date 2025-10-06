
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "en"] 
            territory [#type "DK"]
        ] 
        dates [
            calendars [
                calendar [
                    #type "generic" 
                    dateTimeFormats [
                        availableFormats [
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
                            dateFormatItem [#id "ms" ! "mm.ss"]
                        ]
                    ]
                ] 
                calendar [
                    #type "gregorian" 
                    timeFormats [
                        timeFormatLength [
                            #type "full" 
                            timeFormat [
                                pattern [! "HH.mm.ss zzzz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "long" 
                            timeFormat [
                                pattern [! "HH.mm.ss z"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "medium" 
                            timeFormat [
                                pattern [! "HH.mm.ss"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "short" 
                            timeFormat [
                                pattern [! "HH.mm"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
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
                            dateFormatItem [#id "ms" ! "mm.ss"]
                        ]
                    ]
                ]
            ]
        ] 
        numbers [
            symbols [
                #numberSystem "latn" 
                decimal [! ","] 
                group [! "."] 
                superscriptingExponent [! "·"] 
                timeSeparator [! "."]
            ] 
            percentFormats [
                #numberSystem "latn" 
                percentFormatLength [
                    percentFormat [
                        pattern [! "#,##0 %"]
                    ]
                ]
            ] 
            currencies [
                currency [
                    #type "DKK" 
                    symbol [! "kr."]
                ]
            ]
        ]
    ]

