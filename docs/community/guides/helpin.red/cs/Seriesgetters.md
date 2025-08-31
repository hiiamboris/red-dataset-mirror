Original URL: <http://helpin.red/cs/Seriesgetters.html>

# Series "getters"

* * *

* * *

Existuje takové množství příkazů pro manipulaci s řadami (series)se, že jsem je rozdělil do dvou kapitol - jednu pro příkazy získávající informace z řad (getters) a druhou pro příkazy, které přímo mění řady (changers).

Příkazy "getters" pouze vracejí hodnoty, bez změny řad. Nicméně i tyto příkazy mohou měnit řady, pokud přiřadíme řadu k vratné hodnotě.

### action! length?

Vrací velikost (délku) řady od aktuálního indexu ke konci.

&gt;&gt; a: \[1 3 5 7 9 11 13 15 17]  
\== \[1 3 5 7 9 11 13 15 17]

&gt;&gt; length? a  
\== 9

&gt;&gt; length? find a 13           ;see the command "find"  
\== 3                                   ;from "13" to the tail there are 3 elements

### function! empty?

Vrací true , je-li řada prázdná, jinak vrací  false.

&gt;&gt; a: \[3 4 5]  
\== \[3 4 5]

&gt;&gt; empty? a  
\== false

&gt;&gt; b:\[]  
\== \[]

&gt;&gt; empty? b  
\== true

### action! pick

Vybere hodnotu z řady na pozici, dané druhým argumentem.

![](http://helpin.red/lib/pick.png)

&gt;&gt; pick \["cat" "dog" "mouse" "fly"] 2  
\== "dog"

&gt;&gt; pick "delicious" 4  
\== #"i"

### action! at

Vrací řadu od zadaného indexu.

&gt;&gt; at \["cat" "dog" "fox" "cow" "fly" "ant" "bee" ] 4  
\== \["cow" "fly" "ant" "bee"]

### action! select a action! find

Oba příkazy vyhledají zadanou hodnotu v řadě. Hledání probíhá zleva doprava, není-li použito upřesnění  /reverse  nebo  /last.

Při nalezení shody:

- select vrací následující element řady za shodou;

&gt;&gt; select \["cat" "dog" "fox" "cow" "fly" "ant" "bee" ] \["cow"]  
\== "fly"

- find vrací celý zbytek řady od shody ke chvostu.

&gt;&gt; find \["cat" "dog" "fox" "cow" "fly" "ant" "bee" ] \["cow"]   
\== \["cow" "fly" "ant" "bee"]

##### /part

##### Omezí délku prohledávané řady na daný počet elementů;  v zobrazení dole je   prohledávaná oblast zvýrazněna:

&gt;&gt;select/part \["cat" "dog" "fox" "cow" "fly" "ant" "bee" ] \["cow"]  3   
\== none

&gt;&gt; select/part \["cat" "dog" "fox" "cow" "fly" "ant" "bee" ] \["fox"]  3     
\== "cow"       ; why?!

&gt;&gt; find/part \["cat" "dog" "fox" "cow" "fly" "ant" "bee" ] \["cow"]  3  
\== none

&gt;&gt; find/part \["cat" "dog" "fox" "cow" "fly" "ant" "bee" ] \["cow"]  4  
\== \["cow" "fly" "ant" "bee"]

##### /only

Hledá pouze blok uvnitř prohledávané řady.

&gt;&gt; find/only \["cat" "dog" "fox" "cow" "fly" "ant" "bee" ] \["cow" "fly"]          
\== none                          ;finds nothing

&gt;&gt; find/only \["cat" "dog" "fox" \["cow" "fly"] "ant" "bee" ] \["cow" "fly"]          
\== \[\["cow" "fly"] "ant" "bee"]   ;finds the block

##### /case

Pokyn pro rozlišování malých a velkých písmen.

##### /skip  \[řada skupin] \[shoda] \[délka skupiny]

Považuje řadu za sled skupin zadané délky. Požadovaná shoda se musí nalézat na prvním místě skupiny.

&gt;&gt; find/skip \["cat" "dog"  "fox" "dog"  "dog" "dog" "cow" "dog"  "fly" "dog"  "ant" "dog"  "bee" "dog"] \["dog"]  2   
\== \["dog" "dog" "cow" "dog" "fly" "dog" "ant" "dog" "bee" "dog"]

Skupiny jsou označeny žlutě a hledaná shoda modře. Vrací zbytek bloku včetně shody.

##### /last

Vyhledá poslední shodu se zadaným elementem; vrátí zbytek řady.

&gt;&gt; find/last \[33 11 22 44 11 12] 11  
\== \[11 12]

##### /reverse

The same as /last , but from the current index that can be set, for example by the at command.

##### find/tail

Normálně vrací find výsledek včetně shodujícího se elementu. S upřesněním /tail se vrací zbytek řady za shodným elementem, podobně jako u  select.

&gt;&gt; find \["cat" "dog" "fox" "cow" "fly" "ant" "bee" ] "fly"  
\== \["fly" "ant" "bee"]

&gt;&gt; find/tail \["cat" "dog" "fox" "cow" "fly" "ant" "bee" ] "fly"  
\== \["ant" "bee"]

##### find/match

Upřesnění /match  porovnává klíč s počátkem řady. Případnou vracenou hodnotou je zbytek řady za shodou.

&gt;&gt; find/match \["cat" "dog" "fox" "cow" "fly" "ant" "bee"] "fly"  
\== none                                                 ;no match

&gt;&gt; find/match \["cat" "dog" "fox" "cow" "fly" "ant" "bee"] "cat"  
\== \["dog" "fox" "cow" "fly" "ant" "bee"]                ;match

### function! last

Vrací poslední hodnotu řady.

&gt;&gt; last \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]  
\== "bee"

### function! extract

Extrahue hodnoty z řady v zadaném intervalu, vracejíc novou řadu.

&gt;&gt; extract \[1 2 3 4 5 6 7 8 9] 3  
\== \[1 4 7]

&gt;&gt; extract "abcdefghij" 2  
\== "acegi"

##### /index

Extrahuje hodnoty v zadaném intervalu od zadané pozice (indexem).

&gt;&gt; extract/index "abcdefghij" 2 4       ; interval index  
\== "dfhj"

##### /into

Připojí extrahované hodoty k zadané řadě (akumulátoru).

&gt;&gt; akum: \[]                           ;creates empty series  
\== \[]

&gt;&gt; extract/into "abcdefg" 2 akum  
\== \[#"a" #"c" #"e" #"g"]

&gt;&gt; extract/into \["cat" "dog" "fox" "cow" "fly"] 2 akum  
\== \[#"a" #"c" #"e" #"g" "cat" "fox" "fly"]

### action! copy

Viz kapitola [Kopírování](http://helpin.red/Kopirovani.html).

### native! union

Vrací spojení dvou řad. Duplikátní elementy jsou zařazeny pouze jednou.

&gt;&gt; union \[3 4 5 6] \[5 6 7 8]  
\== \[3 4 5 6 7 8]

/case

Case-sensitive porovnávání

&gt;&gt; union/case \[A a b c] \[b c C]  
\== \[A a b c C]

/skip                                                                

Považuje řady za sled skupin zadané délky. Porovnává se pouze první element každé skupiny. U duplicitních vstupů se zachovává záznam první řady:

&gt;&gt; union/skip \[1 2 3 4 5 6 7 8] \[1 8 5 1 2] 3                    
\== \[1 2 3 4 5 6 7 8]

&gt;&gt; union/skip \[a b c c d e e f f] \[a j k c y m e z z] 3  
\== \[a b c c d e e f f]

&gt;&gt; union/skip \[k b c c d e e f f] \[a j k c y m e z z] 3  
\== \[k b c c d e e f f a j k]

### native! difference

Vypouští duplicitní výskyty elementů z obou řad.

&gt;&gt; difference \[3 4 5 6] \[5 6 7 8]  
\== \[3 4 7 8]

/case

Case-sensitive porovnávání

/skip

Považuje řady za sled skupin zadané délky.

### native! intersect

Vrací pouze duplicitní výskyty elementů:

&gt;&gt; intersect \[3 4 5 6] \[5 6 7 8]  
\== \[5 6]

/case

Case-sensitive porovnávání

/skip

Považuje řady za sled skupin zadané délky

### native! unique

Vypouští duplikáty:

&gt;&gt; unique \[1 2 2 3 4 4 1 7 7]  
\== \[1 2 3 4 7]

/skip

Považuje řady za sled skupin zadané délky

### native! exclude

Vypouští zadané elementy z řady a vrací seznam neopakovaných elementů.

&gt;&gt; a: \[1 2 3 4 5 6 7 8]  
\== \[1 2 3 4 5 6 7 8]

&gt;&gt; exclude a \[2 5 8]  
\== \[1 3 4 6 7]

&gt;&gt; a  
\== \[1 2 3 4 5 6 7 8]                 ; nemění původní hodnotu řady

&gt;&gt; exclude "my house is a very funny house" "aeiou"  
\== "my hsvrfn"

&gt;&gt; exclude \[1 1 2 2 3 3 4 4 5 5 6 6] \[2 4]  
\== \[1 3 5 6]

/case

Case-sensitive porovnávání

/skip

Považuje řady za sled skupin zadané délky
