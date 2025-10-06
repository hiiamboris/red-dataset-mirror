
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "zh"] 
            script [#type "Hans"] 
            territory [#type "HK"]
        ] 
        dates [
            calendars [
                calendar [
                    #type "buddhist" 
                    dateFormats [
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [#draft "contributed" ! "Gd/M/yy"] 
                                datetimeSkeleton [#draft "contributed" ! "GyyMd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "M" #draft "contributed" ! "L"] 
                            dateFormatItem [#id "MEd" #draft "contributed" ! "M/dE"]
                        ]
                    ]
                ] 
                calendar [
                    #type "chinese" 
                    dateFormats [
                        dateFormatLength [
                            #type "full" 
                            dateFormat [
                                pattern [#numbers "hanidec" #draft "contributed" ! "U年MMMd日EEEE"] 
                                datetimeSkeleton [#numbers "hanidec" #draft "contributed" ! "UMMMEEEEd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "long" 
                            dateFormat [
                                pattern [#numbers "hanidec" #draft "contributed" ! "U年MMMd日"] 
                                datetimeSkeleton [#numbers "hanidec" #draft "contributed" ! "UMMMd"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "medium" 
                            dateFormat [
                                pattern [#numbers "hanidec" #draft "contributed" ! "U年MMMd日"] 
                                datetimeSkeleton [#numbers "hanidec" #draft "contributed" ! "UMMMd"]
                            ]
                        ]
                    ]
                ] 
                calendar [
                    #type "generic" 
                    dateFormats [
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [#draft "contributed" ! "d/M/yyGGGGG"] 
                                datetimeSkeleton [#draft "contributed" ! "GGGGGyyMd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "HHmm" #draft "contributed" ! "HH:mm"] 
                            dateFormatItem [#id "Md" #draft "contributed" ! "d/M"] 
                            dateFormatItem [#id "MEd" #draft "contributed" ! "E, d/M"] 
                            dateFormatItem [#id "MMM" #draft "contributed" ! "M月"] 
                            dateFormatItem [#id "MMMMdd" #draft "contributed" ! "M月d日"] 
                            dateFormatItem [#id "yyyyM" #draft "contributed" ! "M/yGGGGG"] 
                            dateFormatItem [#id "yyyyMd" #draft "contributed" ! "d/M/yGGGGG"] 
                            dateFormatItem [#id "yyyyMEd" #draft "contributed" ! "E, d/M/yGGGGG"]
                        ] 
                        intervalFormats [
                            intervalFormatFallback [#draft "contributed" ! "{0}–{1}"] 
                            intervalFormatItem [
                                #id "h" 
                                greatestDifference [#id "h" #draft "contributed" ! "ah至h时"]
                            ] 
                            intervalFormatItem [
                                #id "Hmv" 
                                greatestDifference [#id "H" #draft "contributed" ! "vHH:mm–HH:mm"] 
                                greatestDifference [#id "m" #draft "contributed" ! "vHH:mm–HH:mm"]
                            ] 
                            intervalFormatItem [
                                #id "Hv" 
                                greatestDifference [#id "H" #draft "contributed" ! "vHH–HH"]
                            ] 
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" #draft "contributed" ! "y年M月至y年M月"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" #draft "contributed" ! "d/M/y至d/M/y"] 
                                greatestDifference [#id "M" #draft "contributed" ! "d/M/y至d/M/y"] 
                                greatestDifference [#id "y" #draft "contributed" ! "d/M/y至d/M/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "d/M/yE至d/M/yE"] 
                                greatestDifference [#id "M" #draft "contributed" ! "d/M/yE至d/M/yE"] 
                                greatestDifference [#id "y" #draft "contributed" ! "d/M/yE至d/M/yE"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "y年M月d日E至M月d日E"]
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
                                pattern [#draft "contributed" ! "d/M/yy"] 
                                datetimeSkeleton [#draft "contributed" ! "yyMd"]
                            ]
                        ]
                    ] 
                    timeFormats [
                        timeFormatLength [
                            #type "full" 
                            timeFormat [
                                pattern [! "zzzz ah:mm:ss"] 
                                datetimeSkeleton [! "ahmmsszzzz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "long" 
                            timeFormat [
                                pattern [! "z ah:mm:ss"] 
                                datetimeSkeleton [! "ahmmssz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "medium" 
                            timeFormat [
                                pattern [! "ah:mm:ss"] 
                                datetimeSkeleton [! "ahmmss"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "short" 
                            timeFormat [
                                pattern [! "ah:mm"] 
                                datetimeSkeleton [! "ahmm"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "HHmm" #draft "contributed" ! "HH:mm"] 
                            dateFormatItem [#id "Md" #draft "contributed" ! "d/M"] 
                            dateFormatItem [#id "MEd" #draft "contributed" ! "E, d/M"] 
                            dateFormatItem [#id "MMdd" #draft "contributed" ! "dd/MM"] 
                            dateFormatItem [#id "MMMMdd" #draft "contributed" ! "M月d日"] 
                            dateFormatItem [#id "yM" #draft "contributed" ! "M/y"] 
                            dateFormatItem [#id "yMd" #draft "contributed" ! "d/M/y"] 
                            dateFormatItem [#id "yMEd" #draft "contributed" ! "d/M/y（E）"] 
                            dateFormatItem [#id "yMM" #draft "contributed" ! "MM/y"]
                        ] 
                        intervalFormats [
                            intervalFormatFallback [#draft "contributed" ! "{0}–{1}"] 
                            intervalFormatItem [
                                #id "h" 
                                greatestDifference [#id "h" #draft "contributed" ! "ah至h时"]
                            ] 
                            intervalFormatItem [
                                #id "Hmv" 
                                greatestDifference [#id "H" #draft "contributed" ! "vHH:mm–HH:mm"] 
                                greatestDifference [#id "m" #draft "contributed" ! "vHH:mm–HH:mm"]
                            ] 
                            intervalFormatItem [
                                #id "Hv" 
                                greatestDifference [#id "H" #draft "contributed" ! "vHH–HH"]
                            ] 
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" #draft "contributed" ! "y年M月至y年M月"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" #draft "contributed" ! "d/M/y至d/M/y"] 
                                greatestDifference [#id "M" #draft "contributed" ! "d/M/y至d/M/y"] 
                                greatestDifference [#id "y" #draft "contributed" ! "d/M/y至d/M/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "d/M/yE至d/M/yE"] 
                                greatestDifference [#id "M" #draft "contributed" ! "d/M/yE至d/M/yE"] 
                                greatestDifference [#id "y" #draft "contributed" ! "d/M/yE至d/M/yE"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "y年M月d日E至M月d日E"]
                            ]
                        ]
                    ]
                ] 
                calendar [
                    #type "islamic" 
                    dateFormats [
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [#draft "contributed" ! "Gd/M/yy"] 
                                datetimeSkeleton [#draft "contributed" ! "GyyMd"]
                            ]
                        ]
                    ]
                ] 
                calendar [
                    #type "japanese" 
                    dateFormats [
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [#draft "contributed" ! "Gd/M/yy"] 
                                datetimeSkeleton [#draft "contributed" ! "GyyMd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "Md" #draft "contributed" ! "M/d"] 
                            dateFormatItem [#id "MEd" #draft "contributed" ! "M/dE"]
                        ]
                    ]
                ] 
                calendar [
                    #type "roc" 
                    dateFormats [
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [#draft "contributed" ! "Gd/M/yy"] 
                                datetimeSkeleton [#draft "contributed" ! "GyyMd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "M" #draft "contributed" ! "L"] 
                            dateFormatItem [#id "Md" #draft "contributed" ! "M-d"] 
                            dateFormatItem [#id "MMM" #draft "contributed" ! "M月"]
                        ]
                    ]
                ]
            ] 
            fields [
                field [
                    #type "second" 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "other" ! "{0}秒后"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "other" ! "{0}秒前"]
                    ]
                ]
            ]
        ] 
        numbers [
            currencyFormats [
                #numberSystem "latn" 
                unitPattern [#count "other" #draft "contributed" ! "{0} {1}"]
            ] 
            currencies [
                currency [
                    #type "CNY" 
                    symbol [#draft "contributed" ! "CN¥"]
                ] 
                currency [
                    #type "KYD" 
                    displayName [#draft "contributed" ! "开曼群岛元"] 
                    displayName [#count "other" #draft "contributed" ! "开曼群岛元"]
                ] 
                currency [
                    #type "NIO" 
                    displayName [#count "other" ! "尼加拉瓜科多巴"]
                ] 
                currency [
                    #type "XAG" 
                    displayName [#draft "contributed" ! "白银"]
                ]
            ]
        ] 
        units [
            unitLength [
                #type "long" 
                compoundUnit [
                    #type "per" 
                    compoundUnitPattern [#draft "contributed" ! "{0}/{1}"]
                ] 
                unit [
                    #type "concentr-karat" 
                    displayName [#draft "unconfirmed" ! "开"] 
                    unitPattern [#count "other" #draft "unconfirmed" ! "{0}开"]
                ] 
                unit [
                    #type "duration-second" 
                    unitPattern [#count "other" #draft "contributed" ! "{0}秒"]
                ] 
                unit [
                    #type "temperature-kelvin" 
                    displayName [#draft "contributed" ! "开氏度"] 
                    unitPattern [#count "other" #draft "contributed" ! "{0}开氏度"]
                ]
            ] 
            unitLength [
                #type "short" 
                unit [
                    #type "acceleration-g-force" 
                    unitPattern [#count "other" #draft "unconfirmed" ! "{0}G力"]
                ] 
                unit [
                    #type "concentr-karat" 
                    displayName [#draft "unconfirmed" ! "开"] 
                    unitPattern [#count "other" #draft "unconfirmed" ! "{0}开"]
                ] 
                unit [
                    #type "temperature-kelvin" 
                    displayName [#draft "unconfirmed" ! "开氏度"] 
                    unitPattern [#count "other" #draft "contributed" ! "{0}°K"]
                ]
            ] 
            unitLength [
                #type "narrow" 
                unit [
                    #type "length-picometer" 
                    unitPattern [#count "other" #draft "unconfirmed" ! "{0}皮米"]
                ] 
                unit [
                    #type "length-mile" 
                    unitPattern [#count "other" #draft "unconfirmed" ! "{0}英里"]
                ] 
                unit [
                    #type "length-yard" 
                    unitPattern [#count "other" #draft "unconfirmed" ! "{0}码"]
                ] 
                unit [
                    #type "length-foot" 
                    unitPattern [#count "other" #draft "unconfirmed" ! "{0}英尺"]
                ] 
                unit [
                    #type "length-inch" 
                    unitPattern [#count "other" #draft "unconfirmed" ! "{0}英寸"]
                ] 
                unit [
                    #type "length-light-year" 
                    unitPattern [#count "other" #draft "unconfirmed" ! "{0}光年"]
                ]
            ]
        ]
    ]

