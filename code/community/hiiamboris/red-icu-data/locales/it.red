#(
    lang-name: "italiano"
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
                    pct: "# ##0.%"
                    eng: "0.##############E3"
                )
                money: #(
                    std: "# ##0.00 $$"
                    acct: "# ##0.00 $$"
                )
            )
        )
        ordinal-suffixes: #(
            many: "°"
            other: "°"
        )
    )
    calendar: #(
        day1: mon
        standalone: #(
            months: #(
                abbr: ["gen" "feb" "mar" "apr" "mag" "giu" "lug" "ago" "set" "ott" "nov" "dic"]
                char: ["G" "F" "M" "A" "M" "G" "L" "A" "S" "O" "N" "D"]
                full: ["gennaio" "febbraio" "marzo" "aprile" "maggio" "giugno" "luglio" "agosto" "settembre" "ottobre" "novembre" "dicembre"]
            )
            days: #(
                abbr: #(
                    sun: "dom"
                    mon: "lun"
                    tue: "mar"
                    wed: "mer"
                    thu: "gio"
                    fri: "ven"
                    sat: "sab"
                )
                char: #(
                    sun: "D"
                    mon: "L"
                    tue: "M"
                    wed: "M"
                    thu: "G"
                    fri: "V"
                    sat: "S"
                )
                short: #(
                    sun: "dom"
                    mon: "lun"
                    tue: "mar"
                    wed: "mer"
                    thu: "gio"
                    fri: "ven"
                    sat: "sab"
                )
                full: #(
                    sun: "domenica"
                    mon: "lunedì"
                    tue: "martedì"
                    wed: "mercoledì"
                    thu: "giovedì"
                    fri: "venerdì"
                    sat: "sabato"
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
                    am: "m."
                    pm: "p."
                )
                full: #(
                    am: "AM"
                    pm: "PM"
                )
            )
        )
        format: #(
            months: #(
                abbr: ["gen" "feb" "mar" "apr" "mag" "giu" "lug" "ago" "set" "ott" "nov" "dic"]
                char: ["G" "F" "M" "A" "M" "G" "L" "A" "S" "O" "N" "D"]
                full: ["gennaio" "febbraio" "marzo" "aprile" "maggio" "giugno" "luglio" "agosto" "settembre" "ottobre" "novembre" "dicembre"]
            )
            days: #(
                abbr: #(
                    sun: "dom"
                    mon: "lun"
                    tue: "mar"
                    wed: "mer"
                    thu: "gio"
                    fri: "ven"
                    sat: "sab"
                )
                char: #(
                    sun: "D"
                    mon: "L"
                    tue: "M"
                    wed: "M"
                    thu: "G"
                    fri: "V"
                    sat: "S"
                )
                short: #(
                    sun: "dom"
                    mon: "lun"
                    tue: "mar"
                    wed: "mer"
                    thu: "gio"
                    fri: "ven"
                    sat: "sab"
                )
                full: #(
                    sun: "domenica"
                    mon: "lunedì"
                    tue: "martedì"
                    wed: "mercoledì"
                    thu: "giovedì"
                    fri: "venerdì"
                    sat: "sabato"
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
                    am: "m."
                    pm: "p."
                )
                full: #(
                    am: "AM"
                    pm: "PM"
                )
            )
            eras: #(
                full: #(
                    BC: "avanti Cristo"
                    AD: "dopo Cristo"
                    BCE: "avanti Era Volgare"
                    CE: "Era Volgare"
                )
                abbr: #(
                    BC: "a.C."
                    AD: "d.C."
                    BCE: "a.E.V."
                    CE: "E.V."
                )
                char: #(
                    BC: "aC"
                    AD: "dC"
                )
            )
        )
        masks: #(
            date: #(
                full: "Sunday 31 December 1999"
                long: "31 December 1999"
                medium: "31 Dec 1999"
                short: "031/012/99"
            )
            time: #(
                full: "023:59:59 'GMT'+00:00"
                long: "023:59:59 'GMT'+0"
                medium: "023:59:59"
                short: "023:59"
            )
            datetime: #(
                full: "Sunday 31 December 1999 023:59:59 'GMT'+00:00"
                long: "31 December 1999 023:59:59 'GMT'+0"
                medium: "31 Dec 1999, 023:59:59"
                short: "031/012/99, 023:59"
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
        BRL: [char: "R$"]
        BSD: [char: "$"]
        BWP: [char: "P"]
        BYN: [char: "Br"]
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
        EGP: [char: "£E"]
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
        HKD: [char: "$"]
        HNL: [char: "L"]
        HRK: [char: "kn"]
        HUF: [char: "Ft"]
        IDR: [char: "Rp"]
        ILS: [std: "₪"]
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
        NOK: [char: "NKr"]
        NPR: [char: "Rs"]
        NZD: [char: "$" std: "NZ$"]
        PHP: [std: "₱"]
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
        TWD: [char: "NT$"]
        UAH: [char: "₴"]
        USD: [char: "$"]
        UYU: [char: "$"]
        VEF: [char: "Bs"]
        VND: [char: "₫"]
        XAF: [std: "FCFA"]
        XCD: [char: "$" std: "EC$"]
        XOF: [std: "F CFA"]
        XPF: [std: "CFPF"]
        XXX: [std: "¤"]
        ZAR: [char: "R"]
        ZMW: [char: "ZK"]
    )
)