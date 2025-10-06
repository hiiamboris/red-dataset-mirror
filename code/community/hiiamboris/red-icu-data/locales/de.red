#(
    lang-name: "Deutsch"
    region-name: none
    currency: EUR
    numbers: #(
        system: latn
        latn: #(
            digits: "0123456789"
            fin-digits: "0123456789"
            symbols: #(
                nan: "NaN"
                infinity: "∞"
                permille: "‰"
                superscripting-exponent: "·"
                exponential: "E"
                approximately: "≈"
                minus: "-"
                plus: "+"
                percent: "%"
                list: ";"
                group: "."
                decimal: ","
            )
            masks: #(
                number: #(
                    dec: "# ##0.###"
                    sci: "0.##############E0"
                    pct: "# ##0. %"
                    eng: "0.##############E3"
                )
                money: #(
                    std: "# ##0.00 $$"
                    acct: "# ##0.00 $$"
                )
            )
        )
        ordinal-suffixes: #(
            other: "."
        )
    )
    calendar: #(
        day1: mon
        standalone: #(
            months: #(
                abbr: ["Jan" "Feb" "Mär" "Apr" "Mai" "Jun" "Jul" "Aug" "Sep" "Okt" "Nov" "Dez"]
                char: ["J" "F" "M" "A" "M" "J" "J" "A" "S" "O" "N" "D"]
                full: ["Januar" "Februar" "März" "April" "Mai" "Juni" "Juli" "August" "September" "Oktober" "November" "Dezember"]
            )
            days: #(
                abbr: #(
                    sun: "So"
                    mon: "Mo"
                    tue: "Di"
                    wed: "Mi"
                    thu: "Do"
                    fri: "Fr"
                    sat: "Sa"
                )
                char: #(
                    sun: "S"
                    mon: "M"
                    tue: "D"
                    wed: "M"
                    thu: "D"
                    fri: "F"
                    sat: "S"
                )
                short: #(
                    sun: "So."
                    mon: "Mo."
                    tue: "Di."
                    wed: "Mi."
                    thu: "Do."
                    fri: "Fr."
                    sat: "Sa."
                )
                full: #(
                    sun: "Sonntag"
                    mon: "Montag"
                    tue: "Dienstag"
                    wed: "Mittwoch"
                    thu: "Donnerstag"
                    fri: "Freitag"
                    sat: "Samstag"
                )
            )
            quarters: #(
                abbr: ["Q1" "Q2" "Q3" "Q4"]
                char: ["1" "2" "3" "4"]
                full: ["1. Quartal" "2. Quartal" "3. Quartal" "4. Quartal"]
            )
            periods: #(
                abbr: #(
                    am: "AM"
                    pm: "PM"
                )
                char: #(
                    am: "AM"
                    pm: "PM"
                )
                full: #(
                    am: "AM"
                    pm: "PM"
                )
            )
        )
        format: #(
            months: #(
                abbr: ["Jan." "Feb." "März" "Apr." "Mai" "Juni" "Juli" "Aug." "Sept." "Okt." "Nov." "Dez."]
                char: ["J" "F" "M" "A" "M" "J" "J" "A" "S" "O" "N" "D"]
                full: ["Januar" "Februar" "März" "April" "Mai" "Juni" "Juli" "August" "September" "Oktober" "November" "Dezember"]
            )
            days: #(
                abbr: #(
                    sun: "So."
                    mon: "Mo."
                    tue: "Di."
                    wed: "Mi."
                    thu: "Do."
                    fri: "Fr."
                    sat: "Sa."
                )
                char: #(
                    sun: "S"
                    mon: "M"
                    tue: "D"
                    wed: "M"
                    thu: "D"
                    fri: "F"
                    sat: "S"
                )
                short: #(
                    sun: "So."
                    mon: "Mo."
                    tue: "Di."
                    wed: "Mi."
                    thu: "Do."
                    fri: "Fr."
                    sat: "Sa."
                )
                full: #(
                    sun: "Sonntag"
                    mon: "Montag"
                    tue: "Dienstag"
                    wed: "Mittwoch"
                    thu: "Donnerstag"
                    fri: "Freitag"
                    sat: "Samstag"
                )
            )
            quarters: #(
                abbr: ["Q1" "Q2" "Q3" "Q4"]
                char: ["1" "2" "3" "4"]
                full: ["1. Quartal" "2. Quartal" "3. Quartal" "4. Quartal"]
            )
            periods: #(
                abbr: #(
                    am: "AM"
                    pm: "PM"
                )
                char: #(
                    am: "AM"
                    pm: "PM"
                )
                full: #(
                    am: "AM"
                    pm: "PM"
                )
            )
            eras: #(
                full: #(
                    BC: "v. Chr."
                    AD: "n. Chr."
                    BCE: "vor unserer Zeitrechnung"
                    CE: "unserer Zeitrechnung"
                )
                abbr: #(
                    BC: "v. Chr."
                    AD: "n. Chr."
                    BCE: "v. u. Z."
                    CE: "u. Z."
                )
                char: #(
                    BC: "v. Chr."
                    AD: "n. Chr."
                    BCE: "v. u. Z."
                    CE: "u. Z."
                )
            )
        )
        masks: #(
            date: #(
                full: "Sunday, 31. December 1999"
                long: "31. December 1999"
                medium: "031.012.1999"
                short: "031.012.99"
            )
            time: #(
                full: "023:59:59 'GMT'+00:00"
                long: "023:59:59 'GMT'+0"
                medium: "023:59:59"
                short: "023:59"
            )
            datetime: #(
                full: {Sunday, 31. December 1999 'um' 023:59:59 'GMT'+00:00}
                long: "31. December 1999 'um' 023:59:59 'GMT'+0"
                medium: "031.012.1999, 023:59:59"
                short: "031.012.99, 023:59"
            )
        )
    )
    currency-names: #(
        AFN: [char: "؋"]
        AMD: [char: "֏"]
        AOA: [char: "Kz"]
        ARS: [char: "$"]
        ATS: [std: "öS"]
        AUD: [char: "$" std: "AU$"]
        AZN: [char: "₼"]
        BAM: [char: "KM"]
        BBD: [char: "$"]
        BDT: [char: "৳"]
        BGM: [std: "BGK"]
        BGO: [std: "BGJ"]
        BMD: [char: "$"]
        BND: [char: "$"]
        BOB: [char: "Bs"]
        BRL: [std: "R$"]
        BSD: [char: "$"]
        BWP: [char: "P"]
        BYN: [char: "р."]
        BZD: [char: "$"]
        CAD: [char: "$" std: "CA$"]
        CLP: [char: "$"]
        CNY: [char: "¥" std: "CN¥"]
        COP: [char: "$"]
        CRC: [char: "₡"]
        CUC: [char: "Cub$"]
        CUP: [char: "$"]
        CZK: [char: "Kč"]
        DEM: [std: "DM"]
        DKK: [char: "kr"]
        DOP: [char: "$"]
        EGP: [char: "E£"]
        ESP: [char: "₧"]
        EUR: [std: "€"]
        FJD: [char: "$"]
        FKP: [char: "Fl£"]
        GBP: [std: "£"]
        GEL: [char: "₾"]
        GHS: [char: "₵"]
        GIP: [char: "£"]
        GNF: [char: "F.G."]
        GTQ: [char: "Q"]
        GYD: [char: "$"]
        HKD: [char: "$" std: "HK$"]
        HNL: [char: "L"]
        HRK: [char: "kn"]
        HUF: [char: "Ft"]
        IDR: [char: "Rp"]
        ILS: [std: "₪"]
        INR: [std: "₹"]
        ISK: [char: "kr"]
        JMD: [char: "$"]
        JPY: [std: "¥"]
        KHR: [char: "៛"]
        KMF: [char: "FC"]
        KPW: [char: "₩"]
        KRW: [std: "₩"]
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
        MXN: [char: "$" std: "MX$"]
        MYR: [char: "RM"]
        NAD: [char: "$"]
        NGN: [char: "₦"]
        NIO: [char: "C$"]
        NOK: [char: "kr"]
        NPR: [char: "Rs"]
        NZD: [char: "$" std: "NZ$"]
        PHP: [char: "₱"]
        PKR: [char: "Rs"]
        PLN: [char: "zł"]
        PYG: [char: "₲"]
        RON: [char: "L"]
        RUB: [char: "₽"]
        RUR: [char: "р."]
        RWF: [char: "F.Rw"]
        SBD: [char: "$"]
        SEK: [char: "kr"]
        SGD: [char: "$"]
        SHP: [char: "£"]
        SRD: [char: "$"]
        SSP: [char: "£"]
        STN: [char: "Db"]
        THB: [std: "฿"]
        TOP: [char: "T$"]
        TRY: [char: "₺"]
        TTD: [char: "$"]
        TWD: [std: "NT$"]
        UAH: [char: "₴"]
        USD: [std: "$"]
        UYU: [char: "$"]
        VEF: [char: "Bs"]
        VND: [std: "₫"]
        XAF: [std: "FCFA"]
        XCD: [char: "$" std: "EC$"]
        XOF: [std: "F CFA"]
        XPF: [std: "CFPF"]
        ZAR: [char: "R"]
        ZMW: [char: "K"]
    )
)