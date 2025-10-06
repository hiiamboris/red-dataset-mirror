#(
    lang-name: "עברית"
    region-name: none
    currency: ILS
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
                exponential: "E"
                approximately: "~"
                minus: "‎-"
                plus: "‎+"
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
                    std: "‏-# ##0.00 $$"
                    acct: "# ##0.00 $$"
                )
            )
        )
        ordinal-suffixes: #(
            other: ""
        )
    )
    calendar: #(
        day1: sun
        standalone: #(
            months: #(
                abbr: ["ינו׳" "פבר׳" "מרץ" "אפר׳" "מאי" "יוני" "יולי" "אוג׳" "ספט׳" "אוק׳" "נוב׳" "דצמ׳"]
                char: ["1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12"]
                full: ["ינואר" "פברואר" "מרץ" "אפריל" "מאי" "יוני" "יולי" "אוגוסט" "ספטמבר" "אוקטובר" "נובמבר" "דצמבר"]
            )
            days: #(
                abbr: #(
                    sun: "יום א׳"
                    mon: "יום ב׳"
                    tue: "יום ג׳"
                    wed: "יום ד׳"
                    thu: "יום ה׳"
                    fri: "יום ו׳"
                    sat: "שבת"
                )
                char: #(
                    sun: "א׳"
                    mon: "ב׳"
                    tue: "ג׳"
                    wed: "ד׳"
                    thu: "ה׳"
                    fri: "ו׳"
                    sat: "ש׳"
                )
                short: #(
                    sun: "א׳"
                    mon: "ב׳"
                    tue: "ג׳"
                    wed: "ד׳"
                    thu: "ה׳"
                    fri: "ו׳"
                    sat: "ש׳"
                )
                full: #(
                    sun: "יום ראשון"
                    mon: "יום שני"
                    tue: "יום שלישי"
                    wed: "יום רביעי"
                    thu: "יום חמישי"
                    fri: "יום שישי"
                    sat: "יום שבת"
                )
            )
            quarters: #(
                abbr: ["Q1" "Q2" "Q3" "Q4"]
                char: ["1" "2" "3" "4"]
                full: ["רבעון 1" "רבעון 2" "רבעון 3" "רבעון 4"]
            )
            periods: #(
                abbr: #(
                    am: "AM"
                    pm: "PM"
                )
                char: #(
                    am: "לפנה״צ"
                    pm: "אחה״צ"
                )
                full: #(
                    am: "AM"
                    pm: "PM"
                )
            )
        )
        format: #(
            months: #(
                abbr: ["ינו׳" "פבר׳" "מרץ" "אפר׳" "מאי" "יוני" "יולי" "אוג׳" "ספט׳" "אוק׳" "נוב׳" "דצמ׳"]
                char: ["1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12"]
                full: ["ינואר" "פברואר" "מרץ" "אפריל" "מאי" "יוני" "יולי" "אוגוסט" "ספטמבר" "אוקטובר" "נובמבר" "דצמבר"]
            )
            days: #(
                abbr: #(
                    sun: "יום א׳"
                    mon: "יום ב׳"
                    tue: "יום ג׳"
                    wed: "יום ד׳"
                    thu: "יום ה׳"
                    fri: "יום ו׳"
                    sat: "שבת"
                )
                char: #(
                    sun: "א׳"
                    mon: "ב׳"
                    tue: "ג׳"
                    wed: "ד׳"
                    thu: "ה׳"
                    fri: "ו׳"
                    sat: "ש׳"
                )
                short: #(
                    sun: "א׳"
                    mon: "ב׳"
                    tue: "ג׳"
                    wed: "ד׳"
                    thu: "ה׳"
                    fri: "ו׳"
                    sat: "ש׳"
                )
                full: #(
                    sun: "יום ראשון"
                    mon: "יום שני"
                    tue: "יום שלישי"
                    wed: "יום רביעי"
                    thu: "יום חמישי"
                    fri: "יום שישי"
                    sat: "יום שבת"
                )
            )
            quarters: #(
                abbr: ["Q1" "Q2" "Q3" "Q4"]
                char: ["1" "2" "3" "4"]
                full: ["רבעון 1" "רבעון 2" "רבעון 3" "רבעון 4"]
            )
            periods: #(
                abbr: #(
                    am: "לפנה״צ"
                    pm: "אחה״צ"
                )
                char: #(
                    am: "לפנה״צ"
                    pm: "אחה״צ"
                )
                full: #(
                    am: "לפנה״צ"
                    pm: "אחה״צ"
                )
            )
            eras: #(
                full: #(
                    BC: "לפני הספירה"
                    AD: "לספירה"
                    BCE: "לפנה״ס"
                    CE: "CE"
                )
                abbr: #(
                    BC: "לפנה״ס"
                    AD: "לספירה"
                    BCE: "BCE"
                    CE: "CE"
                )
                char: #(
                    BC: "לפני"
                    AD: "אחריי"
                )
            )
        )
        masks: #(
            date: #(
                full: "Sunday, 31 בDecember 1999"
                long: "31 בDecember 1999"
                medium: "31 בDec 1999"
                short: "31.12.1999"
            )
            time: #(
                full: "23:59:59 'GMT'+00:00'‎'"
                long: "23:59:59 'GMT'+0'‎'"
                medium: "23:59:59"
                short: "23:59"
            )
            datetime: #(
                full: {Sunday, 31 בDecember 1999 בשעה 23:59:59 'GMT'+00:00'‎'}
                long: "31 בDecember 1999 בשעה 23:59:59 'GMT'+0'‎'"
                medium: "31 בDec 1999, 23:59:59"
                short: "31.12.1999, 23:59"
            )
        )
    )
    currency-names: #(
        AFN: [char: "؋"]
        AMD: [char: "֏"]
        AOA: [char: "Kz"]
        ARS: [char: "$"]
        AUD: [char: "$" std: "A$"]
        AZN: [char: "₼"]
        BAM: [char: "KM"]
        BBD: [char: "$"]
        BDT: [char: "৳"]
        BMD: [char: "$"]
        BND: [char: "$"]
        BOB: [char: "Bs"]
        BRL: [std: "R$"]
        BSD: [char: "$"]
        BWP: [char: "P"]
        BYN: [char: "р"]
        BZD: [char: "$"]
        CAD: [char: "$" std: "CA$"]
        CLP: [char: "$"]
        CNY: [char: "¥" std: "‎CN¥‎"]
        COP: [char: "$"]
        CRC: [char: "₡"]
        CUC: [char: "$"]
        CUP: [char: "$"]
        CZK: [char: "Kč"]
        DKK: [char: "kr"]
        DOP: [char: "$"]
        EGP: [char: "E£"]
        ESP: [char: "₧"]
        EUR: [std: "€"]
        FJD: [char: "$"]
        FKP: [char: "£"]
        GBP: [std: "£"]
        GEL: [char: "₾"]
        GHS: [char: "GH₵"]
        GIP: [char: "£"]
        GNF: [char: "FG"]
        GTQ: [char: "Q"]
        GYD: [char: "$"]
        HKD: [char: "$" std: "HK$"]
        HNL: [char: "L"]
        HRK: [char: "kn"]
        HUF: [char: "Ft"]
        IDR: [char: "Rp"]
        ILP: [std: "ל״י"]
        ILS: [std: "₪"]
        INR: [std: "₹"]
        ISK: [char: "kr"]
        JMD: [char: "$"]
        JPY: [std: "¥"]
        KHR: [char: "៛"]
        KMF: [char: "CF"]
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
        RON: [char: "lei"]
        RUB: [char: "₽"]
        RWF: [char: "RF"]
        SBD: [char: "$"]
        SEK: [char: "kr"]
        SGD: [char: "$"]
        SHP: [char: "£"]
        SRD: [char: "$"]
        SSP: [char: "£"]
        STN: [char: "Db"]
        SYP: [char: "£"]
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
        XXX: [std: "¤"]
        ZAR: [char: "R"]
        ZMW: [char: "ZK"]
    )
)