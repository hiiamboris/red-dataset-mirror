Original URL: <http://helpin.red/cs/Navigaceradami.html>

# Navigace řadami

* * *

* * *

- První element řady se nazývá head (čelo). Jak uvidíme, nemusí to být vždy nutně první element;
- Za posledním elementem řady je něco, čemu se říká tail (chvost). Je to místo bez hodnoty.
- Každá řada má "entry index", jehož nejlepší definicí by mohlo být: "místo, kde začíná použitelná část řady". Mnohé operace s řadami mají tento  "entry index" jako startovní bod. Entry index lze posouvat vzad i vpřed s vlivem na výsledek operace.
- Každý element řady je označen číselným indexem, začínajícím 1 (not zero!) u prvního elementu.
- Počínaje pozicí entry indexu, mají elementy slovní označení : "first" pro první, "second" pro druhý a tak dál až po "fifth".

Poznámka: Pojem "entry index" jsem si vymyslel, neboť v dokumentaci není. Tam je "entry index" označován pouze jako "index", což se podle mého názoru může plést s "číslem indexu".

### action! head? action! tail? action! index?

Tyto příkazy vrací informaci o pozici  entry indexu. Je-li entry index v čele řady, dotaz  head? vrací true, jinak false. Tatáž logika platí pro tail?. Dotaz index? vrací číslo indexu místa, kde se aktuálně nachází entry index.

Následující příklady vysvětlení objasní.

Vytvořme řadu s, obsahující řetězce "cat" "dog" "fox" "cow" "fly" "ant" "bee" :

&gt;&gt; s: \[ "cat" "dog" "fox" "cow" "fly" "ant" "bee" ]  
\== \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]

Dostaneme něco, co vypadá asi takto:

![](http://helpin.red/lib/series1b.png)

&gt;&gt; head? s  
\== true

&gt;&gt; index? s  
\== 1

&gt;&gt; print first s  
cat

### action! head  action! tail

### Příkaz head přemístí entry index k prvnímu elementu řady, na její čelo.

Příkaz tail přemístí entry index na pozici za posledním elementem řady, do chvostu.

Umístění head a tail samo o sobě řadu nemění, pouze head  vrací celou řadu a tail nevrací nic.

### action! next

&gt;&gt; s: next s  
\== \["dog" "fox" "cow" "fly" "ant" "bee"]

Příkaz next přemístí entry index o jeden element směrem ke chvostu. Všimněte si, že next pouze vrací změněnou řadu ale nemění ji. Opakované použití příkazu next nezpůsobí další posun vstupního indexu, protože příkaz bychom aplikovali na původní, nezměněné řadě.

Nyní tedy máme:

![](http://helpin.red/lib/series2b.png)

&gt;&gt; print s  
dog fox cow fly ant bee

&gt;&gt; head? s  
\== false                ; entry index není v čele

&gt;&gt; print first s        ; s pozicí entry indexu se posouvají i aliasy  
dog

&gt;&gt; index? s             ; indexování elementů se však nemění  
\== 2

### action! back

Příkaz back je opakem příkazu next: přemístí entry index o jeden element směrem k čelu. Provedete-li back v naší řadě s, vrátí se "cat" zpátky na scénu! Nikdy nebylo zapomenuto!

To znamená, že Red staré s neodhodil. Je to jedna ze zvláštností Redu: data zůstávají trvale vnořena v kódu.

Poté, co jste přemístil index v naší řadě s vpřed a přiřadil ji k jinému slovu, např.  b (b: s), můžete provádět přesuny indexu vzad i vpřed  pro b a dobývat "skryté" hodnoty s, protože b ukazuje na stejná data jako s.

Chcete-li vytvořit nezávislou kopii řady, musíte použít příkaz  copy.

Jak jsem se již zmínil dříve, v Redu jsou (na rozdíl od jiných jazyků) proměnné (slova) přiřazeny k datům a nikoliv naopak.

### action! skip

Přemístí entry index o daný počet elementů k chvostu.

![](http://helpin.red/lib/series3b.png)

&gt;&gt; s: skip s 3  
\== \["fly" "ant" "bee"]

&gt;&gt; print s  
fly ant bee

&gt;&gt; print first s  
fly

&gt;&gt; print index? s  
5

Je-li skok delší než počet elementů, zůstane entry index ve chvostu.

&gt;&gt; s: skip s 100  
\== \[]

![](http://helpin.red/lib/series4b.png)

&gt;&gt; tail? s  
\== true

&gt;&gt; index? s  
\== 8

Viditelnost elementů řady lze obnovit zpětnými skoky:

&gt;&gt; s: skip s -4  
\== \["cow" "fly" "ant" "bee"]

![](http://helpin.red/lib/series5b.png)

&gt;&gt; print first s  
cow

&gt;&gt; print index? s  
4
