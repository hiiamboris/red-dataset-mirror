#(
    lang-name: "Afrikaans"
    region-name: "Suid-Afrika"
    currency: ZAR
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
                    std: "$$# ##0.00"
                    acct: "($$# ##0.00)"
                )
            )
        )
        ordinal-suffixes: #(
            other: "e"
        )
    )
    calendar: #(
        day1: sun
        standalone: #(
            months: #(
                abbr: ["Jan." "Feb." "Mrt." "Apr." "Mei" "Jun." "Jul." "Aug." "Sep." "Okt." "Nov." "Des."]
                char: ["J" "F" "M" "A" "M" "J" "J" "A" "S" "O" "N" "D"]
                full: ["Januarie" "Februarie" "Maart" "April" "Mei" "Junie" "Julie" "Augustus" "September" "Oktober" "November" "Desember"]
            )
            days: #(
                abbr: #(
                    sun: "So."
                    mon: "Ma."
                    tue: "Di."
                    wed: "Wo."
                    thu: "Do."
                    fri: "Vr."
                    sat: "Sa."
                )
                char: #(
                    sun: "S"
                    mon: "M"
                    tue: "D"
                    wed: "W"
                    thu: "D"
                    fri: "V"
                    sat: "S"
                )
                short: #(
                    sun: "So."
                    mon: "Ma."
                    tue: "Di."
                    wed: "Wo."
                    thu: "Do."
                    fri: "Vr."
                    sat: "Sa."
                )
                full: #(
                    sun: "Sondag"
                    mon: "Maandag"
                    tue: "Dinsdag"
                    wed: "Woensdag"
                    thu: "Donderdag"
                    fri: "Vrydag"
                    sat: "Saterdag"
                )
            )
            quarters: #(
                abbr: ["K1" "K2" "K3" "K4"]
                char: ["1" "2" "3" "4"]
                full: ["1ste kwartaal" "2de kwartaal" "3de kwartaal" "4de kwartaal"]
            )
            periods: #(
                abbr: #(
                    am: "vm."
                    pm: "nm."
                )
                char: #(
                    am: "v"
                    pm: "n"
                )
                full: #(
                    am: "vm."
                    pm: "nm."
                )
            )
        )
        format: #(
            months: #(
                abbr: ["Jan." "Feb." "Mrt." "Apr." "Mei" "Jun." "Jul." "Aug." "Sep." "Okt." "Nov." "Des."]
                char: ["J" "F" "M" "A" "M" "J" "J" "A" "S" "O" "N" "D"]
                full: ["Januarie" "Februarie" "Maart" "April" "Mei" "Junie" "Julie" "Augustus" "September" "Oktober" "November" "Desember"]
            )
            days: #(
                abbr: #(
                    sun: "So."
                    mon: "Ma."
                    tue: "Di."
                    wed: "Wo."
                    thu: "Do."
                    fri: "Vr."
                    sat: "Sa."
                )
                char: #(
                    sun: "S"
                    mon: "M"
                    tue: "D"
                    wed: "W"
                    thu: "D"
                    fri: "V"
                    sat: "S"
                )
                short: #(
                    sun: "So."
                    mon: "Ma."
                    tue: "Di."
                    wed: "Wo."
                    thu: "Do."
                    fri: "Vr."
                    sat: "Sa."
                )
                full: #(
                    sun: "Sondag"
                    mon: "Maandag"
                    tue: "Dinsdag"
                    wed: "Woensdag"
                    thu: "Donderdag"
                    fri: "Vrydag"
                    sat: "Saterdag"
                )
            )
            quarters: #(
                abbr: ["K1" "K2" "K3" "K4"]
                char: ["1" "2" "3" "4"]
                full: ["1ste kwartaal" "2de kwartaal" "3de kwartaal" "4de kwartaal"]
            )
            periods: #(
                abbr: #(
                    am: "vm."
                    pm: "nm."
                )
                char: #(
                    am: "v"
                    pm: "n"
                )
                full: #(
                    am: "vm."
                    pm: "nm."
                )
            )
            eras: #(
                full: #(
                    BC: "voor Christus"
                    AD: "na Christus"
                    BCE: "voor die gewone jaartelling"
                    CE: "gewone jaartelling"
                )
                abbr: #(
                    BC: "v.C."
                    AD: "n.C."
                    BCE: "v.g.j."
                    CE: "g.j."
                )
                char: #(
                    BC: "v.C."
                    AD: "n.C."
                    BCE: "vgj"
                    CE: "gj"
                )
            )
        )
        masks: #(
            date: #(
                full: "Sunday 031 December 1999"
                long: "031 December 1999"
                medium: "031 Dec 1999"
                short: "1999-012-031"
            )
            time: #(
                full: "023:59:59 'GMT'+00:00"
                long: "023:59:59 'GMT'+0"
                medium: "023:59:59"
                short: "023:59"
            )
            datetime: #(
                full: "Sunday 031 December 1999 023:59:59 'GMT'+00:00"
                long: "031 December 1999 023:59:59 'GMT'+0"
                medium: "031 Dec 1999 023:59:59"
                short: "1999-012-031 023:59"
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
        CAD: [char: "$"]
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
        MXN: [char: "$"]
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
        RON: [char: "leu"]
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
        USD: [char: "$"]
        UYU: [char: "$"]
        VEF: [char: "Bs"]
        VND: [std: "₫"]
        XAF: [std: "FCFA"]
        XCD: [char: "$" std: "EC$"]
        XOF: [std: "F CFA"]
        XPF: [std: "CFPF"]
        XXX: [std: "¤"]
        ZAR: [std: "R"]
        ZMW: [char: "ZK"]
    )
)