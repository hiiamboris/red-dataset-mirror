
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "om"] 
            territory [#type "KE"]
        ] 
        dates [
            calendars [
                calendar [
                    #type "gregorian" 
                    months [
                        monthContext [
                            #type "stand-alone" 
                            monthWidth [
                                #type "narrow" 
                                month [#type "1" ! "A"] 
                                month [#type "2" ! "G"] 
                                month [#type "3" ! "B"] 
                                month [#type "4" ! "E"] 
                                month [#type "5" ! "C"] 
                                month [#type "6" ! "W"] 
                                month [#type "7" ! "A"] 
                                month [#type "8" ! "H"] 
                                month [#type "9" ! "F"] 
                                month [#type "10" ! "O"] 
                                month [#type "11" ! "S"] 
                                month [#type "12" ! "M"]
                            ]
                        ]
                    ] 
                    days [
                        dayContext [
                            #type "stand-alone" 
                            dayWidth [
                                #type "narrow" 
                                day [#type "sun" ! "D"] 
                                day [#type "mon" ! "W"] 
                                day [#type "tue" ! "Q"] 
                                day [#type "wed" ! "R"] 
                                day [#type "thu" ! "K"] 
                                day [#type "fri" ! "J"] 
                                day [#type "sat" ! "S"]
                            ]
                        ]
                    ] 
                    quarters [
                        quarterContext [
                            #type "format" 
                            quarterWidth [
                                #type "abbreviated" 
                                quarter [#type "1" ! "K1"] 
                                quarter [#type "2" ! "K2"] 
                                quarter [#type "3" ! "K3"] 
                                quarter [#type "4" ! "K4"]
                            ]
                        ]
                    ] 
                    eras [
                        eraAbbr [
                            era [#type "0" ! "KD"] 
                            era [#type "0" #alt "variant" ! "BCE"] 
                            era [#type "1" #alt "variant" ! "KB"]
                        ]
                    ] 
                    timeFormats [
                        timeFormatLength [
                            #type "full" 
                            timeFormat [
                                pattern [! "HH:mm:ss zzzz"] 
                                datetimeSkeleton [! "HHmmsszzzz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "long" 
                            timeFormat [
                                pattern [! "HH:mm:ss z"] 
                                datetimeSkeleton [! "HHmmssz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "medium" 
                            timeFormat [
                                pattern [! "HH:mm:ss"] 
                                datetimeSkeleton [! "HHmmss"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "short" 
                            timeFormat [
                                pattern [! "HH:mm"] 
                                datetimeSkeleton [! "HHmm"]
                            ]
                        ]
                    ]
                ]
            ]
        ] 
        numbers [
            currencies [
                currency [
                    #type "KES" 
                    symbol [! "Ksh"]
                ]
            ]
        ]
    ]

