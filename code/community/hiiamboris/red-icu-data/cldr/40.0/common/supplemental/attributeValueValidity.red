
    supplementalData [
        version [#number "$Revision$"] 
        metadata [
            validity [
                variable [#id "$language" #type "choice" ! {ab af agq ak am ar as asa ast az^/^-^-^-^-bas be bem bez bg bm bn bo br brx bs^/^-^-^-^-ca ccp ce cgg chr ckb cs cu cy^/^-^-^-^-da dav de dje doi dsb dua dyo dz^/^-^-^-^-ebu ee el en eo es et eu ewo^/^-^-^-^-fa ff fi fil fo fr fur fy^/^-^-^-^-ga gd gl gsw gu guz gv^/^-^-^-^-ha haw he hi hr hsb hu hy^/^-^-^-^-ia id ig ii is it^/^-^-^-^-ja jgo jmc jv^/^-^-^-^-ka kab kam kde kea kgp khq ki kk kkj kl kln km kn ko kok ks ksb ksf ksh ku kw ky^/^-^-^-^-lag lb lg lij lkt ln lo lrc lt lu luo luy lv^/^-^-^-^-mai mas mer mfe mg mgh mgo mi mk ml mn mni mr ms mt mua my mzn^/^-^-^-^-naq nb nd nds ne nl nmg nn nnh no nus nv nyn^/^-^-^-^-om or os^/^-^-^-^-pa pcm pl prg ps pt^/^-^-^-^-qu^/^-^-^-^-rhg rm rn ro rof^/^-^-^-^-und^/^-^-^-^-ru rw rwk^/^-^-^-^-sa sah saq sat sbp sc sd se seh ses sg shi si sk sl smn sn so sq sr su sv sw^/^-^-^-^-ta te teo tg th ti tk to tr tt twq tzm^/^-^-^-^-ug uk ur uz^/^-^-^-^-vai vi vo vun^/^-^-^-^-wae wo^/^-^-^-^-xh xog^/^-^-^-^-yav yi yo yrl yue^/^-^-^-^-zgh zh zu^/^-^-^-}] 
                variable [#id "$languageExceptions" #type "choice" ! {ceb co^/^-^-^-^-hmn ht^/^-^-^-^-la^/^-^-^-^-mul^/^-^-^-^-ny^/^-^-^-^-root^/^-^-^-^-sa sm st^/^-^-^-^-zxx^/^-^-^-}] 
                variable [#id "$oldLanguages" #type "choice" ! {aa ace ada ady ain ale alt an anp arn arp ars av awa ay^/^-^-^-^-ba ban bho bi bin bla bug byn^/^-^-^-^-ch chk chm cho chy crs cv^/^-^-^-^-dak dar dgr dv dzg^/^-^-^-^-efi eka^/^-^-^-^-fj fon^/^-^-^-^-gaa gan gez gil gn gor gwi^/^-^-^-^-hak hil hsn hup hz^/^-^-^-^-iba ibb ilo inh io iu^/^-^-^-^-jbo^/^-^-^-^-kac kaj kbd kcg kfo kha kj kmb kpe kr krc krl kru kum kv^/^-^-^-^-lad lez li loz lua lun lus^/^-^-^-^-mad mag mai mak mdf men mh mic min mni moh mos mus mwl myv^/^-^-^-^-na nan nap new ng nia niu nog nqo nr nso nv^/^-^-^-^-oc^/^-^-^-^-pag pam pap pau pcm^/^-^-^-^-quc^/^-^-^-^-rap rar rup^/^-^-^-^-sad sat sba sc scn sco shn sma smj sms snk srn ss ssy suk swb syr^/^-^-^-^-tem tet tig tlh tn tpi trv ts tum tvl ty tyv^/^-^-^-^-udm umb^/^-^-^-^-ve^/^-^-^-^-wa wal war wuu^/^-^-^-^-xal^/^-^-^-^-ybb^/^-^-^-^-zun zza^/^-^-^-}] 
                variable [#id "$scriptNonUnicode" #type "choice" ! {Afak Aran Blis Cirt Cyrs Egyd Egyh Geok Inds Jurc Kitl Kpel Latf Latg Loma Maya Moon^/^-^-^-^-Nkgb Phlv Roro Sara Syre Syrj Syrn Teng Visp Wole^/^-^-^-}] 
                variable [#id "$casing" #type "choice" ! {titlecase-words titlecase-firstword lowercase-words mixed}] 
                variable [#id "$allow" #type "regex" ! "(verbatim)"] 
                variable [#id "$alt" #type "regex" ! {((stand-alone|variant|list|secondary|email|www|short|narrow|new|accounting|limitedAvailability)(-proposed.*)?|(proposed.*))}] 
                variable [#id "$append" #type "choice" ! {Era Year Quarter Month Week Day-Of-Week Day Hour Minute Second Timezone}] 
                variable [#id "$currencyDate" #type "regex" ! {([12][0-9][0-9][0-9])-((0[0-9])|1[0-2])-([0-2][0-9]|3[01])}] 
                variable [#id "$date" #type "regex" ! "-?[0-9]{1,4}-[0-9]{1,2}-[0-9]{1,2}"] 
                variable [#id "$dateRecent" #type "regex" ! "20[0-9][0-9]-([0-9]|1[0-2])-([12][0-9]|3[01])"] 
                variable [#id "$time" #type "regex" ! "([01][0-9]|2[0-4]):[0-5][0-9]"] 
                variable [#id "$timeHour" #type "regex" ! "([01]?[0-9]|2[0-4]):00"] 
                variable [#id "$datetime" #type "regex" ! {[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}\s([01][0-9]|2[0-4]):[0-5][0-9]}] 
                variable [#id "$double" #type "regex" ! "[0-9]+(\.[0-9]+)?"] 
                variable [#id "$integer" #type "regex" ! "[0-9]+"] 
                variable [#id "$format" #type "choice" ! "standard"] 
                variable [#id "$fullTzid" #type "TODO"] 
                variable [#id "$genDate" #type "regex" ! "\$.*\$"] 
                variable [#id "$locale" #type "locale"] 
                variable [#id "$localeAll" #type "locale" ! "all"] 
                variable [#id "$reference" #type "regex" ! "([R|S]|RP)[0-9]+"] 
                variable [#id "$uri" #type "TODO"] 
                variable [#id "$variableID" #type "regex" ! "[$][a-zA-Z0-9_]+"] 
                variable [#id "$version" #type "regex" ! "\$.*\$"] 
                variable [#id "$versionDotted" #type "regex" ! "[0-9]+(\.[0-9]+(\.[0-9]+)?)?"] 
                variable [#id "$emoji" #type "unicodeSetOrString" ! {[©®‼⁉™ℹ↔-↙↩↪⌚⌛⌨⏏⏩-⏳⏸-⏺ Ⓜ▪▫▶◀◻-◾☀-☄☎☑☔☕☘☝☠☢☣☦ ☪☮☯☸-☺♈-♓♠♣♥♦♨♻♿⚒-⚔⚖⚗ ⚙⚛⚜⚠⚡⚪⚫⚰⚱⚽⚾⛄⛅⛈⛎⛏⛑⛓⛔⛩⛪ ⛰-⛵⛷-⛺⛽✂✅✈-✍✏✒✔✖✝✡✨✳✴^/^-^-^-^-❄❇❌❎❓-❕❗❣❤➕-➗➡➰➿⤴⤵⬅-⬇ ⬛⬜⭐⭕〰〽㊗㊙🀄🃏🅰🅱🅾🅿🆎🆑-🆚🈁🈂🈚 🈯🈲-🈺🉐🉑🌀-🌡🌤-🎓🎖🎗🎙-🎛🎞-🏰🏳-🏵 🏷-📽📿-🔽🕉-🕎🕐-🕧🕯🕰🕳-🕹🖇🖊-🖍^/^-^-^-^-🖐🖕🖖🖥🖨🖱🖲🖼🗂-🗄🗑-🗓🗜-🗞🗡🗣🗯🗳 🗺-🙏🚀-🛅🛋-🛐🛠-🛥🛩🛫🛬🛰🛳🤐-🤘🦀-🦄^/^-^-^-^-🧀{#⃣}{*⃣}{0⃣}{1⃣}{2⃣}{3⃣}{4⃣}{5⃣}{6⃣}{7⃣}{8⃣}{9⃣}{☝🏻}{☝🏼}{☝🏽}{☝🏾}{☝🏿}{✊🏻}{✊🏼}{✊🏽}{✊🏾}{✊🏿}{✋🏻}{✋🏼}{✋🏽}{✋🏾}{✋🏿}{✌🏻}{✌🏼}{✌🏽}{✌🏾}{✌🏿}{✍🏻}{✍🏼}{✍🏽}{✍🏾}{✍🏿}{🇦🇨}{🇦🇩}{🇦🇪}{🇦🇫}{🇦🇬}{🇦🇮}{🇦🇱}{🇦🇲}{🇦🇴}{🇦🇶}{🇦🇷}{🇦🇸}{🇦🇹}{🇦🇺}{🇦🇼}{🇦🇽}{🇦🇿}{🇧🇦}{🇧🇧}{🇧🇩}{🇧🇪}{🇧🇫}{🇧🇬}{🇧🇭}{🇧🇮}{🇧🇯}{🇧🇱}{🇧🇲}{🇧🇳}{🇧🇴}{🇧🇶}{🇧🇷}{🇧🇸}{🇧🇹}{🇧🇻}{🇧🇼}{🇧🇾}{🇧🇿}{🇨🇦}{🇨🇨}{🇨🇩}{🇨🇫}{🇨🇬}{🇨🇭}{🇨🇮}{🇨🇰}{🇨🇱}{🇨🇲}{🇨🇳}{🇨🇴}{🇨🇵}{🇨🇷}{🇨🇺}{🇨🇻}{🇨🇼}{🇨🇽}{🇨🇾}{🇨🇿}{🇩🇪}{🇩🇬}{🇩🇯}{🇩🇰}{🇩🇲}{🇩🇴}{🇩🇿}{🇪🇦}{🇪🇨}{🇪🇪}{🇪🇬}{🇪🇭}{🇪🇷}{🇪🇸}{🇪🇹}{🇪🇺}{🇫🇮}{🇫🇯}{🇫🇰}{🇫🇲}{🇫🇴}{🇫🇷}{🇬🇦}{🇬🇧}{🇬🇩}{🇬🇪}{🇬🇫}{🇬🇬}{🇬🇭}{🇬🇮}{🇬🇱}{🇬🇲}{🇬🇳}{🇬🇵}{🇬🇶}{🇬🇷}{🇬🇸}{🇬🇹}{🇬🇺}{🇬🇼}{🇬🇾}{🇭🇰}{🇭🇲}{🇭🇳}{🇭🇷}{🇭🇹}{🇭🇺}{🇮🇨}{🇮🇩}{🇮🇪}{🇮🇱}{🇮🇲}{🇮🇳}{🇮🇴}{🇮🇶}{🇮🇷}{🇮🇸}{🇮🇹}{🇯🇪}{🇯🇲}{🇯🇴}{🇯🇵}{🇰🇪}{🇰🇬}{🇰🇭}{🇰🇮}{🇰🇲}{🇰🇳}{🇰🇵}{🇰🇷}{🇰🇼}{🇰🇾}{🇰🇿}{🇱🇦}{🇱🇧}{🇱🇨}{🇱🇮}{🇱🇰}{🇱🇷}{🇱🇸}{🇱🇹}{🇱🇺}{🇱🇻}{🇱🇾}{🇲🇦}{🇲🇨}{🇲🇩}{🇲🇪}{🇲🇫}{🇲🇬}{🇲🇭}{🇲🇰}{🇲🇱}{🇲🇲}{🇲🇳}{🇲🇴}{🇲🇵}{🇲🇶}{🇲🇷}{🇲🇸}{🇲🇹}{🇲🇺}{🇲🇻}{🇲🇼}{🇲🇽}{🇲🇾}{🇲🇿}{🇳🇦}{🇳🇨}{🇳🇪}{🇳🇫}{🇳🇬}{🇳🇮}{🇳🇱}{🇳🇴}{🇳🇵}{🇳🇷}{🇳🇺}{🇳🇿}{🇴🇲}{🇵🇦}{🇵🇪}{🇵🇫}{🇵🇬}{🇵🇭}{🇵🇰}{🇵🇱}{🇵🇲}{🇵🇳}{🇵🇷}{🇵🇸}{🇵🇹}{🇵🇼}{🇵🇾}{🇶🇦}{🇷🇪}{🇷🇴}{🇷🇸}{🇷🇺}{🇷🇼}{🇸🇦}{🇸🇧}{🇸🇨}{🇸🇩}{🇸🇪}{🇸🇬}{🇸🇭}{🇸🇮}{🇸🇯}{🇸🇰}{🇸🇱}{🇸🇲}{🇸🇳}{🇸🇴}{🇸🇷}{🇸🇸}{🇸🇹}{🇸🇻}{🇸🇽}{🇸🇾}{🇸🇿}{🇹🇦}{🇹🇨}{🇹🇩}{🇹🇫}{🇹🇬}{🇹🇭}{🇹🇯}{🇹🇰}{🇹🇱}{🇹🇲}{🇹🇳}{🇹🇴}{🇹🇷}{🇹🇹}{🇹🇻}{🇹🇼}{🇹🇿}{🇺🇦}{🇺🇬}{🇺🇲}{🇺🇸}{🇺🇾}{🇺🇿}{🇻🇦}{🇻🇨}{🇻🇪}{🇻🇬}{🇻🇮}{🇻🇳}{🇻🇺}{🇼🇫}{🇼🇸}{🇽🇰}{🇾🇪}{🇾🇹}{🇿🇦}{🇿🇲}{🇿🇼}{🎅🏻}{🎅🏼}{🎅🏽}{🎅🏾}{🎅🏿}{🏂🏻}{🏂🏼}{🏂🏽}{🏂🏾}{🏂🏿}{🏃🏻}{🏃🏼}{🏃🏽}{🏃🏾}{🏃🏿}{🏄🏻}{🏄🏼}{🏄🏽}{🏄🏾}{🏄🏿}{🏇🏻}{🏇🏼}{🏇🏽}{🏇🏾}{🏇🏿}{🏊🏻}{🏊🏼}{🏊🏽}{🏊🏾}{🏊🏿}{👂🏻}{👂🏼}{👂🏽}{👂🏾}{👂🏿}{👃🏻}{👃🏼}{👃🏽}{👃🏾}{👃🏿}{👆🏻}{👆🏼}{👆🏽}{👆🏾}{👆🏿}{👇🏻}{👇🏼}{👇🏽}{👇🏾}{👇🏿}{👈🏻}{👈🏼}{👈🏽}{👈🏾}{👈🏿}{👉🏻}{👉🏼}{👉🏽}{👉🏾}{👉🏿}{👊🏻}{👊🏼}{👊🏽}{👊🏾}{👊🏿}{👋🏻}{👋🏼}{👋🏽}{👋🏾}{👋🏿}{👌🏻}{👌🏼}{👌🏽}{👌🏾}{👌🏿}{👍🏻}{👍🏼}{👍🏽}{👍🏾}{👍🏿}{👎🏻}{👎🏼}{👎🏽}{👎🏾}{👎🏿}{👏🏻}{👏🏼}{👏🏽}{👏🏾}{👏🏿}{👐🏻}{👐🏼}{👐🏽}{👐🏾}{👐🏿}{👦🏻}{👦🏼}{👦🏽}{👦🏾}{👦🏿}{👧🏻}{👧🏼}{👧🏽}{👧🏾}{👧🏿}{👨^/^-^-^-^-‍❤‍👨}{👨‍❤‍💋‍👨}{👨‍👨‍👦}{👨 ‍👨‍👦‍👦}{👨‍👨‍👧}{👨‍👨‍👧‍ 👦}{👨‍👨‍👧‍👧}{👨‍👩‍👦}{👨‍ 👩‍👦‍👦}{👨‍👩‍👧}{👨‍👩‍👧‍👦}{👨^/^-^-^-^-‍👩‍👧‍👧}{👨🏻}{👨🏼}{👨🏽}{👨🏾}{👨🏿}{👩 ‍❤‍👩}{👩‍❤‍💋‍👩}{👩‍👩‍👦}{👩 ‍👩‍👦‍👦}{👩‍👩‍👧}{👩‍👩‍👧‍^/^-^-^-^-👦}{👩‍👩‍👧‍👧}{👩🏻}{👩🏼}{👩🏽}{👩🏾}{👩🏿}{👮🏻}{👮🏼}{👮🏽}{👮🏾}{👮🏿}{👰🏻}{👰🏼}{👰🏽}{👰🏾}{👰🏿}{👱🏻}{👱🏼}{👱🏽}{👱🏾}{👱🏿}{👲🏻}{👲🏼}{👲🏽}{👲🏾}{👲🏿}{👳🏻}{👳🏼}{👳🏽}{👳🏾}{👳🏿}{👴🏻}{👴🏼}{👴🏽}{👴🏾}{👴🏿}{👵🏻}{👵🏼}{👵🏽}{👵🏾}{👵🏿}{👶🏻}{👶🏼}{👶🏽}{👶🏾}{👶🏿}{👷🏻}{👷🏼}{👷🏽}{👷🏾}{👷🏿}{👸🏻}{👸🏼}{👸🏽}{👸🏾}{👸🏿}{👼🏻}{👼🏼}{👼🏽}{👼🏾}{👼🏿}{💁🏻}{💁🏼}{💁🏽}{💁🏾}{💁🏿}{💂🏻}{💂🏼}{💂🏽}{💂🏾}{💂🏿}{💃🏻}{💃🏼}{💃🏽}{💃🏾}{💃🏿}{💅🏻}{💅🏼}{💅🏽}{💅🏾}{💅🏿}{💆🏻}{💆🏼}{💆🏽}{💆🏾}{💆🏿}{💇🏻}{💇🏼}{💇🏽}{💇🏾}{💇🏿}{💪🏻}{💪🏼}{💪🏽}{💪🏾}{💪🏿}{🖐🏻}{🖐🏼}{🖐🏽}{🖐🏾}{🖐🏿}{🖕🏻}{🖕🏼}{🖕🏽}{🖕🏾}{🖕🏿}{🖖🏻}{🖖🏼}{🖖🏽}{🖖🏾}{🖖🏿}{🙅🏻}{🙅🏼}{🙅🏽}{🙅🏾}{🙅🏿}{🙆🏻}{🙆🏼}{🙆🏽}{🙆🏾}{🙆🏿}{🙇🏻}{🙇🏼}{🙇🏽}{🙇🏾}{🙇🏿}{🙋🏻}{🙋🏼}{🙋🏽}{🙋🏾}{🙋🏿}{🙌🏻}{🙌🏼}{🙌🏽}{🙌🏾}{🙌🏿}{🙍🏻}{🙍🏼}{🙍🏽}{🙍🏾}{🙍🏿}{🙎🏻}{🙎🏼}{🙎🏽}{🙎🏾}{🙎🏿}{🙏🏻}{🙏🏼}{🙏🏽}{🙏🏾}{🙏🏿}{🚣🏻}{🚣🏼}{🚣🏽}{🚣🏾}{🚣🏿}{🚴🏻}{🚴🏼}{🚴🏽}{🚴🏾}{🚴🏿}{🚵🏻}{🚵🏼}{🚵🏽}{🚵🏾}{🚵🏿}{🚶🏻}{🚶🏼}{🚶🏽}{🚶🏾}{🚶🏿}{🛀🏻}{🛀🏼}{🛀🏽}{🛀🏾}{🛀🏿}{🤘🏻}{🤘🏼}{🤘🏽}{🤘🏾}{🤘🏿}]}] 
                variable [#id "$percent" #type "regex" ! "0|[1-9][0-9]?|100"] 
                variable [#id "$percentFraction" #type "regex" ! "(0|[1-9][0-9]?)(\.[0-9]+)?|100"] 
                variable [#id "$subdivisionSuffix" #type "regex" ! "[0-9A-Z]{0,3}"] 
                variable [#id "$digit" #type "regex" ! "(\p{Nd}|[〇一二三四五六七八九])+"] 
                variable [#id "$hourStyle" #type "regex" ! "[HKhk]"] 
                variable [#id "$internet" #type "regex" ! "[A-Z]+|XN--[A-Z0-9]+([-][A-Z0-9]+)*"] 
                variable [#id "$coverageSpecial" #type "choice" ! "* Cldr:modern"] 
                variable [#id "$collationPrivate" #type "choice" ! {digits-after private-unihan private-kana private-pinyin}] 
                variable [#id "$languageDeprecated" #type "choice" ! "sh tw tl fat in mo ji iw jw"] 
                variable [#id "$localeOrDeprecated" ! "$locale|$languageDeprecated"] 
                variable [#id "$name" #type "regex" ! "[a-zA-Z]+([-_][a-zA-Z]+)*[.]?|\d+|\([A-Z][a-z]+\)"] 
                variable [#id "$defaultCurrencyInfo" #type "choice" ! "DEFAULT"] 
                variable [#id "$utc" #type "regex" ! "UTC[-+]\d+"] 
                variable [#id "$AX" #type "choice" ! "AX"] 
                variable [#id "$skipDefaultLocale" #type "choice" ! "segmentation collation"] 
                variable [#id "$transformId" #type "choice" ! {Amharic Any Arabic Armenian Azerbaijani Belarusian Bengali Bulgarian Cyrillic Devanagari Fullwidth^/^-^-^-^-Georgian Greek Gujarati Gurmukhi Han Hangul Hebrew Hiragana IPA InterIndic Jamo Kannada Katakana Kazakh Kirghiz Korean Latin Macedonian Malayalam^/^-^-^-^-Maldivian Mongolian Oriya Pashto Persian Pinyin Russian Serbian Simplified Syriac Tamil Telugu Thai ThaiLogical Turkmen Ukrainian Uzbek az ch cs^/^-^-^-^-cs_FONIPA dsb el es es_419 es_FONIPA it ja_Latn la lt nl pl pl_FONIPA ro ro_FONIPA ru sk sk_FONIPA tlh tr ug uz_Cyrl yo zh_Latn_PINYIN ASCII^/^-^-^-^-Accents Armenian Bengali Bopomofo CanadianAboriginal ConjoiningJamo Devanagari Ethiopic Gujarati Gurmukhi Halfwidth Hangul InterIndic Jamo Kannada^/^-^-^-^-Katakana Latin Lower Malayalam NumericPinyin Oriya Publishing Spacedhan Tamil Telugu Thaana Thai ThaiLogical ThaiSemi Title Traditional Upper^/^-^-^-^-XSampa am ch_FONIPA cs_FONIPA dsb_FONIPA es_419_FONIPA es_FONIPA ja ko la_FONIPA pl_FONIPA ro_FONIPA ru sk_FONIPA tlh_FONIPA uz_Latn yo_BJ zh}] 
                attributeValues [#attributes "alt" #type "choice" ! "$alt"] 
                attributeValues [#attributes "_q" #type "choice" ! "$integer"] 
                attributeValues [#attributes "validSubLocales" #type "list" ! "$locale"] 
                attributeValues [#dtds "ldml" #elements "alias" #attributes "path" #type "TODO"] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "alias" 
                    #attributes "source" 
                    #type "choice" 
                    ! "locale"
                ] 
                attributeValues [#dtds "ldml" #elements "appendItem" #attributes "request" ! "$append"] 
                attributeValues [#dtds "ldml" #elements "calendar" #attributes "type" ! "$_bcp47_ca"] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "character" 
                    #attributes "value" 
                    #type "regex" 
                    ! "."
                ] 
                attributeValues [#dtds "ldml" #elements "collation" #attributes "type" ! "$_bcp47_collation|$collationPrivate"] 
                attributeValues [#dtds "ldml" #elements "collations" #attributes "version" ! "$version"] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "contextTransform" 
                    #attributes "type" 
                    #type "choice" 
                    ! "uiListOrMenu stand-alone"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "contextTransformUsage" 
                    #attributes "type" 
                    #type "regex" 
                    ! "[a-zA-Z-]+"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "cp" 
                    #attributes "hex" 
                    #type "regex" 
                    ! "[0-9A-Fa-f]{4,6}"
                ] 
                attributeValues [#dtds "supplementalData" #elements "currency" #attributes "before from to" ! "$currencyDate"] 
                attributeValues [#dtds "supplementalData" #elements "currency" #attributes "iso4217" ! "$_bcp47_cu"] 
                attributeValues [#dtds "ldml" #elements "currency" #attributes "type" ! "$_bcp47_cu"] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "currencyFormat" 
                    #attributes "type" 
                    #type "choice" 
                    ! "standard accounting"
                ] 
                attributeValues [#dtds "ldml" #elements {currencyFormats decimalFormats percentFormats scientificFormats} #attributes "numberSystem" ! "$_bcp47_nu"] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "cyclicName" 
                    #attributes "type" 
                    #type "regex" 
                    ! "[0-9]+"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "cyclicNameContext" 
                    #attributes "type" 
                    #order "given" 
                    ! "format stand-alone"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "cyclicNameSet" 
                    #attributes "type" 
                    #type "choice" 
                    ! "years months days dayParts zodiacs solarTerms"
                ] 
                attributeValues [#elements {dateFormat dateTimeFormat decimalFormat percentFormat scientificFormat timeFormat} #attributes "type" ! "$format"] 
                attributeValues [#elements {dateFormatLength timeFormatLength dateTimeFormatLength decimalFormatLength scientificFormatLength percentFormatLength currencyFormatLength} #attributes "type" #order "given" ! "full long medium short"] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "day" 
                    #attributes "type" 
                    #order "given" 
                    ! "sun mon tue wed thu fri sat"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "dayWidth" 
                    #attributes "type" 
                    #order "given" 
                    ! "abbreviated narrow short wide"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "default" 
                    #attributes "type" 
                    #type "choice" 
                    ! {format gregorian long medium pinyin standard stroke wide}
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "era" 
                    #attributes "type" 
                    #type "regex" 
                    ! "[0-9]+"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "field" 
                    #attributes "type" 
                    #order "given" 
                    ! {era year year-short year-narrow quarter quarter-short^/^-^-^-^-quarter-narrow month month-short month-narrow week week-short week-narrow day day-short day-narrow weekday dayperiod hour hour-short hour-narrow^/^-^-^-^-minute minute-short minute-narrow second second-short second-narrow zone sun sun-short sun-narrow mon mon-short mon-narrow tue tue-short^/^-^-^-^-tue-narrow wed wed-short wed-narrow thu thu-short thu-narrow fri fri-short fri-narrow sat sat-short sat-narrow}
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "firstDay weekendEnd weekendStart" 
                    #attributes "day" 
                    #order "given" 
                    ! "sun mon tue wed thu fri sat"
                ] 
                attributeValues [#dtds "ldml" #elements "generation" #attributes "date" ! "$genDate"] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "group" 
                    #attributes "contains" 
                    #type "list" 
                    ! "$_region"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "hours" 
                    #attributes "allowed" 
                    #type "list" 
                    ! "$hourStyle"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "hours" 
                    #attributes "preferred" 
                    #type "regex" 
                    ! "$hourStyle"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "hours" 
                    #attributes "regions" 
                    #type "list" 
                    ! "$_region"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "info" 
                    #attributes "digits" 
                    #type "regex" 
                    ! "[0-9]+"
                ] 
                attributeValues [#dtds "supplementalData" #elements "info" #attributes "iso4217" ! "$_bcp47_currency|$defaultCurrencyInfo"] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "info" 
                    #attributes "rounding" 
                    #type "regex" 
                    ! "[0-9]+"
                ] 
                attributeValues [#dtds "ldml" #elements "key" #attributes "type" ! "$_bcp47_keys"] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "language" 
                    #attributes "scripts" 
                    #type "list" 
                    ! "$_script"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "language" 
                    #attributes "territories" 
                    #type "list" 
                    ! "$_region"
                ] 
                attributeValues [#dtds "ldml" #elements "language" #attributes "type" ! "$localeOrDeprecated"] 
                attributeValues [#dtds "supplementalData" #elements "language" #attributes "variants" ! "$_variant"] 
                attributeValues [#dtds "supplementalData" #elements "languageAlias" #attributes "replacement" #type "locale"] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "languageAlias" 
                    #attributes "type" 
                    #type "regex" 
                    ! "[a-zA-Z0-9]{1,3}(_[A-Za-z0-9]{2,8})*"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "mapTimezones" 
                    #attributes "type" 
                    #type "regex" 
                    ! ".+"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "mapZone" 
                    #attributes "type" 
                    #type "list" 
                    ! "$_bcp47_timezone"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "mapping" 
                    #attributes "registry" 
                    #type "choice" 
                    ! "iana"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "mapping" 
                    #attributes "type" 
                    #type "choice" 
                    ! "utf-8"
                ] 
                attributeValues [#dtds "supplementalData" #elements "numberingSystem" #attributes "id" ! "$_bcp47_numbers"] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "numberingSystem" 
                    #attributes "type" 
                    #type "choice" 
                    ! "algorithmic numeric"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "minDays" 
                    #attributes "count" 
                    #type "regex" 
                    ! "[0-7]"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "month" 
                    #attributes "type" 
                    #type "choice" 
                    ! "1 2 3 4 5 6 7 8 9 10 11 12 13"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "monthPattern" 
                    #attributes "type" 
                    #type "choice" 
                    ! "leap standardAfterLeap combined"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "monthPatternContext" 
                    #attributes "type" 
                    #order "given" 
                    ! "format stand-alone numeric"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "monthPatternWidth" 
                    #attributes "type" 
                    #type "choice" 
                    ! "abbreviated narrow wide all"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "monthWidth quarterWidth cyclicNameWidth" 
                    #attributes "type" 
                    #order "given" 
                    ! "abbreviated narrow wide"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "pattern" 
                    #attributes "type" 
                    #type "choice" 
                    ! {standard atLeast range 1000 10000 100000 1000000 10000000^/^-^-^-^-10000000 100000000 1000000000 10000000000 100000000000 1000000000000 10000000000000 100000000000000}
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "preferenceOrdering" 
                    #attributes "type" 
                    #type "list" 
                    ! "$_bcp47_timezone"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "quarter" 
                    #attributes "type" 
                    #type "choice" 
                    ! "1 2 3 4"
                ] 
                attributeValues [#dtds "ldml" #elements "reference" #attributes "type" ! "$reference"] 
                attributeValues [#dtds "supplementalData" #elements "region" #attributes "iso3166" ! "$_region"] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "relative" 
                    #attributes "type" 
                    #type "regex" 
                    ! "-?[0-9]+"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "relativeTime" 
                    #attributes "type" 
                    #type "choice" 
                    ! "future past"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "reset" 
                    #attributes "before" 
                    #type "choice" 
                    ! "primary secondary tertiary"
                ] 
                attributeValues [#dtds "ldml" #elements "rule" #attributes "id" ! "$double"] 
                attributeValues [#dtds "ldml" #elements "script" #attributes "type" ! "$_script|$scriptNonUnicode"] 
                attributeValues [#dtds "supplementalData" #elements "scriptAlias" #attributes "replacement" ! "$_script"] 
                attributeValues [#dtds "supplementalData" #elements "scriptAlias" #attributes "type" ! "$_script"] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "segmentation" 
                    #attributes "type" 
                    #type "choice" 
                    ! {GraphemeClusterBreak LineBreak SentenceBreak WordBreak}
                ] 
                attributeValues [#dtds "ldml" #elements "symbols" #attributes "numberSystem" ! "$_bcp47_nu"] 
                attributeValues [#dtds "ldml" #elements "territory" #attributes "type" ! "$_region"] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "territoryAlias" 
                    #attributes "type" 
                    #type "regex" 
                    ! "[A-Z]{2,3}|[0-9]{3}"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "territoryAlias" 
                    #attributes "replacement" 
                    #type "list" 
                    ! "$_region"
                ] 
                attributeValues [#dtds "ldml" #elements "type" #attributes "key" ! "$_bcp47_keys"] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "unit" 
                    #attributes "type" 
                    #type "choice" 
                    ! "$_unit"
                ] 
                attributeValues [#dtds "ldml" #elements "variable" #attributes "id" ! "$variableID"] 
                attributeValues [#dtds "ldml" #elements "variant" #attributes "type" ! "$_variant"] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "variantAlias" 
                    #attributes "type" 
                    #type "regex" 
                    ! "[A-Za-z0-9]{4,8}"
                ] 
                attributeValues [#dtds "supplementalData" #elements "variantAlias" #attributes "replacement" ! "$_variant|$AX"] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "version" 
                    #attributes "number" 
                    #type "choice" 
                    ! "$version"
                ] 
                attributeValues [#dtds "ldml" #elements "weekendEnd weekendStart" #attributes "time" ! "$time"] 
                attributeValues [#dtds "ldml" #elements "zone" #attributes "type" ! "$_bcp47_timezone"] 
                attributeValues [#dtds "supplementalData" #elements "zoneFormatting" #attributes "multizone" ! "$_region"] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "zoneItem" 
                    #attributes "aliases" 
                    #type "list" 
                    ! "$_bcp47_timezone"
                ] 
                attributeValues [#dtds "supplementalData" #elements "zoneItem" #attributes "territory" ! "$_region"] 
                attributeValues [#dtds "supplementalData" #elements "zoneItem" #attributes "type" ! "$_bcp47_timezone"] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "annotation" 
                    #attributes "cp" 
                    #type "unicodeSetOrString" 
                    ! "$emoji"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "annotation" 
                    #attributes "tts" 
                    #type "TODO" 
                    ! "$exemplar"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "casingItem" 
                    #attributes "type" 
                    #type "choice" 
                    ! {calendar_field currencyName currencyName_count^/^-^-^-^-day_format_except_narrow day_narrow day_standalone_except_narrow era_abbr era_name era_narrow key keyValue language metazone_long^/^-^-^-^-month_format_except_narrow month_narrow month_standalone_except_narrow quarter_abbreviated quarter_format_wide quarter_narrow^/^-^-^-^-quarter_standalone_wide relative script symbol territory unit_pattern variant zone_exemplarCity zone_long zone_short}
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "codePattern" 
                    #attributes "type" 
                    #type "choice" 
                    ! "language script territory"
                ] 
                attributeValues [#dtds "ldml" #elements "collation" #attributes "references" #type "TODO"] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "compoundUnit" 
                    #attributes "type" 
                    #type "choice" 
                    ! "per"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "dateFormatItem" 
                    #attributes "id" 
                    #type "choice" 
                    ! {E EEEEd EHm EHms Ed Ehm Ehms Gy GyM^/^-^-^-^-GyMMM GyMMMEEEEd GyMMMEd GyMMMM GyMMMMEd GyMMMMd GyMMMd GyMd H HHmm HHmmZ HHmmss Hm HmZ Hmm Hms Hmsv Hmsvvvv Hmv M MEEEEd MEd MMM MMMEEEEd MMMEd^/^-^-^-^-MMMM MMMMEEEEd MMMMEd MMMMd MMMMdd MMMd MMMdd MMd MMdd Md Mdd UM UMMM UMMMd UMd d h hhmm hhmmss hm hms hmsv hmsvvvv hmv mmss ms y yM yMEEEEd^/^-^-^-^-yMEd yMM yMMM yMMMEEEEd yMMMEd yMMMM yMMMMEEEEd yMMMMEd yMMMMccccd yMMMMd yMMMd yMMdd yMd yQ yQQQ yQQQQ yyyy yyyyM yyyyMEEEEd yyyyMEd yyyyMM^/^-^-^-^-yyyyMMM yyyyMMMEEEEd yyyyMMMEd yyyyMMMM yyyyMMMMEd yyyyMMMMccccd yyyyMMMMd yyyyMMMd yyyyMMdd yyyyMd yyyyQQQ yyyyQQQQ}
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "dayPeriodContext" 
                    #attributes "type" 
                    #type "choice" 
                    ! "format stand-alone"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "durationUnit" 
                    #attributes "type" 
                    #type "choice" 
                    ! "hm hms ms"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "greatestDifference" 
                    #attributes "id" 
                    #type "choice" 
                    ! "H M a d h m y"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "intervalFormatItem" 
                    #attributes "id" 
                    #type "choice" 
                    ! {H Hm Hmv Hv M MEd MMM MMMEEEEd MMMEd MMMM MMMMEd^/^-^-^-^-MMMMd MMMd Md d h hm hmv hv y yM yMEd yMMM yMMMEEEEd yMMMEd yMMMM yMMMMEEEEd yMMMMEd yMMMMd yMMMd yMd}
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "listPattern" 
                    #attributes "type" 
                    #type "choice" 
                    ! "unit unit-narrow unit-short"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "metazone" 
                    #attributes "type" 
                    #type "TODO" 
                    ! "$metazone"
                ] 
                attributeValues [#dtds "ldml" #elements "miscPatterns" #attributes "numberSystem" ! "$_bcp47_nu"] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "pattern" 
                    #attributes "numbers" 
                    #type "choice" 
                    ! "M=romanlow d=hanidays hanidec hebr y=jpanyear"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "rbnfrule" 
                    #attributes "radix" 
                    #type "choice" 
                    ! {1,000 100 1000 100000 160,000 20 3,200,000 400 5^/^-^-^-^-64,000,000 8000}
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "rbnfrule" 
                    #attributes "value" 
                    #type "regex" 
                    ! "x|x.x|0.x|-x|0|[1-9][0-9]*"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "ruleset" 
                    #attributes "type" 
                    #type "regex" 
                    ! "[a-z0-9]+([-_][a-z0-9]+)*"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "rulesetGrouping" 
                    #attributes "type" 
                    #type "choice" 
                    ! "NumberingSystemRules OrdinalRules SpelloutRules"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "suppressions" 
                    #attributes "type" 
                    #type "choice" 
                    ! "standard"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "transformName" 
                    #attributes "type" 
                    #type "choice" 
                    ! {BGN Numeric Tone UNGEGN x-Accents x-Fullwidth^/^-^-^-^-x-Halfwidth x-Jamo x-Pinyin x-Publishing}
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "type" 
                    #attributes "type" 
                    #type "choice" 
                    ! "$_bcp47_value"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "version" 
                    #attributes "cldrVersion" 
                    #type "choice" 
                    ! "$double"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "approvalRequirement" 
                    #attributes "locales" 
                    #type "list" 
                    ! "$locale|$coverageSpecial"
                ] 
                attributeValues [#dtds "supplementalData" #elements "approvalRequirement" #attributes "paths" #type "TODO"] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "approvalRequirement" 
                    #attributes "votes" 
                    #type "choice" 
                    ! "20 4 8"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "attributeValues" 
                    #attributes "attributes" 
                    #type "choice" 
                    ! {_q aliases allowed alt before^/^-^-^-^-before from to contains type count date day digits hex id iso3166 iso4217 key multizone number numberSystem path preferred regions registry^/^-^-^-^-replacement replacement type request rounding scripts source territories territory time type uri validSubLocales value variants version}
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "attributeValues" 
                    #attributes "dtds" 
                    #type "choice" 
                    ! "supplementalData"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "attributeValues" 
                    #attributes "elements" 
                    #type "choice" 
                    ! {alias appendItem calendar character^/^-^-^-^-collation collations contextTransform contextTransformUsage cp currency currencyFormat currencyFormats decimalFormats percentFormats^/^-^-^-^-scientificFormats cyclicName cyclicNameContext cyclicNameSet dateFormat dateTimeFormat decimalFormat percentFormat scientificFormat timeFormat^/^-^-^-^-dateFormatLength timeFormatLength dateTimeFormatLength decimalFormatLength scientificFormatLength percentFormatLength currencyFormatLength day^/^-^-^-^-dayWidth default era field firstDay weekendEnd weekendStart generation group hours info key language languageAlias mapTimezones mapZone mapping^/^-^-^-^-minDays month monthPattern monthPatternContext monthPatternWidth monthWidth quarterWidth cyclicNameWidth numberingSystem pattern^/^-^-^-^-preferenceOrdering quarter reference region relative relativeTime reset rule script scriptAlias segmentation supplementalData symbols territory^/^-^-^-^-territoryAlias type unit variable variant variantAlias version weekendEnd weekendStart zone zoneFormatting zoneItem}
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "attributeValues" 
                    #attributes "order" 
                    #type "choice" 
                    ! "given"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "attributeValues" 
                    #attributes "type" 
                    #type "choice" 
                    ! "bcp47 choice list locale path regex"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "attributes" 
                    #attributes "attribute" 
                    #type "choice" 
                    ! "_q characters lines time type version"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "attributes" 
                    #attributes "attributeValue" 
                    #type "choice" 
                    ! {00:00 24:00 left-to-right standard^/^-^-^-^-top-to-bottom}
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "attributes" 
                    #attributes "element" 
                    #type "choice" 
                    ! {collation currency dateFormat^/^-^-^-^-dateTimeFormat decimalFormat ldml orientation pattern percentFormat scientificFormat timeFormat weekendEnd weekendStart}
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "blockingItems" 
                    #attributes "elements" 
                    #type "list" 
                    ! {identity supplementalData cldrTest^/^-^-^-^-collation transform identity supplementalData cldrTest collation transform}
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "calendar" 
                    #attributes "type" 
                    #type "regex" 
                    ! "$_bcp47_calendar"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "calendarPreference" 
                    #attributes "ordering" 
                    #type "list" 
                    ! "$_bcp47_calendar"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "calendarPreference" 
                    #attributes "territories" 
                    #type "list" 
                    ! "$_region"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "codesByTerritory" 
                    #attributes "territory" 
                    #type "choice" 
                    ! {001 AC AD AE AF AG AI AL AM AO AQ^/^-^-^-^-AR AS AT AU AW AX AZ BA BB BD BE BF BG BH BI BJ BL BM BN BO BQ BR BS BT BW BY BZ CA CC CD CF CG CH CI CK CL CM CN CO CR CU CV CW CX CY CZ DE DJ DK^/^-^-^-^-DM DO DZ EC EE EG EH ER ES ET FI FJ FK FM FO FR GA GB GD GE GF GG GH GI GL GM GN GP GQ GR GS GT GU GW GY HK HN HR HT HU ID IE IL IM IN IO IQ IR IS^/^-^-^-^-IT JE JM JO JP KE KG KH KI KM KN KP KR KW KY KZ LA LB LC LI LK LR LS LT LU LV LY MA MC MD ME MF MG MH MK ML MM MN MO MP MQ MR MS MT MU MV MW MX MY^/^-^-^-^-MZ NA NC NE NF NG NI NL NO NP NR NU NZ OM PA PE PF PG PH PK PL PM PN PR PS PT PW PY QA RE RO RS RU RW SA SB SC SD SE SG SH SI SJ SK SL SM SN SO SR^/^-^-^-^-SS ST SV SX SY SZ TC TD TF TG TH TJ TK TL TM TN TO TR TT TV TW TZ UA UG UM US UY UZ VA VC VE VG VI VN VU WF WS XK YE YT ZA ZM ZW}
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "coverageLevel" 
                    #attributes "inLanguage" 
                    #type "choice" 
                    ! {%CJK_Languages %arabextLanguages^/^-^-^-^-%collationType80TopLangs %devaLanguages %phonebookCollationLanguages %traditionalCollationLanguages (ja|ko|vi|zh) (ja|vi|zh) ar dz en ja ko si sv^/^-^-^-^-vai yi zh}
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "coverageLevel" 
                    #attributes "inScript" 
                    #type "choice" 
                    ! {Arab Armn Beng Deva Ethi Geor Grek^/^-^-^-^-Gujr Guru Hebr Khmr Knda Laoo Mlym Mong Mymr Orya Taml Telu Thai Tibt}
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "coverageLevel" 
                    #attributes "inTerritory" 
                    #type "choice" 
                    ! {%chineseCalendarTerritories^/^-^-^-^-%islamicCalendarTerritories %persianCalendarTerritories AR AU BR CA CF CG CM EG ET EU GA GB ID IE IL IN JP KR KZ MX NG RU TD TH TW US}
                ] 
                attributeValues [#dtds "supplementalData" #elements "coverageLevel" #attributes "match" #type "TODO"] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "coverageLevel" 
                    #attributes "value" 
                    #type "choice" 
                    ! "basic core minimal moderate modern posix"
                ] 
                attributeValues [#dtds "supplementalData" #elements "coverageVariable" #attributes "key" #type "TODO"] 
                attributeValues [#dtds "supplementalData" #elements "coverageVariable" #attributes "value" #type "TODO"] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "currencyCodes" 
                    #attributes "numeric" 
                    #type "regex" 
                    ! "0|[1-9][0-9]*"
                ] 
                attributeValues [#dtds "supplementalData" #elements "currencyCodes" #attributes "type" ! "$_bcp47_cu"] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "dayPeriodRule" 
                    #attributes "after" 
                    #type "list" 
                    ! "$timeHour"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "dayPeriodRule" 
                    #attributes "at" 
                    #type "list" 
                    ! "$timeHour"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "dayPeriodRule" 
                    #attributes "before" 
                    #type "regex" 
                    ! "$timeHour"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "dayPeriodRule" 
                    #attributes "from" 
                    #type "regex" 
                    ! "$timeHour"
                ] 
                attributeValues [#dtds "supplementalData" #elements "dayPeriodRule" #attributes "type" #type "TODO"] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "dayPeriodRuleSet" 
                    #attributes "type" 
                    #type "choice" 
                    ! "selection"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "dayPeriodRules" 
                    #attributes "locales" 
                    #type "list" 
                    ! "$locale"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "defaultContent" 
                    #attributes "locales" 
                    #type "list" 
                    ! "$locale"
                ] 
                attributeValues [#dtds "supplementalData" #elements "deprecatedItems" #attributes "attributes" #type "TODO"] 
                attributeValues [#dtds "supplementalData" #elements "deprecatedItems" #attributes "elements" #type "TODO"] 
                attributeValues [#dtds "supplementalData" #elements "deprecatedItems" #attributes "values" #type "TODO"] 
                attributeValues [#dtds "supplementalData" #elements "distinguishingItems" #attributes "attributes" #type "TODO"] 
                attributeValues [#dtds "supplementalData" #elements "distinguishingItems" #attributes "elements" #type "TODO"] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "era" 
                    #attributes "end" 
                    #type "regex" 
                    ! "$date"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "era" 
                    #attributes "start" 
                    #type "regex" 
                    ! "$date"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "era" 
                    #attributes "type" 
                    #type "regex" 
                    ! "0|[1-9][0-9]{0,2}"
                ] 
                attributeValues [#dtds "supplementalData" #elements "firstDay" #attributes "references" #type "TODO"] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "firstDay" 
                    #attributes "territories" 
                    #type "list" 
                    ! "$_region"
                ] 
                attributeValues [#dtds "supplementalData" #elements "generation" #attributes "date" #type "TODO"] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "id" 
                    #attributes "idStatus" 
                    #type "choice" 
                    ! {deprecated macroregion private_use regular^/^-^-^-^-special}
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "id" 
                    #attributes "type" 
                    #type "choice" 
                    ! {currency language region script subdivision unit variant}
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "info" 
                    #attributes "cashDigits" 
                    #type "choice" 
                    ! "0"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "info" 
                    #attributes "cashRounding" 
                    #type "choice" 
                    ! "0 5"
                ] 
                attributeValues [#dtds "supplementalData" #elements "language" #attributes "type" #type "TODO"] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "languageMatch" 
                    #attributes "desired" 
                    #type "TODO" 
                    ! "$localeStar"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "languageMatch" 
                    #attributes "percent" 
                    #type "regex" 
                    ! "$percent"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "languageMatch" 
                    #attributes "supported" 
                    #type "TODO" 
                    ! "$localeStar"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "languageMatches" 
                    #attributes "type" 
                    #type "choice" 
                    ! "written"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "languagePopulation" 
                    #attributes "populationPercent" 
                    #type "regex" 
                    ! "$percentFraction"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "languagePopulation" 
                    #attributes "references" 
                    #type "regex" 
                    ! "R[0-9]+"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "languagePopulation" 
                    #attributes "type" 
                    #type "regex" 
                    ! "$locale"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "languagePopulation" 
                    #attributes "writingPercent" 
                    #type "regex" 
                    ! "$percent"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "likelySubtag" 
                    #attributes "from" 
                    #type "regex" 
                    ! "$localeAll"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "likelySubtag" 
                    #attributes "to" 
                    #type "choice" 
                    ! "$localeAll"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "mapTimezones" 
                    #attributes "otherVersion" 
                    #type "TODO" 
                    ! "7df0004"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "mapTimezones" 
                    #attributes "typeVersion" 
                    #type "TODO" 
                    ! "2011n 2015a"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "mapZone" 
                    #attributes "other" 
                    #type "list" 
                    ! "$name|$utc"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "mapZone" 
                    #attributes "territory" 
                    #type "regex" 
                    ! "$_region"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "measurementSystem" 
                    #attributes "territories" 
                    #type "list" 
                    ! "$_region"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "minDays" 
                    #attributes "territories" 
                    #type "list" 
                    ! "$_region"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "numberingSystem" 
                    #attributes "digits" 
                    #type "regex" 
                    ! "$digit"
                ] 
                attributeValues [#dtds "supplementalData" #elements "numberingSystem" #attributes "rules" #type "TODO"] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "paperSize" 
                    #attributes "territories" 
                    #type "list" 
                    ! "$_region"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "parentLocale" 
                    #attributes "locales" 
                    #type "list" 
                    ! "$locale"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "parentLocale" 
                    #attributes "parent" 
                    #type "list" 
                    ! "$locale"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "pluralRanges" 
                    #attributes "locales" 
                    #type "list" 
                    ! "$locale"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "pluralRules" 
                    #attributes "locales" 
                    #type "list" 
                    ! "$localeOrDeprecated"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "primaryZone" 
                    #attributes "iso3166" 
                    #type "regex" 
                    ! "$_region"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "reference" 
                    #attributes "type" 
                    #type "regex" 
                    ! "R[0-9]+"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "reference" 
                    #attributes "uri" 
                    #type "regex" 
                    ! "$uri"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "skipDefaultLocale" 
                    #attributes "services" 
                    #type "list" 
                    ! "$skipDefaultLocale"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "subdivisionAlias" 
                    #attributes "replacement" 
                    #type "choice" 
                    ! {AS AW BL BQ CW GF GP GU HK MF MO^/^-^-^-^-MP MQ NC PF PM PR RE SJ SX TF TW UM VI WF YT}
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "subdivisionAlias" 
                    #attributes "type" 
                    #type "TODO" 
                    ! "$subdivision"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "subgroup" 
                    #attributes "contains" 
                    #type "list" 
                    ! "$subdivisionSuffix"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "subgroup" 
                    #attributes "subtype" 
                    #type "regex" 
                    ! "[0-9A-Z]{0,3}"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "subgroup" 
                    #attributes "type" 
                    #type "TODO" 
                    ! "$_region"
                ] 
                attributeValues [#dtds "supplementalData" #elements "telephoneCountryCode" #attributes "code" #type "TODO"] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "territory" 
                    #attributes "gdp" 
                    #type "regex" 
                    ! "$integer"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "territory" 
                    #attributes "literacyPercent" 
                    #type "choice" 
                    ! "$percentFraction"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "territory" 
                    #attributes "population" 
                    #type "regex" 
                    ! "$integer"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "territory" 
                    #attributes "type" 
                    #type "TODO" 
                    ! "$_region"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "territoryCodes" 
                    #attributes "alpha3" 
                    #type "regex" 
                    ! "[A-Z]{3}"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "territoryCodes" 
                    #attributes "fips10" 
                    #type "regex" 
                    ! "[A-Z]{2}"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "territoryCodes" 
                    #attributes "internet" 
                    #type "list" 
                    ! "$internet"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "territoryCodes" 
                    #attributes "numeric" 
                    #type "regex" 
                    ! "[0-9]{3}"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "territoryCodes" 
                    #attributes "type" 
                    #type "TODO" 
                    ! "$_region"
                ] 
                attributeValues [#dtds "supplementalData" #elements "timezone" #attributes "type" ! "$_bcp47_tz"] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "transform" 
                    #attributes "source" 
                    #type "choice" 
                    ! "$transformId"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "transform" 
                    #attributes "target" 
                    #type "choice" 
                    ! "$transformId"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "transform" 
                    #attributes "variant" 
                    #type "choice" 
                    ! "BGN Names UNGEGN"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "usesMetazone" 
                    #attributes "from" 
                    #type "regex" 
                    ! "$datetime"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "usesMetazone" 
                    #attributes "mzone" 
                    #type "TODO" 
                    ! "$metazone"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "usesMetazone" 
                    #attributes "to" 
                    #type "choice" 
                    ! "$datetime"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "variable" 
                    #attributes "id" 
                    #type "regex" 
                    ! "\$[a-zA-Z0-9]+([-_][a-zA-Z0-9]+)?"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "version" 
                    #attributes "cldrVersion" 
                    #type "regex" 
                    ! "$double"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "version" 
                    #attributes "number" 
                    #type "regex" 
                    ! "\$Revision.*\$"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "version" 
                    #attributes "unicodeVersion" 
                    #type "regex" 
                    ! "\d+\.0\.0"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "weekendEnd" 
                    #attributes "territories" 
                    #type "list" 
                    ! "$_region"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "weekendStart" 
                    #attributes "territories" 
                    #type "list" 
                    ! "$_region"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "zoneAlias" 
                    #attributes "type" 
                    #type "regex" 
                    ! "[a-zA-Z0-9]+([/_][a-zA-Z0-9]+)*"
                ] 
                attributeValues [#dtds "supplementalData" #elements "zoneAlias" #attributes "replacement" ! "$_bcp47_tz"] 
                attributeValues [
                    #dtds "ldmlBCP47" 
                    #elements "generation" 
                    #attributes "date" 
                    #type "regex" 
                    ! "\$Date.*\$"
                ] 
                attributeValues [
                    #dtds "ldmlBCP47" 
                    #elements "key" 
                    #attributes "alias" 
                    #type "choice" 
                    ! {calendar colAlternate colBackwards colCaseFirst^/^-^-^-^-colCaseLevel colHiraganaQuaternary colNormalization colNumeric colReorder colStrength collation currency hours measure numbers timezone^/^-^-^-^-variableTop}
                ] 
                attributeValues [#dtds "ldmlBCP47" #elements "key" #attributes "description" #type "TODO"] 
                attributeValues [
                    #dtds "ldmlBCP47" 
                    #elements "key" 
                    #attributes "extension" 
                    #type "choice" 
                    ! "t"
                ] 
                attributeValues [
                    #dtds "ldmlBCP47" 
                    #elements "key" 
                    #attributes "name" 
                    #type "choice" 
                    ! "$_bcp47_keys"
                ] 
                attributeValues [
                    #dtds "ldmlBCP47" 
                    #elements "key" 
                    #attributes "since" 
                    #type "choice" 
                    ! "$versionDotted"
                ] 
                attributeValues [#dtds "ldmlBCP47" #elements "type" #attributes "alias" #type "TODO"] 
                attributeValues [#dtds "ldmlBCP47" #elements "type" #attributes "description" #type "TODO"] 
                attributeValues [#dtds "ldmlBCP47" #elements "type" #attributes "name" #type "TODO"] 
                attributeValues [
                    #dtds "ldmlBCP47" 
                    #elements "type" 
                    #attributes "preferred" 
                    #type "choice" 
                    ! "cnsha cnurc islamic-civil nzakl usden"
                ] 
                attributeValues [
                    #dtds "ldmlBCP47" 
                    #elements "type" 
                    #attributes "since" 
                    #type "choice" 
                    ! "$versionDotted"
                ] 
                attributeValues [
                    #dtds "ldmlBCP47" 
                    #elements "version" 
                    #attributes "cldrVersion" 
                    #type "choice" 
                    ! "$double"
                ] 
                attributeValues [
                    #dtds "ldmlBCP47" 
                    #elements "version" 
                    #attributes "number" 
                    #type "regex" 
                    ! "\$Revision.*\$"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "group" 
                    #attributes "type" 
                    #type "list" 
                    ! "$_region"
                ] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "personList" 
                    #attributes "locales" 
                    #type "list" 
                    ! "$localeOrDeprecated"
                ] 
                attributeValues [#dtds "supplementalData" #elements "subgroup" #attributes "subtype" #type "TODO"] 
                attributeValues [
                    #dtds "supplementalData" 
                    #elements "variable" 
                    #attributes "type" 
                    #type "choice" 
                    ! "TODO choice list locale regex unicodeSet"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "dayPeriod" 
                    #attributes "type" 
                    #type "localeSpecific" 
                    ! "dayPeriodFormat"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "pattern" 
                    #attributes "count" 
                    #type "localeSpecific" 
                    ! "pluralOrdinal"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "displayName" 
                    #attributes "count" 
                    #type "localeSpecific" 
                    ! "pluralOrdinal"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "relativeTimePattern" 
                    #attributes "count" 
                    #type "localeSpecific" 
                    ! "pluralOrdinal"
                ] 
                attributeValues [
                    #dtds "ldml" 
                    #elements "unitPattern" 
                    #attributes "count" 
                    #type "localeSpecific" 
                    ! "pluralOrdinal"
                ] 
                attributeValues [#dtds "keyboard" #elements "keyMap" #attributes "modifiers" #type "TODO"] 
                attributeValues [#dtds "keyboard" #elements "keyboard" #attributes "locale" #type "TODO"] 
                attributeValues [
                    #dtds "keyboard" 
                    #elements "map" 
                    #attributes "iso" 
                    #type "list" 
                    ! {A00 A01 A02 A03 A04 A05 B00 B01 B02 B03 B04 B05 B06 B07 B08^/^-^-^-^-B09 B10 B11 B12 C01 C02 C03 C04 C05 C06 C07 C08 C09 C10 C11 C12 D01 D02 D03 D04 D05 D06 D07 D08 D09 D10 D11 D12 D13 E00 E01 E02 E03 E04 E05 E06^/^-^-^-^-E07 E08 E09 E10 E11 E12 E13}
                ] 
                attributeValues [#dtds "keyboard" #elements "map" #attributes "longPress" #type "TODO"] 
                attributeValues [#dtds "keyboard" #elements "map" #attributes "to" #type "TODO"] 
                attributeValues [#dtds "keyboard" #elements "name" #attributes "value" #type "TODO"] 
                attributeValues [#dtds "keyboard" #elements "transform" #attributes "from" #type "TODO"] 
                attributeValues [#dtds "keyboard" #elements "transform" #attributes "to" #type "TODO"] 
                attributeValues [
                    #dtds "keyboard" 
                    #elements "transforms" 
                    #attributes "type" 
                    #type "choice" 
                    ! "simple"
                ] 
                attributeValues [
                    #dtds "keyboard" 
                    #elements "version" 
                    #attributes "cldrVersion" 
                    #type "list" 
                    ! "28"
                ] 
                attributeValues [#dtds "keyboard" #elements "version" #attributes "number" #type "TODO"] 
                attributeValues [#dtds "keyboard" #elements "version" #attributes "platform" #type "TODO"] 
                attributeValues [
                    #dtds "platform" 
                    #elements "map" 
                    #attributes "iso" 
                    #type "list" 
                    ! {A03 B00 B01 B02 B03 B04 B05 B06 B07 B08 B09 B10 B11 C01 C02^/^-^-^-^-C03 C04 C05 C06 C07 C08 C09 C10 C11 C12 D01 D02 D03 D04 D05 D06 D07 D08 D09 D10 D11 D12 D13 E00 E01 E02 E03 E04 E05 E06 E07 E08 E09 E10 E11 E12^/^-^-^-^-E13}
                ] 
                attributeValues [
                    #dtds "platform" 
                    #elements "map" 
                    #attributes "keycode" 
                    #type "list" 
                    ! {0 1 10 11 115 12 13 132 14 15 16 17 18 19 2 20 21 22 23^/^-^-^-^-24 25 26 27 28 29 3 30 31 32 33 34 35 36 37 38 39 4 40 41 42 43 44 45 46 47 48 49 5 50 51 52 53 54 55 56 57 58 59 6 60 61 65 7 8 86 9 93 94 97}
                ] 
                attributeValues [
                    #dtds "platform" 
                    #elements "platform" 
                    #attributes "id" 
                    #type "list" 
                    ! "android chromeos osx windows"
                ]
            ]
        ]
    ]

