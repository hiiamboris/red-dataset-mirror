#(
    lang-name: "français"
    region-name: "France"
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
                approximately: "≃"
                minus: "-"
                plus: "+"
                percent: "%"
                list: ";"
                group: " "
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
                    acct: "(# ##0.00 $$)"
                )
            )
        )
        ordinal-suffixes: #(
            one: "re"
            other: "e"
        )
    )
    calendar: #(
        day1: mon
        standalone: #(
            months: #(
                abbr: ["janv." "févr." "mars" "avr." "mai" "juin" "juil." "août" "sept." "oct." "nov." "déc."]
                char: ["J" "F" "M" "A" "M" "J" "J" "A" "S" "O" "N" "D"]
                full: ["janvier" "février" "mars" "avril" "mai" "juin" "juillet" "août" "septembre" "octobre" "novembre" "décembre"]
            )
            days: #(
                abbr: #(
                    sun: "dim."
                    mon: "lun."
                    tue: "mar."
                    wed: "mer."
                    thu: "jeu."
                    fri: "ven."
                    sat: "sam."
                )
                char: #(
                    sun: "D"
                    mon: "L"
                    tue: "M"
                    wed: "M"
                    thu: "J"
                    fri: "V"
                    sat: "S"
                )
                short: #(
                    sun: "di"
                    mon: "lu"
                    tue: "ma"
                    wed: "me"
                    thu: "je"
                    fri: "ve"
                    sat: "sa"
                )
                full: #(
                    sun: "dimanche"
                    mon: "lundi"
                    tue: "mardi"
                    wed: "mercredi"
                    thu: "jeudi"
                    fri: "vendredi"
                    sat: "samedi"
                )
            )
            quarters: #(
                abbr: ["T1" "T2" "T3" "T4"]
                char: ["1" "2" "3" "4"]
                full: ["1er trimestre" "2e trimestre" "3e trimestre" "4e trimestre"]
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
                abbr: ["janv." "févr." "mars" "avr." "mai" "juin" "juil." "août" "sept." "oct." "nov." "déc."]
                char: ["J" "F" "M" "A" "M" "J" "J" "A" "S" "O" "N" "D"]
                full: ["janvier" "février" "mars" "avril" "mai" "juin" "juillet" "août" "septembre" "octobre" "novembre" "décembre"]
            )
            days: #(
                abbr: #(
                    sun: "dim."
                    mon: "lun."
                    tue: "mar."
                    wed: "mer."
                    thu: "jeu."
                    fri: "ven."
                    sat: "sam."
                )
                char: #(
                    sun: "D"
                    mon: "L"
                    tue: "M"
                    wed: "M"
                    thu: "J"
                    fri: "V"
                    sat: "S"
                )
                short: #(
                    sun: "di"
                    mon: "lu"
                    tue: "ma"
                    wed: "me"
                    thu: "je"
                    fri: "ve"
                    sat: "sa"
                )
                full: #(
                    sun: "dimanche"
                    mon: "lundi"
                    tue: "mardi"
                    wed: "mercredi"
                    thu: "jeudi"
                    fri: "vendredi"
                    sat: "samedi"
                )
            )
            quarters: #(
                abbr: ["T1" "T2" "T3" "T4"]
                char: ["1" "2" "3" "4"]
                full: ["1er trimestre" "2e trimestre" "3e trimestre" "4e trimestre"]
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
                    BC: "avant Jésus-Christ"
                    AD: "après Jésus-Christ"
                    BCE: "avant l’ère commune"
                    CE: "de l’ère commune"
                )
                abbr: #(
                    BC: "av. J.-C."
                    AD: "ap. J.-C."
                    BCE: "AEC"
                    CE: "EC"
                )
                char: #(
                    BC: "av. J.-C."
                    AD: "ap. J.-C."
                    BCE: "AEC"
                    CE: "EC"
                )
            )
        )
        masks: #(
            date: #(
                full: "Sunday 31 December 1999"
                long: "31 December 1999"
                medium: "31 Dec 1999"
                short: "031/012/1999"
            )
            time: #(
                full: "023:59:59 'UTC'+00:00"
                long: "023:59:59 'UTC'+0"
                medium: "023:59:59"
                short: "023:59"
            )
            datetime: #(
                full: "Sunday 31 December 1999 'à' 023:59:59 'UTC'+00:00"
                long: "31 December 1999 'à' 023:59:59 'UTC'+0"
                medium: "31 Dec 1999, 023:59:59"
                short: "031/012/1999 023:59"
            )
        )
    )
    currency-names: #(
        AFN: [char: "؋"]
        AMD: [char: "֏"]
        AOA: [char: "Kz"]
        ARS: [char: "$" std: "$AR"]
        AUD: [char: "$" std: "$AU"]
        AZN: [char: "₼"]
        BAM: [char: "KM"]
        BBD: [char: "$"]
        BDT: [char: "৳"]
        BEF: [std: "FB"]
        BMD: [char: "$" std: "$BM"]
        BND: [char: "$" std: "$BN"]
        BOB: [char: "Bs"]
        BRL: [std: "R$"]
        BSD: [char: "$"]
        BWP: [char: "P"]
        BYN: [char: "р."]
        BZD: [char: "$" std: "$BZ"]
        CAD: [char: "$" std: "$CA"]
        CLP: [char: "$" std: "$CL"]
        CNY: [char: "¥"]
        COP: [char: "$" std: "$CO"]
        CRC: [char: "₡"]
        CUC: [char: "$"]
        CUP: [char: "$"]
        CYP: [std: "£CY"]
        CZK: [char: "Kč"]
        DKK: [char: "kr"]
        DOP: [char: "$"]
        EGP: [char: "£E"]
        ESP: [char: "₧"]
        EUR: [std: "€"]
        FJD: [char: "$" std: "$FJ"]
        FKP: [char: "£" std: "£FK"]
        FRF: [std: "F"]
        GBP: [char: "£" std: "£GB"]
        GEL: [char: "₾"]
        GHS: [char: "GH₵"]
        GIP: [char: "£" std: "£GI"]
        GNF: [char: "FG"]
        GTQ: [char: "Q"]
        GYD: [char: "$"]
        HKD: [char: "$"]
        HNL: [char: "L"]
        HRK: [char: "kn"]
        HUF: [char: "Ft"]
        IDR: [char: "Rp"]
        IEP: [std: "£IE"]
        ILP: [std: "£IL"]
        ILS: [std: "₪"]
        INR: [std: "₹"]
        ISK: [char: "kr"]
        ITL: [std: "₤IT"]
        JMD: [char: "$"]
        JPY: [char: "¥"]
        KHR: [char: "៛"]
        KMF: [char: "FC"]
        KPW: [char: "₩"]
        KRW: [std: "₩"]
        KYD: [char: "$"]
        KZT: [char: "₸"]
        LAK: [char: "₭"]
        LBP: [char: "£L" std: "£LB"]
        LKR: [char: "Rs"]
        LRD: [char: "$"]
        LTL: [char: "Lt"]
        LVL: [char: "Ls"]
        MAF: [std: "fMA"]
        MGA: [char: "Ar"]
        MGF: [std: "Fmg"]
        MMK: [char: "K"]
        MNT: [char: "₮"]
        MTP: [std: "£MT"]
        MUR: [char: "Rs"]
        MXN: [char: "$" std: "$MX"]
        MYR: [char: "RM"]
        NAD: [char: "$" std: "$NA"]
        NGN: [char: "₦"]
        NIO: [char: "$C"]
        NOK: [char: "kr"]
        NPR: [char: "Rs"]
        NZD: [char: "$" std: "$NZ"]
        PHP: [char: "₱"]
        PKR: [char: "Rs"]
        PLN: [char: "zł"]
        PYG: [char: "₲"]
        RHD: [std: "$RH"]
        RON: [char: "L"]
        RUB: [char: "₽"]
        RUR: [char: "р."]
        RWF: [char: "FR"]
        SBD: [char: "$" std: "$SB"]
        SEK: [char: "kr"]
        SGD: [char: "$" std: "$SG"]
        SHP: [char: "£"]
        SRD: [char: "$" std: "$SR"]
        SSP: [char: "£"]
        STN: [char: "Db"]
        SYP: [char: "£"]
        THB: [char: "฿"]
        TOP: [char: "$T"]
        TRY: [char: "₺"]
        TTD: [char: "$" std: "$TT"]
        TWD: [char: "NT$"]
        UAH: [char: "₴"]
        USD: [char: "$" std: "$US"]
        UYU: [char: "$" std: "$UY"]
        VEF: [char: "Bs"]
        VND: [std: "₫"]
        WST: [std: "$WS"]
        XAF: [std: "FCFA"]
        XCD: [char: "$"]
        XDR: [std: "DTS"]
        XOF: [std: "F CFA"]
        XPF: [std: "FCFP"]
        ZAR: [char: "R"]
        ZMW: [char: "Kw"]
    )
)