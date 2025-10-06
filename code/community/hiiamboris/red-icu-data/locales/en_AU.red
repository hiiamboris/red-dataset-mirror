#(
    lang-name: "English"
    region-name: "Australia"
    currency: AUD
    numbers: #(
        system: latn
        latn: #(
            digits: "0123456789"
            fin-digits: "0123456789"
            symbols: #(
                nan: "NaN"
                infinity: "∞"
                permille: "‰"
                superscripting-exponent: "×"
                exponential: "e"
                approximately: "~"
                minus: "-"
                plus: "+"
                percent: "%"
                list: ";"
                group: ","
                decimal: "."
            )
            masks: #(
                number: #(
                    dec: "# ##0.###"
                    sci: "0.##############E0"
                    pct: "# ##0.%"
                    eng: "0.##############E3"
                )
                money: #(
                    std: "$$# ##0.00"
                    acct: "($$# ##0.00)"
                )
            )
        )
        ordinal-suffixes: #(
            few: "rd"
            one: "st"
            other: "th"
            two: "nd"
        )
    )
    calendar: #(
        day1: mon
        standalone: #(
            months: #(
                abbr: ["Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov" "Dec"]
                full: ["January" "February" "March" "April" "May" "June" "July" "August" "September" "October" "November" "December"]
                char: ["J" "F" "M" "A" "M" "J" "J" "A" "S" "O" "N" "D"]
            )
            days: #(
                abbr: #(
                    sun: "Sun"
                    mon: "Mon"
                    tue: "Tue"
                    wed: "Wed"
                    thu: "Thu"
                    fri: "Fri"
                    sat: "Sat"
                )
                char: #(
                    sun: "Su."
                    mon: "M."
                    tue: "Tu."
                    wed: "W."
                    thu: "Th."
                    fri: "F."
                    sat: "Sa."
                )
                short: #(
                    sun: "Su"
                    mon: "Mon"
                    tue: "Tu"
                    wed: "Wed"
                    thu: "Th"
                    fri: "Fri"
                    sat: "Sat"
                )
                full: #(
                    sun: "Sunday"
                    mon: "Monday"
                    tue: "Tuesday"
                    wed: "Wednesday"
                    thu: "Thursday"
                    fri: "Friday"
                    sat: "Saturday"
                )
            )
            quarters: #(
                abbr: ["Q1" "Q2" "Q3" "Q4"]
                full: ["1st quarter" "2nd quarter" "3rd quarter" "4th quarter"]
                char: ["1" "2" "3" "4"]
            )
            periods: #(
                abbr: #(
                    am: "AM"
                    pm: "PM"
                )
                char: #(
                    am: "am"
                    pm: "pm"
                )
                full: #(
                    am: "AM"
                    pm: "PM"
                )
            )
        )
        format: #(
            months: #(
                abbr: ["Jan" "Feb" "Mar" "Apr" "May" "June" "July" "Aug" "Sept" "Oct" "Nov" "Dec"]
                char: ["J" "F" "M" "A" "M" "J" "J" "A" "S" "O" "N" "D"]
                full: ["January" "February" "March" "April" "May" "June" "July" "August" "September" "October" "November" "December"]
            )
            days: #(
                char: #(
                    sun: "Su."
                    mon: "M."
                    tue: "Tu."
                    wed: "W."
                    thu: "Th."
                    fri: "F."
                    sat: "Sa."
                )
                short: #(
                    sun: "Su"
                    mon: "Mon"
                    tue: "Tu"
                    wed: "Wed"
                    thu: "Th"
                    fri: "Fri"
                    sat: "Sat"
                )
                abbr: #(
                    sun: "Sun"
                    mon: "Mon"
                    tue: "Tue"
                    wed: "Wed"
                    thu: "Thu"
                    fri: "Fri"
                    sat: "Sat"
                )
                full: #(
                    sun: "Sunday"
                    mon: "Monday"
                    tue: "Tuesday"
                    wed: "Wednesday"
                    thu: "Thursday"
                    fri: "Friday"
                    sat: "Saturday"
                )
            )
            quarters: #(
                char: ["1" "2" "3" "4"]
                abbr: ["Q1" "Q2" "Q3" "Q4"]
                full: ["1st quarter" "2nd quarter" "3rd quarter" "4th quarter"]
            )
            periods: #(
                abbr: #(
                    am: "AM"
                    pm: "PM"
                )
                char: #(
                    am: "am"
                    pm: "pm"
                )
                full: #(
                    am: "AM"
                    pm: "PM"
                )
            )
            eras: #(
                full: #(
                    BC: "Before Christ"
                    AD: "Anno Domini"
                    BCE: "Before Common Era"
                    CE: "Common Era"
                )
                abbr: #(
                    BC: "BC"
                    AD: "AD"
                    BCE: "BCE"
                    CE: "CE"
                )
                char: #(
                    BC: "B"
                    AD: "A"
                )
            )
        )
        masks: #(
            date: #(
                full: "Sunday, 31 December 1999"
                long: "31 December 1999"
                medium: "31 Dec 1999"
                short: "31/12/99"
            )
            time: #(
                full: "12:59:59 AM 'GMT'+00:00"
                long: "12:59:59 AM 'GMT'+0"
                medium: "12:59:59 AM"
                short: "12:59 AM"
            )
            datetime: #(
                full: {Sunday, 31 December 1999 'at' 12:59:59 AM 'GMT'+00:00}
                long: "31 December 1999 'at' 12:59:59 AM 'GMT'+0"
                medium: "31 Dec 1999, 12:59:59 AM"
                short: "31/12/99, 12:59 AM"
            )
        )
    )
    currency-names: #(
        AFN: [char: "؋"]
        AMD: [char: "֏"]
        AOA: [char: "Kz"]
        ARS: [char: "$"]
        AUD: [std: "$"]
        AZN: [char: "₼"]
        BAM: [char: "KM"]
        BBD: [char: "$"]
        BDT: [char: "Tk"]
        BMD: [char: "$"]
        BND: [char: "$"]
        BOB: [char: "Bs"]
        BRL: [char: "R$"]
        BSD: [char: "$"]
        BWP: [char: "P"]
        BZD: [char: "$"]
        CAD: [char: "$"]
        CLP: [char: "$"]
        CNY: [char: "¥"]
        COP: [char: "$"]
        CRC: [char: "₡"]
        CUC: [char: "$"]
        CUP: [char: "₱"]
        CZK: [char: "Kč"]
        DKK: [char: "kr"]
        DOP: [char: "$"]
        EGP: [char: "£"]
        ESP: [char: "₧"]
        EUR: [char: "€"]
        FJD: [char: "$"]
        FKP: [char: "£"]
        GBP: [char: "£"]
        GEL: [char: "₾"]
        GHS: [char: "GH₵"]
        GIP: [char: "£"]
        GNF: [char: "FG"]
        GTQ: [char: "Q"]
        GYD: [char: "$"]
        HKD: [char: "$"]
        HNL: [char: "L"]
        HRK: [char: "kn"]
        HUF: [char: "Ft"]
        IDR: [char: "Rp"]
        ILS: [char: "₪"]
        INR: [char: "₹"]
        ISK: [char: "Kr"]
        JMD: [char: "$"]
        JPY: [char: "¥"]
        KHR: [char: "៛"]
        KMF: [char: "CF"]
        KPW: [char: "₩"]
        KRW: [char: "₩"]
        KYD: [char: "$"]
        KZT: [char: "₸"]
        LAK: [char: "₭"]
        LBP: [char: "L£"]
        LKR: [char: "Rs"]
        LRD: [char: "$"]
        LTL: [char: "Lt"]
        LVL: [char: "Ls"]
        MGA: [char: "Ar"]
        MMK: [char: "K"]
        MNT: [char: "₮"]
        MUR: [char: "Rs"]
        MXN: [char: "$"]
        MYR: [char: "RM"]
        NAD: [char: "$"]
        NGN: [char: "₦"]
        NIO: [char: "C$"]
        NOK: [char: "kr"]
        NPR: [char: "Rs"]
        NZD: [char: "$"]
        PHP: [char: "₱"]
        PKR: [char: "Rs"]
        PLN: [char: "zł"]
        PYG: [char: "Gs"]
        RON: [char: "lei"]
        RUB: [char: "₽"]
        RWF: [char: "RF"]
        SBD: [char: "$"]
        SCR: [std: "Rs"]
        SEK: [char: "Kr"]
        SGD: [char: "$"]
        SHP: [char: "£"]
        SRD: [char: "$"]
        SSP: [char: "£"]
        STN: [char: "Db"]
        SYP: [char: "£"]
        THB: [char: "฿"]
        TOP: [char: "T$"]
        TRY: [char: "₺"]
        TTD: [char: "$"]
        TWD: [char: "$"]
        UAH: [char: "₴"]
        USD: [char: "$"]
        UYU: [char: "$U"]
        VEF: [char: "Bs"]
        VND: [char: "₫"]
        XCD: [char: "$"]
        XPF: [std: "CFP"]
        XXX: [std: "¤"]
        ZAR: [char: "R"]
        ZMW: [char: "ZK"]
    )
)