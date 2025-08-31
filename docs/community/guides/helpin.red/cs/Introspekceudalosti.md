Original URL: <http://helpin.red/cs/Introspekceudalosti.html>

# Introspekce událostí

* * *

* * *

## Datový typ event!

## Kromě názvů jednotlivých událostí (viz předchozí kapitola) existuje entita, zvaná datový typ event!, který obsahuje 13 funkcí, použitelných k introspekci prováděného kódu.

## Instance datového typu event!

Název

Typ hodnoty

Vracená hodnota

type

word!

Název události

face

object!

Piškot, v němž k události došlo

window

object!

Okno, v němž k události došlo

offset

pair!

Souřadnice kurzoru myši, relativně k piškotu při výskytu události. Pro události gest vrací souřadnice středního bodu.

key

char! word!

Stlačení klávesnice

picked

integer! percent!

word!

Nová položka, vybraná v piškotu (integer! percent!). Při události myši down  v piškotu text-list vrací index položky pod kurzorem nebo none. Při události  wheel  vrací počet (+/-) otočení kolečka.  Při události  menu vrací odpovídající ID položky (word!). Při gestu zoom vrací procento relativního zvětšení/zmenšení. U jiných gest je jeho hodnota závislá na OS (Windows: pole allArguments ze struktury [GESTUREINFO](https://msdn.microsoft.com/en-us/library/windows/desktop/dd353232%28v=vs.85%29.aspx)).

flags

block!

Vrací výpis s jedním či více flagy (away, down, mid-down, alt-down, aux-down, control, shift)

away?

logic!

Vrací true, opouští-li kurzor hranice piškotu . Platí pouze při aktivní události over.

down?

logic!

Vrací true, byla-li stisknuta levá klávesa myši

mid-down?

logic!

Vrací true, byla-li stisknuta střední klávesa myši

alt-down?

logic!

Vrací true , byla-li stisknuta pravá klávesa myši

ctrl?

logic!

Vrací true , byla-li stisknuta klávesa CTRL

shift?

logic!

Vrací true , byla-li stisknuta klávesa SHIFT

Seznam možných flagů v poli event/flags:  away, down, mid-down, alt-down, control, shift

## Pokaždé, když v piškotu dojde k události typu event!, lze o ní získat informaci příkazem

## &gt;&gt;  event/ &lt;název typu&gt;

## Událost myši:

## V níže uvedeném zjednodušeném příkladu vytiskneme typ události a souřadnice kurzoru při stisku myší klávesy (událost down)

Red \[needs: view]

view [

   base 100x100

   on-down [

               print event/type

               print event/offset

       ]

]

down  
39x57  
down  
86x43

## Událost klávesnice:

## Podobné informace získáme při vhodné volbě události pro klávesnici - zde například událost key:

Red \[needs: view]

view [

   area 100x100

   on-key [

               print event/type

               print event/offset     ; chodí podívně

               print event/key

       ]

]

key  
\-59x84  
r  
key  
\-36x59  
s  
key  
\-116x79  
o

## Zdá se, že některé piškoty negenerují události klávesnice. Když například ve výše uvedeném příkladu zaměníme piškot area za base, nedostaneme v konzole žádný výsledek.

Velikost obrazovky:

&gt;&gt; print system/view/screens/1/size  
1366x768

I don't have more information about system, except what you can get typing help system.
