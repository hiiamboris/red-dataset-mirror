#(
    lang-name: "polski"
    region-name: "Polska"
    currency: PLN
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
                    pct: "# ##0.%"
                    eng: "0.##############E3"
                )
                money: #(
                    std: "# ##0.00 $$"
                    acct: "(# ##0.00 $$)"
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
                abbr: ["sty" "lut" "mar" "kwi" "maj" "cze" "lip" "sie" "wrz" "paź" "lis" "gru"]
                char: ["S" "L" "M" "K" "M" "C" "L" "S" "W" "P" "L" "G"]
                full: ["styczeń" "luty" "marzec" "kwiecień" "maj" "czerwiec" "lipiec" "sierpień" "wrzesień" "październik" "listopad" "grudzień"]
            )
            days: #(
                abbr: #(
                    sun: "niedz."
                    mon: "pon."
                    tue: "wt."
                    wed: "śr."
                    thu: "czw."
                    fri: "pt."
                    sat: "sob."
                )
                char: #(
                    sun: "N"
                    mon: "P"
                    tue: "W"
                    wed: "Ś"
                    thu: "C"
                    fri: "P"
                    sat: "S"
                )
                short: #(
                    sun: "nie"
                    mon: "pon"
                    tue: "wto"
                    wed: "śro"
                    thu: "czw"
                    fri: "pią"
                    sat: "sob"
                )
                full: #(
                    sun: "niedziela"
                    mon: "poniedziałek"
                    tue: "wtorek"
                    wed: "środa"
                    thu: "czwartek"
                    fri: "piątek"
                    sat: "sobota"
                )
            )
            quarters: #(
                abbr: ["I kw." "II kw." "III kw." "IV kw."]
                char: ["1" "2" "3" "4"]
                full: ["I kwartał" "II kwartał" "III kwartał" "IV kwartał"]
            )
            periods: #(
                abbr: #(
                    am: "AM"
                    pm: "PM"
                )
                char: #(
                    am: "a"
                    pm: "p"
                )
                full: #(
                    am: "AM"
                    pm: "PM"
                )
            )
        )
        format: #(
            months: #(
                abbr: ["sty" "lut" "mar" "kwi" "maj" "cze" "lip" "sie" "wrz" "paź" "lis" "gru"]
                char: ["s" "l" "m" "k" "m" "c" "l" "s" "w" "p" "l" "g"]
                full: ["stycznia" "lutego" "marca" "kwietnia" "maja" "czerwca" "lipca" "sierpnia" "września" "października" "listopada" "grudnia"]
            )
            days: #(
                abbr: #(
                    sun: "niedz."
                    mon: "pon."
                    tue: "wt."
                    wed: "śr."
                    thu: "czw."
                    fri: "pt."
                    sat: "sob."
                )
                char: #(
                    sun: "n"
                    mon: "p"
                    tue: "w"
                    wed: "ś"
                    thu: "c"
                    fri: "p"
                    sat: "s"
                )
                short: #(
                    sun: "nie"
                    mon: "pon"
                    tue: "wto"
                    wed: "śro"
                    thu: "czw"
                    fri: "pią"
                    sat: "sob"
                )
                full: #(
                    sun: "niedziela"
                    mon: "poniedziałek"
                    tue: "wtorek"
                    wed: "środa"
                    thu: "czwartek"
                    fri: "piątek"
                    sat: "sobota"
                )
            )
            quarters: #(
                abbr: ["I kw." "II kw." "III kw." "IV kw."]
                char: ["1" "2" "3" "4"]
                full: ["I kwartał" "II kwartał" "III kwartał" "IV kwartał"]
            )
            periods: #(
                abbr: #(
                    am: "AM"
                    pm: "PM"
                )
                char: #(
                    am: "a"
                    pm: "p"
                )
                full: #(
                    am: "AM"
                    pm: "PM"
                )
            )
            eras: #(
                full: #(
                    BC: "przed naszą erą"
                    AD: "naszej ery"
                    BCE: "p.n.e."
                    CE: "n.e."
                )
                abbr: #(
                    BC: "p.n.e."
                    AD: "n.e."
                    BCE: "BCE"
                    CE: "CE"
                )
                char: #(
                    BC: "BCE"
                    AD: "CE"
                )
            )
        )
        masks: #(
            date: #(
                full: "Sunday, 31 December 1999"
                long: "31 December 1999"
                medium: "31 Dec 1999"
                short: "31.012.1999"
            )
            time: #(
                full: "023:59:59 'GMT'+00:00"
                long: "023:59:59 'GMT'+0"
                medium: "023:59:59"
                short: "023:59"
            )
            datetime: #(
                full: "Sunday, 31 December 1999 023:59:59 'GMT'+00:00"
                long: "31 December 1999 023:59:59 'GMT'+0"
                medium: "31 Dec 1999, 023:59:59"
                short: "31.012.1999, 023:59"
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
        BRL: [std: "R$"]
        BSD: [char: "$"]
        BWP: [char: "P"]
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
        EGP: [char: "E£"]
        ESP: [char: "₧"]
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
        PLN: [std: "zł"]
        PYG: [char: "₲"]
        RON: [char: "lej"]
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