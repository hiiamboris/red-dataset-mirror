Red [] [
    en: #[
        NumberElements: #[
            latn: #[
                miscPatterns: #[
                    atLeast: "{0}+"
                ]
                patterns: #[
                    accountingFormat: "¤#,##0.00;(¤#,##0.00)"
                    currencyFormat: "¤#,##0.00"
                    decimalFormat: "#,##0.###"
                    percentFormat: "#,##0%"
                    scientificFormat: "#E0"
                ]
                patternsLong: #[
                    decimalFormat: #[
                        1000 #[
                            one: "0 thousand"
                            other: "0 thousand"
                        ]
                        10000 #[
                            one: "00 thousand"
                            other: "00 thousand"
                        ]
                        100000 #[
                            one: "000 thousand"
                            other: "000 thousand"
                        ]
                        1000000 #[
                            one: "0 million"
                            other: "0 million"
                        ]
                        10000000 #[
                            one: "00 million"
                            other: "00 million"
                        ]
                        100000000 #[
                            one: "000 million"
                            other: "000 million"
                        ]
                        1000000000 #[
                            one: "0 billion"
                            other: "0 billion"
                        ]
                    ]
                ]
                patternsShort: #[
                    currencyFormat: #[
                        1000 #[
                            one: "¤0K"
                            other: "¤0K"
                        ]
                        10000 #[
                            one: "¤00K"
                            other: "¤00K"
                        ]
                        100000 #[
                            one: "¤000K"
                            other: "¤000K"
                        ]
                        1000000 #[
                            one: "¤0M"
                            other: "¤0M"
                        ]
                        10000000 #[
                            one: "¤00M"
                            other: "¤00M"
                        ]
                        100000000 #[
                            one: "¤000M"
                            other: "¤000M"
                        ]
                        1000000000 #[
                            one: "¤0B"
                            other: "¤0B"
                        ]
                    ]
                    decimalFormat: #[
                        1000 #[
                            one: "0K"
                            other: "0K"
                        ]
                        10000 #[
                            one: "00K"
                            other: "00K"
                        ]
                        100000 #[
                            one: "000K"
                            other: "000K"
                        ]
                        1000000 #[
                            one: "0M"
                            other: "0M"
                        ]
                        10000000 #[
                            one: "00M"
                            other: "00M"
                        ]
                        100000000 #[
                            one: "000M"
                            other: "000M"
                        ]
                        1000000000 #[
                            one: "0B"
                            other: "0B"
                        ]
                    ]
                ]
                symbols: #[
                    decimal: "."
                    exponential: "E"
                    group: ","
                    infinity: "∞"
                    list: ";"
                    minusSign: "-"
                    nan: "NaN"
                    perMille: "‰"
                    percentSign: "%"
                    plusSign: "+"
                    superscriptingExponent: "×"
                ]
            ]
        ]
        calendar: #[
            generic: #[
                DateTimePatterns: ["h:mm:ss a zzzz" "h:mm:ss a z" "h:mm:ss a" "h:mm a" "EEEE, MMMM d, y G" "MMMM d, y G" "MMM d, y G" "M/d/y GGGGG" "{1}, {0}" "{1} 'at' {0}" "{1} 'at' {0}" "{1}, {0}" "{1}, {0}"]
                DateTimeSkeletons: ["ahmmsszzzz" "ahmmssz" "ahmmss" "ahmm" "GyMMMMEEEEd" "GyMMMMd" "GyMMMd" "GGGGGyMd"]
                appendItems: #[
                    Day: "{0} ({2}: {1})"
                    Day-Of-Week: "{0} {1}"
                    Era: "{0} {1}"
                    Hour: "{0} ({2}: {1})"
                    Minute: "{0} ({2}: {1})"
                    Month: "{0} ({2}: {1})"
                    Quarter: "{0} ({2}: {1})"
                    Second: "{0} ({2}: {1})"
                    Timezone: "{0} {1}"
                    Week: "{0} ({2}: {1})"
                    Year: "{0} {1}"
                ]
                availableFormats: #[
                    bh: "h B"
                    Bhm: "h:mm B"
                    Bhms: "h:mm:ss B"
                    E: "ccc"
                    EBhm: "E h:mm B"
                    EBhms: "E h:mm:ss B"
                    EHm: "E HH:mm"
                    EHms: "E HH:mm:ss"
                    Ed: "d E"
                    Ehm: "E h:mm a"
                    Ehms: "E h:mm:ss a"
                    Gy: "y G"
                    GyMMM: "MMM y G"
                    GyMMMEd: "E, MMM d, y G"
                    GyMMMd: "MMM d, y G"
                    GyMd: "M/d/y GGGGG"
                    H: "HH"
                    Hm: "HH:mm"
                    Hms: "HH:mm:ss"
                    M: "L"
                    MEd: "E, M/d"
                    MMM: "LLL"
                    MMMEd: "E, MMM d"
                    MMMMd: "MMMM d"
                    MMMd: "MMM d"
                    Md: "M/d"
                    d: "d"
                    h: "h a"
                    hm: "h:mm a"
                    hms: "h:mm:ss a"
                    ms: "mm:ss"
                    y: "y G"
                    yyyy: "y G"
                    yyyyM: "M/y GGGGG"
                    yyyyMEd: "E, M/d/y GGGGG"
                    yyyyMMM: "MMM y G"
                    yyyyMMMEd: "E, MMM d, y G"
                    yyyyMMMM: "MMMM y G"
                    yyyyMMMd: "MMM d, y G"
                    yyyyMd: "M/d/y GGGGG"
                    yyyyQQQ: "QQQ y G"
                    yyyyQQQQ: "QQQQ y G"
                ]
                intervalFormats: #[
                    bh: #[
                        B: "h B – h B"
                        h: "h – h B"
                    ]
                    Bhm: #[
                        B: "h:mm B – h:mm B"
                        h: "h:mm – h:mm B"
                        m: "h:mm – h:mm B"
                    ]
                    Gy: #[
                        G: "y G – y G"
                        y: "y – y G"
                    ]
                    GyM: #[
                        G: "M/y GGGGG – M/y GGGGG"
                        M: "M/y – M/y GGGGG"
                        y: "M/y – M/y GGGGG"
                    ]
                    GyMEd: #[
                        G: "E, M/d/y GGGGG – E, M/d/y GGGGG"
                        M: "E, M/d/y – E, M/d/y GGGGG"
                        d: "E, M/d/y – E, M/d/y GGGGG"
                        y: "E, M/d/y – E, M/d/y GGGGG"
                    ]
                    GyMMM: #[
                        G: "MMM y G – MMM y G"
                        M: "MMM – MMM y G"
                        y: "MMM y – MMM y G"
                    ]
                    GyMMMEd: #[
                        G: "E, MMM d, y G – E, MMM d, y G"
                        M: "E, MMM d – E, MMM d, y G"
                        d: "E, MMM d – E, MMM d, y G"
                        y: "E, MMM d, y – E, MMM d, y G"
                    ]
                    GyMMMd: #[
                        G: "MMM d, y G – MMM d, y G"
                        M: "MMM d – MMM d, y G"
                        d: "MMM d – d, y G"
                        y: "MMM d, y – MMM d, y G"
                    ]
                    GyMd: #[
                        G: "M/d/y GGGGG – M/d/y GGGGG"
                        M: "M/d/y – M/d/y GGGGG"
                        d: "M/d/y – M/d/y GGGGG"
                        y: "M/d/y – M/d/y GGGGG"
                    ]
                    H: #[
                        H: "HH – HH"
                    ]
                    Hm: #[
                        H: "HH:mm – HH:mm"
                        m: "HH:mm – HH:mm"
                    ]
                    Hmv: #[
                        H: "HH:mm – HH:mm v"
                        m: "HH:mm – HH:mm v"
                    ]
                    Hv: #[
                        H: "HH – HH v"
                    ]
                    M: #[
                        M: "M – M"
                    ]
                    MEd: #[
                        M: "E, M/d – E, M/d"
                        d: "E, M/d – E, M/d"
                    ]
                    MMM: #[
                        M: "MMM – MMM"
                    ]
                    MMMEd: #[
                        M: "E, MMM d – E, MMM d"
                        d: "E, MMM d – E, MMM d"
                    ]
                    MMMd: #[
                        M: "MMM d – MMM d"
                        d: "MMM d – d"
                    ]
                    Md: #[
                        M: "M/d – M/d"
                        d: "M/d – M/d"
                    ]
                    d: #[
                        d: "d – d"
                    ]
                    fallback: "{0} – {1}"
                    h: #[
                        a: "h a – h a"
                        h: "h – h a"
                    ]
                    hm: #[
                        a: "h:mm a – h:mm a"
                        h: "h:mm – h:mm a"
                        m: "h:mm – h:mm a"
                    ]
                    hmv: #[
                        a: "h:mm a – h:mm a v"
                        h: "h:mm – h:mm a v"
                        m: "h:mm – h:mm a v"
                    ]
                    hv: #[
                        a: "h a – h a v"
                        h: "h – h a v"
                    ]
                    y: #[
                        y: "y – y G"
                    ]
                    yM: #[
                        M: "M/y – M/y GGGGG"
                        y: "M/y – M/y GGGGG"
                    ]
                    yMEd: #[
                        M: "E, M/d/y – E, M/d/y GGGGG"
                        d: "E, M/d/y – E, M/d/y GGGGG"
                        y: "E, M/d/y – E, M/d/y GGGGG"
                    ]
                    yMMM: #[
                        M: "MMM – MMM y G"
                        y: "MMM y – MMM y G"
                    ]
                    yMMMEd: #[
                        M: "E, MMM d – E, MMM d, y G"
                        d: "E, MMM d – E, MMM d, y G"
                        y: "E, MMM d, y – E, MMM d, y G"
                    ]
                    yMMMM: #[
                        M: "MMMM – MMMM y G"
                        y: "MMMM y – MMMM y G"
                    ]
                    yMMMd: #[
                        M: "MMM d – MMM d, y G"
                        d: "MMM d – d, y G"
                        y: "MMM d, y – MMM d, y G"
                    ]
                    yMd: #[
                        M: "M/d/y – M/d/y GGGGG"
                        d: "M/d/y – M/d/y GGGGG"
                        y: "M/d/y – M/d/y GGGGG"
                    ]
                ]
            ]
            gregorian: #[
                AmPmMarkers: ["AM" "PM"]
                AmPmMarkers-variant: ["am" "pm"]
                AmPmMarkersAbbr: ["AM" "PM"]
                AmPmMarkersAbbr-variant: ["am" "pm"]
                AmPmMarkersNarrow: ["a" "p"]
                DateTimePatterns: ["h:mm:ss a zzzz" "h:mm:ss a z" "h:mm:ss a" "h:mm a" "EEEE, MMMM d, y" "MMMM d, y" "MMM d, y" "M/d/yy" "{1}, {0}" "{1} 'at' {0}" "{1} 'at' {0}" "{1}, {0}" "{1}, {0}"]
                DateTimeSkeletons: ["ahmmsszzzz" "ahmmssz" "ahmmss" "ahmm" "yMMMMEEEEd" "yMMMMd" "yMMMd" "yyMd"]
                appendItems: #[
                    Day: "{0} ({2}: {1})"
                    Day-Of-Week: "{0} {1}"
                    Era: "{0} {1}"
                    Hour: "{0} ({2}: {1})"
                    Minute: "{0} ({2}: {1})"
                    Month: "{0} ({2}: {1})"
                    Quarter: "{0} ({2}: {1})"
                    Second: "{0} ({2}: {1})"
                    Timezone: "{0} {1}"
                    Week: "{0} ({2}: {1})"
                    Year: "{0} {1}"
                ]
                availableFormats: #[
                    bh: "h B"
                    Bhm: "h:mm B"
                    Bhms: "h:mm:ss B"
                    E: "ccc"
                    EBhm: "E h:mm B"
                    EBhms: "E h:mm:ss B"
                    EHm: "E HH:mm"
                    EHms: "E HH:mm:ss"
                    Ed: "d E"
                    Ehm: "E h:mm a"
                    Ehms: "E h:mm:ss a"
                    Gy: "y G"
                    GyMMM: "MMM y G"
                    GyMMMEd: "E, MMM d, y G"
                    GyMMMd: "MMM d, y G"
                    GyMd: "M/d/y GGGGG"
                    H: "HH"
                    Hm: "HH:mm"
                    Hms: "HH:mm:ss"
                    Hmsv: "HH:mm:ss v"
                    Hmv: "HH:mm v"
                    M: "L"
                    MEd: "E, M/d"
                    MMM: "LLL"
                    MMMEd: "E, MMM d"
                    MMMMW: #[
                        one: "'week' W 'of' MMMM"
                        other: "'week' W 'of' MMMM"
                    ]
                    MMMMd: "MMMM d"
                    MMMd: "MMM d"
                    Md: "M/d"
                    d: "d"
                    h: "h a"
                    hm: "h:mm a"
                    hms: "h:mm:ss a"
                    hmsv: "h:mm:ss a v"
                    hmv: "h:mm a v"
                    ms: "mm:ss"
                    y: "y"
                    yM: "M/y"
                    yMEd: "E, M/d/y"
                    yMMM: "MMM y"
                    yMMMEd: "E, MMM d, y"
                    yMMMM: "MMMM y"
                    yMMMd: "MMM d, y"
                    yMd: "M/d/y"
                    yQQQ: "QQQ y"
                    yQQQQ: "QQQQ y"
                    yw: #[
                        one: "'week' w 'of' Y"
                        other: "'week' w 'of' Y"
                    ]
                ]
                dayNames: #[
                    format: #[
                        abbreviated: ["Sun" "Mon" "Tue" "Wed" "Thu" "Fri" "Sat"]
                        short: ["Su" "Mo" "Tu" "We" "Th" "Fr" "Sa"]
                        wide: ["Sunday" "Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday"]
                    ]
                    stand-alone: #[
                        narrow: ["S" "M" "T" "W" "T" "F" "S"]
                    ]
                ]
                dayPeriod: #[
                    format: #[
                        abbreviated: #[
                            afternoon1: "in the afternoon"
                            evening1: "in the evening"
                            midnight: "midnight"
                            morning1: "in the morning"
                            night1: "at night"
                            noon: "noon"
                        ]
                        narrow: #[
                            afternoon1: "in the afternoon"
                            evening1: "in the evening"
                            midnight: "mi"
                            morning1: "in the morning"
                            night1: "at night"
                            noon: "n"
                        ]
                        wide: #[
                            afternoon1: "in the afternoon"
                            evening1: "in the evening"
                            midnight: "midnight"
                            morning1: "in the morning"
                            night1: "at night"
                            noon: "noon"
                        ]
                    ]
                    stand-alone: #[
                        abbreviated: #[
                            afternoon1: "afternoon"
                            am: "AM"
                            evening1: "evening"
                            midnight: "midnight"
                            morning1: "morning"
                            night1: "night"
                            noon: "noon"
                            pm: "PM"
                        ]
                        wide: #[
                            afternoon1: "afternoon"
                            am: "AM"
                            evening1: "evening"
                            midnight: "midnight"
                            morning1: "morning"
                            night1: "night"
                            noon: "noon"
                            pm: "PM"
                        ]
                    ]
                ]
                eras: #[
                    abbreviated: ["BC" "AD"]
                    abbreviated-variant: ["BCE" "CE"]
                    narrow: ["B" "A"]
                    wide: ["Before Christ" "Anno Domini"]
                    wide-variant: ["Before Common Era" "Common Era"]
                ]
                intervalFormats: #[
                    bh: #[
                        B: "h B – h B"
                        h: "h – h B"
                    ]
                    Bhm: #[
                        B: "h:mm B – h:mm B"
                        h: "h:mm – h:mm B"
                        m: "h:mm – h:mm B"
                    ]
                    Gy: #[
                        G: "y G – y G"
                        y: "y – y G"
                    ]
                    GyM: #[
                        G: "M/y GGGGG – M/y GGGGG"
                        M: "M/y – M/y GGGGG"
                        y: "M/y – M/y GGGGG"
                    ]
                    GyMEd: #[
                        G: "E, M/d/y GGGGG – E, M/d/y GGGGG"
                        M: "E, M/d/y – E, M/d/y GGGGG"
                        d: "E, M/d/y – E, M/d/y GGGGG"
                        y: "E, M/d/y – E, M/d/y GGGGG"
                    ]
                    GyMMM: #[
                        G: "MMM y G – MMM y G"
                        M: "MMM – MMM y G"
                        y: "MMM y – MMM y G"
                    ]
                    GyMMMEd: #[
                        G: "E, MMM d, y G – E, MMM d, y G"
                        M: "E, MMM d – E, MMM d, y G"
                        d: "E, MMM d – E, MMM d, y G"
                        y: "E, MMM d, y – E, MMM d, y G"
                    ]
                    GyMMMd: #[
                        G: "MMM d, y G – MMM d, y G"
                        M: "MMM d – MMM d, y G"
                        d: "MMM d – d, y G"
                        y: "MMM d, y – MMM d, y G"
                    ]
                    GyMd: #[
                        G: "M/d/y GGGGG – M/d/y GGGGG"
                        M: "M/d/y – M/d/y GGGGG"
                        d: "M/d/y – M/d/y GGGGG"
                        y: "M/d/y – M/d/y GGGGG"
                    ]
                    H: #[
                        H: "HH – HH"
                    ]
                    Hm: #[
                        H: "HH:mm – HH:mm"
                        m: "HH:mm – HH:mm"
                    ]
                    Hmv: #[
                        H: "HH:mm – HH:mm v"
                        m: "HH:mm – HH:mm v"
                    ]
                    Hv: #[
                        H: "HH – HH v"
                    ]
                    M: #[
                        M: "M – M"
                    ]
                    MEd: #[
                        M: "E, M/d – E, M/d"
                        d: "E, M/d – E, M/d"
                    ]
                    MMM: #[
                        M: "MMM – MMM"
                    ]
                    MMMEd: #[
                        M: "E, MMM d – E, MMM d"
                        d: "E, MMM d – E, MMM d"
                    ]
                    MMMd: #[
                        M: "MMM d – MMM d"
                        d: "MMM d – d"
                    ]
                    Md: #[
                        M: "M/d – M/d"
                        d: "M/d – M/d"
                    ]
                    d: #[
                        d: "d – d"
                    ]
                    fallback: "{0} – {1}"
                    h: #[
                        a: "h a – h a"
                        h: "h – h a"
                    ]
                    hm: #[
                        a: "h:mm a – h:mm a"
                        h: "h:mm – h:mm a"
                        m: "h:mm – h:mm a"
                    ]
                    hmv: #[
                        a: "h:mm a – h:mm a v"
                        h: "h:mm – h:mm a v"
                        m: "h:mm – h:mm a v"
                    ]
                    hv: #[
                        a: "h a – h a v"
                        h: "h – h a v"
                    ]
                    y: #[
                        y: "y – y"
                    ]
                    yM: #[
                        M: "M/y – M/y"
                        y: "M/y – M/y"
                    ]
                    yMEd: #[
                        M: "E, M/d/y – E, M/d/y"
                        d: "E, M/d/y – E, M/d/y"
                        y: "E, M/d/y – E, M/d/y"
                    ]
                    yMMM: #[
                        M: "MMM – MMM y"
                        y: "MMM y – MMM y"
                    ]
                    yMMMEd: #[
                        M: "E, MMM d – E, MMM d, y"
                        d: "E, MMM d – E, MMM d, y"
                        y: "E, MMM d, y – E, MMM d, y"
                    ]
                    yMMMM: #[
                        M: "MMMM – MMMM y"
                        y: "MMMM y – MMMM y"
                    ]
                    yMMMd: #[
                        M: "MMM d – MMM d, y"
                        d: "MMM d – d, y"
                        y: "MMM d, y – MMM d, y"
                    ]
                    yMd: #[
                        M: "M/d/y – M/d/y"
                        d: "M/d/y – M/d/y"
                        y: "M/d/y – M/d/y"
                    ]
                ]
                monthNames: #[
                    format: #[
                        abbreviated: ["Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov" "Dec"]
                        wide: ["January" "February" "March" "April" "May" "June" "July" "August" "September" "October" "November" "December"]
                    ]
                    stand-alone: #[
                        narrow: ["J" "F" "M" "A" "M" "J" "J" "A" "S" "O" "N" "D"]
                    ]
                ]
                quarters: #[
                    format: #[
                        abbreviated: ["Q1" "Q2" "Q3" "Q4"]
                        wide: ["1st quarter" "2nd quarter" "3rd quarter" "4th quarter"]
                    ]
                    stand-alone: #[
                        narrow: ["1" "2" "3" "4"]
                    ]
                ]
            ]
        ]
    ]
]
