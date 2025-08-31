Original URL: <http://helpin.red/cs/Ctenizesouboru.html>

# Čtení ze souboru

* * *

### Čtení ze souboru

* * *

##### Načtení celého souboru do jednoho řetězce:

action! read

&gt;&gt; a: read %mySecondFile.txt  
\== {First line;^/Second line;^/Third line.^/Fourth line;^/Fifth li

Nyní proměnná "a" obsahuje celý obsah souboru:

&gt;&gt; print a  
First line;  
Second line;  
Third line.  
Fourth line;  
Fifth line;  
Sixth line.

##### Načtení souboru do bloku po jednotlivých řádcích:

Chcete-li číst soubor jako řadu, v níž je každý řádek elementem, použijete read/lines:

&gt;&gt; a: read/lines %mySecondFile.txt  
\== ["First line;" "Second line;" "Third line." "Fourth line;"...

&gt;&gt; print pick a 2  
Second line;

##### read/part         =&gt; čte pouze zadaný počet jednotek (source relative).

##### read/seek        =&gt; čte ze zadané pozice (source relative).

##### read/binary      =&gt; přesně zachovává obsah

##### read/lines         =&gt; přemění na blok řetězců

##### read/info          =&gt;

##### read/as            =&gt; čte se zadaným kódováním, implicitně je 'UTF-8.

function! load

Načtení souboru do bloku po jednotlivých slovech, oddělených mezerou:

Pro tento účel použijeme load místo read:

&gt;&gt; a: load %mySecondFile.txt  
\== [First line Second line Third line.  
               Fourth line Fifth...

&gt;&gt; print pick a 2  
line

##### Čtení a psaní binárních souborů:

Pro čtení či psaní binárního souboru jako je image nebo zvuk, se používá upřesnění  /binary. Následující kód načte bitmapové zobrazení do proměnné a zapíše jej do souboru s jiným názvem:

&gt;&gt; a: read/binary %heart.bmp  
\== #{  
424D660700000000000036000000280000001E00000014000000010...  
&gt;&gt; write/binary %newheart.bmp a

##### load/header    =&gt; TBD.

##### load/all           =&gt; načte všechny hodnoty, vrací blok; TBD: nevyhodnocuje záhlaví Red.

##### load/trap        =&gt; načte všechny hodnoty, vrací blok: \[\[values] position error].

##### load/next        =&gt; načte pouze následující hodnotu.

##### load/part        =&gt;

##### load/into        =&gt; vloží obsah do existujícího bloku

##### load/as          =&gt; zadání typu načítaných dat; použijeme NONE pro načtení jako kód
