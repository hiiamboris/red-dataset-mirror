#(
    lang-name: "العربية"
    region-name: "المملكة العربية السعودية"
    currency: SAR
    numbers: #(
        system: arab
        arab: #(
            digits: "٠١٢٣٤٥٦٧٨٩"
            fin-digits: "٠١٢٣٤٥٦٧٨٩"
            symbols: #(
                nan: "ليس رقم"
                infinity: "∞"
                permille: "؉"
                superscripting-exponent: "×"
                exponential: "اس"
                approximately: "~"
                minus: "؜-"
                plus: "؜+"
                percent: "٪؜"
                list: "؛"
                group: "٬"
                decimal: "٫"
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
            other: " يمينًا."
        )
    )
    calendar: #(
        day1: sun
        standalone: #(
            months: #(
                abbr: ["يناير" "فبراير" "مارس" "أبريل" "مايو" "يونيو" "يوليو" "أغسطس" "سبتمبر" "أكتوبر" "نوفمبر" "ديسمبر"]
                char: ["ي" "ف" "م" "أ" "و" "ن" "ل" "غ" "س" "ك" "ب" "د"]
                full: ["يناير" "فبراير" "مارس" "أبريل" "مايو" "يونيو" "يوليو" "أغسطس" "سبتمبر" "أكتوبر" "نوفمبر" "ديسمبر"]
            )
            days: #(
                abbr: #(
                    sun: "الأحد"
                    mon: "الاثنين"
                    tue: "الثلاثاء"
                    wed: "الأربعاء"
                    thu: "الخميس"
                    fri: "الجمعة"
                    sat: "السبت"
                )
                char: #(
                    sun: "ح"
                    mon: "ن"
                    tue: "ث"
                    wed: "ر"
                    thu: "خ"
                    fri: "ج"
                    sat: "س"
                )
                short: #(
                    sun: "أحد"
                    mon: "إثنين"
                    tue: "ثلاثاء"
                    wed: "أربعاء"
                    thu: "خميس"
                    fri: "جمعة"
                    sat: "سبت"
                )
                full: #(
                    sun: "الأحد"
                    mon: "الاثنين"
                    tue: "الثلاثاء"
                    wed: "الأربعاء"
                    thu: "الخميس"
                    fri: "الجمعة"
                    sat: "السبت"
                )
            )
            quarters: #(
                abbr: ["الربع الأول" "الربع الثاني" "الربع الثالث" "الربع الرابع"]
                char: ["١" "٢" "٣" "٤"]
                full: ["الربع الأول" "الربع الثاني" "الربع الثالث" "الربع الرابع"]
            )
            periods: #(
                abbr: #(
                    am: "ص"
                    pm: "م"
                )
                char: #(
                    am: "ص"
                    pm: "م"
                )
                full: #(
                    am: "صباحًا"
                    pm: "مساءً"
                )
            )
        )
        format: #(
            months: #(
                abbr: ["يناير" "فبراير" "مارس" "أبريل" "مايو" "يونيو" "يوليو" "أغسطس" "سبتمبر" "أكتوبر" "نوفمبر" "ديسمبر"]
                char: ["ي" "ف" "م" "أ" "و" "ن" "ل" "غ" "س" "ك" "ب" "د"]
                full: ["يناير" "فبراير" "مارس" "أبريل" "مايو" "يونيو" "يوليو" "أغسطس" "سبتمبر" "أكتوبر" "نوفمبر" "ديسمبر"]
            )
            days: #(
                abbr: #(
                    sun: "الأحد"
                    mon: "الاثنين"
                    tue: "الثلاثاء"
                    wed: "الأربعاء"
                    thu: "الخميس"
                    fri: "الجمعة"
                    sat: "السبت"
                )
                char: #(
                    sun: "ح"
                    mon: "ن"
                    tue: "ث"
                    wed: "ر"
                    thu: "خ"
                    fri: "ج"
                    sat: "س"
                )
                short: #(
                    sun: "أحد"
                    mon: "إثنين"
                    tue: "ثلاثاء"
                    wed: "أربعاء"
                    thu: "خميس"
                    fri: "جمعة"
                    sat: "سبت"
                )
                full: #(
                    sun: "الأحد"
                    mon: "الاثنين"
                    tue: "الثلاثاء"
                    wed: "الأربعاء"
                    thu: "الخميس"
                    fri: "الجمعة"
                    sat: "السبت"
                )
            )
            quarters: #(
                abbr: ["الربع الأول" "الربع الثاني" "الربع الثالث" "الربع الرابع"]
                char: ["١" "٢" "٣" "٤"]
                full: ["الربع الأول" "الربع الثاني" "الربع الثالث" "الربع الرابع"]
            )
            periods: #(
                abbr: #(
                    am: "ص"
                    pm: "م"
                )
                char: #(
                    am: "ص"
                    pm: "م"
                )
                full: #(
                    am: "ص"
                    pm: "م"
                )
            )
            eras: #(
                full: #(
                    BC: "قبل الميلاد"
                    AD: "ميلادي"
                    BCE: "قبل الحقبة الحالية"
                    CE: "بعد الميلاد"
                )
                abbr: #(
                    BC: "ق.م"
                    AD: "م"
                    BCE: "ق. م"
                    CE: "ب.م"
                )
                char: #(
                    BC: "BCE"
                    AD: "CE"
                )
            )
        )
        masks: #(
            date: #(
                full: "Sunday، 31 December 1999"
                long: "31 December 1999"
                medium: "031‏/012‏/1999"
                short: "31‏/12‏/1999"
            )
            time: #(
                full: "12:59:59 AM 'غرينتش'+00:00"
                long: "12:59:59 AM 'غرينتش'+0"
                medium: "12:59:59 AM"
                short: "12:59 AM"
            )
            datetime: #(
                full: {Sunday، 31 December 1999 في 12:59:59 AM 'غرينتش'+00:00}
                long: "31 December 1999 في 12:59:59 AM 'غرينتش'+0"
                medium: "031‏/012‏/1999, 12:59:59 AM"
                short: "31‏/12‏/1999, 12:59 AM"
            )
        )
    )
    currency-names: #(
        AED: [std: "د.إ.‏"]
        AFN: [char: "؋"]
        AMD: [char: "֏"]
        AOA: [char: "Kz"]
        ARS: [char: "AR$"]
        AUD: [std: "AU$"]
        AZN: [char: "₼"]
        BAM: [char: "KM"]
        BBD: [char: "BB$"]
        BDT: [char: "৳"]
        BHD: [std: "د.ب.‏"]
        BMD: [char: "BM$"]
        BND: [char: "BN$"]
        BOB: [char: "Bs"]
        BRL: [std: "R$"]
        BSD: [char: "BS$"]
        BWP: [char: "P"]
        BYN: [char: "р."]
        BZD: [char: "BZ$"]
        CAD: [std: "CA$"]
        CLP: [char: "CL$"]
        CNY: [std: "CN¥"]
        COP: [char: "CO$"]
        CRC: [char: "₡"]
        CUC: [char: "$"]
        CUP: [char: "CU$"]
        CZK: [char: "Kč"]
        DKK: [char: "kr"]
        DOP: [char: "DO$"]
        DZD: [std: "د.ج.‏"]
        EGP: [char: "E£" std: "ج.م.‏"]
        ESP: [char: "₧"]
        EUR: [std: "€"]
        FJD: [char: "FJ$"]
        FKP: [char: "£"]
        GBP: [std: "UK£"]
        GEL: [char: "₾"]
        GHS: [char: "GH₵"]
        GIP: [char: "£"]
        GNF: [char: "FG"]
        GTQ: [char: "Q"]
        GYD: [char: "GY$"]
        HKD: [std: "HK$"]
        HNL: [char: "L"]
        HRK: [char: "kn"]
        HUF: [char: "Ft"]
        IDR: [char: "Rp"]
        ILS: [std: "₪"]
        INR: [std: "₹"]
        IQD: [std: "د.ع.‏"]
        IRR: [std: "ر.إ."]
        ISK: [char: "kr"]
        JMD: [char: "JM$"]
        JOD: [std: "د.أ.‏"]
        JPY: [std: "JP¥"]
        KHR: [char: "៛"]
        KMF: [char: "CF"]
        KPW: [char: "₩"]
        KRW: [std: "₩"]
        KWD: [std: "د.ك.‏"]
        KYD: [char: "KY$"]
        KZT: [char: "₸"]
        LAK: [char: "₭"]
        LBP: [char: "L£" std: "ل.ل.‏"]
        LKR: [char: "Rs"]
        LRD: [char: "$LR"]
        LTL: [char: "Lt"]
        LVL: [char: "Ls"]
        LYD: [std: "د.ل.‏"]
        MAD: [std: "د.م.‏"]
        MGA: [char: "Ar"]
        MMK: [char: "K"]
        MNT: [char: "₮"]
        MRU: [std: "أ.م."]
        MUR: [char: "Rs"]
        MXN: [std: "MX$"]
        MYR: [char: "RM"]
        NAD: [char: "$"]
        NGN: [char: "₦"]
        NIO: [char: "C$"]
        NOK: [char: "kr"]
        NPR: [char: "Rs"]
        NZD: [std: "NZ$"]
        OMR: [std: "ر.ع.‏"]
        PHP: [char: "₱"]
        PKR: [char: "Rs"]
        PLN: [char: "zł"]
        PYG: [char: "₲"]
        QAR: [std: "ر.ق.‏"]
        RON: [char: "lei"]
        RUB: [char: "₽"]
        RWF: [char: "RF"]
        SAR: [std: "ر.س.‏"]
        SBD: [char: "SB$"]
        SDD: [std: "د.س.‏"]
        SDG: [std: "ج.س."]
        SEK: [char: "kr"]
        SGD: [char: "$"]
        SHP: [char: "£"]
        SRD: [char: "SR$"]
        SSP: [char: "£"]
        STN: [char: "Db"]
        SYP: [char: "£" std: "ل.س.‏"]
        THB: [std: "฿"]
        TND: [std: "د.ت.‏"]
        TOP: [char: "T$"]
        TRY: [char: "₺"]
        TTD: [char: "TT$"]
        TWD: [std: "NT$"]
        UAH: [char: "₴"]
        USD: [std: "US$"]
        UYU: [char: "UY$"]
        VEF: [char: "Bs"]
        VND: [std: "₫"]
        XAF: [std: "FCFA"]
        XCD: [char: "$" std: "EC$"]
        XOF: [std: "F CFA"]
        XPF: [std: "CFPF"]
        XXX: [std: "¤"]
        YER: [std: "ر.ي.‏"]
        ZAR: [char: "R"]
        ZMW: [char: "ZK"]
    )
)