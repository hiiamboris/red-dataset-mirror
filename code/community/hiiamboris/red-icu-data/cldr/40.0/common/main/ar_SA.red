
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "ar"] 
            territory [#type "SA"]
        ] 
        localeDisplayNames [
            languages [
                language [#type "ar_001" ! "العربية الرسمية الحديثة"] 
                language [#type "arn" ! "المابودونجونية"] 
                language [#type "de_AT" ! "الألمانية النمساوية"] 
                language [#type "de_CH" ! "الألمانية العليا السويسرية"] 
                language [#type "en_AU" ! "الإنجليزية الأسترالية"] 
                language [#type "en_CA" ! "الإنجليزية الكندية"] 
                language [#type "en_GB" ! "الإنجليزية البريطانية"] 
                language [#type "en_GB" #alt "short" ! "الإنجليزية المملكة المتحدة"] 
                language [#type "en_US" ! "الإنجليزية الأمريكية"] 
                language [#type "en_US" #alt "short" ! "الإنجليزية الولايات المتحدة"] 
                language [#type "es_419" ! "الإسبانية أمريكا اللاتينية"] 
                language [#type "es_ES" ! "الإسبانية الأوروبية"] 
                language [#type "es_MX" ! "الإسبانية المكسيكية"] 
                language [#type "fr_CA" ! "الفرنسية الكندية"] 
                language [#type "fr_CH" ! "الفرنسية السويسرية"] 
                language [#type "gn" ! "الغورانية"] 
                language [#type "hsb" ! "صوربيا العليا"] 
                language [#type "lo" ! "اللاوو"] 
                language [#type "nds_NL" ! "السكسونية السفلى"] 
                language [#type "nl_BE" ! "الفلمنكية"] 
                language [#type "pt_BR" ! "البرتغالية البرازيلية"] 
                language [#type "pt_PT" ! "البرتغالية الأوروبية"] 
                language [#type "sh" ! "الكرواتية الصربية"] 
                language [#type "sma" ! "سامي الجنوبية"] 
                language [#type "sw" ! "السواحيلية"] 
                language [#type "sw_CD" ! "السواحيلية الكونغولية"] 
                language [#type "te" ! "التيلوجو"] 
                language [#type "ti" ! "التيغرينية"] 
                language [#type "zh_Hans" ! "الصينية المبسطة"] 
                language [#type "zh_Hant" ! "الصينية التقليدية"]
            ] 
            territories [
                territory [#type "AC" ! "جزيرة أسينشين"] 
                territory [#type "CZ" #alt "variant" ! "التشيك"] 
                territory [#type "EA" ! "سبتة ومليلية"] 
                territory [#type "MO" ! "ماكاو الصينية (منطقة إدارية خاصة)"] 
                territory [#type "MO" #alt "short" ! "ماكاو"] 
                territory [#type "MS" ! "مونتيسيرات"] 
                territory [#type "UY" ! "أوروغواي"]
            ] 
            measurementSystemNames [
                measurementSystemName [#type "US" ! "الولايت المتحدة"]
            ]
        ] 
        characters [
            exemplarCharacters [#type "numbers" ! "[\u200E \- ‑ , . ٪ ‰ + 0 1 2 3 4 5 6 7 8 9]"]
        ] 
        dates [
            calendars [
                calendar [
                    #type "gregorian" 
                    dayPeriods [
                        dayPeriodContext [
                            #type "format" 
                            dayPeriodWidth [
                                #type "abbreviated" 
                                dayPeriod [#type "morning1" ! "فجرًا"] 
                                dayPeriod [#type "morning2" ! "ص"] 
                                dayPeriod [#type "afternoon1" ! "ظهرًا"] 
                                dayPeriod [#type "afternoon2" ! "بعد الظهر"] 
                                dayPeriod [#type "evening1" ! "مساءً"] 
                                dayPeriod [#type "night1" ! "في المساء"] 
                                dayPeriod [#type "night2" ! "ل"]
                            ]
                        ]
                    ]
                ]
            ]
        ] 
        numbers [
            defaultNumberingSystem [! "arab"] 
            symbols [
                #numberSystem "latn" 
                percentSign [! "٪"]
            ]
        ] 
        units [
            unitLength [
                #type "long" 
                unit [
                    #type "acceleration-meter-per-square-second" 
                    unitPattern [#count "zero" #draft "contributed" ! "{0} متر في الثانية المربعة"] 
                    unitPattern [#count "one" #draft "contributed" ! "{0} متر في الثانية المربعة"] 
                    unitPattern [#count "two" #draft "contributed" ! "متران في الثانية المربعة"] 
                    unitPattern [#count "few" #draft "contributed" ! "{0} أمتار في الثانية المربعة"] 
                    unitPattern [#count "many" #draft "contributed" ! "{0} مترًا في الثانية المربعة"] 
                    unitPattern [#count "other" #draft "contributed" ! "{0} متر في الثانية المربعة"]
                ] 
                unit [
                    #type "angle-arc-minute" 
                    unitPattern [#count "zero" ! "{0} دقيقة قوسية"] 
                    unitPattern [#count "one" ! "دقيقة قوسية"] 
                    unitPattern [#count "two" ! "دقيقتان قوسيتان"] 
                    unitPattern [#count "few" ! "{0} دقائق قوسية"] 
                    unitPattern [#count "many" ! "{0} دقيقة قوسية"] 
                    unitPattern [#count "other" ! "{0} دقيقة قوسية"]
                ] 
                unit [
                    #type "area-square-kilometer" 
                    unitPattern [#count "zero" ! "{0} كيلومتر مربع"] 
                    unitPattern [#count "one" ! "{0} كيلومتر مربع"] 
                    unitPattern [#count "two" ! "كيلومتران مربعان"] 
                    unitPattern [#count "few" ! "{0} كيلومترات مربعة"] 
                    unitPattern [#count "many" ! "{0} كيلومترًا مربعًا"] 
                    unitPattern [#count "other" ! "{0} كيلومتر مربع"]
                ] 
                unit [
                    #type "area-hectare" 
                    unitPattern [#count "zero" ! "{0} هكتار"] 
                    unitPattern [#count "one" ! "{0} هكتار"] 
                    unitPattern [#count "two" ! "هكتاران"] 
                    unitPattern [#count "few" ! "{0} هكتارات"] 
                    unitPattern [#count "many" ! "{0} هكتارًا"] 
                    unitPattern [#count "other" ! "{0} هكتار"]
                ] 
                unit [
                    #type "area-square-meter" 
                    unitPattern [#count "zero" ! "{0} متر مربع"] 
                    unitPattern [#count "one" ! "{0} متر مربع"] 
                    unitPattern [#count "two" ! "متران مربعان"] 
                    unitPattern [#count "few" ! "{0} أمتار مربعة"] 
                    unitPattern [#count "many" ! "{0} مترًا مربعًا"] 
                    unitPattern [#count "other" ! "{0} متر مربع"]
                ] 
                unit [
                    #type "area-square-centimeter" 
                    unitPattern [#count "zero" ! "{0} سنتيمتر مربع"] 
                    unitPattern [#count "one" ! "{0} سنتيمتر مربع"] 
                    unitPattern [#count "two" ! "سنتيمتران مربعان"] 
                    unitPattern [#count "few" ! "{0} سنتيمترات مربعة"] 
                    unitPattern [#count "many" ! "{0} سنتيمترًا مربعًا"] 
                    unitPattern [#count "other" ! "{0} سنتيمتر مربع"]
                ] 
                unit [
                    #type "area-square-mile" 
                    unitPattern [#count "zero" ! "{0} ميل مربع"] 
                    unitPattern [#count "one" ! "{0} ميل مربع"] 
                    unitPattern [#count "two" ! "ميلان مربعان"] 
                    unitPattern [#count "few" ! "{0} أميال مربعة"] 
                    unitPattern [#count "many" ! "{0} ميلًا مربعًا"] 
                    unitPattern [#count "other" ! "{0} ميل مربع"]
                ] 
                unit [
                    #type "area-acre" 
                    unitPattern [#count "zero" ! "{0} فدان"] 
                    unitPattern [#count "one" ! "فدان"] 
                    unitPattern [#count "two" ! "{0} فدان"] 
                    unitPattern [#count "few" ! "{0} أفدنة"] 
                    unitPattern [#count "many" ! "{0} فدانًا"] 
                    unitPattern [#count "other" ! "{0} فدان"]
                ] 
                unit [
                    #type "area-square-yard" 
                    unitPattern [#count "zero" ! "{0} ياردة مربعة"] 
                    unitPattern [#count "one" ! "{0} ياردة مربعة"] 
                    unitPattern [#count "two" ! "ياردتان مربعتان"] 
                    unitPattern [#count "few" ! "{0} ياردات مربعة"] 
                    unitPattern [#count "many" ! "{0} ياردة مربعة"] 
                    unitPattern [#count "other" ! "{0} ياردة مربعة"]
                ] 
                unit [
                    #type "area-square-foot" 
                    unitPattern [#count "zero" ! "{0} قدم مربعة"] 
                    unitPattern [#count "one" ! "قدم مربعة"] 
                    unitPattern [#count "two" ! "قدمان مربعتان"] 
                    unitPattern [#count "few" ! "{0} أقدام مربعة"] 
                    unitPattern [#count "many" ! "{0} قدمًا مربعة"] 
                    unitPattern [#count "other" ! "{0} قدم مربعة"]
                ] 
                unit [
                    #type "area-square-inch" 
                    unitPattern [#count "zero" ! "{0} بوصة مربعة"] 
                    unitPattern [#count "one" ! "{0} بوصة مربعة"] 
                    unitPattern [#count "two" ! "بوصتان مربعتان"] 
                    unitPattern [#count "few" ! "{0} بوصات مربعة"] 
                    unitPattern [#count "many" ! "{0} بوصة مربعة"] 
                    unitPattern [#count "other" ! "{0} بوصة مربعة"]
                ] 
                unit [
                    #type "concentr-permillion" 
                    unitPattern [#count "zero" #draft "contributed" ! "{0} جزء في المليون"] 
                    unitPattern [#count "one" #draft "contributed" ! "{0} جزء في المليون"] 
                    unitPattern [#count "two" #draft "contributed" ! "جزءان في المليون"] 
                    unitPattern [#count "few" #draft "contributed" ! "{0} أجزاء في المليون"] 
                    unitPattern [#count "many" #draft "contributed" ! "{0} جزءًا في المليون"] 
                    unitPattern [#count "other" #draft "contributed" ! "{0} جزء في المليون"]
                ] 
                unit [
                    #type "consumption-mile-per-gallon" 
                    unitPattern [#count "zero" ! "{0} ميل لكل غالون"] 
                    unitPattern [#count "one" ! "{0} ميل لكل غالون"] 
                    unitPattern [#count "two" ! "{0} ميلان لكل غالون"] 
                    unitPattern [#count "few" ! "{0} أميال لكل غالون"] 
                    unitPattern [#count "many" ! "{0} ميلًا لكل غالون"] 
                    unitPattern [#count "other" ! "{0} ميل لكل غالون"]
                ] 
                unit [
                    #type "duration-second" 
                    unitPattern [#count "zero" ! "{0} ثانية"] 
                    unitPattern [#count "one" ! "ثانية"] 
                    unitPattern [#count "two" ! "ثانيتان"] 
                    unitPattern [#count "few" ! "{0} ثوانٍ"] 
                    unitPattern [#count "many" ! "{0} ثانية"] 
                    unitPattern [#count "other" ! "{0} ثانية"]
                ] 
                unit [
                    #type "length-kilometer" 
                    unitPattern [#count "zero" ! "{0} كيلومتر"] 
                    unitPattern [#count "one" ! "{0} كيلومتر"] 
                    unitPattern [#count "two" ! "كيلومتران"] 
                    unitPattern [#count "few" ! "{0} كيلومترات"] 
                    unitPattern [#count "many" ! "{0} كيلومترًا"] 
                    unitPattern [#count "other" ! "{0} كيلومتر"]
                ] 
                unit [
                    #type "length-centimeter" 
                    unitPattern [#count "zero" ! "{0} سنتيمتر"] 
                    unitPattern [#count "one" ! "{0} سنتيمتر"] 
                    unitPattern [#count "two" ! "سنتيمتران"] 
                    unitPattern [#count "few" ! "{0} سنتيمترات"] 
                    unitPattern [#count "many" ! "{0} سنتيمترًا"] 
                    unitPattern [#count "other" ! "{0} سنتيمتر"]
                ] 
                unit [
                    #type "length-millimeter" 
                    unitPattern [#count "zero" ! "{0} مليمتر"] 
                    unitPattern [#count "one" ! "{0} مليمتر"] 
                    unitPattern [#count "two" ! "مليمتران"] 
                    unitPattern [#count "few" ! "{0} مليمتر"] 
                    unitPattern [#count "many" ! "{0} مليمترًا"] 
                    unitPattern [#count "other" ! "{0} مليمتر"]
                ] 
                unit [
                    #type "length-yard" 
                    unitPattern [#count "zero" ! "{0} ياردة"] 
                    unitPattern [#count "one" ! "ياردة"] 
                    unitPattern [#count "two" ! "ياردتان"] 
                    unitPattern [#count "few" ! "{0} ياردات"] 
                    unitPattern [#count "many" ! "{0} ياردة"] 
                    unitPattern [#count "other" ! "{0} ياردة"]
                ] 
                unit [
                    #type "length-foot" 
                    unitPattern [#count "zero" ! "{0} قدم"] 
                    unitPattern [#count "one" ! "قدم"] 
                    unitPattern [#count "two" ! "قدمان"] 
                    unitPattern [#count "few" ! "{0} أقدام"] 
                    unitPattern [#count "many" ! "{0} قدمًا"] 
                    unitPattern [#count "other" ! "{0} قدم"]
                ] 
                unit [
                    #type "length-inch" 
                    unitPattern [#count "zero" ! "{0} بوصة"] 
                    unitPattern [#count "one" ! "{0} بوصة"] 
                    unitPattern [#count "two" ! "بوصتان"] 
                    unitPattern [#count "few" ! "{0} بوصات"] 
                    unitPattern [#count "many" ! "{0} بوصة"] 
                    unitPattern [#count "other" ! "{0} بوصة"]
                ] 
                unit [
                    #type "length-parsec" 
                    unitPattern [#count "zero" ! "{0} فرسخ فلكي"] 
                    unitPattern [#count "one" ! "فرسخ فلكي"] 
                    unitPattern [#count "two" ! "فرسخان فلكيان"] 
                    unitPattern [#count "few" ! "{0} فراسخ فلكية"] 
                    unitPattern [#count "many" ! "{0} فرسخًا فلكيًا"] 
                    unitPattern [#count "other" ! "{0} فرسخ فلكي"]
                ] 
                unit [
                    #type "length-astronomical-unit" 
                    unitPattern [#count "zero" ! "{0} وحدة فلكية"] 
                    unitPattern [#count "one" ! "وحدة فلكية"] 
                    unitPattern [#count "two" ! "وحدتان فلكيتان"] 
                    unitPattern [#count "few" ! "{0} وحدات فلكية"] 
                    unitPattern [#count "many" ! "{0} وحدة فلكية"] 
                    unitPattern [#count "other" ! "{0} وحدة فلكية"]
                ] 
                unit [
                    #type "length-nautical-mile" 
                    unitPattern [#count "zero" ! "{0} ميل بحري"] 
                    unitPattern [#count "one" ! "ميل بحري"] 
                    unitPattern [#count "two" ! "ميلان بحريان"] 
                    unitPattern [#count "few" ! "{0} أميال بحرية"] 
                    unitPattern [#count "many" ! "{0} ميلًا بحريًا"] 
                    unitPattern [#count "other" ! "{0} ميل بحري"]
                ] 
                unit [
                    #type "length-mile-scandinavian" 
                    unitPattern [#count "zero" ! "{0} ميل اسكندنافي"] 
                    unitPattern [#count "one" ! "{0} ميل اسكندنافي"] 
                    unitPattern [#count "two" ! "ميلان اسكندنافيان"] 
                    unitPattern [#count "few" ! "{0} أميال اسكندنافية"] 
                    unitPattern [#count "many" ! "{0} ميلًا اسكندنافيًا"] 
                    unitPattern [#count "other" ! "{0} ميل اسكندنافي"]
                ] 
                unit [
                    #type "light-solar-luminosity" 
                    unitPattern [#count "zero" ! "{0} ضياء شمسي"] 
                    unitPattern [#count "one" ! "{0} ضياء شمسي"] 
                    unitPattern [#count "two" ! "ضياءان شمسيان"] 
                    unitPattern [#count "few" ! "{0} ضياءات شمسية"] 
                    unitPattern [#count "many" ! "{0} ضياءً شمسيًا"] 
                    unitPattern [#count "other" ! "{0} ضياء شمسي"]
                ] 
                unit [
                    #type "mass-metric-ton" 
                    unitPattern [#count "zero" ! "{0} طن متري"] 
                    unitPattern [#count "one" ! "{0} طن متري"] 
                    unitPattern [#count "two" ! "طنان متريان"] 
                    unitPattern [#count "few" ! "{0} أطنان مترية"] 
                    unitPattern [#count "many" ! "{0} طنًا متريًا"] 
                    unitPattern [#count "other" ! "{0} طن متري"]
                ] 
                unit [
                    #type "mass-kilogram" 
                    unitPattern [#count "zero" ! "{0} كيلوغرام"] 
                    unitPattern [#count "one" ! "{0} كيلوغرام"] 
                    unitPattern [#count "two" ! "كيلوغرامان"] 
                    unitPattern [#count "few" ! "{0} كيلوغرامات"] 
                    unitPattern [#count "many" ! "{0} كيلوغرامًا"] 
                    unitPattern [#count "other" ! "{0} كيلوغرام"]
                ] 
                unit [
                    #type "mass-milligram" 
                    unitPattern [#count "zero" ! "{0} مليغرام"] 
                    unitPattern [#count "one" ! "{0} مليغرام"] 
                    unitPattern [#count "two" ! "مليغرامان"] 
                    unitPattern [#count "few" ! "{0} مليغرامات"] 
                    unitPattern [#count "many" ! "{0} مليغرامًا"] 
                    unitPattern [#count "other" ! "{0} مليغرام"]
                ] 
                unit [
                    #type "mass-microgram" 
                    unitPattern [#count "zero" ! "{0} ميكروغرام"] 
                    unitPattern [#count "one" ! "{0} ميكروغرام"] 
                    unitPattern [#count "two" ! "ميكروغرامان"] 
                    unitPattern [#count "few" ! "{0} ميكروغرامات"] 
                    unitPattern [#count "many" ! "{0} ميكروغرامًا"] 
                    unitPattern [#count "other" ! "{0} ميكروغرام"]
                ] 
                unit [
                    #type "mass-pound" 
                    unitPattern [#count "zero" ! "{0} رطل"] 
                    unitPattern [#count "one" ! "{0} رطل"] 
                    unitPattern [#count "two" ! "رطلان"] 
                    unitPattern [#count "few" ! "{0} أرطال"] 
                    unitPattern [#count "many" ! "{0} رطلًا"] 
                    unitPattern [#count "other" ! "{0} رطل"]
                ] 
                unit [
                    #type "mass-earth-mass" 
                    unitPattern [#count "zero" ! "{0} كتلة أرضية"] 
                    unitPattern [#count "one" ! "{0} كتلة أرضية"] 
                    unitPattern [#count "two" ! "كتلتان أرضيتان"] 
                    unitPattern [#count "few" ! "{0} كتل أرضية"] 
                    unitPattern [#count "many" ! "{0} كتلة أرضية"] 
                    unitPattern [#count "other" ! "{0} كتلة أرضية"]
                ] 
                unit [
                    #type "mass-solar-mass" 
                    unitPattern [#count "zero" ! "{0} كتلة شمسية"] 
                    unitPattern [#count "one" ! "{0} كتلة شمسية"] 
                    unitPattern [#count "two" ! "كتلتان شمسيتان"] 
                    unitPattern [#count "few" ! "{0} كتل شمسية"] 
                    unitPattern [#count "many" ! "{0} كتلة شمسية"] 
                    unitPattern [#count "other" ! "{0} كتلة شمسية"]
                ] 
                unit [
                    #type "pressure-pound-force-per-square-inch" 
                    unitPattern [#count "zero" #draft "contributed" ! "{0} رطل لكل بوصة مربعة"] 
                    unitPattern [#count "one" #draft "contributed" ! "{0} رطل لكل بوصة مربعة"] 
                    unitPattern [#count "two" #draft "contributed" ! "رطلان لكل بوصة مربعة"] 
                    unitPattern [#count "few" #draft "contributed" ! "{0} أرطال لكل بوصة مربعة"] 
                    unitPattern [#count "many" #draft "contributed" ! "{0} رطلًا لكل بوصة مربعة"] 
                    unitPattern [#count "other" #draft "contributed" ! "{0} رطل لكل بوصة مربعة"]
                ] 
                unit [
                    #type "speed-kilometer-per-hour" 
                    unitPattern [#count "zero" ! "{0} كيلومتر في الساعة"] 
                    unitPattern [#count "one" ! "{0} كيلومتر في الساعة"] 
                    unitPattern [#count "two" ! "كيلومتران في الساعة"] 
                    unitPattern [#count "few" ! "{0} كيلومترات في الساعة"] 
                    unitPattern [#count "many" ! "{0} كيلومترًا في الساعة"] 
                    unitPattern [#count "other" ! "{0} كيلومتر في الساعة"]
                ] 
                unit [
                    #type "speed-meter-per-second" 
                    unitPattern [#count "zero" ! "{0} متر في الثانية"] 
                    unitPattern [#count "one" ! "{0} متر في الثانية"] 
                    unitPattern [#count "two" ! "متران في الثانية"] 
                    unitPattern [#count "few" ! "{0} أمتار في الثانية"] 
                    unitPattern [#count "many" ! "{0} مترًا في الثانية"] 
                    unitPattern [#count "other" ! "{0} متر في الثانية"]
                ] 
                unit [
                    #type "speed-mile-per-hour" 
                    unitPattern [#count "zero" ! "{0} ميل في الساعة"] 
                    unitPattern [#count "one" ! "{0} ميل في الساعة"] 
                    unitPattern [#count "two" ! "ميلان في الساعة"] 
                    unitPattern [#count "few" ! "{0} أميال في الساعة"] 
                    unitPattern [#count "many" ! "{0} ميلًا في الساعة"] 
                    unitPattern [#count "other" ! "{0} ميل في الساعة"]
                ] 
                unit [
                    #type "speed-knot" 
                    unitPattern [#count "zero" ! "{0} عقدة"] 
                    unitPattern [#count "one" ! "{0} عقدة"] 
                    unitPattern [#count "two" ! "عقدتان"] 
                    unitPattern [#count "few" ! "{0} عقد"] 
                    unitPattern [#count "many" ! "{0} عقدة"] 
                    unitPattern [#count "other" ! "{0} عقدة"]
                ] 
                unit [
                    #type "volume-cubic-kilometer" 
                    unitPattern [#count "zero" ! "{0} كيلومتر مكعب"] 
                    unitPattern [#count "one" ! "{0} كيلومتر مكعب"] 
                    unitPattern [#count "two" ! "كيلومتران مكعبان"] 
                    unitPattern [#count "few" ! "{0} كيلومترات مكعبة"] 
                    unitPattern [#count "many" ! "{0} كيلومترًا مكعبًا"] 
                    unitPattern [#count "other" ! "{0} كيلومتر مكعب"]
                ] 
                unit [
                    #type "volume-cubic-meter" 
                    unitPattern [#count "zero" ! "{0} متر مكعب"] 
                    unitPattern [#count "one" ! "{0} متر مكعب"] 
                    unitPattern [#count "two" ! "متران مكعبان"] 
                    unitPattern [#count "few" ! "{0} مترات مكعبة"] 
                    unitPattern [#count "many" ! "{0} مترًا مكعبًا"] 
                    unitPattern [#count "other" ! "{0} متر مكعب"]
                ] 
                unit [
                    #type "volume-cubic-centimeter" 
                    unitPattern [#count "zero" ! "{0} سنتيمتر مكعب"] 
                    unitPattern [#count "one" ! "{0} سنتيمتر مكعب"] 
                    unitPattern [#count "two" ! "سنتيمتران مكعبان"] 
                    unitPattern [#count "few" ! "{0} سنتيمترات مكعبة"] 
                    unitPattern [#count "many" ! "{0} سنتيمترًا مكعبًا"] 
                    unitPattern [#count "other" ! "{0} سنتيمتر مكعب"]
                ] 
                unit [
                    #type "volume-cubic-mile" 
                    unitPattern [#count "zero" ! "{0} ميل مكعب"] 
                    unitPattern [#count "one" ! "{0} ميل مكعب"] 
                    unitPattern [#count "two" ! "ميلان مكعبان"] 
                    unitPattern [#count "few" ! "{0} أميال مكعبة"] 
                    unitPattern [#count "many" ! "{0} ميلًا مكعبًا"] 
                    unitPattern [#count "other" ! "{0} ميل مكعب"]
                ] 
                unit [
                    #type "volume-cubic-yard" 
                    unitPattern [#count "zero" ! "{0} ياردة مكعبة"] 
                    unitPattern [#count "one" ! "{0} ياردة مكعبة"] 
                    unitPattern [#count "two" ! "ياردتان مكعبتان"] 
                    unitPattern [#count "few" ! "{0} ياردات مكعبة"] 
                    unitPattern [#count "many" ! "{0} ياردة مكعبة"] 
                    unitPattern [#count "other" ! "{0} ياردة مكعبة"]
                ] 
                unit [
                    #type "volume-cubic-foot" 
                    unitPattern [#count "zero" ! "{0} قدم مكعبة"] 
                    unitPattern [#count "one" ! "قدم مكعبة"] 
                    unitPattern [#count "two" ! "قدمان مكعبتان"] 
                    unitPattern [#count "few" ! "{0} أقدام مكعبة"] 
                    unitPattern [#count "many" ! "{0} أقدام مكعبة"] 
                    unitPattern [#count "other" ! "{0} قدم مكعبة"]
                ] 
                unit [
                    #type "volume-cubic-inch" 
                    unitPattern [#count "zero" ! "{0} بوصة مكعبة"] 
                    unitPattern [#count "one" ! "{0} بوصة مكعبة"] 
                    unitPattern [#count "two" ! "بوصتان مكعبات"] 
                    unitPattern [#count "few" ! "{0} بوصات مكعبة"] 
                    unitPattern [#count "many" ! "{0} بوصة مكعبة"] 
                    unitPattern [#count "other" ! "{0} بوصة مكعبة"]
                ] 
                unit [
                    #type "volume-liter" 
                    unitPattern [#count "zero" ! "{0} لتر"] 
                    unitPattern [#count "one" ! "لتر"] 
                    unitPattern [#count "two" ! "لتران"] 
                    unitPattern [#count "few" ! "{0} لترات"] 
                    unitPattern [#count "many" ! "{0} لترًا"] 
                    unitPattern [#count "other" ! "{0} لتر"]
                ] 
                unit [
                    #type "volume-pint-metric" 
                    unitPattern [#count "zero" ! "{0} مكيال متري"] 
                    unitPattern [#count "one" ! "{0} مكيال متري"] 
                    unitPattern [#count "two" ! "مكيالان متريان"] 
                    unitPattern [#count "few" ! "{0} مكاييل مترية"] 
                    unitPattern [#count "many" ! "{0} مكيالًا متريًا"] 
                    unitPattern [#count "other" ! "{0} مكيال متري"]
                ] 
                unit [
                    #type "volume-cup-metric" 
                    unitPattern [#count "zero" ! "{0} كوب متري"] 
                    unitPattern [#count "one" ! "{0} كوب متري"] 
                    unitPattern [#count "two" ! "كوبان متريان"] 
                    unitPattern [#count "few" ! "{0} أكواب مترية"] 
                    unitPattern [#count "many" ! "{0} كوبًا متريًا"] 
                    unitPattern [#count "other" ! "{0} كوب متري"]
                ] 
                unit [
                    #type "volume-tablespoon" 
                    unitPattern [#count "zero" ! "{0} ملعقة كبيرة"] 
                    unitPattern [#count "one" ! "ملعقة كبيرة"] 
                    unitPattern [#count "two" ! "ملعقتان كبيرتان"] 
                    unitPattern [#count "few" ! "{0} ملاعق كبيرة"] 
                    unitPattern [#count "many" ! "{0} ملعقة كبيرة"] 
                    unitPattern [#count "other" ! "{0} ملعقة كبيرة"]
                ] 
                unit [
                    #type "volume-teaspoon" 
                    unitPattern [#count "zero" ! "{0} ملعقة صغيرة"] 
                    unitPattern [#count "one" ! "ملعقة صغيرة"] 
                    unitPattern [#count "two" ! "ملعقتان صغيرتان"] 
                    unitPattern [#count "few" ! "{0} ملاعق صغيرة"] 
                    unitPattern [#count "many" ! "{0} ملعقة صغيرة"] 
                    unitPattern [#count "other" ! "{0} ملعقة صغيرة"]
                ]
            ] 
            unitLength [
                #type "short" 
                unit [
                    #type "angle-revolution" 
                    unitPattern [#count "zero" ! "{0} دورة"] 
                    unitPattern [#count "one" ! "دورة"] 
                    unitPattern [#count "two" ! "دورتان"] 
                    unitPattern [#count "few" ! "{0} دورات"] 
                    unitPattern [#count "many" ! "{0} دورة"] 
                    unitPattern [#count "other" ! "{0} دورة"]
                ] 
                unit [
                    #type "area-hectare" 
                    unitPattern [#count "zero" ! "{0} هكتار"] 
                    unitPattern [#count "one" ! "{0} هكتار"] 
                    unitPattern [#count "two" ! "هكتاران"] 
                    unitPattern [#count "few" ! "{0} هكتارات"] 
                    unitPattern [#count "many" ! "{0} هكتارًا"] 
                    unitPattern [#count "other" ! "{0} هكتار"]
                ] 
                unit [
                    #type "area-acre" 
                    unitPattern [#count "zero" ! "{0} فدان"] 
                    unitPattern [#count "one" ! "فدان"] 
                    unitPattern [#count "two" ! "فدانان"] 
                    unitPattern [#count "few" ! "{0} أفدنة"] 
                    unitPattern [#count "many" ! "{0} فدانًا"] 
                    unitPattern [#count "other" ! "{0} فدان"]
                ] 
                unit [
                    #type "concentr-karat" 
                    unitPattern [#count "zero" ! "{0} قيراط"] 
                    unitPattern [#count "one" ! "قيراط"] 
                    unitPattern [#count "two" ! "قيراطان"] 
                    unitPattern [#count "few" ! "{0} قراريط"] 
                    unitPattern [#count "many" ! "{0} قيراطًا"] 
                    unitPattern [#count "other" ! "{0} قيراط"]
                ] 
                unit [
                    #type "concentr-permillion" 
                    unitPattern [#count "zero" #draft "contributed" ! "{0} جزء/مليون"] 
                    unitPattern [#count "one" #draft "contributed" ! "{0} جزء/مليون"] 
                    unitPattern [#count "two" #draft "contributed" ! "جزءان/مليون"] 
                    unitPattern [#count "few" #draft "contributed" ! "{0} أجزاء/مليون"] 
                    unitPattern [#count "many" #draft "contributed" ! "{0} جزءًا/مليون"] 
                    unitPattern [#count "other" #draft "contributed" ! "{0} جزء/مليون"]
                ] 
                unit [
                    #type "consumption-liter-per-kilometer" 
                    unitPattern [#count "zero" ! "{0} لتر/كم"] 
                    unitPattern [#count "one" ! "{0} لتر/كم"] 
                    unitPattern [#count "two" ! "لتران/كم"] 
                    unitPattern [#count "few" ! "{0} لترات/كم"] 
                    unitPattern [#count "many" ! "{0} لترًا/كم"] 
                    unitPattern [#count "other" ! "{0} لتر/كم"]
                ] 
                unit [
                    #type "consumption-liter-per-100-kilometer" 
                    unitPattern [#count "zero" #draft "contributed" ! "{0} لتر/١٠٠ كم"] 
                    unitPattern [#count "one" #draft "contributed" ! "{0} لتر/١٠٠ كم"] 
                    unitPattern [#count "two" #draft "contributed" ! "لتران/١٠٠ كم"] 
                    unitPattern [#count "few" #draft "contributed" ! "{0} لترات/١٠٠ كم"] 
                    unitPattern [#count "many" #draft "contributed" ! "{0} لترًا/١٠٠ كم"] 
                    unitPattern [#count "other" #draft "contributed" ! "{0} لتر/١٠٠ كم"]
                ] 
                unit [
                    #type "consumption-mile-per-gallon" 
                    unitPattern [#count "zero" ! "{0} ميل/غالون"] 
                    unitPattern [#count "one" ! "{0} ميل/غالون"] 
                    unitPattern [#count "two" ! "ميلان/غالون"] 
                    unitPattern [#count "few" ! "{0} أميال/غالون"] 
                    unitPattern [#count "many" ! "{0} ميلًا/غالون"] 
                    unitPattern [#count "other" ! "{0} ميل/غالون"]
                ] 
                unit [
                    #type "consumption-mile-per-gallon-imperial" 
                    unitPattern [#count "zero" ! "{0} ميل/غ. إمبراطوري"] 
                    unitPattern [#count "one" ! "{0} ميل/غ. إمبراطوري"] 
                    unitPattern [#count "two" ! "ميلان/غ. إمبراطوري"] 
                    unitPattern [#count "few" ! "{0} أميال/غ. إمبراطوري"] 
                    unitPattern [#count "many" ! "{0} ميلًا/غ. إمبراطوري"] 
                    unitPattern [#count "other" ! "{0} ميل/غ. إمبراطوري"]
                ] 
                unit [
                    #type "duration-year" 
                    displayName [! "سنوات"] 
                    unitPattern [#count "zero" ! "{0} سنة"] 
                    unitPattern [#count "one" ! "سنة"] 
                    unitPattern [#count "two" ! "سنتان"] 
                    unitPattern [#count "few" ! "{0} سنوات"] 
                    unitPattern [#count "many" ! "{0} سنة"] 
                    unitPattern [#count "other" ! "{0} سنة"]
                ] 
                unit [
                    #type "energy-british-thermal-unit" 
                    unitPattern [#count "zero" ! "{0} وحدة حرارية بريطانية"] 
                    unitPattern [#count "one" ! "{0} وحدة حرارية بريطانية"] 
                    unitPattern [#count "two" ! "{0} وحدة حرارية بريطانية"] 
                    unitPattern [#count "few" ! "{0} وحدات حرارية بريطانية"] 
                    unitPattern [#count "many" ! "{0} وحدة حرارية بريطانية"] 
                    unitPattern [#count "other" ! "{0} وحدة حرارية بريطانية"]
                ] 
                unit [
                    #type "length-mile" 
                    unitPattern [#count "zero" ! "{0} ميل"] 
                    unitPattern [#count "one" ! "ميل"] 
                    unitPattern [#count "two" ! "ميلان"] 
                    unitPattern [#count "few" ! "{0} أميال"] 
                    unitPattern [#count "many" ! "{0} ميل"] 
                    unitPattern [#count "other" ! "{0} ميل"]
                ] 
                unit [
                    #type "length-yard" 
                    unitPattern [#count "zero" ! "{0} ياردة"] 
                    unitPattern [#count "one" ! "ياردة"] 
                    unitPattern [#count "two" ! "ياردتان"] 
                    unitPattern [#count "few" ! "{0} ياردات"] 
                    unitPattern [#count "many" ! "{0} ياردة"] 
                    unitPattern [#count "other" ! "{0} ياردة"]
                ] 
                unit [
                    #type "length-foot" 
                    unitPattern [#count "zero" ! "{0} قدم"] 
                    unitPattern [#count "one" ! "قدم"] 
                    unitPattern [#count "two" ! "قدمان"] 
                    unitPattern [#count "few" ! "{0} أقدام"] 
                    unitPattern [#count "many" ! "{0} قدمًا"] 
                    unitPattern [#count "other" ! "{0} قدم"]
                ] 
                unit [
                    #type "length-inch" 
                    unitPattern [#count "zero" ! "{0} بوصة"] 
                    unitPattern [#count "one" ! "{0} بوصة"] 
                    unitPattern [#count "two" ! "بوصتان"] 
                    unitPattern [#count "few" ! "{0} بوصات"] 
                    unitPattern [#count "many" ! "{0} بوصة"] 
                    unitPattern [#count "other" ! "{0} بوصة"]
                ] 
                unit [
                    #type "length-parsec" 
                    unitPattern [#count "zero" ! "{0} فرسخ فلكي"] 
                    unitPattern [#count "one" ! "فرسخ فلكي"] 
                    unitPattern [#count "two" ! "فرسخان فلكيان"] 
                    unitPattern [#count "few" ! "{0} فراسخ فلكية"] 
                    unitPattern [#count "many" ! "{0} فرسخًا فلكيًا"] 
                    unitPattern [#count "other" ! "{0} فرسخ فلكي"]
                ] 
                unit [
                    #type "length-nautical-mile" 
                    unitPattern [#count "zero" ! "{0} ميل بحري"] 
                    unitPattern [#count "one" ! "ميل بحري"] 
                    unitPattern [#count "two" ! "ميلان بحريان"] 
                    unitPattern [#count "few" ! "{0} أميال بحرية"] 
                    unitPattern [#count "many" ! "{0} ميلًا بحريًا"] 
                    unitPattern [#count "other" ! "{0} ميل بحري"]
                ] 
                unit [
                    #type "length-mile-scandinavian" 
                    unitPattern [#count "zero" ! "{0} ميل اسكندنافي"] 
                    unitPattern [#count "one" ! "{0} ميل اسكندنافي"] 
                    unitPattern [#count "two" ! "ميلان اسكندنافيان"] 
                    unitPattern [#count "few" ! "{0} أميال اسكندنافية"] 
                    unitPattern [#count "many" ! "{0} ميلًا اسكندنافيًا"] 
                    unitPattern [#count "other" ! "{0} ميل اسكندنافي"]
                ] 
                unit [
                    #type "light-solar-luminosity" 
                    unitPattern [#count "zero" ! "{0} ضياء شمسي"] 
                    unitPattern [#count "one" ! "{0} ضياء شمسي"] 
                    unitPattern [#count "two" ! "ضياءان شمسيان"] 
                    unitPattern [#count "few" ! "{0} ضياءات شمسية"] 
                    unitPattern [#count "many" ! "{0} ضياءً شمسيًا"] 
                    unitPattern [#count "other" ! "{0} ضياء شمسي"]
                ] 
                unit [
                    #type "mass-gram" 
                    unitPattern [#count "zero" ! "{0} غرام"] 
                    unitPattern [#count "one" ! "غرام"] 
                    unitPattern [#count "two" ! "غرامان"] 
                    unitPattern [#count "few" ! "{0} غرامات"] 
                    unitPattern [#count "many" ! "{0} غرامًا"] 
                    unitPattern [#count "other" ! "{0} غرام"]
                ] 
                unit [
                    #type "mass-ton" 
                    unitPattern [#count "zero" ! "{0} طن"] 
                    unitPattern [#count "one" ! "{0} طن"] 
                    unitPattern [#count "two" ! "طنان"] 
                    unitPattern [#count "few" ! "{0} أطنان"] 
                    unitPattern [#count "many" ! "{0} طنًا"] 
                    unitPattern [#count "other" ! "{0} طن"]
                ] 
                unit [
                    #type "mass-pound" 
                    unitPattern [#count "zero" ! "{0} رطل"] 
                    unitPattern [#count "one" ! "{0} رطل"] 
                    unitPattern [#count "two" ! "رطلان"] 
                    unitPattern [#count "few" ! "{0} أرطال"] 
                    unitPattern [#count "many" ! "{0} رطلُا"] 
                    unitPattern [#count "other" ! "{0} رطل"]
                ] 
                unit [
                    #type "mass-carat" 
                    unitPattern [#count "zero" ! "{0} قيراط"] 
                    unitPattern [#count "one" ! "{0} قيراط"] 
                    unitPattern [#count "two" ! "قيراطان"] 
                    unitPattern [#count "few" ! "{0} قراريط"] 
                    unitPattern [#count "many" ! "{0} قيراطًا"] 
                    unitPattern [#count "other" ! "{0} قيراط"]
                ] 
                unit [
                    #type "mass-earth-mass" 
                    unitPattern [#count "zero" ! "{0} كتلة أرضية"] 
                    unitPattern [#count "one" ! "{0} كتلة أرضية"] 
                    unitPattern [#count "two" ! "كتلتان أرضيتان"] 
                    unitPattern [#count "few" ! "{0} كتل أرضية"] 
                    unitPattern [#count "many" ! "{0} كتلة أرضية"] 
                    unitPattern [#count "other" ! "{0} كتلة أرضية"]
                ] 
                unit [
                    #type "mass-solar-mass" 
                    unitPattern [#count "zero" ! "{0} كتلة شمسية"] 
                    unitPattern [#count "one" ! "{0} كتلة شمسية"] 
                    unitPattern [#count "two" ! "كتلتان شمسيتان"] 
                    unitPattern [#count "few" ! "{0} كتل شمسية"] 
                    unitPattern [#count "many" ! "{0} كتلة شمسية"] 
                    unitPattern [#count "other" ! "{0} كتلة شمسية"]
                ] 
                unit [
                    #type "pressure-pound-force-per-square-inch" 
                    unitPattern [#count "zero" #draft "contributed" ! "{0} رطل/بوصة²"] 
                    unitPattern [#count "one" #draft "contributed" ! "{0} رطل/بوصة²"] 
                    unitPattern [#count "two" #draft "contributed" ! "رطلان/بوصة²"] 
                    unitPattern [#count "few" #draft "contributed" ! "{0} أرطال/بوصة²"] 
                    unitPattern [#count "many" #draft "contributed" ! "{0} رطلًا/بوصة²"] 
                    unitPattern [#count "other" #draft "contributed" ! "{0} رطل/بوصة²"]
                ] 
                unit [
                    #type "pressure-kilopascal" 
                    displayName [! "كيلوباسكال"] 
                    unitPattern [#count "zero" ! "{0} كيلوباسكال"] 
                    unitPattern [#count "one" ! "{0} كيلوباسكال"] 
                    unitPattern [#count "two" ! "{0} كيلوباسكال"] 
                    unitPattern [#count "few" ! "{0} كيلوباسكال"] 
                    unitPattern [#count "many" ! "{0} كيلوباسكال"] 
                    unitPattern [#count "other" ! "{0} كيلوباسكال"]
                ] 
                unit [
                    #type "pressure-megapascal" 
                    displayName [! "ميغاباسكال"] 
                    unitPattern [#count "zero" ! "{0} ميغاباسكال"] 
                    unitPattern [#count "one" ! "{0} ميغاباسكال"] 
                    unitPattern [#count "two" ! "{0} ميغاباسكال"] 
                    unitPattern [#count "few" ! "{0} ميغاباسكال"] 
                    unitPattern [#count "many" ! "{0} ميغاباسكال"] 
                    unitPattern [#count "other" ! "{0} ميغاباسكال"]
                ] 
                unit [
                    #type "speed-mile-per-hour" 
                    unitPattern [#count "zero" ! "{0} ميل/س"] 
                    unitPattern [#count "one" ! "{0} ميل/س"] 
                    unitPattern [#count "two" ! "ميلان/س"] 
                    unitPattern [#count "few" ! "{0} أميال/س"] 
                    unitPattern [#count "many" ! "{0} ميلًا/س"] 
                    unitPattern [#count "other" ! "{0} ميل/س"]
                ] 
                unit [
                    #type "speed-knot" 
                    unitPattern [#count "zero" ! "{0} عقدة"] 
                    unitPattern [#count "one" ! "{0} عقدة"] 
                    unitPattern [#count "two" ! "عقدتان"] 
                    unitPattern [#count "few" ! "{0} عقد"] 
                    unitPattern [#count "many" ! "{0} عقدة"] 
                    unitPattern [#count "other" ! "{0} عقدة"]
                ] 
                unit [
                    #type "temperature-kelvin" 
                    displayName [! "درجة كلفن"] 
                    unitPattern [#count "zero" ! "{0} درجة كلفن"] 
                    unitPattern [#count "one" ! "{0} درجة كلفن"] 
                    unitPattern [#count "two" ! "{0} درجة كلفن"] 
                    unitPattern [#count "few" ! "{0} درجة كلفن"] 
                    unitPattern [#count "many" ! "{0} درجة كلفن"] 
                    unitPattern [#count "other" ! "{0} درجة كلفن"]
                ] 
                unit [
                    #type "volume-cubic-inch" 
                    unitPattern [#count "zero" ! "{0} بوصة³"] 
                    unitPattern [#count "one" ! "{0} بوصة مكعبة"] 
                    unitPattern [#count "two" ! "{0} بوصة³"] 
                    unitPattern [#count "few" ! "{0} بوصة³"] 
                    unitPattern [#count "many" ! "{0} بوصة³"] 
                    unitPattern [#count "other" ! "{0} بوصة³"]
                ] 
                unit [
                    #type "volume-liter" 
                    unitPattern [#count "zero" ! "{0} لتر"] 
                    unitPattern [#count "one" ! "لتر"] 
                    unitPattern [#count "two" ! "لتران"] 
                    unitPattern [#count "few" ! "{0} لترات"] 
                    unitPattern [#count "many" ! "{0} لترًا"] 
                    unitPattern [#count "other" ! "{0} لتر"]
                ] 
                unit [
                    #type "volume-pint-metric" 
                    unitPattern [#count "zero" ! "{0} مكيال متري"] 
                    unitPattern [#count "one" ! "{0} مكيال متري"] 
                    unitPattern [#count "two" ! "مكيالان متريان"] 
                    unitPattern [#count "few" ! "{0} مكاييل مترية"] 
                    unitPattern [#count "many" ! "{0} مكيالًا متريًا"] 
                    unitPattern [#count "other" ! "{0} مكيال متري"]
                ] 
                unit [
                    #type "volume-cup-metric" 
                    unitPattern [#count "zero" ! "{0} كوب متري"] 
                    unitPattern [#count "one" ! "{0} كوب متري"] 
                    unitPattern [#count "two" ! "كوبان متريان"] 
                    unitPattern [#count "few" ! "{0} أكواب مترية"] 
                    unitPattern [#count "many" ! "{0} كوبًا متريًا"] 
                    unitPattern [#count "other" ! "{0} كوب متري"]
                ] 
                unit [
                    #type "volume-cup" 
                    unitPattern [#count "zero" ! "{0} كوب"] 
                    unitPattern [#count "one" ! "كوب"] 
                    unitPattern [#count "two" ! "كوبان"] 
                    unitPattern [#count "few" ! "{0} أكواب"] 
                    unitPattern [#count "many" ! "{0} كوبًا"] 
                    unitPattern [#count "other" ! "{0} كوب"]
                ] 
                unit [
                    #type "volume-fluid-ounce" 
                    unitPattern [#count "zero" ! "{0} أونصة سائلة"] 
                    unitPattern [#count "one" ! "أونصة س"] 
                    unitPattern [#count "two" ! "أونصتان سائلتان"] 
                    unitPattern [#count "few" ! "{0} أونصات سائلة"] 
                    unitPattern [#count "many" ! "{0} أونصة س"] 
                    unitPattern [#count "other" ! "{0} أونصة سائلة"]
                ] 
                unit [
                    #type "volume-tablespoon" 
                    unitPattern [#count "zero" ! "{0} ملعقة ك."] 
                    unitPattern [#count "one" ! "ملعقة ك."] 
                    unitPattern [#count "two" ! "{0} ملعقتان ك."] 
                    unitPattern [#count "few" ! "{0} ملاعق ك."] 
                    unitPattern [#count "many" ! "{0} ملعقة ك."] 
                    unitPattern [#count "other" ! "{0} ملعقة ك."]
                ] 
                unit [
                    #type "volume-teaspoon" 
                    unitPattern [#count "zero" ! "{0} ملعقة ص"] 
                    unitPattern [#count "one" ! "ملعقة ص"] 
                    unitPattern [#count "two" ! "{0} ملعقتان ص"] 
                    unitPattern [#count "few" ! "{0} ملاعق ص"] 
                    unitPattern [#count "many" ! "{0} ملعقة ص"] 
                    unitPattern [#count "other" ! "{0} ملعقة ص"]
                ] 
                coordinateUnit [
                    coordinateUnitPattern [#type "south" ! "{0} جنوب"] 
                    coordinateUnitPattern [#type "west" ! "{0} غرب"]
                ]
            ] 
            unitLength [
                #type "narrow" 
                unit [
                    #type "duration-year" 
                    unitPattern [#count "zero" ! "{0} سنة"] 
                    unitPattern [#count "one" ! "سنة"] 
                    unitPattern [#count "two" ! "سنتان"] 
                    unitPattern [#count "few" ! "{0} سنوات"] 
                    unitPattern [#count "many" ! "{0} سنة"] 
                    unitPattern [#count "other" ! "{0} سنة"]
                ] 
                unit [
                    #type "duration-month" 
                    unitPattern [#count "zero" ! "{0} شهر"] 
                    unitPattern [#count "one" ! "شهر"] 
                    unitPattern [#count "two" ! "شهران"] 
                    unitPattern [#count "few" ! "{0} أشهر"] 
                    unitPattern [#count "many" ! "{0} شهرًا"] 
                    unitPattern [#count "other" ! "{0} شهر"]
                ] 
                unit [
                    #type "mass-kilogram" 
                    displayName [! "كغم"] 
                    unitPattern [#count "zero" ! "{0} كغم"] 
                    unitPattern [#count "one" ! "{0} كغم"] 
                    unitPattern [#count "two" ! "{0} كغم"] 
                    unitPattern [#count "few" ! "{0} كغم"] 
                    unitPattern [#count "many" ! "{0} كغم"] 
                    unitPattern [#count "other" ! "{0} كغم"]
                ] 
                unit [
                    #type "mass-gram" 
                    displayName [! "غم"] 
                    unitPattern [#count "zero" ! "{0} غم"] 
                    unitPattern [#count "one" ! "{0} غم"] 
                    unitPattern [#count "two" ! "{0} غم"] 
                    unitPattern [#count "few" ! "{0} غم"] 
                    unitPattern [#count "many" ! "{0} غم"] 
                    unitPattern [#count "other" ! "{0} غم"]
                ] 
                coordinateUnit [
                    coordinateUnitPattern [#type "south" ! "{0} جنوب"] 
                    coordinateUnitPattern [#type "west" ! "{0} غرب"]
                ]
            ]
        ]
    ]

