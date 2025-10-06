
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "ti"] 
            territory [#type "ER"]
        ] 
        localeDisplayNames [
            languages [
                language [#type "ar_001" ! "ዘመናዊ ምዱብ ዓረብ"] 
                language [#type "nds_NL" ! "ትሑት ሳክሰን"] 
                language [#type "nl_BE" ! "ፍላሚሽ"] 
                language [#type "zh_Hans" ! "ቀሊል ቻይንኛ"] 
                language [#type "zh_Hans" #alt "long" ! "ቀሊል ማንዳሪን ቻይንኛ"] 
                language [#type "zh_Hant" ! "ባህላዊ ቻይንኛ"] 
                language [#type "zh_Hant" #alt "long" ! "ባህላዊ ማንዳሪን ቻይንኛ"]
            ]
        ] 
        characters [
            exemplarCharacters [#draft "unconfirmed" ! {[\u135F ፡ ፣-፧ ። ፠ ፨ ፲-፼ ፩-፱ ሀ-ሆ ለ-ሟ ረ-ቆ ቈ ቊ-ቍ ቐ-ቖ ቘ ቚ-ቝ በ-ኆ ኈ ኊ-ኍ ነ-ኮ ኰ ኲ-ኵ ኸ-ኾ ዀ ዂ-ዅ ወ-ዎ ዐ-ዖ ዘ-ዮ ደ-ዷ ጀ-ጎ ጐ ጒ-ጕ ጠ-ጯ ጸ-ጿ ፈ-ፗ]}] 
            exemplarCharacters [#type "auxiliary" #draft "unconfirmed" ! {[᎐ ᎑ ᎒ ᎓ ᎔ ᎕ ᎖ ᎗ ᎘ ᎙ ሇ ⶀ ᎀ ᎁ ᎂ ᎃ ⶁ ሠ ሡ ሢ ሣ ሤ ሥ ሦ ሧ ⶂ ⶃ ⶄ ቇ ᎄ ᎅ ᎆ ᎇ ⶅ ⶆ ⶇ ኇ ⶈ ⶉ ⶊ ኯ ዏ ⶋ ዯ ⶌ ዸ ዹ ዺ ዻ ዼ ዽ ዾ ዿ ⶍ ⶎ ጏ ጘ ጙ ጚ ጛ ጜ ጝ ጞ ጟ ⶓ ⶔ ⶕ ⶖ ⶏ ⶐ ⶑ ፀ ፁ ፂ ፃ ፄ ፅ ፆ ፇ ᎈ ᎉ ᎊ ᎋ ᎌ ᎍ ᎎ ᎏ ⶒ ፘ ፙ ፚ ⶠ ⶡ ⶢ ⶣ ⶤ ⶥ ⶦ ⶨ ⶩ ⶪ ⶫ ⶬ ⶭ ⶮ ⶰ ⶱ ⶲ ⶳ ⶴ ⶵ ⶶ ⶸ ⶹ ⶺ ⶻ ⶼ ⶽ ⶾ ⷀ ⷁ ⷂ ⷃ ⷄ ⷅ ⷆ ⷈ ⷉ ⷊ ⷋ ⷌ ⷍ ⷎ ⷐ ⷑ ⷒ ⷓ ⷔ ⷕ ⷖ ⷘ ⷙ ⷚ ⷛ ⷜ ⷝ ⷞ]}] 
            exemplarCharacters [#type "index" #draft "unconfirmed" ! {[ሀ ለ ሐ መ ረ ሰ ሸ ቀ ቈ ቐ ቘ በ ቨ ተ ቸ ኀ ኈ ነ ኘ አ ከ ኰ ኸ ዀ ወ ዐ ዘ ዠ የ ደ ጀ ገ ጐ ጠ ጨ ጸ ፈ ፐ]}]
        ] 
        delimiters [
            quotationStart [! "‘"] 
            quotationEnd [! "’"]
        ] 
        dates [
            calendars [
                calendar [
                    #type "generic" 
                    dateFormats [
                        dateFormatLength [
                            #type "full" 
                            dateFormat [
                                pattern [! "EEEE፡ dd MMMM መዓልቲ y G"] 
                                datetimeSkeleton [! "GyMMMMEEEEdd"]
                            ]
                        ]
                    ] 
                    dateTimeFormats [
                        intervalFormats [
                            intervalFormatFallback [#draft "unconfirmed" ! "{0} - {1}"] 
                            intervalFormatItem [
                                #id "Md" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "MM-dd – MM-dd"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "MM-dd – MM-dd"]
                            ] 
                            intervalFormatItem [
                                #id "MEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E፡ MM-dd – E፡ MM-dd"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E፡ MM-dd – E፡ MM-dd"]
                            ] 
                            intervalFormatItem [
                                #id "MMM" 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "MMM–MMM"]
                            ] 
                            intervalFormatItem [
                                #id "MMMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "MMM d–d"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "MMM d – MMM d"]
                            ] 
                            intervalFormatItem [
                                #id "MMMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E፡ MMM d – E፡ MMM d"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E፡ MMM d – E፡ MMM d"]
                            ] 
                            intervalFormatItem [
                                #id "yM" 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "y-MM – y-MM"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "y-MM – y-MM"]
                            ] 
                            intervalFormatItem [
                                #id "yMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "y-MM-dd – y-MM-dd"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "y-MM-dd – y-MM-dd"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "y-MM-dd – y-MM-dd"]
                            ] 
                            intervalFormatItem [
                                #id "yMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E፡ y-MM-dd – E፡ y-MM-dd"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E፡ y-MM-dd – E፡ y-MM-dd"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E፡ y-MM-dd – E፡ y-MM-dd"]
                            ] 
                            intervalFormatItem [
                                #id "yMMM" 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "y MMM–MMM"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "y MMM – y MMM"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "y MMM d–d"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "y MMM d – MMM d"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "y MMM d – y MMM d"]
                            ] 
                            intervalFormatItem [
                                #id "yMMMEd" 
                                greatestDifference [#id "d" #draft "unconfirmed" ! "E፡ dd MMM መዓልቲ y G – E፡ dd MMM መዓልቲ y G"] 
                                greatestDifference [#id "M" #draft "unconfirmed" ! "E፡ dd MMM መዓልቲ y G – E፡ dd MMM መዓልቲ y G"] 
                                greatestDifference [#id "y" #draft "unconfirmed" ! "E፡ dd MMM መዓልቲ y G – E፡ dd MMM መዓልቲ y G"]
                            ]
                        ]
                    ]
                ] 
                calendar [
                    #type "gregorian" 
                    eras [
                        eraNames [
                            era [#type "0" ! "ዓመተ ዓለም"] 
                            era [#type "0" #alt "variant" ! "ቅድሚ ልደተ ክርስቶስ"] 
                            era [#type "1" #alt "variant" ! "ድሕሪ ልደተ ክርስቶስ"]
                        ]
                    ]
                ]
            ]
        ] 
        numbers [
            currencies [
                currency [
                    #type "ERN" 
                    symbol [! "Nfk"]
                ]
            ]
        ]
    ]

