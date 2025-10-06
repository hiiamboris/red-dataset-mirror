#(
    lang-name: "български"
    region-name: "България"
    currency: BGN
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
                    std: "0.00 $$"
                    acct: "(0.00 $$)"
                )
            )
        )
        ordinal-suffixes: #(
            other: "-ата"
        )
    )
    calendar: #(
        day1: mon
        standalone: #(
            months: #(
                abbr: ["яну" "фев" "март" "апр" "май" "юни" "юли" "авг" "сеп" "окт" "ное" "дек"]
                char: ["я" "ф" "м" "а" "м" "ю" "ю" "а" "с" "о" "н" "д"]
                full: ["януари" "февруари" "март" "април" "май" "юни" "юли" "август" "септември" "октомври" "ноември" "декември"]
            )
            days: #(
                abbr: #(
                    sun: "нд"
                    mon: "пн"
                    tue: "вт"
                    wed: "ср"
                    thu: "чт"
                    fri: "пт"
                    sat: "сб"
                )
                char: #(
                    sun: "н"
                    mon: "п"
                    tue: "в"
                    wed: "с"
                    thu: "ч"
                    fri: "п"
                    sat: "с"
                )
                short: #(
                    sun: "нд"
                    mon: "пн"
                    tue: "вт"
                    wed: "ср"
                    thu: "чт"
                    fri: "пт"
                    sat: "сб"
                )
                full: #(
                    sun: "неделя"
                    mon: "понеделник"
                    tue: "вторник"
                    wed: "сряда"
                    thu: "четвъртък"
                    fri: "петък"
                    sat: "събота"
                )
            )
            quarters: #(
                abbr: ["1. трим." "2. трим." "3. трим." "4. трим."]
                char: ["1" "2" "3" "4"]
                full: ["1. тримесечие" "2. тримесечие" "3. тримесечие" "4. тримесечие"]
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
                abbr: ["яну" "фев" "март" "апр" "май" "юни" "юли" "авг" "сеп" "окт" "ное" "дек"]
                char: ["я" "ф" "м" "а" "м" "ю" "ю" "а" "с" "о" "н" "д"]
                full: ["януари" "февруари" "март" "април" "май" "юни" "юли" "август" "септември" "октомври" "ноември" "декември"]
            )
            days: #(
                abbr: #(
                    sun: "нд"
                    mon: "пн"
                    tue: "вт"
                    wed: "ср"
                    thu: "чт"
                    fri: "пт"
                    sat: "сб"
                )
                char: #(
                    sun: "н"
                    mon: "п"
                    tue: "в"
                    wed: "с"
                    thu: "ч"
                    fri: "п"
                    sat: "с"
                )
                short: #(
                    sun: "нд"
                    mon: "пн"
                    tue: "вт"
                    wed: "ср"
                    thu: "чт"
                    fri: "пт"
                    sat: "сб"
                )
                full: #(
                    sun: "неделя"
                    mon: "понеделник"
                    tue: "вторник"
                    wed: "сряда"
                    thu: "четвъртък"
                    fri: "петък"
                    sat: "събота"
                )
            )
            quarters: #(
                abbr: ["1. трим." "2. трим." "3. трим." "4. трим."]
                char: ["1" "2" "3" "4"]
                full: ["1. тримесечие" "2. тримесечие" "3. тримесечие" "4. тримесечие"]
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
                    am: "пр.об."
                    pm: "сл.об."
                )
            )
            eras: #(
                full: #(
                    BC: "преди Христа"
                    AD: "след Христа"
                    BCE: "преди новата ера"
                    CE: "след новата ера"
                )
                abbr: #(
                    BC: "пр.Хр."
                    AD: "сл.Хр."
                    BCE: "пр.н.е."
                    CE: "сл.н.е."
                )
                char: #(
                    BC: "BCE"
                    AD: "CE"
                )
            )
        )
        masks: #(
            date: #(
                full: "Sunday, 31 December 1999 'г'."
                long: "31 December 1999 'г'."
                medium: "31.012.1999 'г'."
                short: "31.012.99 'г'."
            )
            time: #(
                full: "23:59:59 'ч'. 'Гринуич'+00:00"
                long: "23:59:59 'ч'. 'Гринуич'+0"
                medium: "23:59:59 'ч'."
                short: "23:59 'ч'."
            )
            datetime: #(
                full: {Sunday, 31 December 1999 'г'., 23:59:59 'ч'. 'Гринуич'+00:00}
                long: "31 December 1999 'г'., 23:59:59 'ч'. 'Гринуич'+0"
                medium: "31.012.1999 'г'., 23:59:59 'ч'."
                short: "31.012.99 'г'., 23:59 'ч'."
            )
        )
    )
    currency-names: #(
        AFN: [char: "Af"]
        AOA: [char: "Kz"]
        BAM: [char: "KM"]
        BGN: [std: "лв."]
        BOB: [char: "Bs"]
        BWP: [char: "P"]
        CUC: [char: "$"]
        CZK: [char: "Kč"]
        DKK: [char: "kr"]
        EGP: [char: "E£"]
        ESP: [char: "₧"]
        EUR: [std: "€"]
        GBP: [char: "£"]
        GEL: [char: "₾"]
        GNF: [char: "FG"]
        GTQ: [char: "Q"]
        HNL: [char: "L"]
        HRK: [char: "kn"]
        HUF: [char: "Ft"]
        IDR: [char: "Rp"]
        ISK: [char: "kr"]
        JPY: [char: "¥"]
        KMF: [char: "CF"]
        KPW: [char: "₩"]
        LBP: [char: "L£"]
        LKR: [char: "Rs"]
        LTL: [char: "Lt"]
        LVL: [char: "Ls"]
        MGA: [char: "Ar"]
        MMK: [char: "K"]
        MUR: [char: "Rs"]
        MYR: [char: "RM"]
        NIO: [char: "C$"]
        NOK: [char: "kr"]
        NPR: [char: "Rs"]
        PKR: [char: "Rs"]
        PLN: [char: "zł"]
        RUB: [char: "₽"]
        RWF: [char: "RF"]
        SEK: [char: "kr"]
        SHP: [char: "£"]
        STN: [char: "Db"]
        SYP: [char: "£"]
        THB: [char: "฿"]
        TOP: [char: "T$"]
        USD: [char: "$" std: "щ.д."]
        VEF: [char: "Bs"]
        XAF: [std: "FCFA"]
        XCD: [char: "$"]
        XOF: [std: "F CFA"]
        XPF: [std: "CFPF"]
        XXX: [std: "¤"]
        ZAR: [char: "R"]
        ZMW: [char: "ZK"]
    )
)