#(
    lang-name: "français"
    region-name: "Canada"
    currency: CAD
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
                approximately: "≈"
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
        day1: sun
        standalone: #(
            months: #(
                abbr: ["janv." "févr." "mars" "avr." "mai" "juin" "juill." "août" "sept." "oct." "nov." "déc."]
                char: ["J" "F" "M" "A" "M" "J" "J" "A" "S" "O" "N" "D"]
                full: ["janvier" "février" "mars" "avril" "mai" "juin" "juillet" "août" "septembre" "octobre" "novembre" "décembre"]
            )
            days: #(
                char: #(
                    sun: "D"
                    mon: "L"
                    tue: "M"
                    wed: "M"
                    thu: "J"
                    fri: "V"
                    sat: "S"
                )
                abbr: #(
                    sun: "dim."
                    mon: "lun."
                    tue: "mar."
                    wed: "mer."
                    thu: "jeu."
                    fri: "ven."
                    sat: "sam."
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
                    am: "a.m."
                    pm: "p.m."
                )
                char: #(
                    am: "a.m."
                    pm: "p.m."
                )
                full: #(
                    am: "a.m."
                    pm: "p.m."
                )
            )
        )
        format: #(
            months: #(
                abbr: ["janv." "févr." "mars" "avr." "mai" "juin" "juill." "août" "sept." "oct." "nov." "déc."]
                char: ["J" "F" "M" "A" "M" "J" "J" "A" "S" "O" "N" "D"]
                full: ["janvier" "février" "mars" "avril" "mai" "juin" "juillet" "août" "septembre" "octobre" "novembre" "décembre"]
            )
            days: #(
                char: #(
                    sun: "D"
                    mon: "L"
                    tue: "M"
                    wed: "M"
                    thu: "J"
                    fri: "V"
                    sat: "S"
                )
                abbr: #(
                    sun: "dim."
                    mon: "lun."
                    tue: "mar."
                    wed: "mer."
                    thu: "jeu."
                    fri: "ven."
                    sat: "sam."
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
                    am: "a.m."
                    pm: "p.m."
                )
                char: #(
                    am: "a"
                    pm: "p"
                )
                full: #(
                    am: "a.m."
                    pm: "p.m."
                )
            )
            eras: #(
                full: #(
                    BCE: "avant l’ère chrétienne"
                    CE: "de l’ère chrétienne"
                    BC: "avant Jésus-Christ"
                    AD: "après Jésus-Christ"
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
                short: "1999-012-031"
            )
            time: #(
                full: "023 'h' 59 'min' 59 's' 'UTC'+00:00"
                long: "023 'h' 59 'min' 59 's' 'UTC'+0"
                medium: "023 'h' 59 'min' 59 's'"
                short: "023 'h' 59"
            )
            datetime: #(
                full: {Sunday 31 December 1999 'à' 023 'h' 59 'min' 59 's' 'UTC'+00:00}
                long: {31 December 1999 'à' 023 'h' 59 'min' 59 's' 'UTC'+0}
                medium: "31 Dec 1999, 023 'h' 59 'min' 59 's'"
                short: "1999-012-031 023 'h' 59"
            )
        )
    )
    currency-names: #(
        AFN: [char: "؋"]
        AMD: [char: "֏"]
        AOA: [char: "Kz"]
        ARS: [char: "$"]
        AUD: [char: "$" std: "$ AU"]
        AZN: [char: "₼"]
        BAM: [char: "KM"]
        BBD: [char: "$"]
        BDT: [char: "৳"]
        BEF: [std: "FB"]
        BMD: [char: "$"]
        BND: [char: "$"]
        BOB: [char: "Bs"]
        BRL: [std: "R$"]
        BSD: [char: "$"]
        BWP: [char: "P"]
        BYN: [char: "Br"]
        BZD: [char: "$"]
        CAD: [std: "$"]
        CLP: [char: "$"]
        CNY: [char: "¥" std: "CN¥"]
        COP: [char: "$"]
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
        FJD: [char: "$"]
        FKP: [char: "£"]
        FRF: [std: "F"]
        GBP: [std: "£"]
        GHS: [char: "GH₵"]
        GIP: [char: "£"]
        GNF: [char: "FG"]
        GTQ: [char: "Q"]
        GYD: [char: "$"]
        HKD: [char: "$" std: "$ HK"]
        HNL: [char: "L"]
        HRK: [char: "kn"]
        HUF: [char: "Ft"]
        IDR: [char: "Rp"]
        IEP: [std: "£IE"]
        ILP: [std: "£IL"]
        ILS: [char: "₪"]
        INR: [char: "₹"]
        ISK: [char: "kr"]
        ITL: [std: "₤IT"]
        JMD: [char: "$"]
        JPY: [std: "¥"]
        KHR: [char: "៛"]
        KMF: [char: "CF"]
        KPW: [char: "₩"]
        KRW: [char: "₩"]
        KYD: [char: "$"]
        KZT: [char: "₸"]
        LAK: [char: "₭"]
        LBP: [char: "£L"]
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
        MXN: [char: "$"]
        MYR: [char: "RM"]
        NAD: [char: "$"]
        NGN: [char: "₦"]
        NIO: [char: "C$"]
        NOK: [char: "kr"]
        NPR: [char: "Rs"]
        NZD: [char: "$" std: "$ NZ"]
        PHP: [char: "₱"]
        PKR: [char: "Rs"]
        PLN: [char: "zł"]
        PYG: [char: "₲"]
        RHD: [std: "$RH"]
        RON: [char: "L"]
        RUB: [char: "₽"]
        RUR: [char: "р."]
        RWF: [char: "FR"]
        SBD: [char: "$"]
        SEK: [char: "kr"]
        SGD: [char: "$" std: "$ SG"]
        SHP: [char: "£"]
        SRD: [char: "$"]
        SSP: [char: "£"]
        STN: [char: "Db"]
        SYP: [char: "£"]
        THB: [char: "฿"]
        TOP: [char: "$T"]
        TRY: [char: "₺"]
        TTD: [char: "$"]
        TWD: [char: "NT$"]
        UAH: [char: "₴"]
        USD: [char: "$" std: "$ US"]
        UYU: [char: "$"]
        VEF: [char: "Bs"]
        VND: [char: "₫"]
        XCD: [char: "$"]
        XDR: [std: "DTS"]
        ZAR: [char: "R"]
        ZMW: [char: "ZK"]
    )
)