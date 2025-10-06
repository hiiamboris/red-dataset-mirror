
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "de"] 
            territory [#type "CH"]
        ] 
        localeDisplayNames [
            languages [
                language [#type "ace" ! "Aceh-Sprache"] 
                language [#type "ach" ! "Acholi-Sprache"] 
                language [#type "ar_001" ! "Modernes Hocharabisch"] 
                language [#type "ars" ! "Nadschd-Arabisch"] 
                language [#type "bas" ! "Basaa-Sprache"] 
                language [#type "bik" ! "Bikol-Sprache"] 
                language [#type "bin" ! "Bini-Sprache"] 
                language [#type "chb" ! "Chibcha-Sprache"] 
                language [#type "de_CH" ! "Schweizer Hochdeutsch"] 
                language [#type "din" ! "Dinka-Sprache"] 
                language [#type "fan" ! "Pangwe-Sprache"] 
                language [#type "gba" ! "Gbaya-Sprache"] 
                language [#type "kmb" ! "Kimbundu-Sprache"] 
                language [#type "mus" ! "Muskogee-Sprache"] 
                language [#type "nl_BE" ! "Flämisch"] 
                language [#type "prg" ! "Altpreussisch"] 
                language [#type "rhg" ! "Rohingya"] 
                language [#type "zh_Hans" ! "Chinesisch (vereinfacht)"] 
                language [#type "zh_Hans" #alt "long" ! "Hochchinesisch (vereinfacht)"] 
                language [#type "zh_Hant" ! "Chinesisch (traditionell)"] 
                language [#type "zh_Hant" #alt "long" ! "Hochchinesisch (traditionell)"]
            ] 
            territories [
                territory [#type "BN" ! "Brunei"] 
                territory [#type "BW" ! "Botswana"] 
                territory [#type "CV" ! "Kapverden"] 
                territory [#type "GB" ! "Grossbritannien"] 
                territory [#type "QO" ! "Äusseres Ozeanien"] 
                territory [#type "SB" ! "Salomon-Inseln"] 
                territory [#type "TL" ! "Osttimor"] 
                territory [#type "ZW" ! "Zimbabwe"]
            ] 
            keys [
                key [#type "colCaseFirst" ! "Sortierung nach Gross- bzw. Kleinbuchstaben"] 
                key [#type "colCaseLevel" ! "Sortierung nach Gross- oder Kleinschreibung"] 
                key [#type "ms" ! "Mass-System"]
            ] 
            types [
                type [#key "colCaseFirst" #type "upper" #draft "contributed" ! "Grossbuchstaben zuerst aufführen"] 
                type [#key "colCaseLevel" #type "no" #draft "contributed" ! "Ohne Gross-/Kleinschreibung sortieren"] 
                type [#key "colCaseLevel" #type "yes" #draft "contributed" ! "Nach Gross-/Kleinschreibung sortieren"] 
                type [#key "ms" #type "uksystem" ! "britisches Mass-System"] 
                type [#key "ms" #type "ussystem" ! "US Mass-System"]
            ]
        ] 
        characters [
            exemplarCharacters [! {[a ä b c d e f g h i j k l m n o ö p q r s t u ü v w x y z]}] 
            exemplarCharacters [#type "numbers" ! "[\- ‑ . ’ % ‰ + 0 1 2 3 4 5 6 7 8 9]"] 
            parseLenients [
                #scope "general" 
                #level "lenient" 
                parseLenient [#sample "’" ! "['ʼ՚᾽᾿’＇]"]
            ]
        ] 
        dates [
            calendars [
                calendar [
                    #type "gregorian" 
                    days [
                        dayContext [
                            #type "format" 
                            dayWidth [
                                #type "short" 
                                day [#type "sun" ! "So"] 
                                day [#type "mon" ! "Mo"] 
                                day [#type "tue" ! "Di"] 
                                day [#type "wed" ! "Mi"] 
                                day [#type "thu" ! "Do"] 
                                day [#type "fri" ! "Fr"] 
                                day [#type "sat" ! "Sa"]
                            ]
                        ]
                    ]
                ]
            ] 
            fields [
                field [
                    #type "era-narrow" 
                    displayName [! "Epoche"]
                ] 
                field [
                    #type "weekOfMonth" 
                    displayName [! "Woche im Monat"]
                ] 
                field [
                    #type "weekOfMonth-short" 
                    displayName [! "Wo. i. M."]
                ] 
                field [
                    #type "weekOfMonth-narrow" 
                    displayName [! "W. i. Mon."]
                ] 
                field [
                    #type "dayOfYear-short" 
                    displayName [! "Tag d. J."]
                ] 
                field [
                    #type "weekday-narrow" 
                    displayName [! "Wochentag"]
                ] 
                field [
                    #type "weekdayOfMonth" 
                    displayName [! "Wochentag im Monat"]
                ] 
                field [
                    #type "weekdayOfMonth-short" 
                    displayName [! "Wochent. i. Mo."]
                ] 
                field [
                    #type "weekdayOfMonth-narrow" 
                    displayName [! "Wochent. i. Mon."]
                ]
            ] 
            timeZoneNames [
                zone [
                    #type "Asia/Brunei" 
                    exemplarCity [! "Brunei"]
                ] 
                zone [
                    #type "Asia/Macau" 
                    exemplarCity [! "Macao"]
                ] 
                zone [
                    #type "Europe/Saratov" 
                    exemplarCity [! "Saratov"]
                ] 
                metazone [
                    #type "Brunei" 
                    long [
                        standard [! "Brunei-Zeit"]
                    ]
                ] 
                metazone [
                    #type "Solomon" 
                    long [
                        standard [! "Salomoninseln-Zeit"]
                    ]
                ]
            ]
        ] 
        numbers [
            symbols [
                #numberSystem "latn" 
                decimal [! "."] 
                group [! "’"]
            ] 
            percentFormats [
                #numberSystem "latn" 
                percentFormatLength [
                    percentFormat [
                        pattern [! "#,##0%"]
                    ]
                ]
            ] 
            currencyFormats [
                #numberSystem "latn" 
                currencyFormatLength [
                    currencyFormat [
                        #type "standard" 
                        pattern [! "¤ #,##0.00;¤-#,##0.00"]
                    ]
                ]
            ] 
            currencies [
                currency [
                    #type "BYN" 
                    displayName [! "Weissrussischer Rubel"] 
                    displayName [#count "one" ! "Weissrussischer Rubel"] 
                    displayName [#count "other" ! "Weissrussische Rubel"]
                ] 
                currency [
                    #type "BYR" 
                    displayName [! "Weissrussischer Rubel (2000–2016)"] 
                    displayName [#count "one" ! "Weissrussischer Rubel (2000–2016)"] 
                    displayName [#count "other" ! "Weissrussische Rubel (2000–2016)"]
                ] 
                currency [
                    #type "EUR" 
                    symbol [! "EUR"] 
                    symbol [#alt "narrow" ! "EUR"]
                ] 
                currency [
                    #type "STN" 
                    displayName [! "São-toméischer Dobra (2018)"] 
                    displayName [#count "one" ! "São-toméischer Dobra (2018)"] 
                    displayName [#count "other" ! "São-toméischer Dobra (2018)"]
                ]
            ]
        ] 
        units [
            unitLength [
                #type "long" 
                unit [
                    #type "area-square-foot" 
                    displayName [! "Quadratfuss"] 
                    unitPattern [#count "one" ! "{0} Quadratfuss"] 
                    unitPattern [#count "one" #case "accusative" ! "{0} Quadratfuss"] 
                    unitPattern [#count "one" #case "dative" ! "{0} Quadratfuss"] 
                    unitPattern [#count "one" #case "genitive" ! "{0} Quadratfusses"] 
                    unitPattern [#count "other" ! "{0} Quadratfuss"] 
                    unitPattern [#count "other" #case "accusative" ! "{0} Quadratfuss"] 
                    unitPattern [#count "other" #case "dative" ! "{0} Quadratfuss"] 
                    unitPattern [#count "other" #case "genitive" ! "{0} Quadratfuss"]
                ] 
                unit [
                    #type "length-foot" 
                    displayName [! "Fuss"] 
                    unitPattern [#count "one" ! "{0} Fuss"] 
                    unitPattern [#count "one" #case "accusative" ! "{0} Fuss"] 
                    unitPattern [#count "one" #case "dative" ! "{0} Fuss"] 
                    unitPattern [#count "one" #case "genitive" ! "{0} Fusses"] 
                    unitPattern [#count "other" ! "{0} Fuss"] 
                    unitPattern [#count "other" #case "accusative" ! "{0} Fuss"] 
                    unitPattern [#count "other" #case "dative" ! "{0} Fuss"] 
                    unitPattern [#count "other" #case "genitive" ! "{0} Fuss"] 
                    perUnitPattern [! "{0} pro Fuss"]
                ] 
                unit [
                    #type "volume-cubic-foot" 
                    displayName [! "Kubikfuss"] 
                    unitPattern [#count "one" ! "{0} Kubikfuss"] 
                    unitPattern [#count "one" #case "accusative" ! "{0} Kubikfuss"] 
                    unitPattern [#count "one" #case "dative" ! "{0} Kubikfuss"] 
                    unitPattern [#count "one" #case "genitive" ! "{0} Kubikfusses"] 
                    unitPattern [#count "other" ! "{0} Kubikfuss"] 
                    unitPattern [#count "other" #case "accusative" ! "{0} Kubikfuss"] 
                    unitPattern [#count "other" #case "dative" ! "{0} Kubikfuss"] 
                    unitPattern [#count "other" #case "genitive" ! "{0} Kubikfuss"]
                ] 
                unit [
                    #type "volume-gallon-imperial" 
                    unitPattern [#count "one" ! "{0} gal Imp."] 
                    unitPattern [#count "other" ! "{0} gal Imp."] 
                    perUnitPattern [! "{0}/gal Imp."]
                ]
            ] 
            unitLength [
                #type "short" 
                unit [
                    #type "length-foot" 
                    displayName [! "Fuss"]
                ] 
                unit [
                    #type "volume-gallon-imperial" 
                    perUnitPattern [! "{0}/gal Imp."]
                ] 
                unit [
                    #type "volume-dram" 
                    displayName [! "Dram"] 
                    unitPattern [#count "one" ! "{0} dr."] 
                    unitPattern [#count "other" ! "{0} dr."]
                ] 
                unit [
                    #type "volume-jigger" 
                    displayName [! "Schuss"] 
                    unitPattern [#count "one" ! "Schuss"] 
                    unitPattern [#count "other" ! "{0} Schuss"]
                ] 
                unit [
                    #type "volume-pinch" 
                    unitPattern [#count "one" ! "{0} Prise"] 
                    unitPattern [#count "other" ! "{0} Prise"]
                ]
            ]
        ] 
        typographicNames [
            axisName [#type "opsz" ! "optische Grösse"] 
            styleName [#type "opsz" #subtype "8" ! "Konsultationsgrösse"] 
            styleName [#type "opsz" #subtype "12" ! "Lesegrösse"] 
            styleName [#type "opsz" #subtype "18" ! "Schaugrösse"] 
            styleName [#type "opsz" #subtype "72" ! "Plakatgrösse"] 
            styleName [#type "opsz" #subtype "144" ! "Ferngrösse"]
        ]
    ]

