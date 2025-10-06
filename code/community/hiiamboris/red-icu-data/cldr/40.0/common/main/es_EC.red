
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "es"] 
            territory [#type "EC"]
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
                    dateTimeFormats [
                        intervalFormats [
                            intervalFormatFallback [#draft "unconfirmed" ! "{0} a el {1}"] 
                            intervalFormatItem [
                                #id "H" 
                                greatestDifference [#id "H" #draft "unconfirmed" ! "H–H"]
                            ] 
                            intervalFormatItem [
                                #id "hm" 
                                greatestDifference [#id "h" #draft "unconfirmed" ! "h:mm–h:mm a"] 
                                greatestDifference [#id "m" #draft "unconfirmed" ! "h:mm–h:mm a"]
                            ] 
                            intervalFormatItem [
                                #id "Hm" 
                                greatestDifference [#id "H" #draft "unconfirmed" ! "H:mm–H:mm"] 
                                greatestDifference [#id "m" #draft "unconfirmed" ! "H:mm–H:mm"]
                            ] 
                            intervalFormatItem [
                                #id "hmv" 
                                greatestDifference [#id "h" #draft "unconfirmed" ! "h:mm–h:mm a v"] 
                                greatestDifference [#id "m" #draft "unconfirmed" ! "h:mm–h:mm a v"]
                            ] 
                            intervalFormatItem [
                                #id "Hmv" 
                                greatestDifference [#id "H" #draft "unconfirmed" ! "H:mm–H:mm v"] 
                                greatestDifference [#id "m" #draft "unconfirmed" ! "H:mm–H:mm v"]
                            ] 
                            intervalFormatItem [
                                #id "Hv" 
                                greatestDifference [#id "H" #draft "unconfirmed" ! "H–H v"]
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
                                greatestDifference [#id "M" #draft "unconfirmed" ! "d 'de' MMM 'al' d 'de' MMM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E d 'al' E d 'de' MMM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E d 'de' MMM 'al' E d 'de' MMM"]
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
                                greatestDifference [#id "d" #draft "unconfirmed" ! "d–d 'de' MMM 'de' y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "d 'de' MMM 'al' d 'de' MMM 'de' y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "d 'de' MMM 'de' y 'al' d 'de' MMM 'de' y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E d 'al' E d 'de' MMM 'de' y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E d 'de' MMM 'al' E d 'de' MMM 'de' y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E d 'de' MMM 'de' y 'al' E d 'de' MMM 'de' y"]
                            ]
                        ]
                    ]
                ] 
                calendar [
                    #type "gregorian" 
                    dateTimeFormats [
                        intervalFormats [
                            intervalFormatFallback [#draft "unconfirmed" ! "{0} a el {1}"] 
                            intervalFormatItem [
                                #id "hm" 
                                greatestDifference [#id "h" #draft "unconfirmed" ! "h:mm–h:mm a"] 
                                greatestDifference [#id "m" #draft "unconfirmed" ! "h:mm–h:mm a"]
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
                                greatestDifference [#id "M" #draft "unconfirmed" ! "d 'de' MMM 'al' d 'de' MMM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E d 'al' E d 'de' MMM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E d 'de' MMM 'al' E d 'de' MMM"]
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
                                greatestDifference [#id "M" #draft "unconfirmed" ! "d 'de' MMM 'al' d 'de' MMM 'de' y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "d 'de' MMM 'de' y 'al' d 'de' MMM 'de' y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E d 'al' E d 'de' MMM 'de' y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E d 'de' MMM 'al' E d 'de' MMM 'de' y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E d 'de' MMM 'de' y 'al' E d 'de' MMM 'de' y"]
                            ]
                        ]
                    ]
                ]
            ] 
            timeZoneNames [
                metazone [
                    #type "Ecuador" 
                    short [
                        standard [! "ECT"]
                    ]
                ]
            ]
        ] 
        numbers [
            symbols [
                #numberSystem "latn" 
                decimal [! ","] 
                group [! "."]
            ] 
            currencyFormats [
                #numberSystem "latn" 
                currencyFormatLength [
                    currencyFormat [
                        #type "standard" 
                        pattern [! "¤#,##0.00;¤-#,##0.00"]
                    ]
                ]
            ] 
            currencies [
                currency [
                    #type "USD" 
                    symbol [! "$"]
                ]
            ]
        ]
    ]

