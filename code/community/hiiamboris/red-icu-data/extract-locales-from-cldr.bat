for %%i in (en fr de es ar ru zh hi pt af it ja cs bg pl he tr ko en_US en_GB en_CA en_AU fr_FR fr_CA de_DE es_MX es_ES ar_SA ar_AE ar_EG ru_RU ru_BY ru_UA zh_CN hi_IN pt_BR af_ZA it_IT ja_JP cs_CZ bg_BG pl_PL he_IL tr_TR ko_KR) do (
	call red extract-locale.red d:\devel\red\unicode\cldr\40.0\common\main\%%i.red locales\%%i.red
)
