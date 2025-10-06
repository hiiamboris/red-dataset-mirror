
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "es"] 
            territory [#type "PE"]
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
                            #type "short" 
                            dateFormat [
                                pattern [! "d/MM/yy GGGGG"] 
                                datetimeSkeleton [! "GGGGGyyMMd"]
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
                                greatestDifference [#id "d" #draft "unconfirmed" ! "d/MM – d/MM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "d/MM – d/MM"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E d/MM – E d/MM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E d/MM – E d/MM"]
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
                                greatestDifference [#id "d" #draft "unconfirmed" ! "d/MM/y – d/MM/y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "d/MM/y – d/MM/y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "d/MM/y – d/MM/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E d/MM/y – E d/MM/y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E d/MM/y – E d/MM/y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E d/MM/y – E d/MM/y"]
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
                    months [
                        monthContext [
                            #type "format" 
                            monthWidth [
                                #type "abbreviated" 
                                month [#type "1" #draft "contributed" ! "ene."] 
                                month [#type "2" #draft "contributed" ! "feb."] 
                                month [#type "3" #draft "contributed" ! "mar."] 
                                month [#type "4" #draft "contributed" ! "abr."] 
                                month [#type "5" #draft "contributed" ! "may."] 
                                month [#type "6" #draft "contributed" ! "jun."] 
                                month [#type "7" #draft "contributed" ! "jul."] 
                                month [#type "8" #draft "contributed" ! "ago."] 
                                month [#type "9" #draft "contributed" ! "set."] 
                                month [#type "10" #draft "contributed" ! "oct."] 
                                month [#type "11" #draft "contributed" ! "nov."] 
                                month [#type "12" #draft "contributed" ! "dic."]
                            ] 
                            monthWidth [
                                #type "wide" 
                                month [#type "1" #draft "contributed" ! "enero"] 
                                month [#type "2" #draft "contributed" ! "febrero"] 
                                month [#type "3" #draft "contributed" ! "marzo"] 
                                month [#type "4" #draft "contributed" ! "abril"] 
                                month [#type "5" #draft "contributed" ! "mayo"] 
                                month [#type "6" #draft "contributed" ! "junio"] 
                                month [#type "7" #draft "contributed" ! "julio"] 
                                month [#type "8" #draft "contributed" ! "agosto"] 
                                month [#type "9" #draft "contributed" ! "setiembre"] 
                                month [#type "10" #draft "contributed" ! "octubre"] 
                                month [#type "11" #draft "contributed" ! "noviembre"] 
                                month [#type "12" #draft "contributed" ! "diciembre"]
                            ]
                        ] 
                        monthContext [
                            #type "stand-alone" 
                            monthWidth [
                                #type "abbreviated" 
                                month [#type "1" #draft "contributed" ! "Ene."] 
                                month [#type "2" #draft "contributed" ! "Feb."] 
                                month [#type "3" #draft "contributed" ! "Mar."] 
                                month [#type "4" #draft "contributed" ! "Abr."] 
                                month [#type "5" #draft "contributed" ! "May."] 
                                month [#type "6" #draft "contributed" ! "Jun."] 
                                month [#type "7" #draft "contributed" ! "Jul."] 
                                month [#type "8" #draft "contributed" ! "Ago."] 
                                month [#type "9" #draft "contributed" ! "Set."] 
                                month [#type "10" #draft "contributed" ! "Oct."] 
                                month [#type "11" #draft "contributed" ! "Nov."] 
                                month [#type "12" #draft "contributed" ! "Dic."]
                            ] 
                            monthWidth [
                                #type "wide" 
                                month [#type "1" #draft "contributed" ! "Enero"] 
                                month [#type "2" #draft "contributed" ! "Febrero"] 
                                month [#type "3" #draft "contributed" ! "Marzo"] 
                                month [#type "4" #draft "contributed" ! "Abril"] 
                                month [#type "5" #draft "contributed" ! "Mayo"] 
                                month [#type "6" #draft "contributed" ! "Junio"] 
                                month [#type "7" #draft "contributed" ! "Julio"] 
                                month [#type "8" #draft "contributed" ! "Agosto"] 
                                month [#type "9" #draft "contributed" ! "Setiembre"] 
                                month [#type "10" #draft "contributed" ! "Octubre"] 
                                month [#type "11" #draft "contributed" ! "Noviembre"] 
                                month [#type "12" #draft "contributed" ! "Diciembre"]
                            ]
                        ]
                    ] 
                    dateFormats [
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "d/MM/yy"] 
                                datetimeSkeleton [! "yyMMd"]
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
                                greatestDifference [#id "d" #draft "unconfirmed" ! "d/MM – d/MM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "d/MM – d/MM"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E d/MM – E d/MM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E d/MM – E d/MM"]
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
                                greatestDifference [#id "d" #draft "unconfirmed" ! "d/MM/y – d/MM/y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "d/MM/y – d/MM/y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "d/MM/y – d/MM/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E d/MM/y – E d/MM/y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E d/MM/y – E d/MM/y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E d/MM/y – E d/MM/y"]
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
                    #type "Peru" 
                    short [
                        generic [! "PET"] 
                        standard [! "PET"] 
                        daylight [! "PEST"]
                    ]
                ]
            ]
        ] 
        numbers [
            currencyFormats [
                #numberSystem "latn" 
                currencyFormatLength [
                    currencyFormat [
                        #type "standard" 
                        pattern [! "¤ #,##0.00"]
                    ]
                ] 
                currencyFormatLength [
                    #type "short" 
                    currencyFormat [
                        #type "standard" 
                        pattern [#type "1000" #count "one" #draft "contributed" ! "¤ 0 K"] 
                        pattern [#type "1000" #count "other" #draft "contributed" ! "¤ 0 K"] 
                        pattern [#type "10000" #count "one" #draft "contributed" ! "¤ 00 K"] 
                        pattern [#type "10000" #count "other" #draft "contributed" ! "¤ 00 K"] 
                        pattern [#type "100000" #count "one" #draft "contributed" ! "¤ 000 K"] 
                        pattern [#type "100000" #count "other" #draft "contributed" ! "¤ 000 K"] 
                        pattern [#type "1000000" #count "one" ! "¤ 0 M"] 
                        pattern [#type "1000000" #count "other" ! "¤ 0 M"] 
                        pattern [#type "10000000" #count "one" ! "¤ 00 M"] 
                        pattern [#type "10000000" #count "other" ! "¤ 00 M"] 
                        pattern [#type "100000000" #count "one" ! "¤ 000 M"] 
                        pattern [#type "100000000" #count "other" ! "¤ 000 M"] 
                        pattern [#type "1000000000" #count "one" ! "¤ 0000 M"] 
                        pattern [#type "1000000000" #count "other" ! "¤ 0000 M"] 
                        pattern [#type "10000000000" #count "one" #draft "contributed" ! "¤ 00 MRD"] 
                        pattern [#type "10000000000" #count "other" #draft "contributed" ! "¤ 00 MRD"] 
                        pattern [#type "100000000000" #count "one" #draft "contributed" ! "¤ 000 MRD"] 
                        pattern [#type "100000000000" #count "other" #draft "contributed" ! "¤ 000 MRD"] 
                        pattern [#type "1000000000000" #count "one" ! "¤ 0 B"] 
                        pattern [#type "1000000000000" #count "other" ! "¤ 0 B"] 
                        pattern [#type "10000000000000" #count "one" ! "¤ 00 B"] 
                        pattern [#type "10000000000000" #count "other" ! "¤ 00 B"] 
                        pattern [#type "100000000000000" #count "one" ! "¤ 000 B"] 
                        pattern [#type "100000000000000" #count "other" ! "¤ 000 B"]
                    ]
                ]
            ] 
            currencies [
                currency [
                    #type "PEN" 
                    symbol [! "S/"]
                ]
            ]
        ]
    ]

