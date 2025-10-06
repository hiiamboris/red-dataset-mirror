#(
    lang-name: "русский"
    region-name: none
    currency: RUB
    numbers: #(
        system: latn
        latn: #(
            digits: "0123456789"
            fin-digits: "0123456789"
            symbols: #(
                nan: "не число"
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
                    acct: "# ##0.00 $$"
                )
            )
        )
        ordinal-suffixes: #(
            other: "-й"
        )
    )
    calendar: #(
        day1: mon
        standalone: #(
            months: #(
                abbr: ["янв." "февр." "март" "апр." "май" "июнь" "июль" "авг." "сент." "окт." "нояб." "дек."]
                char: ["Я" "Ф" "М" "А" "М" "И" "И" "А" "С" "О" "Н" "Д"]
                full: ["январь" "февраль" "март" "апрель" "май" "июнь" "июль" "август" "сентябрь" "октябрь" "ноябрь" "декабрь"]
            )
            days: #(
                abbr: #(
                    sun: "вс"
                    mon: "пн"
                    tue: "вт"
                    wed: "ср"
                    thu: "чт"
                    fri: "пт"
                    sat: "сб"
                )
                char: #(
                    sun: "В"
                    mon: "П"
                    tue: "В"
                    wed: "С"
                    thu: "Ч"
                    fri: "П"
                    sat: "С"
                )
                short: #(
                    sun: "вс"
                    mon: "пн"
                    tue: "вт"
                    wed: "ср"
                    thu: "чт"
                    fri: "пт"
                    sat: "сб"
                )
                full: #(
                    sun: "воскресенье"
                    mon: "понедельник"
                    tue: "вторник"
                    wed: "среда"
                    thu: "четверг"
                    fri: "пятница"
                    sat: "суббота"
                )
            )
            quarters: #(
                abbr: ["1-й кв." "2-й кв." "3-й кв." "4-й кв."]
                char: ["1" "2" "3" "4"]
                full: ["1-й квартал" "2-й квартал" "3-й квартал" "4-й квартал"]
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
                abbr: ["янв." "февр." "мар." "апр." "мая" "июн." "июл." "авг." "сент." "окт." "нояб." "дек."]
                char: ["Я" "Ф" "М" "А" "М" "И" "И" "А" "С" "О" "Н" "Д"]
                full: ["января" "февраля" "марта" "апреля" "мая" "июня" "июля" "августа" "сентября" "октября" "ноября" "декабря"]
            )
            days: #(
                abbr: #(
                    sun: "вс"
                    mon: "пн"
                    tue: "вт"
                    wed: "ср"
                    thu: "чт"
                    fri: "пт"
                    sat: "сб"
                )
                short: #(
                    sun: "вс"
                    mon: "пн"
                    tue: "вт"
                    wed: "ср"
                    thu: "чт"
                    fri: "пт"
                    sat: "сб"
                )
                full: #(
                    sun: "воскресенье"
                    mon: "понедельник"
                    tue: "вторник"
                    wed: "среда"
                    thu: "четверг"
                    fri: "пятница"
                    sat: "суббота"
                )
                char: #(
                    sun: "В"
                    mon: "П"
                    tue: "В"
                    wed: "С"
                    thu: "Ч"
                    fri: "П"
                    sat: "С"
                )
            )
            quarters: #(
                abbr: ["1-й кв." "2-й кв." "3-й кв." "4-й кв."]
                char: ["1" "2" "3" "4"]
                full: ["1-й квартал" "2-й квартал" "3-й квартал" "4-й квартал"]
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
                    BC: "до Рождества Христова"
                    AD: "от Рождества Христова"
                    BCE: "до нашей эры"
                    CE: "нашей эры"
                )
                abbr: #(
                    BC: "до Р. Х."
                    AD: "от Р. Х."
                    CE: "н. э."
                    BCE: "до н. э."
                )
                char: #(
                    BC: "до Р.Х."
                    AD: "от Р.Х."
                    CE: "н.э."
                    BCE: "до н.э."
                )
            )
        )
        masks: #(
            date: #(
                full: "Sunday, 31 December 1999 'г'."
                long: "31 December 1999 'г'."
                medium: "31 Dec 1999 'г'."
                short: "031.012.1999"
            )
            time: #(
                full: "023:59:59 'GMT'+00:00"
                long: "023:59:59 'GMT'+0"
                medium: "023:59:59"
                short: "023:59"
            )
            datetime: #(
                full: {Sunday, 31 December 1999 'г'., 023:59:59 'GMT'+00:00}
                long: "31 December 1999 'г'., 023:59:59 'GMT'+0"
                medium: "31 Dec 1999 'г'., 023:59:59"
                short: "031.012.1999, 023:59"
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
        GEL: [char: "ლ"]
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
        RUB: [std: "₽"]
        RUR: [std: "р."]
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
        TMT: [std: "ТМТ"]
        TOP: [char: "T$"]
        TRY: [char: "₺"]
        TTD: [char: "$"]
        TWD: [std: "NT$"]
        UAH: [std: "₴"]
        USD: [std: "$"]
        UYU: [char: "$"]
        VEF: [char: "Bs"]
        VND: [std: "₫"]
        XAF: [std: "FCFA"]
        XCD: [char: "$" std: "EC$"]
        XOF: [std: "F CFA"]
        XPF: [std: "CFPF"]
        XXX: [std: "XXXX"]
        ZAR: [char: "R"]
        ZMW: [char: "ZK"]
    )
)