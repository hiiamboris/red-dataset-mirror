Original URL: <http://helpin.red/cs/Psanidosouboru.html>

# Psaní do souboru

* * *

### Psaní do souboru

* * *

##### Psaní do textového souboru:

action! write

##### Provede zápis do souboru, který vytvoří, pokud neexistuje.

&gt;&gt; write %myFirstFile.txt "Once upon a time..."

##### Připojení a manipulace s textovým souborem:

##### write/append

Opětovný zápis do souboru způsobí vymazání původního obsahu. Chcete-li jenom připojit (append) další text, použijete:

&gt;&gt; write/append %myFirstFile.txt "there was a house."

Váš soubor nyní obsahuje "Once upon a time...there was a house".

##### Psaní řad na vlastní řádky:

Přidejme nyní další soubor se třemi řádky:

&gt;&gt; write/lines %mySecondFile.txt \["First line;" "Second line;" "Third line."]

##### Přidávání dalších řádků:

&gt;&gt; write/append/lines %mySecondFile.txt \["Fourth line;" "Fifth line;" "Sixth line."]

Soubor nyní vypadá takto:

First line;  
Second line;  
Third line.  
Fourth line;  
Fifth line;  
Sixth line.

Vězte, že jste mohli psát write/lines/append. Pořadí upřesnění nemá na nic vliv.

##### Výměna znaků v souboru:

Pro výměnu znaků, počínaje na n+1 pozici, použijeme write/seek %&lt;file&gt; &lt;n&gt; :

&gt;&gt; write/seek %myFirstFile.txt "NEW TEXT" 5

První soubor nyní obsahuje text: "Once NEW TEXTime...there was a house."

Upřesnění

/binary      =&gt; Preserves contents exactly.

/lines        =&gt; Write each value in a block as a separate line.

/info         =&gt;

/append   =&gt; Write data at end of file.

/part         =&gt; Partial write a given number of units.

/seek        =&gt; Write at a specific position.

/allow        =&gt; Specifies protection attributes.

/as            =&gt; Write with the specified encoding, default is 'UTF-8.

function! save

Uloží hodnotu, blok, či jiná data do souboru, URL, bináru (binary) nebo řetězce.

##### Rozdíl mezi write a save:

&gt;&gt; write %myFourthFile.txt \[11 22 "three" "four" "five"]

Soubor nyní obsahuje blok: \[11 22 "three" "four" "five"]

&gt;&gt; save %myFourthFile.txt \[11 22 "three" "four" "five"]

Soubor nyní (po přepsání) obsahuje výčet: 11 22 "three" "four" "five"

Důležité použití příkazu save je při ukládání skriptů Redu, které mohou být interpretovány s použitím akce  do :

&gt;&gt; save %myProgram.r \[Red\[] print "hello"]  
&gt;&gt; do %myProgram.r  
hello

Příkazy do, [load](https://ungaretti.gitbooks.io/red-language-notebook/content/files-and-i-o.html) a [save](https://ungaretti.gitbooks.io/red-language-notebook/content/files-and-i-o.html)  se lépe chápou, považujete-li konzolu Redu za monitor starého počítače z 80. let, realizující některou variaci základního jazyka. Můžete program  load (načíst),  save (uložit)  nebo do (provést).
