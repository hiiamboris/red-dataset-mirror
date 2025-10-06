#(
    lang-name: "Türkçe"
    region-name: "Türkiye"
    currency: TRY
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
                    pct: "%# ##0."
                    eng: "0.##############E3"
                )
                money: #(
                    std: "$$# ##0.00"
                    acct: "($$# ##0.00)"
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
                abbr: ["Oca" "Şub" "Mar" "Nis" "May" "Haz" "Tem" "Ağu" "Eyl" "Eki" "Kas" "Ara"]
                char: ["O" "Ş" "M" "N" "M" "H" "T" "A" "E" "E" "K" "A"]
                full: ["Ocak" "Şubat" "Mart" "Nisan" "Mayıs" "Haziran" "Temmuz" "Ağustos" "Eylül" "Ekim" "Kasım" "Aralık"]
            )
            days: #(
                abbr: #(
                    sun: "Paz"
                    mon: "Pzt"
                    tue: "Sal"
                    wed: "Çar"
                    thu: "Per"
                    fri: "Cum"
                    sat: "Cmt"
                )
                char: #(
                    sun: "P"
                    mon: "P"
                    tue: "S"
                    wed: "Ç"
                    thu: "P"
                    fri: "C"
                    sat: "C"
                )
                short: #(
                    sun: "Pa"
                    mon: "Pt"
                    tue: "Sa"
                    wed: "Ça"
                    thu: "Pe"
                    fri: "Cu"
                    sat: "Ct"
                )
                full: #(
                    sun: "Pazar"
                    mon: "Pazartesi"
                    tue: "Salı"
                    wed: "Çarşamba"
                    thu: "Perşembe"
                    fri: "Cuma"
                    sat: "Cumartesi"
                )
            )
            quarters: #(
                abbr: ["Ç1" "Ç2" "Ç3" "Ç4"]
                char: ["1." "2." "3." "4."]
                full: ["1. çeyrek" "2. çeyrek" "3. çeyrek" "4. çeyrek"]
            )
            periods: #(
                abbr: #(
                    am: "ÖÖ"
                    pm: "ÖS"
                )
                char: #(
                    am: "ÖÖ"
                    pm: "ÖS"
                )
                full: #(
                    am: "ÖÖ"
                    pm: "ÖS"
                )
            )
        )
        format: #(
            months: #(
                abbr: ["Oca" "Şub" "Mar" "Nis" "May" "Haz" "Tem" "Ağu" "Eyl" "Eki" "Kas" "Ara"]
                char: ["O" "Ş" "M" "N" "M" "H" "T" "A" "E" "E" "K" "A"]
                full: ["Ocak" "Şubat" "Mart" "Nisan" "Mayıs" "Haziran" "Temmuz" "Ağustos" "Eylül" "Ekim" "Kasım" "Aralık"]
            )
            days: #(
                abbr: #(
                    sun: "Paz"
                    mon: "Pzt"
                    tue: "Sal"
                    wed: "Çar"
                    thu: "Per"
                    fri: "Cum"
                    sat: "Cmt"
                )
                char: #(
                    sun: "P"
                    mon: "P"
                    tue: "S"
                    wed: "Ç"
                    thu: "P"
                    fri: "C"
                    sat: "C"
                )
                short: #(
                    sun: "Pa"
                    mon: "Pt"
                    tue: "Sa"
                    wed: "Ça"
                    thu: "Pe"
                    fri: "Cu"
                    sat: "Ct"
                )
                full: #(
                    sun: "Pazar"
                    mon: "Pazartesi"
                    tue: "Salı"
                    wed: "Çarşamba"
                    thu: "Perşembe"
                    fri: "Cuma"
                    sat: "Cumartesi"
                )
            )
            quarters: #(
                abbr: ["Ç1" "Ç2" "Ç3" "Ç4"]
                char: ["1." "2." "3." "4."]
                full: ["1. çeyrek" "2. çeyrek" "3. çeyrek" "4. çeyrek"]
            )
            periods: #(
                abbr: #(
                    am: "ÖÖ"
                    pm: "ÖS"
                )
                char: #(
                    am: "öö"
                    pm: "ös"
                )
                full: #(
                    am: "ÖÖ"
                    pm: "ÖS"
                )
            )
            eras: #(
                full: #(
                    BC: "Milattan Önce"
                    AD: "Milattan Sonra"
                    BCE: "İsa’dan Önce"
                    CE: "İsa’dan Sonra"
                )
                abbr: #(
                    BC: "MÖ"
                    AD: "MS"
                    BCE: "İÖ"
                    CE: "İS"
                )
                char: #(
                    BC: "BCE"
                    AD: "CE"
                )
            )
        )
        masks: #(
            date: #(
                full: "31 December 1999 Sunday"
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
                full: "31 December 1999 Sunday 023:59:59 'GMT'+00:00"
                long: "31 December 1999 023:59:59 'GMT'+0"
                medium: "31 Dec 1999 023:59:59"
                short: "31.012.1999 023:59"
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
        THB: [std: "฿"]
        TOP: [char: "T$"]
        TRY: [std: "₺"]
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