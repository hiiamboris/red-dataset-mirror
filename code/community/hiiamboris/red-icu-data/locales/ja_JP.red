#(
    lang-name: "日本語"
    region-name: "日本"
    currency: JPY
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
                approximately: "約"
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
            other: " 番目の角を右折します。"
        )
    )
    calendar: #(
        day1: sun
        standalone: #(
            months: #(
                abbr: ["1月" "2月" "3月" "4月" "5月" "6月" "7月" "8月" "9月" "10月" "11月" "12月"]
                char: ["1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12"]
                full: ["1月" "2月" "3月" "4月" "5月" "6月" "7月" "8月" "9月" "10月" "11月" "12月"]
            )
            days: #(
                abbr: #(
                    sun: "日"
                    mon: "月"
                    tue: "火"
                    wed: "水"
                    thu: "木"
                    fri: "金"
                    sat: "土"
                )
                char: #(
                    sun: "日"
                    mon: "月"
                    tue: "火"
                    wed: "水"
                    thu: "木"
                    fri: "金"
                    sat: "土"
                )
                short: #(
                    sun: "日"
                    mon: "月"
                    tue: "火"
                    wed: "水"
                    thu: "木"
                    fri: "金"
                    sat: "土"
                )
                full: #(
                    sun: "日曜日"
                    mon: "月曜日"
                    tue: "火曜日"
                    wed: "水曜日"
                    thu: "木曜日"
                    fri: "金曜日"
                    sat: "土曜日"
                )
            )
            quarters: #(
                abbr: ["Q1" "Q2" "Q3" "Q4"]
                char: ["1" "2" "3" "4"]
                full: ["第1四半期" "第2四半期" "第3四半期" "第4四半期"]
            )
            periods: #(
                abbr: #(
                    am: "午前"
                    pm: "午後"
                )
                char: #(
                    am: "午前"
                    pm: "午後"
                )
                full: #(
                    am: "午前"
                    pm: "午後"
                )
            )
        )
        format: #(
            months: #(
                abbr: ["1月" "2月" "3月" "4月" "5月" "6月" "7月" "8月" "9月" "10月" "11月" "12月"]
                char: ["1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12"]
                full: ["1月" "2月" "3月" "4月" "5月" "6月" "7月" "8月" "9月" "10月" "11月" "12月"]
            )
            days: #(
                abbr: #(
                    sun: "日"
                    mon: "月"
                    tue: "火"
                    wed: "水"
                    thu: "木"
                    fri: "金"
                    sat: "土"
                )
                char: #(
                    sun: "日"
                    mon: "月"
                    tue: "火"
                    wed: "水"
                    thu: "木"
                    fri: "金"
                    sat: "土"
                )
                short: #(
                    sun: "日"
                    mon: "月"
                    tue: "火"
                    wed: "水"
                    thu: "木"
                    fri: "金"
                    sat: "土"
                )
                full: #(
                    sun: "日曜日"
                    mon: "月曜日"
                    tue: "火曜日"
                    wed: "水曜日"
                    thu: "木曜日"
                    fri: "金曜日"
                    sat: "土曜日"
                )
            )
            quarters: #(
                abbr: ["Q1" "Q2" "Q3" "Q4"]
                char: ["1" "2" "3" "4"]
                full: ["第1四半期" "第2四半期" "第3四半期" "第4四半期"]
            )
            periods: #(
                abbr: #(
                    am: "午前"
                    pm: "午後"
                )
                char: #(
                    am: "午前"
                    pm: "午後"
                )
                full: #(
                    am: "午前"
                    pm: "午後"
                )
            )
            eras: #(
                full: #(
                    BC: "紀元前"
                    AD: "西暦"
                    BCE: "西暦紀元前"
                    CE: "西暦紀元"
                )
                abbr: #(
                    BC: "紀元前"
                    AD: "西暦"
                    BCE: "西暦紀元前"
                    CE: "西暦紀元"
                )
                char: #(
                    BC: "BC"
                    AD: "AD"
                )
            )
        )
        masks: #(
            date: #(
                full: "1999年12月31日Sunday"
                long: "1999年12月31日"
                medium: "1999/012/031"
                short: "1999/012/031"
            )
            time: #(
                full: "23時59分59秒 'GMT'+00:00"
                long: "23:59:59 'GMT'+0"
                medium: "23:59:59"
                short: "23:59"
            )
            datetime: #(
                full: "1999年12月31日Sunday 23時59分59秒 'GMT'+00:00"
                long: "1999年12月31日 23:59:59 'GMT'+0"
                medium: "1999/012/031 23:59:59"
                short: "1999/012/031 23:59"
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
        BYN: [char: "р."]
        BZD: [char: "$"]
        CAD: [char: "$" std: "CA$"]
        CLP: [char: "$"]
        CNY: [char: "￥" std: "元"]
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
        ILS: [std: "₪"]
        INR: [std: "₹"]
        ISK: [char: "kr"]
        JMD: [char: "$"]
        JPY: [std: "￥"]
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
        RON: [char: "レイ"]
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
        THB: [char: "฿"]
        TOP: [char: "T$"]
        TRY: [char: "₺"]
        TTD: [char: "$"]
        TWD: [char: "$" std: "NT$"]
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
        ZMW: [char: "ZK"]
    )
)