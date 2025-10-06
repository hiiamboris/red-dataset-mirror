
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "ps"] 
            territory [#type "PK"]
        ] 
        localeDisplayNames [
            languages [
                language [#type "ar_001" ! "نوے معياري عربي"] 
                language [#type "dsb" ! "لوړے سربي"] 
                language [#type "fo" ! "فاروئے"] 
                language [#type "kha" ! "خاسے"] 
                language [#type "nb" ! "ناروے بوکمال"] 
                language [#type "no" #draft "unconfirmed" ! "ناروېئے"]
            ] 
            territories [
                territory [#type "019" ! "امريکے"] 
                territory [#type "PS" ! "فلسطين سيمے"] 
                territory [#type "TC" ! "د ترکیے او کیکاسو ټاپو"] 
                territory [#type "TF" ! "د فرانسے جنوبي سیمے"]
            ] 
            types [
                type [#key "collation" #type "standard" ! "معياري د لټے ترتيب"] 
                type [#key "numbers" #type "arabext" ! "غځېدلے عربي ۔ اينډيک عدد"]
            ]
        ] 
        characters [
            exemplarCharacters [! {[\u064E \u0650 \u064F \u064B \u064D \u064C \u0651 \u0652 \u0654 \u0670 آ ا أ ء ب پ ت ټ ث ج ځ چ څ ح خ د ډ ذ ر ړ ز ژ ږ س ش ښ ص ض ط ظ ع غ ف ق ک ګ گ ل م ن ڼ ه ة و ؤ ی ے ي ې ۍ ئ]}] 
            exemplarCharacters [#type "auxiliary" ! "[\u200C \u200D \u200E\u200F]"]
        ] 
        dates [
            calendars [
                calendar [
                    #type "gregorian" 
                    timeFormats [
                        timeFormatLength [
                            #type "full" 
                            timeFormat [
                                pattern [! "h:mm:ss a zzzz"] 
                                datetimeSkeleton [! "ahmmsszzzz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "long" 
                            timeFormat [
                                pattern [! "h:mm:ss a z"] 
                                datetimeSkeleton [! "ahmmssz"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "medium" 
                            timeFormat [
                                pattern [! "h:mm:ss a"] 
                                datetimeSkeleton [! "ahmmss"]
                            ]
                        ] 
                        timeFormatLength [
                            #type "short" 
                            timeFormat [
                                pattern [! "h:mm a"] 
                                datetimeSkeleton [! "ahmm"]
                            ]
                        ]
                    ]
                ] 
                calendar [
                    #type "islamic" 
                    months [
                        monthContext [
                            #type "format" 
                            monthWidth [
                                #type "wide" 
                                month [#type "2" ! "د صفرے د"]
                            ]
                        ] 
                        monthContext [
                            #type "stand-alone" 
                            monthWidth [
                                #type "wide" 
                                month [#type "2" ! "د صفرے د"]
                            ]
                        ]
                    ]
                ]
            ] 
            fields [
                field [
                    #type "year" 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "په {0} کال کے"] 
                        relativeTimePattern [#count "other" ! "په {0} کالونو کے"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} کال مخکے"] 
                        relativeTimePattern [#count "other" ! "{0} کاله مخکے"]
                    ]
                ] 
                field [
                    #type "year-short" 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "په {0} کال کے"] 
                        relativeTimePattern [#count "other" ! "په {0} کالونو کے"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} کال مخکے"] 
                        relativeTimePattern [#count "other" ! "{0} کاله مخکے"]
                    ]
                ] 
                field [
                    #type "year-narrow" 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "په {0} کال کے"] 
                        relativeTimePattern [#count "other" ! "په {0} کالونو کے"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} کال مخکے"] 
                        relativeTimePattern [#count "other" ! "{0} کاله مخکے"]
                    ]
                ] 
                field [
                    #type "weekOfMonth" 
                    displayName [! "د مياشتے اونۍ"]
                ] 
                field [
                    #type "weekOfMonth-short" 
                    displayName [! "د مياشتے اونۍ"]
                ] 
                field [
                    #type "weekOfMonth-narrow" 
                    displayName [! "د مياشتے اونۍ"]
                ] 
                field [
                    #type "weekdayOfMonth" 
                    displayName [! "د مياشتے اونۍ ورځ"]
                ] 
                field [
                    #type "weekdayOfMonth-short" 
                    displayName [! "د مياشتے اونۍ ورځ"]
                ] 
                field [
                    #type "weekdayOfMonth-narrow" 
                    displayName [! "د مياشتے اونۍ ورځ"]
                ]
            ] 
            timeZoneNames [
                zone [
                    #type "America/Lower_Princes" 
                    exemplarCity [! "د کمتر شهزاده درے میاشتنۍ"]
                ] 
                zone [
                    #type "Africa/Harare" 
                    exemplarCity [! "هرارے"]
                ] 
                metazone [
                    #type "Alaska" 
                    long [
                        daylight [! "د الاسکا د ورځے روښانه کول"]
                    ]
                ] 
                metazone [
                    #type "America_Central" 
                    long [
                        daylight [! "مرکزي رڼا ورځے وخت"]
                    ]
                ] 
                metazone [
                    #type "America_Eastern" 
                    long [
                        daylight [! "ختيځ د رڼا ورځے وخت"]
                    ]
                ] 
                metazone [
                    #type "America_Mountain" 
                    long [
                        daylight [! "د غره د رڼا ورځے وخت"]
                    ]
                ] 
                metazone [
                    #type "America_Pacific" 
                    long [
                        daylight [! "پیسفک د رڼا ورځے وخت"]
                    ]
                ] 
                metazone [
                    #type "Apia" 
                    long [
                        daylight [! "د اپیا د ورځے وخت"]
                    ]
                ] 
                metazone [
                    #type "Arabian" 
                    long [
                        daylight [! "د عربي ورځپاڼے وخت"]
                    ]
                ] 
                metazone [
                    #type "Atlantic" 
                    long [
                        daylight [! "اتلانتیک د رڼا ورځے وخت"]
                    ]
                ] 
                metazone [
                    #type "Australia_Western" 
                    long [
                        daylight [! "د اسټرالیا لویدیځ د ورځے وخت"]
                    ]
                ] 
                metazone [
                    #type "China" 
                    long [
                        daylight [! "د چين د رڼا ورځے وخت"]
                    ]
                ] 
                metazone [
                    #type "Cuba" 
                    long [
                        daylight [! "کیوبا د رڼا ورځے وخت"]
                    ]
                ] 
                metazone [
                    #type "Europe_Western" 
                    long [
                        generic [! "لوېديزے اروپا وخت"] 
                        standard [! "د لودیځے اروپا معیاري وخت"] 
                        daylight [! "د لودیځے اورپا د اوړي وخت"]
                    ]
                ] 
                metazone [
                    #type "French_Southern" 
                    long [
                        standard [! "د فرانسے سویل او انټارټيک وخت"]
                    ]
                ] 
                metazone [
                    #type "Hawaii_Aleutian" 
                    long [
                        daylight [! "هوایی الیوتین رڼا ورځے وخت"]
                    ]
                ] 
                metazone [
                    #type "Iran" 
                    long [
                        daylight [! "د ایران د ورځے وخت"]
                    ]
                ] 
                metazone [
                    #type "Israel" 
                    long [
                        daylight [! "د اسراییلو د ورځے وخت"]
                    ]
                ] 
                metazone [
                    #type "Japan" 
                    long [
                        daylight [! "جاپان د رڼا ورځے وخت"]
                    ]
                ] 
                metazone [
                    #type "Korea" 
                    long [
                        daylight [! "د کوریا د ورځے د ورځے وخت"]
                    ]
                ] 
                metazone [
                    #type "Line_Islands" 
                    long [
                        standard [! "د کرښے ټاټوبي وخت"]
                    ]
                ] 
                metazone [
                    #type "Lord_Howe" 
                    long [
                        daylight [! "رب هاو د ورځے د رڼا وخت"]
                    ]
                ] 
                metazone [
                    #type "Mexico_Northwest" 
                    long [
                        daylight [! "د شمال لویدیځ مکسیکو رڼا ورځے وخت"]
                    ]
                ] 
                metazone [
                    #type "Mexico_Pacific" 
                    long [
                        daylight [! "مکسیکن پیسفک رڼا ورځے وخت"]
                    ]
                ] 
                metazone [
                    #type "New_Zealand" 
                    long [
                        daylight [! "د نیوزی لینڈ د ورځے د رڼا وخت"]
                    ]
                ] 
                metazone [
                    #type "Newfoundland" 
                    long [
                        daylight [! "د نوي فیلډلینډ رڼا ورځے وخت"]
                    ]
                ] 
                metazone [
                    #type "Pierre_Miquelon" 
                    long [
                        daylight [! "سینټ پییرا و ميکلين رڼا ورځے وخت"]
                    ]
                ] 
                metazone [
                    #type "Samoa" 
                    long [
                        daylight [! "د سموا د ورځے روښانه کول"]
                    ]
                ]
            ]
        ] 
        numbers [
            currencies [
                currency [
                    #type "PKR" 
                    displayName [#count "one" ! "پاکستانۍ کلداره"] 
                    displayName [#count "other" ! "پاکستانۍ کلدارے"] 
                    symbol [#draft "contributed" ! "Rs"]
                ] 
                currency [
                    #type "XXX" 
                    displayName [! "نامعلومه مروجه پېسے"] 
                    displayName [#count "one" ! "(د نامعلومه مروجه پېسو واحد)"] 
                    displayName [#count "other" ! "(نامعلومه مروجه پېسے)"]
                ]
            ]
        ] 
        units [
            unitLength [
                #type "long" 
                unit [
                    #type "acceleration-g-force" 
                    displayName [! "د جاذبے قوه"] 
                    unitPattern [#count "one" ! "{0} د جاذبے قوه"] 
                    unitPattern [#count "other" ! "{0} د جاذبے قوه"]
                ] 
                unit [
                    #type "angle-degree" 
                    displayName [! "درجے"] 
                    unitPattern [#count "one" ! "{0} درجے"] 
                    unitPattern [#count "other" ! "{0} درجے"]
                ] 
                unit [
                    #type "angle-arc-second" 
                    displayName [! "آرک ثانيے"] 
                    unitPattern [#count "one" ! "{0} آرک ثانيه"] 
                    unitPattern [#count "other" ! "{0} آرک ثانيے"]
                ] 
                unit [
                    #type "area-hectare" 
                    displayName [! "هيکترے"] 
                    unitPattern [#count "one" ! "{0} هيکتر"] 
                    unitPattern [#count "other" ! "{0} هيکترے"]
                ] 
                unit [
                    #type "duration-month" 
                    displayName [! "مياشتے"] 
                    unitPattern [#count "one" ! "{0} مياشت"] 
                    unitPattern [#count "other" ! "{0} مياشتے"]
                ] 
                unit [
                    #type "duration-week" 
                    perUnitPattern [! "{0} په هره اونۍ کے"]
                ] 
                unit [
                    #type "duration-day" 
                    displayName [! "ورځے"] 
                    unitPattern [#count "one" ! "{0} ورځ"] 
                    unitPattern [#count "other" ! "{0} ورځے"] 
                    perUnitPattern [! "{0} په هره ورځ کے"]
                ] 
                unit [
                    #type "length-inch" 
                    displayName [! "انچے"] 
                    unitPattern [#count "one" ! "{0} انچ"] 
                    unitPattern [#count "other" ! "{0} انچے"]
                ] 
                unit [
                    #type "length-astronomical-unit" 
                    displayName [! "فلکي احدے"] 
                    unitPattern [#count "one" ! "{0} فلکي احد"] 
                    unitPattern [#count "other" ! "{0} فلکي احدے"]
                ] 
                unit [
                    #type "pressure-millimeter-ofhg" 
                    displayName [! "د پارے ملي مترز"] 
                    unitPattern [#count "one" ! "{0} د پارے ملي متر"] 
                    unitPattern [#count "other" ! "{0} د پارے ملي مترز"]
                ] 
                unit [
                    #type "pressure-inch-ofhg" 
                    displayName [! "د پارے انچے"] 
                    unitPattern [#count "one" ! "{0} د پارے انچ"] 
                    unitPattern [#count "other" ! "{0} د پارے انچے"]
                ] 
                unit [
                    #type "temperature-celsius" 
                    displayName [! "درجے سيلسيس"] 
                    unitPattern [#count "one" ! "{0} درجے سيلسيس"] 
                    unitPattern [#count "other" ! "{0} درجے سيلسيس"]
                ] 
                unit [
                    #type "temperature-fahrenheit" 
                    displayName [! "درجے فارنهايټ"] 
                    unitPattern [#count "one" ! "{0} درجے فارنهايټ"] 
                    unitPattern [#count "other" ! "{0} درجے فارنهايټ"]
                ] 
                unit [
                    #type "volume-cup" 
                    displayName [! "پيالے"] 
                    unitPattern [#count "one" ! "{0} پياله"] 
                    unitPattern [#count "other" ! "{0} پيالے"]
                ] 
                unit [
                    #type "volume-teaspoon" 
                    displayName [! "د ميز کاچوغے"] 
                    unitPattern [#count "one" ! "{0} د ميز کاچوغه"] 
                    unitPattern [#count "other" ! "{0} د ميز کاچوغے"]
                ]
            ] 
            unitLength [
                #type "short" 
                unit [
                    #type "acceleration-g-force" 
                    displayName [! "د جاذبے قوه"]
                ] 
                unit [
                    #type "angle-degree" 
                    displayName [! "درجے"]
                ] 
                unit [
                    #type "area-hectare" 
                    displayName [! "هيکترے"]
                ] 
                unit [
                    #type "duration-month" 
                    displayName [! "مياشتے"]
                ] 
                unit [
                    #type "duration-day" 
                    displayName [! "ورځے"] 
                    unitPattern [#count "one" ! "{0} ورځ"] 
                    unitPattern [#count "other" ! "{0} ورځے"]
                ] 
                unit [
                    #type "length-inch" 
                    displayName [! "انچے"]
                ] 
                unit [
                    #type "volume-cup" 
                    displayName [! "پيالے"]
                ]
            ]
        ] 
        characterLabels [
            characterLabel [#type "east_asian_scripts" ! "د ختيځے اسيا سکرېپټ"] 
            characterLabel [#type "nonspacing" ! "بے واټنه کول"] 
            characterLabel [#type "numbers" ! "شمېرے"] 
            characterLabel [#type "smiley" ! "مسکېدلے"]
        ] 
        typographicNames [
            featureName [#type "lnum" ! "لايننګ شمېرے"] 
            featureName [#type "pnum" ! "مطابقتي شمېرے"]
        ]
    ]

