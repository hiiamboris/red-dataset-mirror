Original URL: <http://helpin.red/cs/Matematikaalogika.html>

# Matematika a logika

* * *

* * *

Většina matematiky a logiky v Redu je běžná až na pořadí [výpočtu](http://helpin.red/Vyhodnoceni.html). Níže uvádím výčet operátorů (slov), používaných pro výpočty spolu s případnými poznámkami.

#### Základy:

Následující skupinu tvoří jak prefixové (např. add) tak infixové  (např. operátor "+") funkce . Přijímají hodnoty typu number!, char!, pair!, tuple! nebo vector! jako argumenty.

Funkcionální (prefixové) operátory se uvádějí před svými operandy (např.:  add 3 4).

### action! add  or   op! +

### action! subtract  or  op!  -

### action! multiply  or  op! *

### action! divide  or op! /

### action! power  or op! \**

### action! absolute

Vyhodnotí výraz a vrátí absolutní hodnotu, to jest kladné číslo.

### action! negate

Změní signum hodnoty, to jest: positive &lt;=&gt; negative

### float! pi  (konstanta typu float!)

3,141592...

### action! random

Vrací náhodnou hodnotu téhož typu jako argument.

Je-li argumentem celé číslu, vrací integer mezi 1 (inclusive) a argumentem (inclusive).

Je-li argumentem desetinné číslo, vrací float mezi 0 (inclusive) a argumentem (inclusive).

Je-li argumentem řada, přeskupí elementy.

&gt;&gt; random 10  
\== 2

&gt;&gt; random 33x33  
\== 13x23

&gt;&gt; random 1  
\== 1

&gt;&gt; random 1.0  
\== 0.07588539741741744

&gt;&gt; random "abcde"  
\== "cedab"

&gt;&gt; random 10:20:05  
\== 8:02:32.5867693

Upřesnění (refinements):

/seed - Restartovat a randomizovat. Patrně lze použít v situaci, kdy je funkce random volána v programu opakovaně. V tom případě nemusí být výsledek zcela náhodný, pokud se nepoužije random/seed.

/secure - TBD: Vrací kryptograficky zajištěné náhodné číslo.

/only - Vybrat náhodnou hodnotu z řady.

&gt;&gt; random/only \["fly" "bee" "ant" "owl" "dog"]  
\== "fly"

&gt;&gt; random/only "aeiou"  
\== #"o"

### action! round

Vrací nejbližší celé číslo. Poloviny (např. 0,5) se zaokrouhlují směrem od nuly.

&gt;&gt; round 2.3  
\== 2.0

&gt;&gt; round 2.5  
\== 3.0

&gt;&gt; round -2.3  
\== -2.0

&gt;&gt; round -2.5  
\== -3.0

Refinements:

/to - pro určení "přesnosti" zaokrouhlení:

&gt;&gt; round/to 6.8343278 0.1  
\== 6.8

&gt;&gt; round/to 6.8343278 0.01  
\== 6.83

&gt;&gt; round/to 6.8343278 0.001  
\== 6.834

/even - Poloviny (např. 0.5) se zaokrouhlují směrem k sudému číslu.

&gt;&gt; round/even 2.5  
\== 2.0                         ;not 3

/down - Odsekne desetinnou část ale číslo zachová jako float!.

&gt;&gt; round/down 3.9876  
\== 3.0

&gt;&gt; round/down -3.876  
\== -3.0

/half-down - Poloviny zaokrouhlovat směrem k nule, nikoli od nuly.

&gt;&gt; round/half-down 2.5  
\== 2.0

&gt;&gt; round/half-down -2.5  
\== -2.0

/floor - Zaokrouhlovat v negativním směru.

&gt;&gt; round/floor 3.8  
\== 3.0

&gt;&gt; round/floor -3.8  
\== -4.0

/ceiling - Zaokrouhlovat v pozitivním směru.

&gt;&gt; round/ceiling 2.2  
\== 3.0

&gt;&gt; round/ceiling -2.8  
\== -2.0

/half-ceiling - Zaokrouhluje poloviny v pozitivním směru.

&gt;&gt; round/half-ceiling 2.5  
\== 3.0

&gt;&gt; round/half-ceiling -2.5  
\== -2.0

### native! square-root

Příjímá libovolnou hodnotu typu number! jako argument.

* * *

#### Remainders (zbytky) etc.:

### action! remainder nebo  op! //

Přijímá hodnotu typu number! char! pair! tuple! a vector! jako argument. Vrací zbytek dělení prvního čísla druhým.

&gt;&gt; remainder 15 6  
\== 3

&gt;&gt; remainder -15 6  
\== -3

&gt;&gt; remainder 4.67 2  
\== 0.67

&gt;&gt; 17 // 5  
\== 2

&gt;&gt; 4.8 // 2.2  
\== 0.3999999999999995

#### op! %

Vrací zbytek po dělení jedné hodnoty druhou.

### function! modulo

Vrací pozitivní zbytek (modulus) po dělení prvního argumentu druhým. Je-li některé  z čísel (či obě) záporné, uvedené jednoduché pravidlo neplatí a je to mnohem složitější - viz Vikipedia: [Modulo operation](https://en.wikipedia.org/wiki/Modulo_operation).

&gt;&gt; modulo 9 4  
\== 1

&gt;&gt; modulo -15 6      ; bylo to však složitější  
\== 3

&gt;&gt; modulo -15 -6     ; bylo to však složitější  
\== 3

&gt;&gt; modulo -15 7           ; neboť to je složitější  
\== 6

&gt;&gt; modulo -15 -7           ; neboť to je složitější  
\== 6

* * *

#### Logaritmy :

### function! exp

Druhá mocnina přirozeného čísla e.

### native! log-10

Pro daný argument vraci logaritmus se základem 10 .

### native! log-2

Pro daný argument vraci logaritmus se základem 2.

### native! log-e

Pro daný argument vraci logaritmus se základem e.

* * *

#### Trigonometrie:

Všechny trigonometrické funkce s dlouhými názvy  (arccosine, cosine etc) přijímají argumenty ve stupních, umožňují ale použití argumentu v radiánech s upřesněním  /radians. Verze s krátkými názvy (acos, cos etc.)  přijímají úhly v radiánech.

### function! acos  či  native! arccosine

### function! asin  či native! arcsine

### function! atan  či  native! arctangent

#### Vrací trigonometrický arctangent.

### function! atan2  či  native! arctangent2

#### Vrací úhel spojnice bodu 0,0 a x,y v radiánech, měřený proti směru hodinových ručiček od kladné osy jednotkové kružnice. Vracené hodnoty se pohybují mezi -pi a +pi.

### function! cos  či  native! cosine

### function! sin  či  native! sine

### function! tan  či  native! tangent

* * *

#### Extras:

#### native! max

Vrátí větší  ze dvou argumentů typu scalar! nebo series!

&gt;&gt; max 8 12  
\== 12

&gt;&gt; max "abd" "abcd"  
\== "abd"

Při porovnávání řetězců (což jsou series!) nebo bloků je postupně porovnáván každý element. Při výskytu první neshody porovnávání končí a jako větší je vybrán blok (string) s větší hodnotou neshodného elementu.

&gt;&gt; max \[1 2 3] \[3 2 1]     ; porovnávání skončilo hned u prvního elementu    
\== \[3 2 1]

&gt;&gt; max \[1 2 99] \[3 2 1]    ; rovněž tak  
\== \[3 2 1]

Při porovnání hodnot typu pair!, vrací větší z každého elementu:

&gt;&gt; max 12x6 7x34  
\== 12x34

#### native! min

Vrací menší ze dvou argumentů. Poznámka o max je zde rovněž revelantní.

### action! odd?

Vrací true je-li argument typu integer! lichý a false je-li sudý.

### action! even?

Vrací true  je-li argument typu integer! sudý a false  je-li lichý.

#### native! positive?

Vrací true je-li argument větší než nula a false je-li menší než 1.

#### native! negative?

Vrací true je-li argument menší než 1 a false je-li větší než 0.

#### native! zero?

Vrací true je-li argument roven nule.

### function! math

Vyhodnotí hodnotu typu block! s použitím normálních precedencí, to jest s upřednostněním dělení a násobení před sčítáním a odčítáním.

&gt;&gt; math \[2 + 3 * 4]  
\== 14

### function! within?

Přijímá 3 argumenty typu pair! - pozici bodu x,y - souřadnice x,y levého horního bodu obdélníka - šířku a výšku obdélníka.

Vrací  true!, nalézá-li se bod uvnitř nebo na hranici plochy obdélníka.

&gt;&gt; within? 12x11 5x10 8x2     ; souřadnice vrcholů trojúhelníka typu pair!  
\== true

#### native! NaN?

Vrací  true!  není-li argument typu number!

&gt;&gt; NaN? square-root 9        
\== false

&gt;&gt; square-root -9        
\== 1.#NaN                        ; Red neumí komplexní čísla?

#### native! NaN

#### Returns TRUE if the number is Not-a-Number.

### function! a-an                                                             nemtudum

#### Returns the appropriate variant of a or an (simple, vs 100% grammatically correct).

* * *

#### Logické funkce :

### action! and~   či  op! and (infix)

#### native! equal?   či   op! =

#### native! greater-or-equal?  či  op! &gt;=

#### native! greater?  či  op! &gt;

#### native! lesser-or-equal?   či  op! &lt;=

#### native! lesser?  či  op! &lt;

#### native! not

#### native! not-equal?   či   op! &lt;&gt;

### action! or~  či  op! or (infix)

#### native! same?  či  op! =?

Vrací true! odkazují-li argumenty na tatáž data (object, string etc.), to jest, odkazují-li na stejné místo v paměti.

&gt;&gt; a: \[1 2 3]  
\== \[1 2 3]

&gt;&gt; b: a                     ; b points to the same data as a  
\== \[1 2 3]

&gt;&gt; a =? b  
\== true                     ; they are the same

&gt;&gt; c: \[1 2 3]  
\== \[1 2 3]

&gt;&gt; c =? a                ; c is equal to a, but is not the same data in memory.  
\== false

#### native! strict-equal?  or  op! ==

Vrací true! mají-li argumenty stejnou hodnotu a jsou stejného typu či  velikosti (lower-case/uppercase) u řetězců.

&gt;&gt; a: "house"  
&gt;&gt; b: "House"  
&gt;&gt; a = b  
\== true

&gt;&gt; a == b  
\== false
