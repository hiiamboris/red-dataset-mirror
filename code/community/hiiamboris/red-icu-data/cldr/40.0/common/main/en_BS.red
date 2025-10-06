
    ldml [
        identity [
            version [#number "$Revision$"] 
            language [#type "en"] 
            territory [#type "BS"]
        ] 
        numbers [
            currencies [
                currency [
                    #type "BSD" 
                    symbol [! "$"]
                ]
            ]
        ] 
        units [
            unitLength [
                #type "narrow" 
                unit [
                    #type "temperature-celsius" 
                    unitPattern [#count "one" ! "{0}°C"] 
                    unitPattern [#count "other" ! "{0}°C"]
                ] 
                unit [
                    #type "temperature-fahrenheit" 
                    unitPattern [#count "one" ! "{0}°"] 
                    unitPattern [#count "other" ! "{0}°"]
                ]
            ]
        ]
    ]

