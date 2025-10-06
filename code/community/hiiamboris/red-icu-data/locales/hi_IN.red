#(
    lang-name: "हिन्दी"
    region-name: "भारत"
    currency: INR
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
                group: ","
                decimal: "."
            )
            masks: #(
                number: #(
                    dec: "# ## ##0.###"
                    sci: "[0.E0]"
                    pct: "# ## ##0.%"
                    eng: "[0.E3]"
                )
                money: #(
                    std: "$$# ## ##0.00"
                    acct: "$$# ## ##0.00"
                )
            )
        )
        ordinal-suffixes: #(
            few: " दाहिना"
            many: "ठा"
            one: "ला"
            other: "वां"
            two: "रा"
        )
    )
    calendar: #(
        day1: sun
        standalone: #(
            months: #(
                abbr: ["जन॰" "फ़र॰" "मार्च" "अप्रैल" "मई" "जून" "जुल॰" "अग॰" "सित॰" "अक्तू॰" "नव॰" "दिस॰"]
                char: ["ज" "फ़" "मा" "अ" "म" "जू" "जु" "अ" "सि" "अ" "न" "दि"]
                full: ["जनवरी" "फ़रवरी" "मार्च" "अप्रैल" "मई" "जून" "जुलाई" "अगस्त" "सितंबर" "अक्तूबर" "नवंबर" "दिसंबर"]
            )
            days: #(
                abbr: #(
                    sun: "रवि"
                    mon: "सोम"
                    tue: "मंगल"
                    wed: "बुध"
                    thu: "गुरु"
                    fri: "शुक्र"
                    sat: "शनि"
                )
                char: #(
                    sun: "र"
                    mon: "सो"
                    tue: "मं"
                    wed: "बु"
                    thu: "गु"
                    fri: "शु"
                    sat: "श"
                )
                short: #(
                    sun: "र"
                    mon: "सो"
                    tue: "मं"
                    wed: "बु"
                    thu: "गु"
                    fri: "शु"
                    sat: "श"
                )
                full: #(
                    sun: "रविवार"
                    mon: "सोमवार"
                    tue: "मंगलवार"
                    wed: "बुधवार"
                    thu: "गुरुवार"
                    fri: "शुक्रवार"
                    sat: "शनिवार"
                )
            )
            quarters: #(
                abbr: ["ति1" "ति2" "ति3" "ति4"]
                char: ["1" "2" "3" "4"]
                full: ["पहली तिमाही" "दूसरी तिमाही" "तीसरी तिमाही" "चौथी तिमाही"]
            )
            periods: #(
                abbr: #(
                    am: "am"
                    pm: "pm"
                )
                char: #(
                    am: "am"
                    pm: "pm"
                )
                full: #(
                    am: "am"
                    pm: "pm"
                )
            )
        )
        format: #(
            months: #(
                abbr: ["जन॰" "फ़र॰" "मार्च" "अप्रैल" "मई" "जून" "जुल॰" "अग॰" "सित॰" "अक्तू॰" "नव॰" "दिस॰"]
                char: ["ज" "फ़" "मा" "अ" "म" "जू" "जु" "अ" "सि" "अ" "न" "दि"]
                full: ["जनवरी" "फ़रवरी" "मार्च" "अप्रैल" "मई" "जून" "जुलाई" "अगस्त" "सितंबर" "अक्तूबर" "नवंबर" "दिसंबर"]
            )
            days: #(
                abbr: #(
                    sun: "रवि"
                    mon: "सोम"
                    tue: "मंगल"
                    wed: "बुध"
                    thu: "गुरु"
                    fri: "शुक्र"
                    sat: "शनि"
                )
                char: #(
                    sun: "र"
                    mon: "सो"
                    tue: "मं"
                    wed: "बु"
                    thu: "गु"
                    fri: "शु"
                    sat: "श"
                )
                short: #(
                    sun: "र"
                    mon: "सो"
                    tue: "मं"
                    wed: "बु"
                    thu: "गु"
                    fri: "शु"
                    sat: "श"
                )
                full: #(
                    sun: "रविवार"
                    mon: "सोमवार"
                    tue: "मंगलवार"
                    wed: "बुधवार"
                    thu: "गुरुवार"
                    fri: "शुक्रवार"
                    sat: "शनिवार"
                )
            )
            quarters: #(
                abbr: ["ति1" "ति2" "ति3" "ति4"]
                char: ["1" "2" "3" "4"]
                full: ["पहली तिमाही" "दूसरी तिमाही" "तीसरी तिमाही" "चौथी तिमाही"]
            )
            periods: #(
                abbr: #(
                    am: "am"
                    pm: "pm"
                )
                char: #(
                    am: "am"
                    pm: "pm"
                )
                full: #(
                    am: "am"
                    pm: "pm"
                )
            )
            eras: #(
                full: #(
                    BC: "ईसा-पूर्व"
                    AD: "ईसवी सन"
                    BCE: "ईसवी पूर्व"
                    CE: "ईसवी"
                )
                abbr: #(
                    BC: "ईसा-पूर्व"
                    AD: "ईस्वी"
                    BCE: "ईसवी पूर्व"
                    CE: "ईसवी"
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
                short: "31/12/99"
            )
            time: #(
                full: "12:59:59 AM 'GMT'+00:00"
                long: "12:59:59 AM 'GMT'+0"
                medium: "12:59:59 AM"
                short: "12:59 AM"
            )
            datetime: #(
                full: {Sunday, 31 December 1999 को 12:59:59 AM 'GMT'+00:00}
                long: "31 December 1999 को 12:59:59 AM 'GMT'+0"
                medium: "31 Dec 1999, 12:59:59 AM"
                short: "31/12/99, 12:59 AM"
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
        PYG: [char: "₲"]
        RON: [char: "लेई"]
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