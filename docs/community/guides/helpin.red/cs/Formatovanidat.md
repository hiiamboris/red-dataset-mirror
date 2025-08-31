Original URL: <http://helpin.red/cs/Formatovanidat.html>

# Formátování dat

* * *

## Přístup a formátování dat

* * *

### native! get

Každé slovo Redu, nativní i uživatelsky vytvořené, je umístěno ve slovníku. Je-li slovo sdruženo s výrazem, je uloženo i s přidruženým výrazem, který se vyhodnotí v závislosti na typu volání slova.

Chcete-li znát slovníkový popis slova, použijete příkaz  get . Uvědomte si, že když v Redu odkazujete na slovo samotné (nikoliv jeho hodnotu), předznamenáte slovo apostrofem ('). Příkaz  get poskytuje význam i nativních slov ale vrací chybové hlášení, je-li použit pro konkretní hodnotu, např. typu  integer!, pair! či tuple! :

&gt;&gt; get 'print  
\== make native! [[  
       "Output...

&gt;&gt; get 'get  
\== make native! [[  
       "Return...

&gt;&gt; a: 7  
\== 7

&gt;&gt; get 'a  
\== 7

&gt;&gt; a: \[7 + 2]  
\== \[7 + 2]

&gt;&gt; get 'a  
\== \[7 + 2]

&gt;&gt; get 8  
\*\** Script Error: get does not allow integer! for its word argument

action! mold

Příkaz mold přemění zadanou hodnotu (např. typu block!, integer!, series! etc.) na řetězec a vrátí jej:

&gt;&gt; type? 8  
\== integer!

&gt;&gt; type? mold 8  
\== string!

&gt;&gt; print \[4 + 2]  
6

&gt;&gt; print mold \[4 + 2]  
\[4 + 2]

Refinements:

/only - Vyloučí vnější hranaté závorky bloku  
/all - Vrací hodnotu v načtení schopném formátu  
/flat - Vyloučí veškerou identaci  
/part - Omezí délku výsledku na zadanou hodnotu

action! form

Příkaz form  také přemění zadanou hodnotu na řetězec ale v závislosti na typu, nemusí výsledný text obsahovat extra informace o typu (jako \[ ] { } a ""), jako u příkazu mold. Užitečné  pro [Manipulace s textem](http://helpin.red/Manipulacestextem.html).

Red \[]

print "---------MOLD----------"

print mold {My house

       is a very

       funny house}

print "---------FORM----------"        

print form {My house

       is a very

       funny house}

print "---------MOLD----------"        

print mold \[3 5 7]

print "---------FORM----------"        

print form \[3 5 7]

---------MOLD----------

"My house^/^-is a very^/^-funny house"

---------FORM----------

My house

   is a very

   funny house

---------MOLD----------

\[3 5 7]

---------FORM----------

3 5 7

Umožňuje použití refinementu /part k omezení počtu znaků.

#### Hlavní použití pro mold a form:

mold se hlavně používá pro přeměnu řad na kód, který může být uložen a interpretován později

form se hlavně používá pro generování obyčejného textu z řad

&gt;&gt; a: \[b: drop-down data\[ "one" "two" "three"]\[print a/text]]  
\== \[b: drop-down data \["one" "two" "three"] \[print a/text]]

&gt;&gt; mold a  
\== {\[b: drop-down data \["one" "two" "three"] \[print a/text]]}

&gt;&gt; form a  
\== "b drop-down data one two three print a/text"

### function! probe

Příkaz  probe vytiskne svůj argument bez vyhodnocení a také jej vrátí. Lze jej s výhodou použít při ladění. Vzpomeňte si, že příkaz print svůj argument vyhodnocuje.

&gt;&gt; print \[3 + 2]  
5

&gt;&gt; probe \[3 + 2] \[3 + 2]  
\== \[3 + 2]

&gt;&gt; print probe \[3 + 2]  
\[3 + 2]  
5

### native! reduce

Vyhodnocuje výrazy uvnitř bloku a vrací nový blok s vyhodnocenými hodnotami. Nahlédněte do kapitoly  [Vyhodnocení](http://helpin.red/Vyhodnoceni.html).

&gt;&gt; a: \[3 + 5 2 - 8 9 &gt; 3]  
\== \[3 + 5 2 - 8 9 &gt; 3]

&gt;&gt; reduce a  
\== \[8 -6 true]

&gt;&gt; b:\[3 + 5 2 + 9 7 &gt; 2 \[6 + 6 3 &gt; 9]]  
\== \[3 + 5 2 + 9 7 &gt; 2 \[6 + 6 3 &gt; 9]]

&gt;&gt; reduce b  
\== \[8 11 true \[6 + 6 3 &gt; 9]]                ;it does not evaluate expressions of blocks inside blocks

&gt;&gt; b  
\== \[3 + 5 2 + 9 7 &gt; 2 \[6 + 6 3 &gt; 9]]        ;the original block remains unchanged.

/into     Vloží výsledek do připraveného bloku.

### function! collect a keep

### Shromáždí v novém bloku všechny hodnoty vybrané funkci keep  z těla bloku.

### Jinými slovy: vytvoří nový blok, zachovávaje pouze hodnoty určené funkcí keep, obvykle na základě splnění určité podmínky.

Red \[]

a: \[11 "house" 34.2 "dog" 22]

b: collect [

       foreach element a \[if string? element \[keep element]]

       ]

print b                     ;obsah bloku b je vytvořen funkcí collect

house dog

syntaxe pro upřesnění: collect/into

Red \[]

c: \["one" "two"]                           

a: \[11 "house" 34.2 "dog" 22]

collect/into [

       foreach element a \[if scalar? element \[keep element]]] c                                                                            

print c          ;obsah bloku c je rozšířen o vybrané prvky bloku a

one two 11 34.2 22

### native! compose

Vrací kopii bloku, vyhodnocujíce pouze prvky typu  paren!.

Příkaz compose je velmi důležitý pro dialekt [DRAW](http://helpin.red/Draw.html);

Red \[]

a: \[add 3 5 (add 3 5) 9 + 8 (9 + 8)]

print a                        ; vyhodnotí vše, včetně zanořených závorek

probe compose a        ; vrací argument s vyhodnocenými závorkami typu paren!

8 8 17 17  
\[add 3 5 8 9 + 8 17]

    /deep        =&gt; provést příkaz compose i pro zanořené bloky

Red \[]

a: \[add 3 5 (add 3 5) \[9 + 8 (9 + 8)]]

probe compose a                

probe compose/deep a        

\[add 3 5 8 \[9 + 8 (9 + 8)]]  
\[add 3 5 8 \[9 + 8 17]]

    /only  -  složit (compose) vnořené bloky jako bloky, obsahující své hodnoty  nemtudum

                je zapotřebí vložit příklad

    /into   - vložit výsledek do připraveného bloku místo vytvářní nového bloku.

Red \[]

a: \[add 3 5 (add 3 5) 9 + 8 (9 + 8)]

b: \[]

compose/into a b

probe b

\[add 3 5 8 9 + 8 17]
