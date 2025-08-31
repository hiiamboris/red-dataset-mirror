Original URL: <http://helpin.red/cs/Serieschangers.html>

# Series "changers"

* * *

* * *

Tyto příkazy mění původní řady !

### action! clear

Smaže všechny elementy řady.

Pouhé přiřazení prázdného řetězce (" ")  nebo nuly nemusí mít očekávaný účinek. Pamatování "věcí" realizuje Red mnohdy neočekávanými způsoby. Skutečné smazání řady zajistí příkaz  clear.

&gt;&gt; a: \[11 22 33 "cat"]  
\== \[11 22 33 "cat"]

&gt;&gt; clear a  
\== \[]

&gt;&gt; a  
\== \[]

### action! poke

Změní hodnotu elementu řady v pozici dané druhým argumentem na hodnotu třetího argumentu.

![](http://helpin.red/lib/poke.png)

&gt;&gt; x: \["cat" "dog" "mouse" "fly"]  
\== \["cat" "dog" "mouse" "fly"]

&gt;&gt; poke x 3 "BULL"  
\== "BULL"

&gt;&gt; x  
\== \["cat" "dog" "BULL" "fly"]

&gt;&gt; s: "abcdefghijklmn"  
\== "abcdefghijklmn"

&gt;&gt; poke s 4 #"W"  
\== #"W"

&gt;&gt; s  
\== "abcWefghijklmn"

### action! append

Vloží elementy druhého argumentu na konec řady.

![](http://helpin.red/lib/append.png)

&gt;&gt; x: \["cat" "dog" "mouse" "fly"]  
\== \["cat" "dog" "mouse" "fly"]

&gt;&gt; append x "HOUSE"  
\== \["cat" "dog" "mouse" "fly" "HOUSE"]

&gt;&gt; x  
\== \["cat" "dog" "mouse" "fly" "HOUSE"]

&gt;&gt;x: \["cat" "dog" "mouse" "fly"]  
\== \["cat" "dog" "mouse" "fly"]

&gt;&gt; y: \["Sky" "Bull"]  
\== \["Sky" "Bull"]  

&gt;&gt; append x y  
\== \["cat" "dog" "mouse" "fly" "Sky" "Bull"]

&gt;&gt; x  
\== \["cat" "dog" "mouse" "fly" "Sky" "Bull"]

&gt;&gt; append "abcd" "EFGH"  
\== "abcdEFGH"

#### /part

Omezuje počet připojovaných elementů.

&gt;&gt;  append/part \["a" "b" "c"] \["A" "B" "C" "D" "E"]  2  
\== \["a" "b" "c" "A" "B"]

#### /only

Připojí připojovanou řadu jako vnořený blok.

&gt;&gt; append/only \["a" "b" "c"] \["A" "B"]  
\== \["a" "b" "c" \["A" "B"]]

#### /dup

Připojí vícekrát (dup) druhý argument k prvnímu.

&gt;&gt; append/dup \["a" "b" "c"] \["A" "B"] 3  
\== \["a" "b" "c" "A" "B" "A" "B" "A" "B"]

### action! insert

Vloží elementy druhého argumentu v místě aktuálního entry-indexu (obvykle to je počátek řady). Zatímco append vrací řadu od čela, insert ji vrací až za místem vložení. To umožňuje řetězit vícero operací  insert, nebo  počítat délku vložené části.

![](http://helpin.red/lib/insert.png)

&gt;&gt; a: "abcdefgh"  
\== "abcdefgh"

&gt;&gt; insert a "OOO"  
\== "abcdefgh"

&gt;&gt; a  
\== "OOOabcdefgh"

![](http://helpin.red/lib/insert2.png)

&gt;&gt; a: "abcdefgh"  
\== "abcdefgh"

&gt;&gt; insert at a 3 "OOO"  
\== "cdefgh"

&gt;&gt; a  
\== "abOOOcdefgh"

#### /part

Vloží pouze zadaný počet vkládaných elementů.

#### /only

Umožňuje vložení elementů jako blok.

#### /dup

Umožňuje opakované vložení druhého argumentu v počtu, daném třetím argumentem.

&gt;&gt; a: "abcdefg"  
\== "abcdefg"

&gt;&gt; insert/dup a "XYZ" 3  
\== "abcdefg"

&gt;&gt; a  
\== "XYZXYZXYZabcdefg"

function! replace

Nahradit uvedený element danou hodnotou. Provede se jen pro první výskyt.

![](http://helpin.red/lib/replace.png)

&gt;&gt; replace \["cat" "dog" "mouse" "fly" "Sky" "Bull"] "mouse" "HORSE"  
\== \["cat" "dog" "HORSE" "fly" "Sky" "Bull"]

##### /all

Nahradí se všechny výskyty

&gt;&gt; a: "my nono house nono is nono nice"  
\== "my nono house nono is nono nice"

&gt;&gt; replace/all a "nono " ""  
\== "my house is nice"

action! sort

Třídí řadu podle velikosti hodnot.

![](http://helpin.red/lib/changerssort.png)

&gt;&gt; sort \[8 4 3 9 0 1 5 2 7 6]  
\== \[0 1 2 3 4 5 6 7 8 9]

&gt;&gt; sort "sorting strings is useless"  
\== " eeggiiilnnorrsssssssttu"

### /case

### Provede case-sensitive třídění.

### /skip

### Zachází s řadou jako s pořadím skupin zadané délky.

### /compare

### Pro definovaný komparátor (offset, blok, funkce) zadáme porovnávané elementy.

&gt;&gt; names: \["Larry" "Curly" "Mo" ]  
\== \["Larry" "Curly" "Mo" ]

&gt;&gt; sort/compare names function \[a b] \[a &gt; b]         ; zajímavá diskrepance!

== \["Mo" "Larry" "Curly"]

### /part

### Třídí pouze části řad

### /all

### Porovná všechna vybraná pole. Používá se s upřesněním 'skip'  pro určení velikosti skupin.

### /reverse

### Obrátit pořadí

### /stable

### Místo někdy  nestabilního třídění Quicksort se použije stabilnější ale pomalejší algoritmus Merge.

action! remove

Odebere první hodnotu řady.

![](http://helpin.red/lib/remove1.png)

&gt;&gt; s: \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]  
\== \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]

&gt;&gt; remove s  
\== \["dog" "fox" "cow" "fly" "ant" "bee"]

&gt;&gt; s  
\== \["dog" "fox" "cow" "fly" "ant" "bee"]

#### /part

Odebere zadaný počet elementů.

![](http://helpin.red/lib/removepart.png)

&gt;&gt; s: "abcdefghij"  
\== "abcdefghij"

&gt;&gt; remove/part s 4  
\== "efghij"

Totéž lze provést příkazem  remove at \[0 1 2 3 4 5] 2 

### native! remove-each

### Podobně jako foreach,  postupně vyhodnotí blok pro každý element řady. Vrací-li blok hodnotu  true, je element odebrán z řady:

Red \[]

a: \["dog" 23 3.5 "house" 45]

remove-each i a \[string? i]                    ; odebere všechny řetězce

print a

23 3.5 45

Red \[]

a: "   my house in the middle of our street"

remove-each i a \[i = #" "]                      ; odebere všechny mezery

print a

myhouseinthemiddleofourstreet

action! take

Odebere první element z řady a vrátí jej jako vratnou hodnotu (return).

&gt;&gt; s: \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]  
\== \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]

&gt;&gt; take s  
\== "cat"

&gt;&gt; s  
\== \["dog" "fox" "cow" "fly" "ant" "bee"]

##### /last

Odebere poslední element z řady a vrátí jej jako vratnou hodnotu (return).

&gt;&gt; s: \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]  
\== \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]

&gt;&gt; take/last s  
\== "bee"

&gt;&gt; s  
\== \["cat" "dog" "fox" "cow" "fly" "ant"]

 take/last and append can be used to perform stack (queue) operations.

##### /part

Odebere daný počet elementů z počátku řady a vrátí je jako  return.

&gt;&gt; s: \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]  
\== \["cat" "dog" "fox" "cow" "fly" "ant" "bee"]

&gt;&gt; take/part s 3  
\== \["cat" "dog" "fox"]

&gt;&gt; s  
\== \["cow" "fly" "ant" "bee"]

### /deep

### Kopíruje vnořené hodnoty.

action! move

Přemístí jeden (implicitně) nebo více elementů řady na jinou pozici téže nebo jiné řady. Mění oba vstupní argumenty.

![](http://helpin.red/lib/move1.png)

/part

Přemístí zadaný počet elementů

![](http://helpin.red/lib/move2.png)

&gt;&gt; a: \[a b c d]  
\== \[a b c d]

&gt;&gt; b: \[1 2 3 4]  
\== \[1 2 3 4]

&gt;&gt; move a b  
\== \[b c d]

&gt;&gt; a  
\== \[b c d]

&gt;&gt; b  
\== \[a 1 2 3 4]

&gt;&gt; move/part a b 2  
\== \[d]

&gt;&gt; a  
\== \[d]

&gt;&gt; b  
\== \[b c a 1 2 3 4]

Příkaz move může být kombinován s jinými příkazy pro přemístění uvnitř jediné řady. Na příklad:

&gt;&gt; a: \[1 2 3 4 5]  
\== \[1 2 3 4 5]

&gt;&gt; move a tail a  
\== \[2 3 4 5 1]

&gt;&gt; move/part a tail a 3  
\== \[5 1 2 3 4]

action! change

Změní počáteční elementy řady a vrací řadu po změně. Mění pouze první řadu.

![](http://helpin.red/lib/change.png)

&gt;&gt; a: \[1 2 3 4 5]  
\== \[1 2 3 4 5]

&gt;&gt; change a \[a b]  
\== \[3 4 5]

&gt;&gt; a  
\== \[a b 3 4 5]

/part

Upraví měněnou délku řady vložením hodnot z jiné řady.

&gt;&gt; a: \[1 2 3 4 5]  
\== \[1 2 3 4 5]

&gt;&gt; change/part a \["a" "b"] 3  
\== \[4 5]

&gt;&gt; a  
\== \["a" "b" 4 5]

/only

Nahradí první element blokem.

&gt;&gt; change/only s: \[1 2 3 4 5] \[1 2]  
\== \[2 3 4 5]

&gt;&gt; s  
\== \[\[1 2] 2 3 4 5]

/dup  
Provede zadaný počet duplikátů změny.

function! alter

Připojí element k řadě nebo jej z řady odebere. Pokud   alter  zadaný element v řadě nenalezne připojí jej a vrátí true. Pokud jej nalezne, odebere jej a vrátí false.

&gt;&gt; a: \["cat" "dog" "fly" "bat" "owl"]  
\== \["cat" "dog" "fly" "bat" "owl"]

&gt;&gt; alter a "dog"  
\== false

&gt;&gt; a  
\== \["cat" "fly" "bat" "owl"]

&gt;&gt; alter a "HOUSE"  
\== true

&gt;&gt; a  
\== \["cat" "fly" "bat" "owl" "HOUSE"]

action! swap

Prohodí první elementy dvou řad. Vrací první řadu ale mění obě:

![](http://helpin.red/lib/swap.png)

&gt;&gt; a: \[1 2 3 4] b: \[a b c d]  
\== \[a b c d]

&gt;&gt; swap a b  
\== \[a 2 3 4]

&gt;&gt; a  
\== \[a 2 3 4]

&gt;&gt; b  
\== \[1 b c d]

S použitím slova find lze prohodit libovolný element dvou řad nebo elementy téže řady:

&gt;&gt; a: \[1 2 3 4 5] b: \["dog" "bat" "owl" "rat"]  
\== \["dog" "bat" "owl" "rat"]

&gt;&gt; swap find a 3 find b "owl"  
\== \["owl" 4 5]

&gt;&gt; a  
\== \[1 2 "owl" 4 5]

&gt;&gt; b  
\== \["dog" "bat" 3 "rat"]

action! reverse

Převrátí pořadí elementů v řadě:

&gt;&gt; reverse \[1 2 3]  
\== \[3 2 1]

&gt;&gt; reverse "abcde"  
\== "edcba"

/part  omezí akci reverse na zadaný počet elementů:

&gt;&gt; reverse/part "abcdefghi" 4  
\== "dcbaefghi"
