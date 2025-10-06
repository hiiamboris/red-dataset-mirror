
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "ur"] 
            territory [#type "IN"]
        ] 
        localeDisplayNames [
            languages [
                language [#type "ar_001" ! "جدید معیاری عربی"] 
                language [#type "awa" ! "اودھی"] 
                language [#type "ckb" ! "سورانی کردی"] 
                language [#type "dje" ! "زرمہ"] 
                language [#type "hr" ! "کروشین"] 
                language [#type "jv" ! "جاوانیز"] 
                language [#type "ka" ! "جارجيائى"] 
                language [#type "kl" ! "کلالیسٹ"] 
                language [#type "kn" ! "کنڑ"] 
                language [#type "ku" ! "کرد"] 
                language [#type "mag" ! "مگہی"] 
                language [#type "zgh" ! "معیاری مراقشی تمازیقی"] 
                language [#type "zh_Hans" ! "آسان چینی"]
            ] 
            territories [
                territory [#type "AC" ! "جزیرہ اسینشن"] 
                territory [#type "AX" ! "جزائر آلینڈ"] 
                territory [#type "BV" ! "جزیرہ بوویت"] 
                territory [#type "CC" ! "جزائر (کیلنگ) کوکوس"] 
                territory [#type "CK" ! "جزائر کک"] 
                territory [#type "CP" ! "جزیرہ کلپرٹن"] 
                territory [#type "DG" ! "ڈیگو گارشیا"] 
                territory [#type "FK" ! "جزائر فاکلینڈ"] 
                territory [#type "FK" #alt "variant" ! "جزائر فاکلینڈ (اسلاس مالویناس)"] 
                territory [#type "FO" ! "جزائر فیرو"] 
                territory [#type "GF" ! "فرانسیسی گیانا"] 
                territory [#type "HM" ! "جزائر ہرڈ و مکڈونلڈ"] 
                territory [#type "IC" ! "جزائر کناری"] 
                territory [#type "IO" ! "برطانوی بحرہند خطہ"] 
                territory [#type "MH" ! "جزائر مارشل"] 
                territory [#type "MP" ! "جزائر شمالی ماریانا"] 
                territory [#type "NF" ! "جزیرہ نارفوک"] 
                territory [#type "PN" ! "جزائر پٹکیرن"] 
                territory [#type "SB" ! "جزائر سلیمان"] 
                territory [#type "TA" ! "ترسٹان دا کونیا"] 
                territory [#type "TC" ! "جزائر کیکس و ترکیہ"] 
                territory [#type "UM" ! "امریکی بیرونی جزائر"] 
                territory [#type "VG" ! "برطانوی جزائر ورجن"] 
                territory [#type "VI" ! "امریکی جزائر ورجن"]
            ] 
            types [
                type [#key "numbers" #type "armnlow" ! "آرمینیائی لوئر کیس اعداد"] 
                type [#key "numbers" #type "greklow" ! "یونانی لوئر کیس اعداد"] 
                type [#key "numbers" #type "tibt" ! "تبتی ہندسے"]
            ]
        ] 
        dates [
            fields [
                field [
                    #type "era" 
                    displayName [! "دور"]
                ] 
                field [
                    #type "year" 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "{0} سال میں"] 
                        relativeTimePattern [#count "other" ! "{0} سالوں میں"]
                    ]
                ] 
                field [
                    #type "year-short" 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "{0} سال میں"] 
                        relativeTimePattern [#count "other" ! "{0} سالوں میں"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} سال پہلے"] 
                        relativeTimePattern [#count "other" ! "{0} سالوں پہلے"]
                    ]
                ] 
                field [
                    #type "month" 
                    relative [#type "-1" ! "گزشتہ ماہ"] 
                    relative [#type "0" ! "اس ماہ"] 
                    relative [#type "1" ! "اگلے ماہ"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "{0} ماہ میں"] 
                        relativeTimePattern [#count "other" ! "{0} ماہ میں"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} ماہ قبل"] 
                        relativeTimePattern [#count "other" ! "{0} ماہ قبل"]
                    ]
                ] 
                field [
                    #type "month-short" 
                    displayName [! "مہینہ"]
                ] 
                field [
                    #type "month-narrow" 
                    displayName [! "مہینہ"] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} ماہ قبل"] 
                        relativeTimePattern [#count "other" ! "{0} ماہ قبل"]
                    ]
                ] 
                field [
                    #type "week" 
                    relative [#type "-1" ! "گزشتہ ہفتہ"] 
                    relative [#type "0" ! "اس ہفتہ"] 
                    relative [#type "1" ! "اگلے ہفتہ"] 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "{0} ہفتہ میں"] 
                        relativeTimePattern [#count "other" ! "{0} ہفتوں میں"]
                    ] 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} ہفتہ قبل"] 
                        relativeTimePattern [#count "other" ! "{0} ہفتے قبل"]
                    ]
                ] 
                field [
                    #type "week-short" 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} ہفتے قبل"] 
                        relativeTimePattern [#count "other" ! "{0} ہفتے قبل"]
                    ]
                ] 
                field [
                    #type "week-narrow" 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} ہفتہ قبل"] 
                        relativeTimePattern [#count "other" ! "{0} ہفتے قبل"]
                    ]
                ] 
                field [
                    #type "day-short" 
                    relativeTime [
                        #type "future" 
                        relativeTimePattern [#count "one" ! "{0} دنوں میں"] 
                        relativeTimePattern [#count "other" ! "{0} دنوں میں"]
                    ]
                ] 
                field [
                    #type "day-narrow" 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} دن قبل"] 
                        relativeTimePattern [#count "other" ! "{0} دن قبل"]
                    ]
                ] 
                field [
                    #type "mon" 
                    relative [#type "-1" ! "پچھلے سوموار"] 
                    relative [#type "0" ! "اس سوموار"] 
                    relative [#type "1" ! "اگلے سوموار"]
                ] 
                field [
                    #type "tue" 
                    relative [#type "-1" ! "پچھلے منگل"] 
                    relative [#type "0" ! "اس منگل"] 
                    relative [#type "1" ! "اگلے منگل"]
                ] 
                field [
                    #type "wed" 
                    relative [#type "-1" ! "پچھلے بدھ"] 
                    relative [#type "0" ! "اس بدھ"] 
                    relative [#type "1" ! "اگلے بدھ"]
                ] 
                field [
                    #type "thu" 
                    relative [#type "-1" ! "پچھلے جمعرات"] 
                    relative [#type "0" ! "اس جمعرات"] 
                    relative [#type "1" ! "اگلے جمعرات"]
                ] 
                field [
                    #type "fri" 
                    relative [#type "-1" ! "پچھلے جمعہ"] 
                    relative [#type "0" ! "اس جمعہ"] 
                    relative [#type "1" ! "اگلے جمعہ"]
                ] 
                field [
                    #type "hour-short" 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} گھنٹے قبل"] 
                        relativeTimePattern [#count "other" ! "{0} گھنٹے قبل"]
                    ]
                ] 
                field [
                    #type "hour-narrow" 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} گھنٹہ قبل"] 
                        relativeTimePattern [#count "other" ! "{0} گھنٹے قبل"]
                    ]
                ] 
                field [
                    #type "minute" 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} منٹ قبل"] 
                        relativeTimePattern [#count "other" ! "{0} منٹ قبل"]
                    ]
                ] 
                field [
                    #type "minute-short" 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} منٹ قبل"] 
                        relativeTimePattern [#count "other" ! "{0} منٹ قبل"]
                    ]
                ] 
                field [
                    #type "minute-narrow" 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} منٹ قبل"] 
                        relativeTimePattern [#count "other" ! "{0} منٹ قبل"]
                    ]
                ] 
                field [
                    #type "second" 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} سیکنڈ قبل"] 
                        relativeTimePattern [#count "other" ! "{0} سیکنڈ قبل"]
                    ]
                ] 
                field [
                    #type "second-short" 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} سیکنڈ قبل"] 
                        relativeTimePattern [#count "other" ! "{0} سیکنڈ قبل"]
                    ]
                ] 
                field [
                    #type "second-narrow" 
                    relativeTime [
                        #type "past" 
                        relativeTimePattern [#count "one" ! "{0} سیکنڈ قبل"] 
                        relativeTimePattern [#count "other" ! "{0} سیکنڈ قبل"]
                    ]
                ]
            ] 
            timeZoneNames [
                gmtFormat [! "GMT{0}"] 
                regionFormat [#type "daylight" ! "{0} دن کا وقت"] 
                zone [
                    #type "America/Cambridge_Bay" 
                    exemplarCity [! "کیمبرج بے"]
                ] 
                zone [
                    #type "America/Goose_Bay" 
                    exemplarCity [! "گوس بے"]
                ] 
                zone [
                    #type "America/Glace_Bay" 
                    exemplarCity [! "گلیس بے"]
                ] 
                zone [
                    #type "Africa/Accra" 
                    exemplarCity [! "اکرا"]
                ] 
                zone [
                    #type "America/Thule" 
                    exemplarCity [! "تھولے"]
                ] 
                zone [
                    #type "America/Scoresbysund" 
                    exemplarCity [! "اتتوققورتورمیت"]
                ] 
                zone [
                    #type "Europe/Budapest" 
                    exemplarCity [! "بوڈاپیسٹ"]
                ] 
                zone [
                    #type "America/Grand_Turk" 
                    exemplarCity [! "گرینڈ ترک"]
                ] 
                metazone [
                    #type "Afghanistan" 
                    long [
                        standard [! "افغانستان ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Amazon" 
                    long [
                        generic [! "ایمیزون ٹائم"] 
                        standard [! "ایمیزون سٹینڈرڈ ٹائم"] 
                        daylight [! "ایمیزون سمر ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Arabian" 
                    long [
                        generic [! "عرب ٹائم"] 
                        standard [! "عرب سٹینڈرڈ ٹائم"] 
                        daylight [! "عرب ڈے لائٹ ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Argentina_Western" 
                    long [
                        generic [! "مغربی ارجنٹینا ٹائم"] 
                        standard [! "مغربی ارجنٹینا سٹینڈرڈ ٹائم"] 
                        daylight [! "مغربی ارجنٹینا سمر ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Armenia" 
                    long [
                        generic [! "آرمینیا ٹائم"] 
                        standard [! "آرمینیا سٹینڈرڈ ٹائم"] 
                        daylight [! "آرمینیا سمر ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Azerbaijan" 
                    long [
                        generic [! "آذربائیجان ٹائم"] 
                        standard [! "آذربائیجان سٹینڈرڈ ٹائم"] 
                        daylight [! "آذربائیجان سمر ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Bangladesh" 
                    long [
                        generic [! "بنگلہ دیش ٹائم"] 
                        standard [! "بنگلہ دیش سٹینڈرڈ ٹائم"] 
                        daylight [! "بنگلہ دیش سمر ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Bhutan" 
                    long [
                        standard [! "بھوٹان ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Bolivia" 
                    long [
                        standard [! "بولیویا ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Brasilia" 
                    long [
                        generic [! "برازیلیا ٹائم"] 
                        standard [! "برازیلیا سٹینڈرڈ ٹائم"] 
                        daylight [! "برازیلیا سمر ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Chile" 
                    long [
                        generic [! "چلی ٹائم"] 
                        standard [! "چلی سٹینڈرڈ ٹائم"] 
                        daylight [! "چلی سمر ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Colombia" 
                    long [
                        generic [! "کولمبیا ٹائم"] 
                        standard [! "کولمبیا سٹینڈرڈ ٹائم"] 
                        daylight [! "کولمبیا سمر ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Easter" 
                    long [
                        generic [! "ایسٹر آئلینڈ ٹائم"] 
                        standard [! "ایسٹر آئلینڈ سٹینڈرڈ ٹائم"] 
                        daylight [! "ایسٹر آئلینڈ سمر ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Ecuador" 
                    long [
                        standard [! "ایکواڈور ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Europe_Central" 
                    long [
                        generic [! "وسطی یورپ کا وقت"] 
                        standard [! "وسطی یورپ کا معیاری وقت"] 
                        daylight [! "وسطی یورپ کا موسم گرما کا وقت"]
                    ]
                ] 
                metazone [
                    #type "Falkland" 
                    long [
                        generic [! "فاک لینڈ آئلینڈز ٹائم"] 
                        standard [! "فاک لینڈ آئلینڈز سٹینڈرڈ ٹائم"] 
                        daylight [! "فاک لینڈ آئلینڈز سمر ٹائم"]
                    ]
                ] 
                metazone [
                    #type "French_Guiana" 
                    long [
                        standard [! "فرینچ گیانا ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Galapagos" 
                    long [
                        standard [! "گالاپاگوز ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Georgia" 
                    long [
                        generic [! "جارجیا ٹائم"] 
                        standard [! "جارجیا سٹینڈرڈ ٹائم"] 
                        daylight [! "جارجیا سمر ٹائم"]
                    ]
                ] 
                metazone [
                    #type "GMT" 
                    long [
                        standard [! "گرین وچ مین ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Gulf" 
                    long [
                        standard [! "خلیج سٹینڈرڈ ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Guyana" 
                    long [
                        standard [! "گیانا ٹائم"]
                    ]
                ] 
                metazone [
                    #type "India" 
                    long [
                        standard [! "انڈیا سٹینڈرڈ ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Iran" 
                    long [
                        generic [! "ایران ٹائم"] 
                        standard [! "ایران سٹینڈرڈ ٹائم"] 
                        daylight [! "ایران ڈے لائٹ ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Israel" 
                    long [
                        generic [! "اسرائیل ٹائم"] 
                        standard [! "اسرائیل سٹینڈرڈ ٹائم"] 
                        daylight [! "اسرائیل ڈے لائٹ ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Kazakhstan_Eastern" 
                    long [
                        standard [! "مشرقی قزاخستان ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Kazakhstan_Western" 
                    long [
                        standard [! "مغربی قزاخستان ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Kyrgystan" 
                    long [
                        standard [! "کرغستان ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Macquarie" 
                    long [
                        standard [! "مکوآری آئلینڈ ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Maldives" 
                    long [
                        standard [! "مالدیپ ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Nepal" 
                    long [
                        standard [! "نیپال ٹائم"]
                    ]
                ] 
                metazone [
                    #type "New_Zealand" 
                    long [
                        generic [! "نیوزی لینڈ ٹائم"] 
                        standard [! "نیوزی لینڈ سٹینڈرڈ ٹائم"] 
                        daylight [! "نیوزی لینڈ ڈے لائٹ ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Noronha" 
                    long [
                        generic [! "فرنانڈو ڈی نورنہا ٹائم"] 
                        standard [! "فرنانڈو ڈی نورنہا سٹینڈرڈ ٹائم"] 
                        daylight [! "فرنانڈو ڈی نورونہا سمر ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Pakistan" 
                    long [
                        generic [! "پاکستان ٹائم"] 
                        standard [! "پاکستان سٹینڈرڈ ٹائم"] 
                        daylight [! "پاکستان سمر ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Paraguay" 
                    long [
                        generic [! "پیراگوئے ٹائم"] 
                        standard [! "پیراگوئے سٹینڈرڈ ٹائم"] 
                        daylight [! "پیراگوئے سمر ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Peru" 
                    long [
                        generic [! "پیرو ٹائم"] 
                        standard [! "پیرو سٹینڈرڈ ٹائم"] 
                        daylight [! "پیرو سمر ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Rothera" 
                    long [
                        standard [! "روتھیرا ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Suriname" 
                    long [
                        standard [! "سورینام ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Tajikistan" 
                    long [
                        standard [! "تاجکستان ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Turkmenistan" 
                    long [
                        generic [! "ترکمانستان ٹائم"] 
                        standard [! "ترکمانستان سٹینڈرڈ ٹائم"] 
                        daylight [! "ترکمانستان سمر ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Uruguay" 
                    long [
                        generic [! "یوروگوئے ٹائم"] 
                        standard [! "یوروگوئے سٹینڈرڈ ٹائم"] 
                        daylight [! "یوروگوئے سمر ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Uzbekistan" 
                    long [
                        generic [! "ازبکستان ٹائم"] 
                        standard [! "ازبکستان سٹینڈرڈ ٹائم"] 
                        daylight [! "ازبکستان سمر ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Venezuela" 
                    long [
                        standard [! "وینزوئیلا ٹائم"]
                    ]
                ] 
                metazone [
                    #type "Vostok" 
                    long [
                        standard [! "ووسٹاک ٹائم"]
                    ]
                ]
            ]
        ] 
        numbers [
            defaultNumberingSystem [! "arabext"] 
            currencyFormats [
                #numberSystem "arabext" 
                currencyFormatLength [
                    currencyFormat [
                        #type "standard" 
                        pattern [! "¤ #,##,##0.00"]
                    ]
                ]
            ] 
            currencies [
                currency [
                    #type "CRC" 
                    displayName [! "کوسٹا ریکا کولون"] 
                    displayName [#count "one" ! "کوسٹا ریکا کولون"] 
                    displayName [#count "other" ! "کوسٹا ریکا کولون"]
                ] 
                currency [
                    #type "CUC" 
                    displayName [! "قابل منتقلی کیوبائی پیسو"] 
                    displayName [#count "one" ! "قابل منتقلی کیوبائی پیسو"] 
                    displayName [#count "other" ! "قابل منتقلی کیوبائی پیسو"]
                ] 
                currency [
                    #type "CUP" 
                    displayName [! "کیوبائی پیسو"] 
                    displayName [#count "one" ! "کیوبائی پیسو"] 
                    displayName [#count "other" ! "کیوبائی پیسو"]
                ] 
                currency [
                    #type "CVE" 
                    displayName [! "کیپ ورڈی اسکیوڈو"] 
                    displayName [#count "one" ! "کیپ ورڈی اسکیوڈو"] 
                    displayName [#count "other" ! "کیپ ورڈی اسکیوڈو"]
                ] 
                currency [
                    #type "GBP" 
                    displayName [! "برطانوی پاونڈ سٹرلنگ"] 
                    displayName [#count "one" ! "برطانوی پاونڈ سٹرلنگ"] 
                    displayName [#count "other" ! "برطانوی پاونڈ سٹرلنگ"]
                ] 
                currency [
                    #type "GHS" 
                    displayName [! "گھانی سیڈی"] 
                    displayName [#count "one" ! "گھانی سیڈی"] 
                    displayName [#count "other" ! "گھانی سیڈی"]
                ] 
                currency [
                    #type "PKR" 
                    displayName [#count "one" ! "پاکستانی روپیہ"] 
                    displayName [#count "other" ! "پاکستانی روپے"] 
                    symbol [! "PKR"]
                ] 
                currency [
                    #type "WST" 
                    displayName [! "ساموآئی ٹالا"] 
                    displayName [#count "one" ! "ساموآئی ٹالا"] 
                    displayName [#count "other" ! "ساموآئی ٹالا"]
                ]
            ] 
            miscPatterns [
                #numberSystem "latn" 
                pattern [#type "atLeast" ! "{0}+"]
            ]
        ] 
        units [
            unitLength [
                #type "long" 
                unit [
                    #type "length-astronomical-unit" 
                    displayName [! "فلکیاتی اکائیاں"] 
                    unitPattern [#count "one" ! "{0} فلکیاتی اکائی"] 
                    unitPattern [#count "other" ! "{0} فلکیاتی اکائیاں"]
                ]
            ]
        ] 
        listPatterns [
            listPattern [
                #type "unit" 
                listPatternPart [#type "end" ! "{1}، {0}"] 
                listPatternPart [#type "2" ! "{1}، {0}"]
            ] 
            listPattern [
                #type "unit-narrow" 
                listPatternPart [#type "start" ! "{1} {0}"] 
                listPatternPart [#type "middle" ! "{1} {0}"] 
                listPatternPart [#type "end" ! "{1} {0}"] 
                listPatternPart [#type "2" ! "{1} {0}"]
            ] 
            listPattern [
                #type "unit-short" 
                listPatternPart [#type "end" ! "{1}، {0}"] 
                listPatternPart [#type "2" ! "{1}، {0}"]
            ]
        ] 
        posix [
            messages [
                nostr [! "نہیں:نہ"]
            ]
        ]
    ]

