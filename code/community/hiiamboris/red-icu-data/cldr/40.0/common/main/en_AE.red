
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "en"] 
            territory [#type "AE"]
        ] 
        dates [
            calendars [
                calendar [
                    #type "chinese" 
                    dateFormats [
                        dateFormatLength [
                            #type "full" 
                            dateFormat [
                                pattern [! "EEEE, d MMMM r(U)"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "long" 
                            dateFormat [
                                pattern [! "d MMMM r(U)"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "medium" 
                            dateFormat [
                                pattern [! "d MMM r"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "dd/MM/r"] 
                                datetimeSkeleton [! "rMMdd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "Ed" ! "E d"] 
                            dateFormatItem [#id "GyMMMd" ! "d MMM r"] 
                            dateFormatItem [#id "GyMMMEd" ! "E, d MMM r(U)"] 
                            dateFormatItem [#id "M" ! "LL"] 
                            dateFormatItem [#id "Md" ! "dd/MM"] 
                            dateFormatItem [#id "MEd" ! "E, dd/MM"] 
                            dateFormatItem [#id "MMMd" ! "d MMM"] 
                            dateFormatItem [#id "MMMEd" ! "E, d MMM"] 
                            dateFormatItem [#id "MMMMd" ! "d MMMM"] 
                            dateFormatItem [#id "UMd" ! "dd/MM/U"] 
                            dateFormatItem [#id "UMMMd" ! "d MMM U"] 
                            dateFormatItem [#id "yMd" ! "dd/MM/r"] 
                            dateFormatItem [#id "yyyyM" ! "MM/r"] 
                            dateFormatItem [#id "yyyyMd" ! "dd/MM/r"] 
                            dateFormatItem [#id "yyyyMEd" ! "E, dd/MM/r"] 
                            dateFormatItem [#id "yyyyMMMd" ! "d MMM r"] 
                            dateFormatItem [#id "yyyyMMMEd" ! "E, d MMM r(U)"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" ! "dd/MM – dd/MM"] 
                                greatestDifference [#id "M" ! "dd/MM – dd/MM"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" ! "E dd/MM – E dd/MM"] 
                                greatestDifference [#id "M" ! "E dd/MM – E dd/MM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMd" 
                                greatestDifference [#id "d" ! "d – d MMM"] 
                                greatestDifference [#id "M" ! "d MMM – d MMM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" ! "E d – E d MMM"] 
                                greatestDifference [#id "M" ! "E d MMM – E d MMM"]
                            ] 
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" ! "MM/y – MM/y"] 
                                greatestDifference [#id "y" ! "MM/y – MM/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" ! "dd/MM/y – dd/MM/y"] 
                                greatestDifference [#id "M" ! "dd/MM/y – dd/MM/y"] 
                                greatestDifference [#id "y" ! "dd/MM/y – dd/MM/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" ! "E, dd/MM/y – E, dd/MM/y"] 
                                greatestDifference [#id "M" ! "E, dd/MM/y – E, dd/MM/y"] 
                                greatestDifference [#id "y" ! "E, dd/MM/y – E, dd/MM/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMd" 
                                greatestDifference [#id "d" ! "d – d MMM U"] 
                                greatestDifference [#id "M" ! "d MMM – d MMM U"] 
                                greatestDifference [#id "y" ! "d MMM U – d MMM U"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" ! "E, d – E, d MMM U"] 
                                greatestDifference [#id "M" ! "E, d MMM – E, d MMM U"] 
                                greatestDifference [#id "y" ! "E, d MMM U – E, d MMM U"]
                            ]
                        ]
                    ]
                ] 
                calendar [
                    #type "generic" 
                    dateFormats [
                        dateFormatLength [
                            #type "full" 
                            dateFormat [
                                pattern [! "EEEE, d MMMM y G"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "long" 
                            dateFormat [
                                pattern [! "d MMMM y G"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "medium" 
                            dateFormat [
                                pattern [! "d MMM y G"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "dd/MM/y GGGGG"] 
                                datetimeSkeleton [! "GGGGGyMMdd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "EBhm" ! "E, h:mm B"] 
                            dateFormatItem [#id "EBhms" ! "E, h:mm:ss B"] 
                            dateFormatItem [#id "Ed" ! "E d"] 
                            dateFormatItem [#id "Ehm" ! "E, h:mm a"] 
                            dateFormatItem [#id "EHm" ! "E, HH:mm"] 
                            dateFormatItem [#id "Ehms" ! "E, h:mm:ss a"] 
                            dateFormatItem [#id "EHms" ! "E, HH:mm:ss"] 
                            dateFormatItem [#id "GyMMMd" ! "d MMM y G"] 
                            dateFormatItem [#id "GyMMMEd" ! "E, d MMM y G"] 
                            dateFormatItem [#id "M" ! "LL"] 
                            dateFormatItem [#id "Md" ! "dd/MM"] 
                            dateFormatItem [#id "MEd" ! "E, d/M"] 
                            dateFormatItem [#id "MMMd" ! "d MMM"] 
                            dateFormatItem [#id "MMMEd" ! "E, d MMM"] 
                            dateFormatItem [#id "MMMMd" ! "d MMMM"] 
                            dateFormatItem [#id "yyyyM" ! "MM/y GGGGG"] 
                            dateFormatItem [#id "yyyyMd" ! "dd/MM/y GGGGG"] 
                            dateFormatItem [#id "yyyyMEd" ! "E, dd/MM/y GGGGG"] 
                            dateFormatItem [#id "yyyyMMMd" ! "d MMM y G"] 
                            dateFormatItem [#id "yyyyMMMEd" ! "E, d MMM y G"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" ! "dd/MM – dd/MM"] 
                                greatestDifference [#id "M" ! "dd/MM – dd/MM"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" ! "E dd/MM – E dd/MM"] 
                                greatestDifference [#id "M" ! "E dd/MM – E dd/MM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMd" 
                                greatestDifference [#id "d" ! "d – d MMM"] 
                                greatestDifference [#id "M" ! "d MMM – d MMM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" ! "E d – E d MMM"] 
                                greatestDifference [#id "M" ! "E d MMM – E d MMM"]
                            ] 
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" ! "MM/y – MM/y GGGGG"] 
                                greatestDifference [#id "y" ! "MM/y – MM/y GGGGG"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" ! "dd/MM/y – dd/MM/y GGGGG"] 
                                greatestDifference [#id "M" ! "dd/MM/y – dd/MM/y GGGGG"] 
                                greatestDifference [#id "y" ! "dd/MM/y – dd/MM/y GGGGG"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" ! "E, dd/MM/y – E, dd/MM/y GGGGG"] 
                                greatestDifference [#id "M" ! "E, dd/MM/y – E, dd/MM/y GGGGG"] 
                                greatestDifference [#id "y" ! "E, dd/MM/y – E, dd/MM/y GGGGG"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMd" 
                                greatestDifference [#id "d" ! "d – d MMM y G"] 
                                greatestDifference [#id "M" ! "d MMM – d MMM y G"] 
                                greatestDifference [#id "y" ! "d MMM y – d MMM y G"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" ! "E, d – E, d MMM y G"] 
                                greatestDifference [#id "M" ! "E, d MMM – E, d MMM y G"] 
                                greatestDifference [#id "y" ! "E, d MMM y – E, d MMM y G"]
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
                                pattern [! "EEEE, d MMMM y"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "long" 
                            dateFormat [
                                pattern [! "d MMMM y"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "medium" 
                            dateFormat [
                                pattern [! "d MMM y"]
                            ]
                        ] 
                        dateFormatLength [
                            #type "short" 
                            dateFormat [
                                pattern [! "dd/MM/y"] 
                                datetimeSkeleton [! "yMMdd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        availableFormats [
                            dateFormatItem [#id "EBhm" ! "E, h:mm B"] 
                            dateFormatItem [#id "EBhms" ! "E, h:mm:ss B"] 
                            dateFormatItem [#id "Ed" ! "E d"] 
                            dateFormatItem [#id "GyMMMd" ! "d MMM y G"] 
                            dateFormatItem [#id "GyMMMEd" ! "E, d MMM y G"] 
                            dateFormatItem [#id "Md" ! "dd/MM"] 
                            dateFormatItem [#id "MEd" ! "E, dd/MM"] 
                            dateFormatItem [#id "MMdd" ! "dd/MM"] 
                            dateFormatItem [#id "MMMd" ! "d MMM"] 
                            dateFormatItem [#id "MMMEd" ! "E, d MMM"] 
                            dateFormatItem [#id "MMMMd" ! "d MMMM"] 
                            dateFormatItem [#id "yM" ! "MM/y"] 
                            dateFormatItem [#id "yMd" ! "dd/MM/y"] 
                            dateFormatItem [#id "yMEd" ! "E, dd/MM/y"] 
                            dateFormatItem [#id "yMMMd" ! "d MMM y"] 
                            dateFormatItem [#id "yMMMEd" ! "E, d MMM y"]
                        ] 
                        intervalFormats [
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" ! "dd/MM – dd/MM"] 
                                greatestDifference [#id "M" ! "dd/MM – dd/MM"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" ! "E dd/MM – E dd/MM"] 
                                greatestDifference [#id "M" ! "E dd/MM – E dd/MM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMd" 
                                greatestDifference [#id "d" ! "d – d MMM"] 
                                greatestDifference [#id "M" ! "d MMM – d MMM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" ! "E d – E d MMM"] 
                                greatestDifference [#id "M" ! "E d MMM – E d MMM"]
                            ] 
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" ! "MM/y – MM/y"] 
                                greatestDifference [#id "y" ! "MM/y – MM/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" ! "dd/MM/y – dd/MM/y"] 
                                greatestDifference [#id "M" ! "dd/MM/y – dd/MM/y"] 
                                greatestDifference [#id "y" ! "dd/MM/y – dd/MM/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" ! "E, dd/MM/y – E, dd/MM/y"] 
                                greatestDifference [#id "M" ! "E, dd/MM/y – E, dd/MM/y"] 
                                greatestDifference [#id "y" ! "E, dd/MM/y – E, dd/MM/y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMd" 
                                greatestDifference [#id "d" ! "d – d MMM y"] 
                                greatestDifference [#id "M" ! "d MMM – d MMM y"] 
                                greatestDifference [#id "y" ! "d MMM y – d MMM y"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" ! "E, d – E, d MMM y"] 
                                greatestDifference [#id "M" ! "E, d MMM – E, d MMM y"] 
                                greatestDifference [#id "y" ! "E, d MMM y – E, d MMM y"]
                            ]
                        ]
                    ]
                ]
            ] 
            timeZoneNames [
                zone [
                    #type "Pacific/Honolulu" 
                    short [
                        generic [! "∅∅∅"] 
                        standard [! "∅∅∅"] 
                        daylight [! "∅∅∅"]
                    ]
                ] 
                metazone [
                    #type "Alaska" 
                    short [
                        generic [! "∅∅∅"] 
                        standard [! "∅∅∅"] 
                        daylight [! "∅∅∅"]
                    ]
                ] 
                metazone [
                    #type "America_Central" 
                    short [
                        generic [! "∅∅∅"] 
                        standard [! "∅∅∅"] 
                        daylight [! "∅∅∅"]
                    ]
                ] 
                metazone [
                    #type "America_Eastern" 
                    short [
                        generic [! "∅∅∅"] 
                        standard [! "∅∅∅"] 
                        daylight [! "∅∅∅"]
                    ]
                ] 
                metazone [
                    #type "America_Mountain" 
                    short [
                        generic [! "∅∅∅"] 
                        standard [! "∅∅∅"] 
                        daylight [! "∅∅∅"]
                    ]
                ] 
                metazone [
                    #type "America_Pacific" 
                    short [
                        generic [! "∅∅∅"] 
                        standard [! "∅∅∅"] 
                        daylight [! "∅∅∅"]
                    ]
                ] 
                metazone [
                    #type "Atlantic" 
                    short [
                        generic [! "∅∅∅"] 
                        standard [! "∅∅∅"] 
                        daylight [! "∅∅∅"]
                    ]
                ] 
                metazone [
                    #type "Gulf" 
                    short [
                        standard [! "GST"]
                    ]
                ] 
                metazone [
                    #type "Hawaii_Aleutian" 
                    short [
                        generic [! "∅∅∅"] 
                        standard [! "∅∅∅"] 
                        daylight [! "∅∅∅"]
                    ]
                ]
            ]
        ] 
        numbers [
            currencies [
                currency [
                    #type "AED" 
                    symbol [! "AED"]
                ]
            ]
        ]
    ]

