
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "zh"] 
            script [#type "Hans"] 
            territory [#type "SG"]
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
                                pattern [! "dd/MM/yyGGGGG"] 
                                datetimeSkeleton [! "GGGGGyyMMdd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "Md" #draft "contributed" ! "M-d"] 
                            dateFormatItem [#id "MEd" #draft "contributed" ! "M-dE"] 
                            dateFormatItem [#id "MMdd" #draft "contributed" ! "MM-dd"] 
                            dateFormatItem [#id "MMMMdd" #draft "contributed" ! "M月d日"] 
                            dateFormatItem [#id "yyyyMd" #draft "contributed" ! "Gy年M月d日"] 
                            dateFormatItem [#id "yyyyMEd" #draft "contributed" ! "Gy年M月d日，E"]
                        ] 
                        intervalFormats [
                            intervalFormatFallback [#draft "contributed" ! "{0}至{1}"] 
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
                                #id "Md" 
                                greatestDifference [#id "d" #draft "contributed" ! "M-d至M-d"] 
                                greatestDifference [#id "M" #draft "contributed" ! "M-d至M-d"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "M-dE至M-dE"] 
                                greatestDifference [#id "M" #draft "contributed" ! "M-dE至M-dE"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "M月d日E至M月d日E"]
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
                        ]
                    ]
                ] 
                calendar [
                    #type "gregorian" 
                    dateFormats [
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "dd/MM/yy"] 
                                datetimeSkeleton [! "yyMMdd"]
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
                            dateFormatItem [#id "Md" #draft "contributed" ! "M-d"] 
                            dateFormatItem [#id "MEd" #draft "contributed" ! "M-dE"] 
                            dateFormatItem [#id "MMdd" #draft "contributed" ! "MM-dd"] 
                            dateFormatItem [#id "MMM" #draft "contributed" ! "M月"] 
                            dateFormatItem [#id "MMMMdd" #draft "contributed" ! "M月d日"] 
                            dateFormatItem [#id "yMd" #draft "contributed" ! "y年M月d日"] 
                            dateFormatItem [#id "yMEd" #draft "contributed" ! "y年M月d日，E"]
                        ] 
                        intervalFormats [
                            intervalFormatFallback [#draft "contributed" ! "{0}至{1}"] 
                            intervalFormatItem [
                                #id "d" 
                                greatestDifference [#id "d" #draft "contributed" ! "d日至d日"]
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
                                #id "Md" 
                                greatestDifference [#id "d" #draft "contributed" ! "M-d至M-d"] 
                                greatestDifference [#id "M" #draft "contributed" ! "M-d至M-d"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "M-dE至M-dE"] 
                                greatestDifference [#id "M" #draft "contributed" ! "M-dE至M-dE"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" #draft "contributed" ! "M月d日E至M月d日E"]
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
                            dateFormatItem [#id "Md" #draft "contributed" ! "M-d"] 
                            dateFormatItem [#id "MEd" #draft "contributed" ! "M-dE"] 
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
            timeZoneNames [
                zone [
                    #type "America/Scoresbysund" 
                    exemplarCity [#draft "contributed" ! "斯考斯伯松德"]
                ] 
                metazone [
                    #type "Malaysia" 
                    short [
                        standard [! "MYT"]
                    ]
                ] 
                metazone [
                    #type "Singapore" 
                    short [
                        standard [! "SGT"]
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
                    #type "ANG" 
                    displayName [#count "other" #draft "contributed" ! "荷兰安的列斯盾"]
                ] 
                currency [
                    #type "CNY" 
                    symbol [#draft "contributed" ! "CN¥"]
                ] 
                currency [
                    #type "NIO" 
                    displayName [#count "other" #draft "contributed" ! "尼加拉瓜科多巴"]
                ] 
                currency [
                    #type "SGD" 
                    symbol [! "$"]
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

