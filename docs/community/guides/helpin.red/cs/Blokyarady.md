Original URL: <http://helpin.red/cs/Blokyarady.html>

# Bloky a řady

* * *

* * *

##### Bloky

##### Datový typ block! patří do typových skupin (typeset!) series, any-block a any-list.

Bloky jsou skupiny hodnot a slov, ohraničené hranatými závorkami, napříkad: \[one block], \[another block \[block within a block]]. Hodnoty a výrazy v bloku se implicitně nevyhodnocují. Vyhodnocení bloku se evokuje funkcemi do a reduce viz [Datový typ block!](https://doc.red-lang.org/cs/block.html).

Blok lze vytvořit výpisem závorek a hodnot, například (literálová skladba):

\[one 2 "three"]  
\[print 1.23]

nebo funkcemi make či  to (konstruktorová skladba):

&gt;&gt; make block! 10  
\== \[]                        ; alokuje prostor pro 10 prvků

&gt;&gt; to block! {one 2 4:00}  
\== \[one 2 4:00:00]           ; konvertuje string! na block!                      

##### Řady (series!)

Slovo series! je označení typové skupiny (typeset!), skládající se z těchto typů: block!, paren!, string!, file!, url!, path!, vector!, hash!, binary!, tag!, email!, image!.

Obecně je řada (serie) uspořádaná sada hodnot různých typů. Prvkem serie může být cokoli z repertoáru: data, slova, funkce, objekty, a jiné serie.

##### Pole - arrays

Pole (array) netvoří zavedený datový typ. Je to kolekce indexovaných (viz [Navigace řadami](http://helpin.red/Navigaceradami.html)) hodnot stejného typu. Jednorozměrné pole se označuje jako řádková matice (vektor), dvojrozměrné pole definuje matici. Třírozměrné pole se někdy označuje jako tenzor.

Řádková matice je tvořena jednoduchým blokem, matici tvoří blok řádkových matic, více rozměrové pole lze vyjádřit jako matici hodnot typu tuple!

Zde je příklad pole  o rozměrech 2 x 3:

&gt;&gt; a: \[\[1 2]\[3 4]\[5 6]]  
\== \[\[1 2] \[3 4] \[5 6]]

Pro přístup k jeho elementům lze použít lomítko:

&gt;&gt; a/1  
\== \[1 2]  
&gt;&gt; a/1/1  
\== 1  
&gt;&gt; a/3/2  
\== 6

Nebo slovní označení indexu:

&gt;&gt; third a  
\== \[5 6]
