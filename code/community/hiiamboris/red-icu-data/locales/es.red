#(
    lang-name: "español"
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
            other: ".ª"
        )
    )
    calendar: #(
        day1: mon
        standalone: #(
            months: #(
                abbr: ["ene" "feb" "mar" "abr" "may" "jun" "jul" "ago" "sept" "oct" "nov" "dic"]
                char: ["E" "F" "M" "A" "M" "J" "J" "A" "S" "O" "N" "D"]
                full: ["enero" "febrero" "marzo" "abril" "mayo" "junio" "julio" "agosto" "septiembre" "octubre" "noviembre" "diciembre"]
            )
            days: #(
                abbr: #(
                    sun: "dom"
                    mon: "lun"
                    tue: "mar"
                    wed: "mié"
                    thu: "jue"
                    fri: "vie"
                    sat: "sáb"
                )
                char: #(
                    sun: "D"
                    mon: "L"
                    tue: "M"
                    wed: "X"
                    thu: "J"
                    fri: "V"
                    sat: "S"
                )
                short: #(
                    sun: "DO"
                    mon: "LU"
                    tue: "MA"
                    wed: "MI"
                    thu: "JU"
                    fri: "VI"
                    sat: "SA"
                )
                full: #(
                    sun: "domingo"
                    mon: "lunes"
                    tue: "martes"
                    wed: "miércoles"
                    thu: "jueves"
                    fri: "viernes"
                    sat: "sábado"
                )
            )
            quarters: #(
                abbr: ["T1" "T2" "T3" "T4"]
                char: ["1" "2" "3" "4"]
                full: ["1.er trimestre" "2.º trimestre" "3.er trimestre" "4.º trimestre"]
            )
            periods: #(
                abbr: #(
                    am: "a. m."
                    pm: "p. m."
                )
                char: #(
                    am: "a. m."
                    pm: "p. m."
                )
                full: #(
                    am: "a. m."
                    pm: "p. m."
                )
            )
        )
        format: #(
            months: #(
                abbr: ["ene" "feb" "mar" "abr" "may" "jun" "jul" "ago" "sept" "oct" "nov" "dic"]
                char: ["E" "F" "M" "A" "M" "J" "J" "A" "S" "O" "N" "D"]
                full: ["enero" "febrero" "marzo" "abril" "mayo" "junio" "julio" "agosto" "septiembre" "octubre" "noviembre" "diciembre"]
            )
            days: #(
                abbr: #(
                    sun: "dom"
                    mon: "lun"
                    tue: "mar"
                    wed: "mié"
                    thu: "jue"
                    fri: "vie"
                    sat: "sáb"
                )
                char: #(
                    sun: "D"
                    mon: "L"
                    tue: "M"
                    wed: "X"
                    thu: "J"
                    fri: "V"
                    sat: "S"
                )
                short: #(
                    sun: "DO"
                    mon: "LU"
                    tue: "MA"
                    wed: "MI"
                    thu: "JU"
                    fri: "VI"
                    sat: "SA"
                )
                full: #(
                    sun: "domingo"
                    mon: "lunes"
                    tue: "martes"
                    wed: "miércoles"
                    thu: "jueves"
                    fri: "viernes"
                    sat: "sábado"
                )
            )
            quarters: #(
                abbr: ["T1" "T2" "T3" "T4"]
                char: ["1" "2" "3" "4"]
                full: ["1.er trimestre" "2.º trimestre" "3.er trimestre" "4.º trimestre"]
            )
            periods: #(
                abbr: #(
                    am: "a. m."
                    pm: "p. m."
                )
                char: #(
                    am: "a. m."
                    pm: "p. m."
                )
                full: #(
                    am: "a. m."
                    pm: "p. m."
                )
            )
            eras: #(
                full: #(
                    BC: "antes de Cristo"
                    AD: "después de Cristo"
                    BCE: "antes de la era común"
                    CE: "era común"
                )
                abbr: #(
                    BC: "a. C."
                    AD: "d. C."
                    BCE: "a. e. c."
                    CE: "e. c."
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
                medium: "31 Dec 1999"
                short: "31/12/99"
            )
            time: #(
                full: "23:59:59 ('GMT'+00:00)"
                long: "23:59:59 'GMT'+0"
                medium: "23:59:59"
                short: "23:59"
            )
            datetime: #(
                full: {Sunday, 31 'de' December 'de' 1999, 23:59:59 ('GMT'+00:00)}
                long: "31 'de' December 'de' 1999, 23:59:59 'GMT'+0"
                medium: "31 Dec 1999, 23:59:59"
                short: "31/12/99, 23:59"
            )
        )
    )
    currency-names: #(
        AFN: [char: "؋"]
        AMD: [char: "֏"]
        AOA: [char: "Kz"]
        ARS: [char: "$"]
        AUD: [char: "$"]
        AZN: [char: "₼"]
        BAM: [char: "KM"]
        BBD: [char: "$"]
        BDT: [char: "৳"]
        BMD: [char: "$"]
        BND: [char: "$"]
        BOB: [char: "Bs"]
        BRL: [char: "R$"]
        BSD: [char: "$"]
        BWP: [char: "P"]
        BYN: [char: "р."]
        BZD: [char: "$"]
        CAD: [char: "$"]
        CLP: [char: "$"]
        CNY: [char: "¥"]
        COP: [char: "$"]
        CRC: [char: "₡"]
        CUC: [char: "$"]
        CUP: [char: "$"]
        CZK: [char: "Kč"]
        DKK: [char: "kr"]
        DOP: [char: "$"]
        ESP: [std: "₧"]
        EUR: [std: "€"]
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
        ISK: [char: "kr"]
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
        SYP: [char: "£"]
        THB: [std: "฿"]
        TOP: [char: "T$"]
        TRY: [char: "₺"]
        TTD: [char: "$"]
        TWD: [char: "NT$"]
        UAH: [char: "₴"]
        USD: [char: "$" std: "US$"]
        UYU: [char: "$"]
        VEF: [char: "Bs"]
        VND: [std: "₫"]
        XCD: [char: "$"]
        XPF: [std: "CFPF"]
        XXX: [std: "¤"]
        ZAR: [char: "R"]
        ZMW: [char: "ZK"]
    )
)