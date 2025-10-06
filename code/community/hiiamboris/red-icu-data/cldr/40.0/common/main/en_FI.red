
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "en"] 
            territory [#type "FI"]
        ] 
        characters [
            exemplarCharacters [#type "numbers" ! "[  \- ‑ , % ‰ + 0 1 2 3 4 5 6 7 8 9]"]
        ] 
        dates [
            calendars [
                calendar [
                    #type "generic" 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "Ehm" ! "E h.mm a"] 
                            dateFormatItem [#id "EHm" ! "E H.mm"] 
                            dateFormatItem [#id "Ehms" ! "E h.mm.ss a"] 
                            dateFormatItem [#id "EHms" ! "E H.mm.ss"] 
                            dateFormatItem [#id "hm" ! "h.mm a"] 
                            dateFormatItem [#id "Hm" ! "H.mm"] 
                            dateFormatItem [#id "hms" ! "h.mm.ss a"] 
                            dateFormatItem [#id "Hms" ! "H.mm.ss"] 
                            dateFormatItem [#id "hmsv" ! "h.mm.ss a v"] 
                            dateFormatItem [#id "Hmsv" ! "H.mm.ss v"] 
                            dateFormatItem [#id "hmv" ! "h.mm a v"] 
                            dateFormatItem [#id "Hmv" ! "H.mm v"] 
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
                                pattern [! "H.mm.ss zzzz"] 
                                datetimeSkeleton [! "Hmmsszzzz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "long" 
                            timeFormat [
                                pattern [! "H.mm.ss z"] 
                                datetimeSkeleton [! "Hmmssz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "medium" 
                            timeFormat [
                                pattern [! "H.mm.ss"] 
                                datetimeSkeleton [! "Hmmss"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "short" 
                            timeFormat [
                                pattern [! "H.mm"] 
                                datetimeSkeleton [! "Hmm"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "Ehm" ! "E h.mm a"] 
                            dateFormatItem [#id "EHm" ! "E H.mm"] 
                            dateFormatItem [#id "Ehms" ! "E h.mm.ss a"] 
                            dateFormatItem [#id "EHms" ! "E H.mm.ss"] 
                            dateFormatItem [#id "hm" ! "h.mm a"] 
                            dateFormatItem [#id "Hm" ! "H.mm"] 
                            dateFormatItem [#id "hms" ! "h.mm.ss a"] 
                            dateFormatItem [#id "Hms" ! "H.mm.ss"] 
                            dateFormatItem [#id "hmsv" ! "h.mm.ss a v"] 
                            dateFormatItem [#id "Hmsv" ! "H.mm.ss v"] 
                            dateFormatItem [#id "hmv" ! "h.mm a v"] 
                            dateFormatItem [#id "Hmv" ! "H.mm v"] 
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
                group [! " "] 
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
        ]
    ]

