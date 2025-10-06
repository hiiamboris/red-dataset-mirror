Red [
    author: "Abdullah"
]

nativeLang: "tr"
nativeLangText: "Native: English"

learnLang: "id"

switch nativeLang [
    "en" [
        nativeLangBText: "Native: English"
        memorizeBText: "Memorize"
        quitBText: "Quit"
        switch learnLang [
            "en" [
                learnLangBText: "English"
            ]
            "tr" [
                learnLangBText: "Turkish"
            ]
            "id" [
                learnLangBText: "Indonesian"
            ]
        ]
    ]
    "tr" [
        nativeLangBText: "Anadil: Türkçe"
        memorizeBText: "Ezber"
        quitBText: "Çık"
        switch learnLang [
            "en" [
                learnLangBText: "İngilizce"
            ]
            "tr" [
                learnLangBText: "Türkçe"
            ]
            "id" [
                learnLangBText: "Endonezce"
            ]
        ]
    ]
    "id" [
        nativeLangBText: "Bahasa ibu: Bahasa Indonesia"
        memorizeBText: "Menghafal"
        quitBText: "Berhenti"
        switch learnLang [
            "en" [
                learnLangBText: "Bahasa Inggris"
            ]
            "tr" [
                learnLangBText: "Bahasa Turki"
            ]
            "id" [
                learnLangBText: "Bahasa Indonesia"
            ]
        ]
    ]
]

view [ size 400x500 title "Sahi Pisa"
    button learnLangBText
    return
    button memorizeBText font-size 30 center
    return return return return return return return return return return
    button quitBText font-size 30 [
        quit
    ]
    return
    button nativeLangBText
]