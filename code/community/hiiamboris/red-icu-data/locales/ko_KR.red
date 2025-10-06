#(
    lang-name: "한국어"
    region-name: "대한민국"
    currency: KRW
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
            other: "번째"
        )
    )
    calendar: #(
        day1: sun
        standalone: #(
            months: #(
                abbr: ["1월" "2월" "3월" "4월" "5월" "6월" "7월" "8월" "9월" "10월" "11월" "12월"]
                char: ["1월" "2월" "3월" "4월" "5월" "6월" "7월" "8월" "9월" "10월" "11월" "12월"]
                full: ["1월" "2월" "3월" "4월" "5월" "6월" "7월" "8월" "9월" "10월" "11월" "12월"]
            )
            days: #(
                abbr: #(
                    sun: "일"
                    mon: "월"
                    tue: "화"
                    wed: "수"
                    thu: "목"
                    fri: "금"
                    sat: "토"
                )
                char: #(
                    sun: "일"
                    mon: "월"
                    tue: "화"
                    wed: "수"
                    thu: "목"
                    fri: "금"
                    sat: "토"
                )
                short: #(
                    sun: "일"
                    mon: "월"
                    tue: "화"
                    wed: "수"
                    thu: "목"
                    fri: "금"
                    sat: "토"
                )
                full: #(
                    sun: "일요일"
                    mon: "월요일"
                    tue: "화요일"
                    wed: "수요일"
                    thu: "목요일"
                    fri: "금요일"
                    sat: "토요일"
                )
            )
            quarters: #(
                abbr: ["1분기" "2분기" "3분기" "4분기"]
                char: ["1" "2" "3" "4"]
                full: ["제 1/4분기" "제 2/4분기" "제 3/4분기" "제 4/4분기"]
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
                    am: "오전"
                    pm: "오후"
                )
            )
        )
        format: #(
            months: #(
                abbr: ["1월" "2월" "3월" "4월" "5월" "6월" "7월" "8월" "9월" "10월" "11월" "12월"]
                char: ["1월" "2월" "3월" "4월" "5월" "6월" "7월" "8월" "9월" "10월" "11월" "12월"]
                full: ["1월" "2월" "3월" "4월" "5월" "6월" "7월" "8월" "9월" "10월" "11월" "12월"]
            )
            days: #(
                abbr: #(
                    sun: "일"
                    mon: "월"
                    tue: "화"
                    wed: "수"
                    thu: "목"
                    fri: "금"
                    sat: "토"
                )
                char: #(
                    sun: "일"
                    mon: "월"
                    tue: "화"
                    wed: "수"
                    thu: "목"
                    fri: "금"
                    sat: "토"
                )
                short: #(
                    sun: "일"
                    mon: "월"
                    tue: "화"
                    wed: "수"
                    thu: "목"
                    fri: "금"
                    sat: "토"
                )
                full: #(
                    sun: "일요일"
                    mon: "월요일"
                    tue: "화요일"
                    wed: "수요일"
                    thu: "목요일"
                    fri: "금요일"
                    sat: "토요일"
                )
            )
            quarters: #(
                abbr: ["1분기" "2분기" "3분기" "4분기"]
                char: ["1" "2" "3" "4"]
                full: ["제 1/4분기" "제 2/4분기" "제 3/4분기" "제 4/4분기"]
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
                    am: "오전"
                    pm: "오후"
                )
            )
            eras: #(
                full: #(
                    BC: "기원전"
                    AD: "서기"
                    BCE: "BCE"
                    CE: "CE"
                )
                abbr: #(
                    BC: "BC"
                    AD: "AD"
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
                full: "1999년 12월 31일 Sunday"
                long: "1999년 12월 31일"
                medium: "1999. 12. 31."
                short: "99. 12. 31."
            )
            time: #(
                full: "AM 12시 m분 s초 'GMT'+00:00"
                long: "AM 12시 m분 s초 'GMT'+0"
                medium: "AM 12:59:59"
                short: "AM 12:59"
            )
            datetime: #(
                full: "1999년 12월 31일 Sunday AM 12시 m분 s초 'GMT'+00:00"
                long: "1999년 12월 31일 AM 12시 m분 s초 'GMT'+0"
                medium: "1999. 12. 31. AM 12:59:59"
                short: "99. 12. 31. AM 12:59"
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
        RON: [char: "L"]
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
        TWD: [std: "NT$"]
        UAH: [char: "₴"]
        USD: [char: "$" std: "US$"]
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