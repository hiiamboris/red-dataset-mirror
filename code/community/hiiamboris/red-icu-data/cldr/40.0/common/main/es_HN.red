
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "es"] 
            territory [#type "HN"]
        ] 
        localeDisplayNames [
            languages [
                language [#type "ace" #draft "contributed" ! "acehnés"] 
                language [#type "arp" #draft "contributed" ! "arapaho"] 
                language [#type "bho" #draft "contributed" ! "bhojpuri"] 
                language [#type "eu" #draft "contributed" ! "euskera"] 
                language [#type "grc" #draft "contributed" ! "griego antiguo"] 
                language [#type "lo" #draft "contributed" ! "lao"] 
                language [#type "nso" #draft "contributed" ! "sotho septentrional"] 
                language [#type "pa" #draft "contributed" ! "punyabí"] 
                language [#type "ss" #draft "contributed" ! "siswati"] 
                language [#type "sw" #draft "contributed" ! "suajili"] 
                language [#type "sw_CD" #draft "contributed" ! "suajili del Congo"] 
                language [#type "tn" #draft "contributed" ! "setswana"] 
                language [#type "wo" #draft "contributed" ! "wolof"] 
                language [#type "zgh" #draft "contributed" ! "tamazight marroquí estándar"]
            ] 
            territories [
                territory [#type "BA" #draft "contributed" ! "Bosnia y Herzegovina"] 
                territory [#type "GB" #alt "short" #draft "contributed" ! "RU"] 
                territory [#type "TA" #draft "contributed" ! "Tristán de Acuña"] 
                territory [#type "UM" #draft "contributed" ! "Islas menores alejadas de EE. UU."]
            ]
        ] 
        dates [
            calendars [
                calendar [
                    #type "generic" 
                    dateFormats [
                        dateFormatLength [
                            #type "full" 
                            dateFormat [
                                pattern [! "EEEE dd 'de' MMMM 'de' y G"] 
                                datetimeSkeleton [! "GyMMMMEEEEdd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "long" 
                            dateFormat [
                                pattern [! "dd 'de' MMMM 'de' y G"] 
                                datetimeSkeleton [! "GyMMMMdd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        intervalFormats [
                            intervalFormatFallback [#draft "unconfirmed" ! "{0} a el {1}"] 
                            intervalFormatItem [
                                #id "hm" 
                                greatestDifference [#id "h" #draft "unconfirmed" ! "h:mm–h:mm a"] 
                                greatestDifference [#id "m" #draft "unconfirmed" ! "h:mm–h:mm a"]
                            ] 
                            intervalFormatItem [
                                #id "Hm" 
                                greatestDifference [#id "H" #draft "unconfirmed" ! "HH:mm–HH:mm"] 
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
                                #id "Md" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "dd/MM – dd/MM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "dd/MM – dd/MM"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E dd/MM – E dd/MM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E dd/MM – E dd/MM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "dd–dd 'de' MMM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "dd 'de' MMM 'al' dd 'de' MMM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E dd 'al' E dd 'de' MMM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E dd 'de' MMM 'al' E dd 'de' MMM"]
                            ] 
                            intervalFormatItem [
                                #id "y" 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "y–y"]
                            ] 
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "MM/y – MM/y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "MM/y – MM/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "dd/MM/y – dd/MM/y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "dd/MM/y – dd/MM/y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "dd/MM/y – dd/MM/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E dd/MM/y – E dd/MM/y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E dd/MM/y – E dd/MM/y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E dd/MM/y – E dd/MM/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMM" 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "MMM–MMM 'de' y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "MMM 'de' y 'a' MMM 'de' y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "dd–dd 'de' MMM 'de' y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "dd 'de' MMM 'al' dd 'de' MMM 'de' y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "dd 'de' MMM 'de' y 'al' dd 'de' MMM 'de' y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E dd 'al' E dd 'de' MMM 'de' y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E dd 'de' MMM 'al' E dd 'de' MMM 'de' y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E dd 'de' MMM 'de' y 'al' E dd 'de' MMM 'de' y"]
                            ]
                        ]
                    ]
                ] 
                calendar [
                    #type "gregorian" 
                    dateFormats [
                        dateFormatLength [
                            #type "full" 
                            dateFormat [
                                pattern [! "EEEE dd 'de' MMMM 'de' y"] 
                                datetimeSkeleton [! "yMMMMEEEEdd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "long" 
                            dateFormat [
                                pattern [! "dd 'de' MMMM 'de' y"] 
                                datetimeSkeleton [! "yMMMMdd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        intervalFormats [
                            intervalFormatFallback [#draft "unconfirmed" ! "{0} a el {1}"] 
                            intervalFormatItem [
                                #id "hm" 
                                greatestDifference [#id "h" #draft "unconfirmed" ! "h:mm–h:mm a"] 
                                greatestDifference [#id "m" #draft "unconfirmed" ! "h:mm–h:mm a"]
                            ] 
                            intervalFormatItem [
                                #id "Hm" 
                                greatestDifference [#id "H" #draft "unconfirmed" ! "HH:mm–HH:mm"] 
                                greatestDifference [#id "m" #draft "unconfirmed" ! "HH:mm–HH:mm"]
                            ] 
                            intervalFormatItem [
                                #id "Hmv" 
                                greatestDifference [#id "H" #draft "unconfirmed" ! "HH:mm–HH:mm v"] 
                                greatestDifference [#id "m" #draft "unconfirmed" ! "HH:mm–HH:mm v"]
                            ] 
                            intervalFormatItem [
                                #id "Hv" 
                                greatestDifference [#id "H" #draft "unconfirmed" ! "HH–HH v"]
                            ] 
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "dd/MM – dd/MM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "dd/MM – dd/MM"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E dd/MM – E dd/MM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E dd/MM – E dd/MM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "dd–dd 'de' MMM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "dd 'de' MMM 'al' dd 'de' MMM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E dd 'al' E dd 'de' MMM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E dd 'de' MMM 'al' E dd 'de' MMM"]
                            ] 
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "MM/y – MM/y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "MM/y – MM/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "dd/MM/y – dd/MM/y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "dd/MM/y – dd/MM/y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "dd/MM/y – dd/MM/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E dd/MM/y – E dd/MM/y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E dd/MM/y – E dd/MM/y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E dd/MM/y – E dd/MM/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMM" 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "MMM 'de' y 'a' MMM 'de' y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "dd–dd 'de' MMM 'de' y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "dd 'de' MMM 'al' dd 'de' MMM 'de' y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "dd 'de' MMM 'de' y 'al' dd 'de' MMM 'de' y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E dd 'al' E dd 'de' MMM 'de' y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E dd 'de' MMM 'al' E dd 'de' MMM 'de' y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E dd 'de' MMM 'de' y 'al' E dd 'de' MMM 'de' y"]
                            ]
                        ]
                    ]
                ]
            ]
        ] 
        numbers [
            currencies [
                currency [
                    #type "HNL" 
                    symbol [! "L"]
                ]
            ]
        ]
    ]

