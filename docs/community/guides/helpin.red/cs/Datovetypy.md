Original URL: <http://helpin.red/cs/Datovetypy.html>

# Datové typy

* * *

* * *

#### Každá hodnota Redu má svůj specifický datový typ, který určuje rozsah přípustných hodnot, přípustné operace a způsob uložení hodnot v paměti. Datových typů je aktuálně 46, včetně datového typu datatype! Výpis datových typů získáme dotazem:

&gt;&gt; ? datatype!

#### Z těchto 46 datových typů je vytvořeno 16 skupin (typesetů), majících společné vlastnosti. Některé datové typy se vyskytují ve více skupinách. Výpis těchto skupin získáme dotazem:

&gt;&gt; ? typeset!

#### Jsou to tyto tyto skupiny: any-(type!, object!, string!, word!, function!, block!, path!, list!), series!, number!, scalar!, immediate!, internal!, external!, default!, all-word!.

#### Jednotlivé datové typy:

#### word!

Základní datový typ. Slova jsou klíčovým pojmem v jazyce Red. Vyskytují se ve čtveré typové formě:

word  - typ word!,        základní formát pro přirozenou hodnotu slova

word: - typ set-word!, formát pro přiřazení hodnoty ke slovu

:word - typ get-word!, odkaz na hodnotu slova (bez vyhodnocení)

'word - typ lit-word!, odkaz na slovo jako symbol

#### block!

Bloky jsou skupiny hodnot a slov. Používají se všude, od samotného skriptu až po bloky dat a bloky kódu ve skriptu.

&gt;&gt; bl: \[123 data "zdar"]        ; blok s daty  
\== \[123 data "zdar"]

&gt;&gt; \[]                           ; prázdný blok  
\== \[]

#### paren!

Datový typ paren! je kolektor, ohraničený kulatými závorkami. Používá se hlavně k vyjádření preference aritmetických operací.

Objekt typu paren! se vytvoří příkazem make paren! :

&gt;&gt; prn: make paren! \["a" 5]  
\== ("a" 5)

#### none!

Ekvivalent "nuly" v jiných programovacích jazycích. Indikuje neexistující data.

&gt;&gt; a: \[1 2 3 4 5]  
\== \[1 2 3 4 5]  
&gt;&gt; pick a 7  
\== none

#### logic!

Kromě klasických true a false, používá Red také on , off, yes a no jako hodnoty datového typu  logic!.

&gt;&gt; a: 2 b: 3  
\== 3  
&gt;&gt; a &gt; b  
\== false

&gt;&gt; a: on  
\== true  
&gt;&gt; a  
\== true

&gt;&gt; a: off  
\== false  
&gt;&gt; a  
\== false

&gt;&gt; a: yes  
\== true  
&gt;&gt; a  
\== true

&gt;&gt; a: no  
\== false  
&gt;&gt; a  
\== false

#### string!

Řada (series) znaků uvnitř uvozovek nebo složených závorek. Zabírá-li řetězec více než jeden řádek, je použití {} jedině možné.

Manipulace s řetězci se provádí s použitím příkazů, popsaných v [kapitolách o řadách](http://helpin.red/Blokyarady.html).

&gt;&gt; a: "my string"  
\== "my string"

&gt;&gt; a: {my string}  
\== "my string"

&gt;&gt; a: {my  
{    string}           ; první "{" je signál konzoly!  
\== "my^/string"  
&gt;&gt; print a  
my  
string

&gt;&gt; a: "my new                ;trying to span over more than one line  
\*\** Syntax Error: invalid value at {"my new}

#### char!

Uvedena znakem #  a uvnitř uvozovek, představuje hodnota typu char! kódový bod Unicodu. Jsou to celá čísla v rozsahu  hexadecimal 00 po hexadecimal 10FFFF (0 až 1,114,111).

#"A" je char!

"A" je string!

Umožňuje určité matematické operace.

&gt;&gt; a: "my string"  
\== "my string"  
&gt;&gt; pick a 2  
\== #"y"  
&gt;&gt; poke a 3 #"X"  
\== #"X"  
&gt;&gt; a  
\== "myXstring"

&gt;&gt; a: #"b"  
\== #"b"  
&gt;&gt; a: a + 1  
\== #"c"

#### integer!

32 bitová celá signovaná čísla. Od  −2,147,483,648 po 2,147,483,647. Je-li číslo mimo tento rozsah, přiřadí mu Red datový typ  float!.

Poznámka: Dělení  2 celých čísel dává oseknutý výsledek:

&gt;&gt; 7 / 2  
\== 3

#### float!

64 bitová desetinná čísla. Prezentují se s desetinnou tečkou či čárkou nebo e-notací.

&gt;&gt; 7.0 / 2  
\== 3.5

&gt;&gt; 3e2  
\== 300.0

&gt;&gt; 6.0 / 7  
\== 0.8571428571428571

#### file!

Název je uveden znakem %. Nepoužíváte-li aktuální cestu, máte uvést cestu v uvozovkách. Cesta používá lomítka  (/); zpětná lomítka (\\) jsou ve Windows automaticky konvertována na obyčejná lomítka.

&gt;&gt; write %myfirstfile.txt "This is my first file"

&gt;&gt; write %"C:\\Users\\André\\Documents\\RED\\mysecondfile.txt" "This is my second file"

#### path!

Používá se k přístupu k interním položkám větších struktur pomocí lomítka (/). Používá se v různých situacích, například:

&gt;&gt; a: \[23 45 89]  
\== \[23 45 89]  
&gt;&gt; print a/2  
45

Lomítka "/" se také používají při přístupu k objektům a k upřesněním.

#### time!

Čas je vyjádřen ve formátu  hours:minutes:seconds.subseconds. Všimněte si, že sekundy a subsekundy jsou odděleny tečkou, nikoliv dvojtečkou. Ke každé části je možný přístup přes upřesnění (refinement). Nahlédněte do kapitoly  [Práce s časem](http://helpin.red/Pracescasem.html).

&gt;&gt; mymoment: 8:59:33.4  
\== 8:59:33.4  
&gt;&gt; mymoment/minute: mymoment/minute + 1  
\== 60  
&gt;&gt; mymoment == 9:00:33.4

&gt;&gt; a: now/time/precise            
\== 22:05:46.805                  
&gt;&gt; type? a  
\== time!                ; datový typ objektu a je time!  
&gt;&gt; a/hour  
\== 22  
&gt;&gt; a/minute  
\== 5  
&gt;&gt; a/second  
\== 46.805                          ; datový typ a/second je float!

#### date!

Red akceptuje datumy v různých formátech:

&gt;&gt; print 31-10-2017  
31-Oct-2017  
&gt;&gt; print 31/10/2017  
31-Oct-2017  
&gt;&gt; print 2017-10-31  
31-Oct-2017  
&gt;&gt; print 31/Oct/2017  
31-Oct-2017  
&gt;&gt; print 31-october-2017  
31-Oct-2017  
&gt;&gt; print 31/oct/2017   
31-Oct-2017  
&gt;&gt; print 31/oct/17   ; zkuste si totéž pro první a druhé tisíciletí          
31-Oct-2017

Red rovněž ověřuje platnost datumů, včetně s uvážením přechodných let. Na den, měsíc či rok se lze odkázat upřesněním:

&gt;&gt; a: 31-oct-2017  
\== 31-Oct-2017  
&gt;&gt; print a/day  
31  
&gt;&gt; print a/month  
10  
&gt;&gt; print a/year  
2017

#### point! a pair!

Point! a pair! se zdají být úplně stejné. Uvádějí celočíselné souřadnice v kartézském souřadnicovém systému (x y axys).                           K typu point! nejsou informace

&gt;&gt; a: 12x23  
\== 12x23  
&gt;&gt; a: 2 * a  
\== 24x46  
&gt;&gt; print a/x  
24  
&gt;&gt; print a/y  
46

#### percent!

Prezentují se přidáním znaku "%" za číslem.

&gt;&gt; a: 100 * 11.2%  
\== 11.2  
&gt;&gt; a: 1000 * 11.3%  
\== 113.0

#### tuple!

Tuple (entice) je výpis tří až dvanácti celých čísel o velikosti 0 až 255, oddělených  tečkami. Entice jsou užitečné pro prezentaci čísel verzí, IP adres a barev (např.: 0.255.0).

S enticí lze provádět tyto operace:  random, add, divide, multiply, remainder, subtract, and, or, xor, length?, pick (nikoliv poke), reverse.

&gt;&gt; a: 1.2.3.4  
\== 1.2.3.4  
&gt;&gt; a: 2 * a  
\== 2.4.6.8  
&gt;&gt; print pick a 3  
6  
&gt;&gt; a/3: random 255  
\== 41  
&gt;&gt; a  
\== 2.4.41.8

#### Úplný přehled barev ve vyjádření typu word! a tuple! získáme zadáním následujícího dotazu:

&gt;&gt; ? tuple!  
red            255.0.0       ; následuje výpis 45 barev
