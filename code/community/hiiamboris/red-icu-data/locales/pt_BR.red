#(
    lang-name: "português"
    region-name: "Brasil"
    currency: BRL
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
                group: "."
                decimal: ","
            )
            masks: #(
                number: #(
                    dec: "# ##0.###"
                    sci: "0.##############E0"
                    pct: "# ##0.%"
                    eng: "0.##############E3"
                )
                money: #(
                    std: "$$ # ##0.00"
                    acct: "$$ # ##0.00"
                )
            )
        )
        ordinal-suffixes: #(
            other: "ª"
        )
    )
    calendar: #(
        day1: sun
        standalone: #(
            months: #(
                char: ["J" "F" "M" "A" "M" "J" "J" "A" "S" "O" "N" "D"]
                full: ["janeiro" "fevereiro" "março" "abril" "maio" "junho" "julho" "agosto" "setembro" "outubro" "novembro" "dezembro"]
                abbr: ["jan." "fev." "mar." "abr." "mai." "jun." "jul." "ago." "set." "out." "nov." "dez."]
            )
            days: #(
                char: #(
                    sun: "D"
                    mon: "S"
                    tue: "T"
                    wed: "Q"
                    thu: "Q"
                    fri: "S"
                    sat: "S"
                )
                full: #(
                    sun: "domingo"
                    mon: "segunda-feira"
                    tue: "terça-feira"
                    wed: "quarta-feira"
                    thu: "quinta-feira"
                    fri: "sexta-feira"
                    sat: "sábado"
                )
                abbr: #(
                    sun: "dom."
                    mon: "seg."
                    tue: "ter."
                    wed: "qua."
                    thu: "qui."
                    fri: "sex."
                    sat: "sáb."
                )
                short: #(
                    sun: "Sun"
                    mon: "Mon"
                    tue: "Tue"
                    wed: "Wed"
                    thu: "Thu"
                    fri: "Fri"
                    sat: "Sat"
                )
            )
            quarters: #(
                abbr: ["T1" "T2" "T3" "T4"]
                char: ["1" "2" "3" "4"]
                full: ["1º trimestre" "2º trimestre" "3º trimestre" "4º trimestre"]
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
                abbr: ["jan." "fev." "mar." "abr." "mai." "jun." "jul." "ago." "set." "out." "nov." "dez."]
                char: ["J" "F" "M" "A" "M" "J" "J" "A" "S" "O" "N" "D"]
                full: ["janeiro" "fevereiro" "março" "abril" "maio" "junho" "julho" "agosto" "setembro" "outubro" "novembro" "dezembro"]
            )
            days: #(
                abbr: #(
                    sun: "dom."
                    mon: "seg."
                    tue: "ter."
                    wed: "qua."
                    thu: "qui."
                    fri: "sex."
                    sat: "sáb."
                )
                char: #(
                    sun: "D"
                    mon: "S"
                    tue: "T"
                    wed: "Q"
                    thu: "Q"
                    fri: "S"
                    sat: "S"
                )
                full: #(
                    sun: "domingo"
                    mon: "segunda-feira"
                    tue: "terça-feira"
                    wed: "quarta-feira"
                    thu: "quinta-feira"
                    fri: "sexta-feira"
                    sat: "sábado"
                )
                short: #(
                    sun: "Sun"
                    mon: "Mon"
                    tue: "Tue"
                    wed: "Wed"
                    thu: "Thu"
                    fri: "Fri"
                    sat: "Sat"
                )
            )
            quarters: #(
                abbr: ["T1" "T2" "T3" "T4"]
                char: ["1" "2" "3" "4"]
                full: ["1º trimestre" "2º trimestre" "3º trimestre" "4º trimestre"]
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
                    BC: "antes de Cristo"
                    AD: "depois de Cristo"
                    BCE: "antes da Era Comum"
                    CE: "Era Comum"
                )
                abbr: #(
                    BC: "a.C."
                    AD: "d.C."
                    BCE: "AEC"
                    CE: "EC"
                )
                char: #(
                    BC: "BCE"
                    AD: "CE"
                )
            )
        )
        masks: #(
            date: #(
                full: "Sunday, 31 'de' December 'de' 1999"
                long: "31 'de' December 'de' 1999"
                medium: "31 'de' Dec 'de' 1999"
                short: "031/012/1999"
            )
            time: #(
                full: "023:59:59 'GMT'+00:00"
                long: "023:59:59 'GMT'+0"
                medium: "023:59:59"
                short: "023:59"
            )
            datetime: #(
                full: {Sunday, 31 'de' December 'de' 1999 023:59:59 'GMT'+00:00}
                long: "31 'de' December 'de' 1999 023:59:59 'GMT'+0"
                medium: "31 'de' Dec 'de' 1999 023:59:59"
                short: "031/012/1999 023:59"
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
        PTE: [std: "Esc."]
        PYG: [char: "₲"]
        RON: [char: "L"]
        RUB: [char: "₽"]
        RWF: [char: "RF"]
        SBD: [char: "$"]
        SEK: [char: "kr"]
        SGD: [char: "$"]
        SHP: [char: "£"]
        SRD: [char: "$"]
        SSP: [char: "£"]
        STN: [char: "Db"]
        SYP: [char: "S£"]
        THB: [std: "฿"]
        TOP: [char: "T$"]
        TRY: [char: "₺"]
        TTD: [char: "$"]
        TWD: [std: "NT$"]
        UAH: [char: "₴"]
        USD: [char: "$" std: "US$"]
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