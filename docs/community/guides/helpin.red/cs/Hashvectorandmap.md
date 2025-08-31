Original URL: <http://helpin.red/cs/Hashvectorandmap.html>

# Hash!, vector! and map!

* * *

* * *

Tyto datové typy si zasluhují samostatnou kapitolu. Mohou výrazně zlepšit kvalitu a rychlost práce.

Hash! a vector! jsou výkonné řady, zejména u velkých sestav.

Doporučuji před dalším čtením nahlédnout do kapitol [Bloky a řady](http://helpin.red/Blokyarady.html).

#### hash!

hash! je řada, upravená pro rychlejší vyhledávání. Protože "hašování" spotřebovává zdroje, nemá cenu vytvářet  hash!  pro řady, které budou prohledávány jenom několikrát.  Pokud však má být vaše řada prohledávaná často, vyplatí se z ní vytvořit hash! . Webová stránka Rebolu tvrdí, že vyhledávání může být 650 krát rychlejší než u normálních řad.

&gt;&gt; a: make hash! \[a 33 b 44 c 52]  
\== make hash! \[a 33 b 44 c 52]

&gt;&gt; select a \[c]  
\== 52

&gt;&gt; select a 'c  
\== 52

&gt;&gt; a/b  
\== 44

#### Jinak to jsou řady, jejichž hodnoty jsou interně vnímané jako skupiny dvojic.

#### vector!

Vektory jsou výkonné řady položek typu integer! ,float!, char! nebo percent!.

K vytvoření vektoru použijete příkaz  make vector!

#### Zatímco  hash!  umožňuje rychlejší vyhledávání,   vector!  umožňuje rychlejší provádění matematických operací, noboť jsou prováděny pro celou řadu najednou.

&gt;&gt; a: make vector! \[33 44 52]  
\== make vector! \[33 44 52]

&gt;&gt; print a  
33 44 52

&gt;&gt; print a * 8  
264 352 416

#### Všimněte si, že to nejde udělat s blokem, patřícím rovněž do skupiny series!:

&gt;&gt; a: \[2 3 4 5]

== \[2 3 4 5]

&gt;&gt; print a * 2

\*\** Script Error: * does not allow block! for its value1 argument

\*\** Where: *

\*\** Stack:  

#### map!

Mapy jsou vysoce výkonné slovníky, které sdružují klíče s hodnotami (key1: val1  key2: val2 ... key3: val3).

Mapy nejsou řadami. Nelze u nich uplatnit většinu příkazů pro řady (series).

Pro vyjmutí hodnoty z mapy použijeme příkaz select  a pro zadání hodnoty použijeme specielní akci: put.

&gt;&gt; a: make map! \["mini" 33 "winny" 44 "mo" 55]  
\== #(  
       "mini" 33  
       "winny" 44  
       "mo" 55  
...

&gt;&gt; print a  
"mini" 33  
"winny" 44  
"mo" 55

&gt;&gt; print select a "winny"  
44

&gt;&gt; put a "winny" 99  
\== 99

&gt;&gt; print a  
"mini" 33  
"winny" 99  
"mo" 55
