#(
    lang-name: "čeština"
    region-name: none
    currency: CZK
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
                minus: "-"
                plus: "+"
                percent: "%"
                list: ";"
                group: " "
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
                abbr: ["led" "úno" "bře" "dub" "kvě" "čvn" "čvc" "srp" "zář" "říj" "lis" "pro"]
                char: ["1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12"]
                full: ["leden" "únor" "březen" "duben" "květen" "červen" "červenec" "srpen" "září" "říjen" "listopad" "prosinec"]
            )
            days: #(
                abbr: #(
                    sun: "ne"
                    mon: "po"
                    tue: "út"
                    wed: "st"
                    thu: "čt"
                    fri: "pá"
                    sat: "so"
                )
                char: #(
                    sun: "N"
                    mon: "P"
                    tue: "Ú"
                    wed: "S"
                    thu: "Č"
                    fri: "P"
                    sat: "S"
                )
                short: #(
                    sun: "ne"
                    mon: "po"
                    tue: "út"
                    wed: "st"
                    thu: "čt"
                    fri: "pá"
                    sat: "so"
                )
                full: #(
                    sun: "neděle"
                    mon: "pondělí"
                    tue: "úterý"
                    wed: "středa"
                    thu: "čtvrtek"
                    fri: "pátek"
                    sat: "sobota"
                )
            )
            quarters: #(
                abbr: ["Q1" "Q2" "Q3" "Q4"]
                char: ["1" "2" "3" "4"]
                full: ["1. čtvrtletí" "2. čtvrtletí" "3. čtvrtletí" "4. čtvrtletí"]
            )
            periods: #(
                abbr: #(
                    am: "dop."
                    pm: "odp."
                )
                char: #(
                    am: "dop."
                    pm: "odp."
                )
                full: #(
                    am: "dop."
                    pm: "odp."
                )
            )
        )
        format: #(
            months: #(
                abbr: ["led" "úno" "bře" "dub" "kvě" "čvn" "čvc" "srp" "zář" "říj" "lis" "pro"]
                char: ["1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12"]
                full: ["ledna" "února" "března" "dubna" "května" "června" "července" "srpna" "září" "října" "listopadu" "prosince"]
            )
            days: #(
                abbr: #(
                    sun: "ne"
                    mon: "po"
                    tue: "út"
                    wed: "st"
                    thu: "čt"
                    fri: "pá"
                    sat: "so"
                )
                char: #(
                    sun: "N"
                    mon: "P"
                    tue: "Ú"
                    wed: "S"
                    thu: "Č"
                    fri: "P"
                    sat: "S"
                )
                short: #(
                    sun: "ne"
                    mon: "po"
                    tue: "út"
                    wed: "st"
                    thu: "čt"
                    fri: "pá"
                    sat: "so"
                )
                full: #(
                    sun: "neděle"
                    mon: "pondělí"
                    tue: "úterý"
                    wed: "středa"
                    thu: "čtvrtek"
                    fri: "pátek"
                    sat: "sobota"
                )
            )
            quarters: #(
                abbr: ["Q1" "Q2" "Q3" "Q4"]
                char: ["1" "2" "3" "4"]
                full: ["1. čtvrtletí" "2. čtvrtletí" "3. čtvrtletí" "4. čtvrtletí"]
            )
            periods: #(
                abbr: #(
                    am: "dop."
                    pm: "odp."
                )
                char: #(
                    am: "dop."
                    pm: "odp."
                )
                full: #(
                    am: "dop."
                    pm: "odp."
                )
            )
            eras: #(
                full: #(
                    BC: "před naším letopočtem"
                    AD: "našeho letopočtu"
                    BCE: "před naším letopočtem"
                    CE: "našeho letopočtu"
                )
                abbr: #(
                    BC: "př. n. l."
                    AD: "n. l."
                )
                char: #(
                    BC: "př.n.l."
                    AD: "n.l."
                )
            )
        )
        masks: #(
            date: #(
                full: "Sunday 31. December 1999"
                long: "31. December 1999"
                medium: "31. 12. 1999"
                short: "031.012.99"
            )
            time: #(
                full: "23:59:59 'GMT'+00:00"
                long: "23:59:59 'GMT'+0"
                medium: "23:59:59"
                short: "23:59"
            )
            datetime: #(
                full: "Sunday 31. December 1999 23:59:59 'GMT'+00:00"
                long: "31. December 1999 23:59:59 'GMT'+0"
                medium: "31. 12. 1999 23:59:59"
                short: "031.012.99 23:59"
            )
        )
    )
    currency-names: #(
        AFN: [char: "؋"]
        AMD: [char: "֏"]
        AOA: [char: "Kz"]
        ARS: [char: "$"]
        AUD: [char: "$" std: "AU$"]
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
        CNY: [char: "¥" std: "CN¥"]
        COP: [char: "$"]
        CRC: [char: "₡"]
        CSK: [std: "Kčs"]
        CUC: [char: "$"]
        CUP: [char: "$"]
        CZK: [std: "Kč"]
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
        ILS: [char: "₪"]
        INR: [char: "₹"]
        ISK: [char: "kr"]
        JMD: [char: "$"]
        JPY: [char: "¥" std: "JP¥"]
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
        RON: [char: "L"]
        RUB: [char: "₽"]
        RUR: [char: "р."]
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
        TWD: [std: "NT$"]
        UAH: [char: "₴"]
        USD: [char: "$" std: "US$"]
        UYU: [char: "$"]
        VEF: [char: "Bs"]
        VND: [char: "₫"]
        XAF: [std: "FCFA"]
        XCD: [char: "$" std: "EC$"]
        XEU: [std: "ECU"]
        XOF: [std: "F CFA"]
        XPF: [std: "CFPF"]
        ZAR: [char: "R"]
        ZMW: [char: "ZK"]
    )
)