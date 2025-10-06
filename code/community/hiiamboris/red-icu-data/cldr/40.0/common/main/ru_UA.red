
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "ru"] 
            territory [#type "UA"]
        ] 
        localeDisplayNames [
            territories [
                territory [#type "AC" #draft "contributed" ! "О-в Вознесения"] 
                territory [#type "AE" #draft "contributed" ! "Объединенные Арабские Эмираты"] 
                territory [#type "BV" #draft "contributed" ! "О-в Буве"] 
                territory [#type "CK" #draft "contributed" ! "О-ва Кука"] 
                territory [#type "CP" #draft "contributed" ! "О-в Клиппертон"] 
                territory [#type "CX" #draft "contributed" ! "О-в Рождества"] 
                territory [#type "HM" #draft "contributed" ! "О-ва Херд и Макдональд"] 
                territory [#type "NF" #draft "contributed" ! "О-в Норфолк"] 
                territory [#type "TL" #draft "contributed" ! "Тимор-Лесте"] 
                territory [#type "UM" #draft "contributed" ! "Малые Тихоокеанские Отдаленные Острова США"]
            ]
        ] 
        dates [
            calendars [
                calendar [
                    #type "generic" 
                    dateTimeFormats [
                        intervalFormats [
                            intervalFormatItem [
                                #id "h" 
                                greatestDifference [#id "h" #draft "unconfirmed" ! "h–h 'ч'. a"]
                            ] 
                            intervalFormatItem [
                                #id "H" 
                                greatestDifference [#id "H" #draft "unconfirmed" ! "HH–HH 'ч'."]
                            ] 
                            intervalFormatItem [
                                #id "hv" 
                                greatestDifference [#id "h" #draft "unconfirmed" ! "h–h 'ч'. a, v"]
                            ] 
                            intervalFormatItem [
                                #id "Hv" 
                                greatestDifference [#id "H" #draft "unconfirmed" ! "HH–HH 'ч'., v"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E, d – E, d MMM"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E, d MMM – E, d MMM"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E, dd.MM.y – E, dd.MM.y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E, dd.MM.y – E, dd.MM.y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E, dd.MM.y – E, dd.MM.y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMM" 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "MMM–MMM y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "MMM y – MMM y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "d–d MMM y"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "d MMM – d MMM y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "d MMM y – d MMM y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E, d – E, d MMM y 'г'."] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E, d MMM – E, d MMM y 'г'."] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E, d MMM y – E, d MMM y 'г'."]
                            ] 
                            intervalFormatItem [
                                #id "yMMMM" 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "LLLL–LLLL y"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "LLLL y – LLLL y"]
                            ]
                        ]
                    ]
                ] 
                calendar [
                    #type "gregorian" 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "yMEd" #draft "contributed" ! "ccc, d.MM.y"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "yMMM" 
                                greatestDifference [#id "y" #draft "contributed" ! "LLL y – LLL y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMd" 
                                greatestDifference [#id "y" #draft "contributed" ! "d MMM y – d MMM y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "y" #draft "contributed" ! "ccc, d MMM y – ccc, d MMM y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMM" 
                                greatestDifference [#id "y" #draft "contributed" ! "LLLL y – LLLL y"]
                            ]
                        ]
                    ]
                ]
            ]
        ] 
        numbers [
            minimumGroupingDigits [#draft "contributed" ! "2"]
        ]
    ]

