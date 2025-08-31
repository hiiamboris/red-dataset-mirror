Original URL: <http://helpin.red/cs/Manipulacestextem.html>

# Manipulace s textem

* * *

* * *

function! split

Vytvoří [blok](http://helpin.red/Blokyarady.html), sestavený z částí řetězce, rozděleného zadaným oddělovačem. Příkaz  split  je obzvláště vhodný pro analýzu a manipulaci s textovými  [soubory](http://helpin.red/Soubory.html).

&gt;&gt; s: "My house is a very funny house"  
&gt;&gt; split s " "                                        ; oddělovačem je každá mezera  
\== \["My" "house" "is" "a" "very" "funny" "house"]

&gt;&gt; s: "My house ; is a very ; funny house"  
&gt;&gt; split s ";"                        ; oddělovačem (delimiter) je středník  
\== \["My house " " is a very " " funny house"]

### Odebrání znaků: action! trim

Slovo trim (zredukovat) bez upřesnění odebírá bílá místa (taby a mezery) ze začátku a konce řetězce (také odebírá none z entity typu block! nebo object!). Hodnota argumentu se změní.

&gt;&gt; e: " spaces before and after "    
&gt;&gt; trim e  
\== "spaces before and after"

trim/head - odebírá mezery pouze z čela

&gt;&gt; e: " spaces before and after "  
&gt;&gt; trim/head e  
\== "spaces before and after "

trim/tail -  odebírá mezery pouze z chvostu

&gt;&gt; e: " spaces before and after "  
&gt;&gt; trim/tail e  
\== " spaces before and after"

trim/auto - Auto indents lines relative to first line.    Dosud neimplementováno

trim/lines - odebere přerušení řádku a nadbytečné mezery  
trim/all - odebere všechny mezery, nikoliv ale přerušení řádku

trim/with - odebere zadané znaky typu: char! string! integer!

&gt;&gt; d: "our house in the middle of our street"  
&gt;&gt; trim/with d " "  
\== "ourhouseinthemiddleofourstreet"

&gt;&gt; a: "house"  
&gt;&gt; trim/with a "u"  
\== "hose"

### Opak trim: function! pad

Příkaz pad rozšíří řetězec na danou velikost přidáním mezer. Implicitně se mezery přidávají vpravo ale s upřesněním /left  se mezery přidávají vlevo. Pozor, mění původní string.

&gt;&gt; a: "House"  
&gt;&gt; pad a 10  
\== "House "

&gt;&gt; pad/left a 20  
\== " House "

### Spojení textu: function! rejoin

&gt;&gt; a: "house" b: " " c: "entrance"  
&gt;&gt; rejoin \[a b c]  
\== "house entrance"

případně s příkazem append, což mění původní řady:

&gt;&gt; append a c  
\== "house entrance"

&gt;&gt; a: "house" b: " " c: "entrance"

&gt;&gt; append a c  
\== "houseentrance"

&gt;&gt; append a append b c  
\== "houseentrance entrance"                ; "a" was changed to "houseentrance" in the last manipulation

### Přeměna řady na text: action! form

Příkaz form přemění řadu na string odebráním hranatých závorek a přidáním mezer mezi elementy.

&gt;&gt; a: \["my" "house" 23 47 4 + 8 \["a" "bee" "cee"]]  
&gt;&gt; form a  
\== "my house 23 47 4 + 8 a bee cee"

form/part

Upřesnění /part limituje počet znaků ve vytvořeném řetězci.

&gt;&gt; a: \["my" "house" 23 47 4 + 8 \["a" "bee" "cee"]]  
&gt;&gt; form/part a 8  
\== "my house"

### Zjištění délky řetězce: action! length?

&gt;&gt; f: "my house"  
&gt;&gt; length? f                        ; see chapter "Series 'getters'"  
\== 8

### Přehled manipulací

### Levá strana řetězce:

použitím copy/part :

&gt;&gt; s: "nasty thing"  
&gt;&gt; b: copy/part s 5  
\== "nasty"

### Pravá strana řetězce:

použitím at :

&gt;&gt; s: "nasty thing"  
&gt;&gt; at tail s -5  
\== "thing"

použitím remove/part - pozor, mění původní řetězec!

&gt;&gt; s: "nasty thing"  
&gt;&gt; remove/part s 6  
\== "thing"

### Střední část řetězce:

použitím copy/part a at:

&gt;&gt; a: "abcdefghijkl"  
&gt;&gt; copy/part at a 4 3  
\== "def"

### Vkládání řetězců:

na začátek, s použitím insert:

&gt;&gt; s: "house"  
&gt;&gt; insert s "beautiful "

&gt;&gt; s  
\== "beautiful house"

na konec, s použitím append:

&gt;&gt; s: "beautiful"  
&gt;&gt; append s " day"  
\== "beautiful day"

ve střední části, s použitím insert at:

&gt;&gt; s: "nasty thing"  
&gt;&gt; insert at s 7 "little "

&gt;&gt; s  
\== "nasty little thing"

native! lowercase

Pozor, mění původní řetězec.

&gt;&gt; a: "mY HoUse"  
&gt;&gt; lowercase a  
\== "my house"

lovercase/part

&gt;&gt; a: "mY HoUse"  
&gt;&gt; lowercase/part a 2  
\== "my HoUse"

native! uppercase

&gt;&gt; a: "mY HoUse"  
&gt;&gt; uppercase a  
\== "MY HOUSE"

uppercase/part

&gt;&gt; a: "mY HoUse"  
&gt;&gt; uppercase/part a 2  
\== "MY HoUse"
